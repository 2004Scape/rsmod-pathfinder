import {CollisionFlag} from '../flag/CollisionFlag';

@final
export default class CollisionFlagMap {
    @inline static readonly ZONE_TILE_COUNT: i32 = 8 * 8;
    @inline static readonly TOTAL_ZONE_COUNT: i32 = 256 * 256 * 4 * CollisionFlagMap.ZONE_TILE_COUNT;

    @inline
    static zoneIndex(x: i32, z: i32, level: i32): i32 {
        return ((x >> 3) & 0x7ff) | (((z >> 3) & 0x7ff) << 11) | ((level & 0x3) << 22);
    }

    @inline
    static tileIndex(x: i32, z: i32): i32 {
        return (x & 0x7) | ((z & 0x7) << 3);
    }

    readonly flags: StaticArray<StaticArray<i32> | null> = new StaticArray(CollisionFlagMap.TOTAL_ZONE_COUNT);

    get(absoluteX: i32, absoluteZ: i32, level: i32): i32 {
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        const flags: StaticArray<i32> | null = unchecked(this.flags[CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level)]);
        if (flags == null) {
            return CollisionFlag.NULL;
        }
        if (flags.length <= tileIndex) {
            return CollisionFlag.NULL;
        }
        return unchecked(flags[tileIndex]);
    }

    set(absoluteX: i32, absoluteZ: i32, level: i32, mask: i32): void {
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        let tiles: StaticArray<i32> | null = unchecked(this.flags[CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level)]);
        if (tiles == null) {
            tiles = this.allocateIfAbsent(absoluteX, absoluteZ, level);
        }
        unchecked((tiles[tileIndex] = mask));
    }

    add(absoluteX: i32, absoluteZ: i32, level: i32, mask: i32): void {
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        const flags: StaticArray<i32> | null = unchecked(this.flags[CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level)]);
        let currentFlags: i32 = CollisionFlag.OPEN;
        if (flags != null && tileIndex < flags.length) {
            unchecked((currentFlags = flags[tileIndex]));
        }
        this.set(absoluteX, absoluteZ, level, currentFlags | mask);
    }

    remove(absoluteX: i32, absoluteZ: i32, level: i32, mask: i32): void {
        const tileIndex: i32 = CollisionFlagMap.tileIndex(absoluteX, absoluteZ);
        const flags: StaticArray<i32> | null = unchecked(this.flags[CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level)]);
        let currentFlags: i32 = CollisionFlag.OPEN;
        if (flags != null && tileIndex < flags.length) {
            unchecked((currentFlags = flags[tileIndex]));
        }
        this.set(absoluteX, absoluteZ, level, currentFlags & ~mask);
    }

    allocateIfAbsent(absoluteX: i32, absoluteZ: i32, level: i32): StaticArray<i32> {
        const zoneIndex: i32 = CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level);
        const existingFlags: StaticArray<i32> | null = unchecked(this.flags[zoneIndex]);
        if (existingFlags != null) {
            return existingFlags;
        }

        const tileFlags: StaticArray<i32> = new StaticArray<i32>(CollisionFlagMap.ZONE_TILE_COUNT);
        unchecked((this.flags[zoneIndex] = tileFlags));
        return tileFlags;
    }

    deallocateIfPresent(absoluteX: i32, absoluteZ: i32, level: i32): void {
        unchecked((this.flags[CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level)] = null));
    }

    isZoneAllocated(absoluteX: i32, absoluteZ: i32, level: i32): bool {
        return unchecked(this.flags[CollisionFlagMap.zoneIndex(absoluteX, absoluteZ, level)] != null);
    }

    isFlagged(x: i32, z: i32, level: i32, masks: i32): bool {
        return (this.get(x, z, level) & masks) !== CollisionFlag.OPEN;
    }
}
