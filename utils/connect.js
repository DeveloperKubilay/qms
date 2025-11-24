const fs = require('fs');
const path = require('path');
const net = require('net');
const mqtt = require('mqtt');

const CA_PATH = path.join(__dirname, 'ca_cert.pem');

function parseIpRange(range) {
    if (!range) return [];
    if (!range.includes('-')) return [range];
    const [start, end] = range.split('-');
    const startParts = start.trim().split('.');
    const endParts = end.trim().split('.');
    if (startParts.length !== 4 || endParts.length !== 1 && endParts.length !== 4) return [];
    const base = startParts.slice(0, 3).join('.');
    const startNum = parseInt(startParts[3], 10);
    const endNum = endParts.length === 1 ? parseInt(endParts[0], 10) : parseInt(endParts[3], 10);
    const ips = [];
    for (let i = startNum; i <= endNum; i++) ips.push(`${base}.${i}`);
    return ips;
}

function checkPortOpen(host, port, timeout = 1500) {
    return new Promise((resolve) => {
        const socket = new net.Socket();
        let handled = false;
        socket.setTimeout(timeout);
        socket.once('connect', () => {
            handled = true;
            socket.destroy();
            resolve(true);
        });
        socket.once('timeout', () => {
            if (handled) return;
            handled = true;
            socket.destroy();
            resolve(false);
        });
        socket.once('error', () => {
            if (handled) return;
            handled = true;
            socket.destroy();
            resolve(false);
        });
        socket.connect(port, host);
    });
}

function tryMqttConnect(host, options, connectTimeout = 4000) {
    return new Promise((resolve, reject) => {
        const client = mqtt.connect(Object.assign({}, options, { host }));
        let settled = false;
        const timer = setTimeout(() => {
            if (settled) return;
            settled = true;
            try { client.end(true); } catch (e) {}
            reject(new Error('connect timeout'));
        }, connectTimeout);
        client.once('connect', () => {
            if (settled) return;
            settled = true;
            clearTimeout(timer);
            resolve(client);
        });
        client.once('error', (err) => {
            if (settled) return;
            settled = true;
            clearTimeout(timer);
            try { client.end(true); } catch (e) {}
            reject(err);
        });
    });
}

async function findAndConnect(configPath, deviceID) {
    const CONFIG_PATH = configPath || path.join(process.cwd(), 'config.json');
    let cfg = JSON.parse(fs.readFileSync(CONFIG_PATH, 'utf8'));
    const candidates = [];
    if (cfg.latestIpaddr) candidates.push(cfg.latestIpaddr);
    if (process.env.PRINTER_IP && !candidates.includes(process.env.PRINTER_IP)) candidates.push(process.env.PRINTER_IP);
    const rangeIps = parseIpRange(cfg.ipRange);
    for (const ip of rangeIps) if (!candidates.includes(ip)) candidates.push(ip);

    const baseOptions = {
        protocol: 'mqtts',
        port: 8883,
        connectTimeout: 4000,
        clean: true,
        username: 'bblp',
        password: process.env.LAN_ACCESS_CODE,
        servername: deviceID,
        ca: fs.existsSync(CA_PATH) ? fs.readFileSync(CA_PATH) : undefined,
    };

    for (const ip of candidates) {
        try {
            const open = await checkPortOpen(ip, baseOptions.port, 1500);
            if (!open) continue;
            const client = await tryMqttConnect(ip, baseOptions, baseOptions.connectTimeout);
            cfg.latestIpaddr = ip;
            fs.writeFileSync(CONFIG_PATH, JSON.stringify(cfg, null, 4), 'utf8');
            return client;
        } catch (e) {
            // continue to next candidate
        }
    }
    throw new Error('No reachable MQTT host found');
}

module.exports = { findAndConnect };
