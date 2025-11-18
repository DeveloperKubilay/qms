const fs = require("fs");
const mqtt = require("mqtt");
require("dotenv").config();

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

    client.subscribe(reportTopic, (err) => {
        if(err) console.error("❌ Subscribe hatası:", err.message);

        const commands = [
            { "print": { "sequence_id": "2008", "command": "resume" } },
        ];
        commands.forEach((msg, i) => {
            setTimeout(() => {
                console.log(`📤 ${i + 1}. Komut ->`, JSON.stringify(msg));
                client.publish(requestTopic, JSON.stringify(msg), { qos: 1 });
            }, i * 500);
        });


    });
});

client.on("error", (err) => {
    console.error("❌ Bağlantı hatası:", err.message);
});

client.on("message", (topic, message) => {
    const payload = message.toString();
    const json = JSON.parse(payload);
    console.log(json)
});
