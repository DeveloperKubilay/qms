const setTimeout = require('timers/promises').setTimeout;


module.exports = {
    resume: async function () {
        console.log("⏯️ PAUSE görüldü, resume gönderiliyor:");

        await setTimeout(2000); // 2 saniye bekle

        console.log("✅ Resume komutu gönderildi.");

        
    }
}