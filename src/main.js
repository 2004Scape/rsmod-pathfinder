const fs = require('fs');
const {__set, CollisionType, findPath} = require('../dist/rsmod-pathfinder.js');

const lumbridge = JSON.parse(fs.readFileSync("lumbridge.json"));

for (let x = 3200; x < 3264; x++) {
    for (let z = 3200; z < 3264; z++) {
        __set(x, z, 0, lumbridge[(z & 0x3f) | ((x & 0x3f) << 6) | ((0 & 0x3) << 12)][(x & 0x7) | ((z & 0x7) << 3)] >>> 0);
    }
}

setInterval(() => {
    let start = Date.now();
    for (let index = 0; index < 100_000; index++) {
        findPath(
            0,
            3232,
            3205,
            3232,
            3215,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            CollisionType.NORMAL
        );
    }
    let end = Date.now() - start;
    console.log(`100k paths took: ${end}ms; time per call: ${end * 1000 / 100_000}µs`);
}, 600);
