import CollisionFlagMap from '../collision/CollisionFlagMap';
import {CollisionFlag} from '../flag/CollisionFlag';
import BlockAccessFlag from '../flag/BlockAccessFlag';

@final
export default class RectangleBoundaryUtils {
    @inline
    static collides(srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcWidth: i32, srcHeight: i32, destWidth: i32, destHeight: i32): bool {
        return srcX >= destX + destWidth || srcX + srcWidth <= destX ? false : srcZ < destZ + destHeight && destZ < srcHeight + srcZ;
    }

    @inline
    static reachRectangle1(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, destWidth: i32, destHeight: i32, blockAccessFlags: i32): bool {
        const east: i32 = destX + destWidth - 1;
        const north: i32 = destZ + destHeight - 1;

        if (srcX == destX - 1 && srcZ >= destZ && srcZ <= north && (flags.get(srcX, srcZ, level) & CollisionFlag.WALL_EAST) == 0 && (blockAccessFlags & BlockAccessFlag.BLOCK_WEST) == 0) {
            return true;
        }

        if (srcX == east + 1 && srcZ >= destZ && srcZ <= north && (flags.get(srcX, srcZ, level) & CollisionFlag.WALL_WEST) == 0 && (blockAccessFlags & BlockAccessFlag.BLOCK_EAST) == 0) {
            return true;
        }

        if (srcZ + 1 == destZ && srcX >= destX && srcX <= east && (flags.get(srcX, srcZ, level) & CollisionFlag.WALL_NORTH) == 0 && (blockAccessFlags & BlockAccessFlag.BLOCK_SOUTH) == 0) {
            return true;
        }

        return srcZ == north + 1 && srcX >= destX && srcX <= east && (flags.get(srcX, srcZ, level) & CollisionFlag.WALL_SOUTH) == 0 && (blockAccessFlags & BlockAccessFlag.BLOCK_NORTH) == 0;
    }

    @inline
    static reachRectangleN(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcWidth: i32, srcHeight: i32, destWidth: i32, destHeight: i32, blockAccessFlags: i32): bool {
        const srcEast: i32 = srcX + srcWidth;
        const srcNorth: i32 = srcHeight + srcZ;
        const destEast: i32 = destWidth + destX;
        const destNorth: i32 = destHeight + destZ;

        if (destEast == srcX && (blockAccessFlags & BlockAccessFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
            const fromZ: i32 = <i32>Math.max(srcZ, destZ);
            const toZ: i32 = <i32>Math.min(srcNorth, destNorth);
            for (let sideZ: i32 = fromZ; sideZ < toZ; sideZ++) {
                if ((flags.get(destEast - 1, sideZ, level) & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                    return true;
                }
            }
        } else if (srcEast == destX && (blockAccessFlags & BlockAccessFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
            const fromZ: i32 = <i32>Math.max(srcZ, destZ);
            const toZ: i32 = <i32>Math.min(srcNorth, destNorth);
            for (let sideZ: i32 = fromZ; sideZ < toZ; sideZ++) {
                if ((flags.get(destX, sideZ, level) & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                    return true;
                }
            }
        } else if (srcZ == destNorth && (blockAccessFlags & BlockAccessFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
            const fromX: i32 = <i32>Math.max(srcX, destX);
            const toX: i32 = <i32>Math.min(srcEast, destEast);
            for (let sideX: i32 = fromX; sideX < toX; sideX++) {
                if ((flags.get(sideX, destNorth - 1, level) & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                    return true;
                }
            }
        } else if (destZ == srcNorth && (blockAccessFlags & BlockAccessFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
            const fromX: i32 = <i32>Math.max(srcX, destX);
            const toX: i32 = <i32>Math.min(srcEast, destEast);
            for (let sideX: i32 = fromX; sideX < toX; sideX++) {
                if ((flags.get(sideX, destZ, level) & CollisionFlag.WALL_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
            }
        }
        return false;
    }
}
