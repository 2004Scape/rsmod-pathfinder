import CollisionFlagMap from '../collision/CollisionFlagMap';
import RotationUtils from '../utils/RotationUtils';
import RectangleBoundaryUtils from './RectangleBoundaryUtils';
import {CollisionFlag} from '../flag/CollisionFlag';

export default class ReachStrategy {
    private static readonly WALL_STRATEGY: i32 = 0;
    private static readonly WALL_DECOR_STRATEGY: i32 = 1;
    private static readonly RECTANGLE_STRATEGY: i32 = 2;
    private static readonly NO_STRATEGY: i32 = 3;
    private static readonly RECTANGLE_EXCLUSIVE_STRATEGY: i32 = 4;

    @inline
    private static exitStrategy(locShape: i32): i32 {
        if (locShape === -2) {
            return this.RECTANGLE_EXCLUSIVE_STRATEGY;
        } else if (locShape === -1) {
            return this.NO_STRATEGY;
        } else if ((locShape >= 0 && locShape <= 3) || locShape === 9) {
            return this.WALL_STRATEGY;
        } else if (locShape < 9) {
            return this.WALL_DECOR_STRATEGY;
        } else if ((locShape >= 10 && locShape <= 11) || locShape === 22) {
            return this.RECTANGLE_STRATEGY;
        }
        return this.NO_STRATEGY;
    }

    @inline
    private static alteredRotation(angle: i32, shape: i32): i32 {
        return shape === 7 ? (angle + 2) & 0x3 : angle;
    }

    static reached(
        flags: CollisionFlagMap,
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        destWidth: i32,
        destHeight: i32,
        srcSize: i32,
        angle: i32 = 0,
        shape: i32 = -1,
        blockAccessFlags: i32 = 0
    ): bool {
        const exitStrategy: i32 = this.exitStrategy(shape);
        if (exitStrategy !== this.RECTANGLE_EXCLUSIVE_STRATEGY && srcX === destX && srcZ === destZ) {
            return true;
        }
        switch (exitStrategy) {
            case this.WALL_STRATEGY:
                return this.reachWall(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
            case this.WALL_DECOR_STRATEGY:
                return this.reachWallDecor(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
            case this.RECTANGLE_STRATEGY:
                return this.reachRectangle(flags, level, srcX, srcZ, destX, destZ, srcSize, destWidth, destHeight, angle, blockAccessFlags);
            case this.RECTANGLE_EXCLUSIVE_STRATEGY:
                return this.reachExclusiveRectangle(flags, level, srcX, srcZ, destX, destZ, srcSize, destWidth, destHeight, angle, blockAccessFlags);
        }
        return false;
    }

    private static reachRectangle(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i32, destWidth: i32, destHeight: i32, angle: i32 = 0, blockAccessFlags: i32 = 0): bool {
        const rotatedWidth: i32 = RotationUtils.rotate(angle, destWidth, destHeight);
        const rotatedHeight: i32 = RotationUtils.rotate(angle, destHeight, destWidth);
        const rotatedBlockAccess: i32 = RotationUtils.rotateFlags(angle, blockAccessFlags);
        const collides: bool = RectangleBoundaryUtils.collides(srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight);

        if (srcSize > 1) {
            return collides || RectangleBoundaryUtils.reachRectangleN(flags, level, srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight, rotatedBlockAccess);
        }
        return collides || RectangleBoundaryUtils.reachRectangle1(flags, level, srcX, srcZ, destX, destZ, rotatedWidth, rotatedHeight, rotatedBlockAccess);
    }

    private static reachExclusiveRectangle(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i32, destWidth: i32, destHeight: i32, angle: i32 = 0, blockAccessFlags: i32 = 0): bool {
        const rotatedWidth: i32 = RotationUtils.rotate(angle, destWidth, destHeight);
        const rotatedHeight: i32 = RotationUtils.rotate(angle, destHeight, destWidth);
        const rotatedBlockAccess: i32 = RotationUtils.rotateFlags(angle, blockAccessFlags);
        const collides: bool = RectangleBoundaryUtils.collides(srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight);

        if (srcSize > 1) {
            return !collides && RectangleBoundaryUtils.reachRectangleN(flags, level, srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight, rotatedBlockAccess);
        }
        return !collides && RectangleBoundaryUtils.reachRectangle1(flags, level, srcX, srcZ, destX, destZ, rotatedWidth, rotatedHeight, rotatedBlockAccess);
    }

    private static reachWall(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i32, shape: i32, angle: i32): bool {
        if (srcSize === 1 && srcX === destX && srcZ === destZ) {
            return true;
        } else if (srcSize !== 1 && destX >= srcX && srcSize + srcX - 1 >= destX && destZ >= srcZ && srcSize + srcZ - 1 >= destZ) {
            return true;
        } else if (srcSize === 1) {
            return this.reachWall1(flags, level, srcX, srcZ, destX, destZ, shape, angle);
        }
        return this.reachWallN(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
    }

    private static reachWallDecor(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i32, shape: i32, angle: i32): bool {
        if (srcSize === 1 && srcX === destX && srcZ === destZ) {
            return true;
        } else if (srcSize !== 1 && destX >= srcX && srcSize + srcX - 1 >= destX && destZ >= srcZ && srcSize + srcZ - 1 >= destZ) {
            return true;
        } else if (srcSize === 1) {
            return this.reachWallDecor1(flags, level, srcX, srcZ, destX, destZ, shape, angle);
        }
        return this.reachWallDecorN(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
    }

    private static reachWall1(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, shape: i32, angle: i32): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        if (shape === 0) {
            if (angle === 0) {
                if (srcX === destX - 1 && srcZ === destZ) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 1) {
                if (srcX === destX && srcZ === destZ + 1) {
                    return true;
                } else if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 2) {
                if (srcX === destX + 1 && srcZ === destZ) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 3) {
                if (srcX === destX && srcZ === destZ - 1) {
                    return true;
                } else if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape === 2) {
            if (angle === 0) {
                if (srcX === destX - 1 && srcZ === destZ) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1) {
                    return true;
                } else if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 1) {
                if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1) {
                    return true;
                } else if (srcX === destX + 1 && srcZ === destZ) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 2) {
                if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ === destZ) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1) {
                    return true;
                }
                return false;
            } else if (angle === 3) {
                if (srcX === destX - 1 && srcZ === destZ) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape === 9) {
            if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_EAST) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_WEST) === CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }

