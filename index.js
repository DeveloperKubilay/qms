const fs = require("fs");
require("dotenv").config();
const config = require("./config");
const { findAndConnect } = require("./utils/connect");

const deviceID = process.env.DEVICE_ID;

const resumeModule = require("./utils/resume/" + config.type + ".js");

const CONFIG_PATH = require('path').join(__dirname, 'config.json');

let client;

(async () => {
    try {
        client = await findAndConnect(CONFIG_PATH, deviceID);
    } catch (err) {
        console.error('❌ Bağlantı hatası:', err.message);
        process.exit(1);
    }

    client.on('connect', () => {
        console.log('🔥 Bağlantı başarılı!');
        const reportTopic = `device/${deviceID}/report`;
        client.subscribe(reportTopic);
    });

    client.on('error', (err) => {
        console.error('❌ Bağlantı hatası:', err.message);
    });

    client.on('message', async (topic, message) => {
        const payload = message.toString();
        const json = JSON.parse(payload);
        if (json.print?.gcode_state == 'PAUSED') {
            await resumeModule.resume();
        }
    });
})();
