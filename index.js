const fs = require("fs");
const mqtt = require("mqtt");
require("dotenv").config();
const kubitdb = require("kubitdb");
const db = new kubitdb("./utils/db");

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

client.on("connect", () => {
    console.log("🔥 Bağlantı başarılı!");

    const reportTopic = `device/${deviceID}/report`;
    const requestTopic = `device/${deviceID}/request`;

    //if(db.get(""))

 
});

client.on("error", (err) => {
    console.error("❌ Bağlantı hatası:", err.message);
});

client.on("message", (topic, message) => {
    const payload = message.toString();
    const json = JSON.parse(payload);
    console.log(json)
});
