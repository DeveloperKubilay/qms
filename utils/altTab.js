#!/usr/bin/env node
const fs = require('fs');
const os = require('os');
const path = require('path');
const { spawnSync } = require('child_process');

function _buildPsScriptContent() {
	return `param($procName, $fallback)
$proc = Get-Process | Where-Object { $_.ProcessName -like $procName -or $_.MainWindowTitle -like "*$procName*" } | Select-Object -First 1
if ($null -ne $proc -and $proc.MainWindowHandle -ne 0) {
	$hwnd = $proc.MainWindowHandle
	Add-Type -Namespace Win -Name Native -MemberDefinition @"
using System;
using System.Runtime.InteropServices;
public static class Native {
	[DllImport("user32.dll")]
	public static extern bool SetForegroundWindow(IntPtr hWnd);
	[DllImport("user32.dll")]
	public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
	[DllImport("user32.dll")]
	public static extern bool IsIconic(IntPtr hWnd);
}
"@
	if ([Win.Native]::IsIconic($hwnd)) { [Win.Native]::ShowWindowAsync($hwnd, 9) | Out-Null }
	[Win.Native]::SetForegroundWindow($hwnd) | Out-Null
	Write-Output "OK: Found and focused process: $($proc.ProcessName) - $($proc.Id)"
	exit 0
} else {
	if ($fallback) {
		$wshell = New-Object -ComObject WScript.Shell
		Start-Sleep -Milliseconds 100
		$wshell.SendKeys('%{TAB}')
		Write-Output "Fallback: Sent Alt+Tab"
		exit 0
	} else {
		Write-Error "Process not found or no main window handle."
		exit 1
	}
}
`;
}

function altTab(target, fallbackAltTab = false) {
	if (!target) throw new Error('target is required');
	let t = target;
	if (t.toLowerCase().endsWith('.exe')) t = t.slice(0, -4);

	const psContent = _buildPsScriptContent();
	const tmp = path.join(os.tmpdir(), `focus-${Date.now()}.ps1`);
	fs.writeFileSync(tmp, psContent, { encoding: 'utf8' });

	const args = ['-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', tmp, t, fallbackAltTab ? '1' : '0'];
	const res = spawnSync('powershell.exe', args, { encoding: 'utf8' });

	try { fs.unlinkSync(tmp); } catch (e) {}

	if (res.error) {
		return { ok: false, error: res.error, stdout: res.stdout, stderr: res.stderr, status: res.status };
	}
	return { ok: res.status === 0, stdout: (res.stdout || '').trim(), stderr: (res.stderr || '').trim(), status: res.status };
}

module.exports = altTab;

if (require.main === module) {
	const argv = process.argv.slice(2);
	if (argv.length === 0) {
		console.error('Kullanım: node altTab.js <processName|windowTitle> [--alt-tab]');
		process.exit(2);
	}
	let target = argv[0];
	const fallbackAltTab = argv.includes('--alt-tab');
	try {
		const r = altTab(target, fallbackAltTab);
		if (r.ok) {
			console.log(r.stdout || 'OK');
			process.exit(0);
		} else {
			console.error(r.stderr || r.stdout || (r.error && r.error.message) || 'Error');
			process.exit(r.status || 1);
		}
	} catch (e) {
		console.error(e.message);
		process.exit(1);
	}
}

