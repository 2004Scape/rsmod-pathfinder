import CollisionFlagMap from './collision/CollisionFlagMap';
import {CollisionStrategy} from './collision/CollisionStrategy';
import {CollisionFlag} from './flag/CollisionFlag';

export default class StepValidator {
    private readonly flags: CollisionFlagMap;

    constructor(flags: CollisionFlagMap) {
        this.flags = flags;
    }

    canTravel(level: i32, x: i32, z: i32, offsetX: i32, offsetZ: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        let blocked: bool;
        if (offsetX === 0 && offsetZ === -1) {
            blocked = this.isBlockedSouth(level, x, z, size, extraFlag, collision);
        } else if (offsetX === 0 && offsetZ === 1) {
            blocked = this.isBlockedNorth(level, x, z, size, extraFlag, collision);
        } else if (offsetX === -1 && offsetZ === 0) {
            blocked = this.isBlockedWest(level, x, z, size, extraFlag, collision);
        } else if (offsetX === 1 && offsetZ === 0) {
            blocked = this.isBlockedEast(level, x, z, size, extraFlag, collision);
        } else if (offsetX === -1 && offsetZ === -1) {
            blocked = this.isBlockedSouthWest(level, x, z, size, extraFlag, collision);
        } else if (offsetX === -1 && offsetZ === 1) {
            blocked = this.isBlockedNorthWest(level, x, z, size, extraFlag, collision);
        } else if (offsetX === 1 && offsetZ === -1) {
            blocked = this.isBlockedSouthEast(level, x, z, size, extraFlag, collision);
        } else if (offsetX === 1 && offsetZ === 1) {
            blocked = this.isBlockedNorthEast(level, x, z, size, extraFlag, collision);
        } else {
            throw new Error(`Invalid offsets: offsetX was: ${offsetX}, offsetZ was: ${offsetZ}`);
        }
        return !blocked;
    }