    private static reachWallN(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i32, shape: i32, angle: i32): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        const east: i32 = srcX + srcSize - 1;
        const north: i32 = srcZ + srcSize - 1;
        if (shape === 0) {
            if (angle === 0) {
                if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 1) {
                if (destX >= srcX && destX <= east && srcZ === destZ + 1) {
                    return true;
                } else if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 2) {
                if (srcX === destX + 1 && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 3) {
                if (destX >= srcX && destX <= east && srcZ === destZ - srcSize) {
                    return true;
                } else if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape === 2) {
            if (angle === 0) {
                if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ + 1) {
                    return true;
                } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 1) {
                if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ + 1) {
                    return true;
                } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle === 2) {
                if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ - srcSize) {
                    return true;
                }
                return false;
            } else if (angle === 3) {
                if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ === destZ - srcSize) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape === 9) {
            if (destX >= srcX && destX <= east && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) === CollisionFlag.OPEN) {
                return true;
            } else if (destX >= srcX && destX <= east && srcZ === destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) === CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }

    private static reachWallDecor1(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, shape: i32, angle: i32): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        if (shape === 6 || shape === 7) {
            const number: i32 = this.alteredRotation(angle, shape);
            if (number === 0) {
                if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (number === 1) {
                if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (number === 2) {
                if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (number === 3) {
                if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
            }
            return false;
        } else if (shape === 8) {
            if (srcX === destX && srcZ === destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX && srcZ === destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX - 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_EAST) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX + 1 && srcZ === destZ && (collisionFlags & CollisionFlag.WALL_WEST) === CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }

    private static reachWallDecorN(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i32, shape: i32, angle: i32): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        const east: i32 = srcX + srcSize - 1;
        const north: i32 = srcZ + srcSize - 1;
        if (shape === 6 || shape === 7) {
            const number: i32 = this.alteredRotation(angle, shape);
            if (number === 0) {
                if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ === destZ - srcSize && east >= destX && (collisionFlags & CollisionFlag.WALL_NORTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (number === 1) {
                if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ === destZ - srcSize && east >= destX && (collisionFlags & CollisionFlag.WALL_NORTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (number === 2) {
                if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_EAST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ === destZ + 1 && east >= destX && (collisionFlags & CollisionFlag.WALL_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (number === 3) {
                if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_WEST) === CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ === destZ + 1 && east >= destX && (collisionFlags & CollisionFlag.WALL_SOUTH) === CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape === 8) {
            if (srcX <= destX && srcZ === destZ + 1 && east >= destX && (collisionFlags & CollisionFlag.WALL_SOUTH) === 0) {
                return true;
            } else if (srcX <= destX && srcZ === destZ - srcSize && east >= destX && (collisionFlags & CollisionFlag.WALL_NORTH) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_EAST) === CollisionFlag.OPEN) {
                return true;
            } else if (srcX === destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_WEST) === CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }
}
