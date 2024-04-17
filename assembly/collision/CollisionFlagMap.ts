import {CollisionFlag} from '../flag/CollisionFlag';

export default class CollisionFlagMap {
    // 256x256 mapsquares (room for instances): 2048 * 2048 * 4 = ((256 * 256) * 64) * 4
    // 60x160 mapsquares (we don't support instances): ((60 * 160) * 64) * 4
    private static readonly TOTAL_ZONE_COUNT: i32 = ((256 * 256) * 64) * 4;
    private static readonly ZONE_TILE_COUNT: i32 = 8 * 8;

    private static tileIndex(x: i32, z: i32): i32 {
        return (x & 0x7) | ((z & 0x7) << 3);
    }

    // this one is for non-instances
    /*private static zoneIndex(x: i32, z: i32, level: i32): i32 {
        return ((x >> 3) & 0x1ff) | (((z >> 3) & 0x7ff) << 9) | ((level & 0x3) << 19);
    }*/

    // this one is supporting instances
    private static zoneIndex(x: i32, z: i32, level: i32): i32 {
        return ((x >> 3) & 0x7ff) | (((z >> 3) & 0x7ff) << 11) | ((level & 0x3) << 22);
    }

    readonly flags: (Int32Array | null)[] = new Array<Int32Array | null>(CollisionFlagMap.TOTAL_ZONE_COUNT);

    get(absoluteX: i32, absoluteZ: i32, level: i32): i32 {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        const flags: Int32Array | null = this.flags[zoneIndex];
        if (flags == null) {
            return CollisionFlag.NULL;
        }
        if (flags.length <= tileIndex) {
            return CollisionFlag.NULL;
        }
        return flags[tileIndex];
    }

    set(absoluteX: i32, absoluteZ: i32, level: i32, mask: i32): void {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        let tiles: Int32Array | null = this.flags[zoneIndex];
        if (tiles == null) {
            tiles = this.allocateIfAbsent(absoluteX, absoluteZ, level);
        }
        tiles[tileIndex] = mask;
    }

    add(absoluteX: i32, absoluteZ: i32, level: i32, mask: i32): void {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        const flags: Int32Array | null = this.flags[zoneIndex];
        let currentFlags: i32 = CollisionFlag.OPEN;
        if (flags != null && tileIndex < flags.length) {
            currentFlags = flags[tileIndex];
        }
        this.set(absoluteX, absoluteZ, level, currentFlags | mask);
    }

    remove(absoluteX: i32, absoluteZ: i32, level: i32, mask: i32): void {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        const flags: Int32Array | null = this.flags[zoneIndex];
        let currentFlags: i32 = CollisionFlag.OPEN;
        if (flags != null && tileIndex < flags.length) {
            currentFlags = flags[tileIndex];
        }
        this.set(absoluteX, absoluteZ, level, currentFlags & ~mask);
    }

    allocateIfAbsent(absoluteX: i32, absoluteZ: i32, level: i32): Int32Array {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        const existingFlags: Int32Array | null = this.flags[zoneIndex];
        if (existingFlags != null) {
            return existingFlags;
        }

        const tileFlags: Int32Array = new Int32Array(CollisionFlagMap.ZONE_TILE_COUNT);
        this.flags[zoneIndex] = tileFlags;
        return tileFlags;
    }

    deallocateIfPresent(absoluteX: i32, absoluteZ: i32, level: i32): void {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        this.flags[zoneIndex] = null;
    }

    isZoneAllocated(absoluteX: i32, absoluteZ: i32, level: i32): bool {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        return this.flags[zoneIndex] != null;
    }

    isFlagged(x: i32, z: i32, level: i32, masks: i32): bool {
        return (this.get(x, z, level) & masks) !== CollisionFlag.OPEN;
    }
}