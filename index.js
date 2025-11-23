const fs = require("fs");
const mqtt = require("mqtt");
require("dotenv").config();
const config = require("./utils/config");

const deviceID = process.env.DEVICE_ID;

const client = mqtt.connect({
    protocol: "mqtts",
    host: process.env.PRINTER_IP,
    port: 8883,
    connectTimeout: 4000,
    clean: true,
    username: "bblp",
    password: process.env.LAN_ACCESS_CODE,
    servername: deviceID,
    ca: fs.readFileSync("./utils/ca_cert.pem"),
});

let hasStarted = 0;

client.on("connect", () => {
    console.log("🔥 Bağlantı başarılı!");

    const reportTopic = `device/${deviceID}/report`;
    const requestTopic = `device/${deviceID}/request`;

    //json.print?.gcode_state

    client.subscribe(reportTopic)
    //if(db.get(""))

});

client.on("error", (err) => {
    console.error("❌ Bağlantı hatası:", err.message);
});

const module = require("./utils/resume/" + config.type + ".js");

client.on("message", async (topic, message) => {
    const payload = message.toString();
    const json = JSON.parse(payload);
    if (json.print?.gcode_state == "RUNNING") {
        hasStarted = true;
    }
    if (json.print?.gcode_state == "PAUSED") {//hasStarted && 
        await module.resume();
    }

});
