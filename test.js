const sharp = require("sharp");

async function findImageInImage(bigPath, smallPath) {
    // 1. Resimleri yükle ve gri tona çevir (Hız için)
    const big = sharp(bigPath).grayscale();
    const small = sharp(smallPath).grayscale();

    const bigMeta = await big.metadata();
    const smallMeta = await small.metadata();

    // 2. Ölçekleme (Scale) - Resmi küçültüp kabaca yerini bulalım (Aşırı hızlandırır)
    const scale = 0.25; // %25 boyutuna indir
    const smallW_scaled = Math.floor(smallMeta.width * scale);

    // Eğer resim çok küçükse scale etme, direkt ara
    if (smallW_scaled < 10) {
        const bData = await big.raw().toBuffer();
        const sData = await small.raw().toBuffer();
        const res = scan(bData, bigMeta.width, bigMeta.height, sData, smallMeta.width, smallMeta.height);
        return {
            x: Math.floor(res.x + smallMeta.width / 2),
            y: Math.floor(res.y + smallMeta.height / 2),
            score: res.diff
        };
    }

    // Küçültülmüş versiyonları oluştur
    const bigScaled = await big.clone().resize(Math.round(bigMeta.width * scale)).raw().toBuffer({ resolveWithObject: true });
    const smallScaled = await small.clone().resize(smallW_scaled).raw().toBuffer({ resolveWithObject: true });

    // 3. Kaba arama (Coarse Search)
    const coarse = scan(bigScaled.data, bigScaled.info.width, bigScaled.info.height, smallScaled.data, smallScaled.info.width, smallScaled.info.height);

    if (!coarse) return null;

    // 4. Hassas arama (Fine Search) - Bulunan yerin etrafını orijinal boyutta tara
    const originX = Math.floor(coarse.x / scale);
    const originY = Math.floor(coarse.y / scale);
    const margin = 20; // Hata payı

    // Arama sınırlarını belirle
    const searchX = Math.max(0, originX - margin);
    const searchY = Math.max(0, originY - margin);
    const searchW = Math.min(bigMeta.width - searchX, smallMeta.width + (margin * 2));
    const searchH = Math.min(bigMeta.height - searchY, smallMeta.height + (margin * 2));

    // Orijinal resimden sadece o bölgeyi al
    const region = await big.clone().extract({ left: searchX, top: searchY, width: searchW, height: searchH }).raw().toBuffer({ resolveWithObject: true });
    const smallOriginal = await small.raw().toBuffer({ resolveWithObject: true });

    const fine = scan(region.data, region.info.width, region.info.height, smallOriginal.data, smallOriginal.info.width, smallOriginal.info.height);

    if (fine) {
        return {
            x: Math.floor(searchX + fine.x + smallMeta.width / 2),
            y: Math.floor(searchY + fine.y + smallMeta.height / 2),
            score: fine.diff
        };
    }
    return null;
}

function scan(bigData, bigW, bigH, smallData, smallW, smallH) {
    let bestDiff = Infinity;
    let bestX = -1;
    let bestY = -1;

    // Piksel piksel gez
    for (let y = 0; y <= bigH - smallH; y++) {
        for (let x = 0; x <= bigW - smallW; x++) {
            let diff = 0;

            // Küçük resmi karşılaştır
            for (let sy = 0; sy < smallH; sy++) {
                // Satır başı indexleri
                const bigRowOffset = (y + sy) * bigW + x;
                const smallRowOffset = sy * smallW;

                for (let sx = 0; sx < smallW; sx++) {
                    // Grayscale olduğu için tek kanal (byte)
                    const valBig = bigData[bigRowOffset + sx];
                    const valSmall = smallData[smallRowOffset + sx];

                    // Mutlak fark (Absolute Difference)
                    diff += Math.abs(valBig - valSmall);

                    // Optimizasyon: Eğer hata şimdiden en iyiden kötüyse bu konumu sal
                    if (diff >= bestDiff) break;
                }
                if (diff >= bestDiff) break;
            }

            if (diff < bestDiff) {
                bestDiff = diff;
                bestX = x;
                bestY = y;
            }
        }
    }

    return { x: bestX, y: bestY, diff: bestDiff };
}

module.exports = { findImageInImage };
if (require.main === module) {
    console.time("Arama Süresi");
    findImageInImage("Adsız.png", "icon.png").then(res => {
        console.timeEnd("Arama Süresi");
        console.log("Bulunan Konum:", res);
    });

}