    private isBlockedSouth(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return !collision.canMove(this.flags.get(x, z - 1, level), CollisionFlag.BLOCK_SOUTH | extraFlag);
            case 2:
                return !collision.canMove(this.flags.get(x, z - 1, level), CollisionFlag.BLOCK_SOUTH_WEST | extraFlag) || !collision.canMove(this.flags.get(x + 1, z - 1, level), CollisionFlag.BLOCK_SOUTH_EAST | extraFlag);
            default:
                if (!collision.canMove(this.flags.get(x, z - 1, level), CollisionFlag.BLOCK_SOUTH_WEST | extraFlag)) {
                    return true;
                } else if (!collision.canMove(this.flags.get(x + size - 1, z - 1, level), CollisionFlag.BLOCK_SOUTH_EAST | extraFlag)) {
                    return true;
                }
                for (let midX: i32 = x + 1; midX < x + size - 1; midX++) {
                    if (!collision.canMove(this.flags.get(midX, z - 1, level), CollisionFlag.BLOCK_NORTH_EAST_AND_WEST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }

    private isBlockedNorth(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return !collision.canMove(this.flags.get(x, z + 1, level), CollisionFlag.BLOCK_NORTH | extraFlag);
            case 2:
                return !collision.canMove(this.flags.get(x, z + 2, level), CollisionFlag.BLOCK_NORTH_WEST | extraFlag) || !collision.canMove(this.flags.get(x + 1, z + 2, level), CollisionFlag.BLOCK_NORTH_EAST | extraFlag);
            default:
                if (!collision.canMove(this.flags.get(x, z + size, level), CollisionFlag.BLOCK_NORTH_WEST | extraFlag)) {
                    return true;
                } else if (!collision.canMove(this.flags.get(x + size - 1, z + size, level), CollisionFlag.BLOCK_NORTH_EAST | extraFlag)) {
                    return true;
                }
                for (let midX: i32 = x + 1; midX < x + size - 1; midX++) {
                    if (!collision.canMove(this.flags.get(midX, z + size, level), CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }

    private isBlockedWest(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return !collision.canMove(this.flags.get(x - 1, z, level), CollisionFlag.BLOCK_WEST | extraFlag);
            case 2:
                return !collision.canMove(this.flags.get(x - 1, z, level), CollisionFlag.BLOCK_SOUTH_WEST | extraFlag) || !collision.canMove(this.flags.get(x - 1, z + 1, level), CollisionFlag.BLOCK_NORTH_WEST | extraFlag);
            default:
                if (!collision.canMove(this.flags.get(x - 1, z, level), CollisionFlag.BLOCK_SOUTH_WEST | extraFlag)) {
                    return true;
                } else if (!collision.canMove(this.flags.get(x - 1, z + size - 1, level), CollisionFlag.BLOCK_NORTH_WEST | extraFlag)) {
                    return true;
                }
                for (let midZ: i32 = z + 1; midZ < z + size - 1; midZ++) {
                    if (!collision.canMove(this.flags.get(x - 1, midZ, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }

    private isBlockedEast(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return !collision.canMove(this.flags.get(x + 1, z, level), CollisionFlag.BLOCK_EAST | extraFlag);
            case 2:
                return !collision.canMove(this.flags.get(x + 2, z, level), CollisionFlag.BLOCK_SOUTH_EAST | extraFlag) || !collision.canMove(this.flags.get(x + 2, z + 1, level), CollisionFlag.BLOCK_NORTH_EAST | extraFlag);
            default:
                if (!collision.canMove(this.flags.get(x + size, z, level), CollisionFlag.BLOCK_SOUTH_EAST | extraFlag)) {
                    return true;
                } else if (!collision.canMove(this.flags.get(x + size, z + size - 1, level), CollisionFlag.BLOCK_NORTH_EAST | extraFlag)) {
                    return true;
                }
                for (let midZ: i32 = z + 1; midZ < z + size - 1; midZ++) {
                    if (!collision.canMove(this.flags.get(x + size, midZ, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }

    private isBlockedSouthWest(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return (
                    !collision.canMove(this.flags.get(x - 1, z - 1, level), CollisionFlag.BLOCK_SOUTH_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x - 1, z, level), CollisionFlag.BLOCK_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x, z - 1, level), CollisionFlag.BLOCK_SOUTH | extraFlag)
                );
            case 2:
                return (
                    !collision.canMove(this.flags.get(x - 1, z, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x - 1, z - 1, level), CollisionFlag.BLOCK_SOUTH_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x, z - 1, level), CollisionFlag.BLOCK_NORTH_EAST_AND_WEST | extraFlag)
                );
            default:
                if (!collision.canMove(this.flags.get(x - 1, z - 1, level), CollisionFlag.BLOCK_SOUTH_WEST | extraFlag)) {
                    return true;
                }
                for (let mid: i32 = 1; mid < size; mid++) {
                    if (!collision.canMove(this.flags.get(x - 1, z + mid - 1, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST | extraFlag)) {
                        return true;
                    } else if (!collision.canMove(this.flags.get(x + mid - 1, z - 1, level), CollisionFlag.BLOCK_NORTH_EAST_AND_WEST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }

    private isBlockedNorthWest(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return (
                    !collision.canMove(this.flags.get(x - 1, z + 1, level), CollisionFlag.BLOCK_NORTH_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x - 1, z, level), CollisionFlag.BLOCK_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x, z + 1, level), CollisionFlag.BLOCK_NORTH | extraFlag)
                );
            case 2:
                return (
                    !collision.canMove(this.flags.get(x - 1, z + 1, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x - 1, z + 2, level), CollisionFlag.BLOCK_NORTH_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x, z + 2, level), CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST | extraFlag)
                );
            default:
                if (!collision.canMove(this.flags.get(x - 1, z + size, level), CollisionFlag.BLOCK_NORTH_WEST | extraFlag)) {
                    return true;
                }
                for (let mid: i32 = 1; mid < size; mid++) {
                    if (!collision.canMove(this.flags.get(x - 1, z + mid, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST | extraFlag)) {
                        return true;
                    } else if (!collision.canMove(this.flags.get(x + mid - 1, z + size, level), CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }

    private isBlockedSouthEast(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return (
                    !collision.canMove(this.flags.get(x + 1, z - 1, level), CollisionFlag.BLOCK_SOUTH_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x + 1, z, level), CollisionFlag.BLOCK_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x, z - 1, level), CollisionFlag.BLOCK_SOUTH | extraFlag)
                );
            case 2:
                return (
                    !collision.canMove(this.flags.get(x + 1, z - 1, level), CollisionFlag.BLOCK_NORTH_EAST_AND_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x + 2, z - 1, level), CollisionFlag.BLOCK_SOUTH_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x + 2, z, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST | extraFlag)
                );
            default:
                for (let mid: i32 = 1; mid < size; mid++) {
                    if (!collision.canMove(this.flags.get(x + size, z + mid - 1, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST | extraFlag)) {
                        return true;
                    } else if (!collision.canMove(this.flags.get(x + mid, z - 1, level), CollisionFlag.BLOCK_NORTH_EAST_AND_WEST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }

    private isBlockedNorthEast(level: i32, x: i32, z: i32, size: i32, extraFlag: i32, collision: CollisionStrategy): bool {
        switch (size) {
            case 1:
                return (
                    !collision.canMove(this.flags.get(x + 1, z + 1, level), CollisionFlag.BLOCK_NORTH_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x + 1, z, level), CollisionFlag.BLOCK_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x, z + 1, level), CollisionFlag.BLOCK_NORTH | extraFlag)
                );
            case 2:
                return (
                    !collision.canMove(this.flags.get(x + 1, z + 2, level), CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST | extraFlag) ||
                    !collision.canMove(this.flags.get(x + 2, z + 2, level), CollisionFlag.BLOCK_NORTH_EAST | extraFlag) ||
                    !collision.canMove(this.flags.get(x + 2, z + 1, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST | extraFlag)
                );
            default:
                if (!collision.canMove(this.flags.get(x + size, z + size, level), CollisionFlag.BLOCK_NORTH_EAST | extraFlag)) {
                    return true;
                }
                for (let mid: i32 = 1; mid < size; mid++) {
                    if (!collision.canMove(this.flags.get(x + mid, z + size, level), CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST | extraFlag)) {
                        return true;
                    } else if (!collision.canMove(this.flags.get(x + size, z + mid, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST | extraFlag)) {
                        return true;
                    }
                }
                return false;
        }
    }
}
