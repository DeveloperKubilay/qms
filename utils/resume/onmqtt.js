
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