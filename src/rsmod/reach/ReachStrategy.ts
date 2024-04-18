import CollisionFlagMap from '../collision/CollisionFlagMap';
import RotationUtils from '../utils/RotationUtils';
import RectangleBoundaryUtils from './RectangleBoundaryUtils';
import {CollisionFlag} from '../flag/CollisionFlag';
import {LocShape} from '../LocShape';
import {LocAngle} from '../LocAngle';

@final
export default class ReachStrategy {
    @inline private static readonly WALL_STRATEGY: i8 = 0;
    @inline private static readonly WALL_DECOR_STRATEGY: i8 = 1;
    @inline private static readonly RECTANGLE_STRATEGY: i8 = 2;
    @inline private static readonly NO_STRATEGY: i8 = 3;
    @inline private static readonly RECTANGLE_EXCLUSIVE_STRATEGY: i8 = 4;

    @inline
    private static exitStrategy(locShape: i8): i8 {
        if (locShape == -2) {
            return this.RECTANGLE_EXCLUSIVE_STRATEGY;
        } else if (locShape == -1) {
            return this.NO_STRATEGY;
        } else if ((locShape >= 0 && locShape <= 3) || locShape == 9) {
            return this.WALL_STRATEGY;
        } else if (locShape < 9) {
            return this.WALL_DECOR_STRATEGY;
        } else if ((locShape >= 10 && locShape <= 11) || locShape == 22) {
            return this.RECTANGLE_STRATEGY;
        }
        return this.NO_STRATEGY;
    }

    @inline
    private static alteredRotation(angle: i8, shape: i8): i8 {
        return shape == 7 ? (angle + 2) & 0x3 : angle;
    }

    // prettier-ignore
    @inline
    static reached(
        flags: CollisionFlagMap,
        level: i8,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        destWidth: i8,
        destHeight: i8,
        srcSize: i8,
        angle: i8 = 0,
        shape: i8 = -1,
        blockAccessFlags: i8 = 0
    ): bool {
        const exitStrategy: i8 = this.exitStrategy(shape);
        if (exitStrategy != this.RECTANGLE_EXCLUSIVE_STRATEGY && srcX == destX && srcZ == destZ) {
            return true;
        }
        if (exitStrategy == this.WALL_STRATEGY) {
            return this.reachWall(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
        } else if (exitStrategy == this.WALL_DECOR_STRATEGY) {
            return this.reachWallDecor(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
        } else if (exitStrategy == this.RECTANGLE_STRATEGY) {
            return this.reachRectangle(flags, level, srcX, srcZ, destX, destZ, srcSize, destWidth, destHeight, angle, blockAccessFlags);
        } else if (exitStrategy == this.RECTANGLE_EXCLUSIVE_STRATEGY) {
            return this.reachExclusiveRectangle(flags, level, srcX, srcZ, destX, destZ, srcSize, destWidth, destHeight, angle, blockAccessFlags);
        }
        return false;
    }

    @inline
    private static reachRectangle(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i8, destWidth: i8, destHeight: i8, angle: i8 = 0, blockAccessFlags: i8 = 0): bool {
        const rotatedWidth: i32 = RotationUtils.rotate(angle, destWidth, destHeight);
        const rotatedHeight: i32 = RotationUtils.rotate(angle, destHeight, destWidth);
        const rotatedBlockAccess: i32 = RotationUtils.rotateFlags(angle, blockAccessFlags);
        const collides: bool = RectangleBoundaryUtils.collides(srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight);

        if (srcSize > 1) {
            return collides || RectangleBoundaryUtils.reachRectangleN(flags, level, srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight, rotatedBlockAccess);
        }
        return collides || RectangleBoundaryUtils.reachRectangle1(flags, level, srcX, srcZ, destX, destZ, rotatedWidth, rotatedHeight, rotatedBlockAccess);
    }

    @inline
    private static reachExclusiveRectangle(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i8, destWidth: i8, destHeight: i8, angle: i8 = 0, blockAccessFlags: i8 = 0): bool {
        const rotatedWidth: i32 = RotationUtils.rotate(angle, destWidth, destHeight);
        const rotatedHeight: i32 = RotationUtils.rotate(angle, destHeight, destWidth);
        const rotatedBlockAccess: i32 = RotationUtils.rotateFlags(angle, blockAccessFlags);
        const collides: bool = RectangleBoundaryUtils.collides(srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight);

        if (srcSize > 1) {
            return !collides && RectangleBoundaryUtils.reachRectangleN(flags, level, srcX, srcZ, destX, destZ, srcSize, srcSize, rotatedWidth, rotatedHeight, rotatedBlockAccess);
        }
        return !collides && RectangleBoundaryUtils.reachRectangle1(flags, level, srcX, srcZ, destX, destZ, rotatedWidth, rotatedHeight, rotatedBlockAccess);
    }

    @inline
    private static reachWall(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i8, shape: i8, angle: i8): bool {
        if (srcSize == 1 && srcX == destX && srcZ == destZ) {
            return true;
        } else if (srcSize != 1 && destX >= srcX && srcSize + srcX - 1 >= destX && destZ >= srcZ && srcSize + srcZ - 1 >= destZ) {
            return true;
        } else if (srcSize == 1) {
            return this.reachWall1(flags, level, srcX, srcZ, destX, destZ, shape, angle);
        }
        return this.reachWallN(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
    }

    @inline
    private static reachWallDecor(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i8, shape: i8, angle: i8): bool {
        if (srcSize == 1 && srcX == destX && srcZ == destZ) {
            return true;
        } else if (srcSize != 1 && destX >= srcX && srcSize + srcX - 1 >= destX && destZ >= srcZ && srcSize + srcZ - 1 >= destZ) {
            return true;
        } else if (srcSize == 1) {
            return this.reachWallDecor1(flags, level, srcX, srcZ, destX, destZ, shape, angle);
        }
        return this.reachWallDecorN(flags, level, srcX, srcZ, destX, destZ, srcSize, shape, angle);
    }

    @inline
    private static reachWall1(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, shape: i8, angle: i8): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        if (shape == LocShape.WALL_STRAIGHT) {
            if (angle == LocAngle.WEST) {
                if (srcX == destX - 1 && srcZ == destZ) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.NORTH) {
                if (srcX == destX && srcZ == destZ + 1) {
                    return true;
                } else if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.EAST) {
                if (srcX == destX + 1 && srcZ == destZ) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.SOUTH) {
                if (srcX == destX && srcZ == destZ - 1) {
                    return true;
                } else if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape == LocShape.WALL_L) {
            if (angle == LocAngle.WEST) {
                if (srcX == destX - 1 && srcZ == destZ) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1) {
                    return true;
                } else if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.NORTH) {
                if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1) {
                    return true;
                } else if (srcX == destX + 1 && srcZ == destZ) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.EAST) {
                if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ == destZ) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.SOUTH) {
                if (srcX == destX - 1 && srcZ == destZ) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape == LocShape.WALL_DIAGONAL) {
            if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }

    @inline
    private static reachWallN(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i8, shape: i8, angle: i8): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        const east: i32 = srcX + srcSize - 1;
        const north: i32 = srcZ + srcSize - 1;
        if (shape == LocShape.WALL_STRAIGHT) {
            if (angle == LocAngle.WEST) {
                if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.NORTH) {
                if (destX >= srcX && destX <= east && srcZ == destZ + 1) {
                    return true;
                } else if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.EAST) {
                if (srcX == destX + 1 && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.SOUTH) {
                if (destX >= srcX && destX <= east && srcZ == destZ - srcSize) {
                    return true;
                } else if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape == LocShape.WALL_L) {
            if (angle == LocAngle.WEST) {
                if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ + 1) {
                    return true;
                } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.NORTH) {
                if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ + 1) {
                    return true;
                } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.EAST) {
                if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ - srcSize) {
                    return true;
                }
                return false;
            } else if (angle == LocAngle.SOUTH) {
                if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (destX >= srcX && destX <= east && srcZ == destZ - srcSize) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape == LocShape.WALL_DIAGONAL) {
            if (destX >= srcX && destX <= east && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.BLOCK_NORTH) == CollisionFlag.OPEN) {
                return true;
            } else if (destX >= srcX && destX <= east && srcZ == destZ - srcSize && (collisionFlags & CollisionFlag.BLOCK_SOUTH) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_WEST) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.BLOCK_EAST) == CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }

    @inline
    private static reachWallDecor1(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, shape: i8, angle: i8): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        if (shape == LocShape.WALLDECOR_DIAGONAL_OFFSET || shape == LocShape.WALLDECOR_DIAGONAL_NOOFFSET) {
            const alteredAngle: i32 = this.alteredRotation(angle, shape);
            if (alteredAngle == LocAngle.WEST) {
                if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (alteredAngle == LocAngle.NORTH) {
                if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (alteredAngle == LocAngle.EAST) {
                if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (alteredAngle == LocAngle.SOUTH) {
                if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
            }
            return false;
        } else if (shape == LocShape.WALLDECOR_DIAGONAL_BOTH) {
            if (srcX == destX && srcZ == destZ + 1 && (collisionFlags & CollisionFlag.WALL_SOUTH) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX && srcZ == destZ - 1 && (collisionFlags & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX - 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX + 1 && srcZ == destZ && (collisionFlags & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }

    @inline
    private static reachWallDecorN(flags: CollisionFlagMap, level: i32, srcX: i32, srcZ: i32, destX: i32, destZ: i32, srcSize: i8, shape: i8, angle: i8): bool {
        const collisionFlags: i32 = flags.get(srcX, srcZ, level);
        const east: i32 = srcX + srcSize - 1;
        const north: i32 = srcZ + srcSize - 1;
        if (shape == LocShape.WALLDECOR_DIAGONAL_OFFSET || shape == LocShape.WALLDECOR_DIAGONAL_NOOFFSET) {
            const alteredAngle: i32 = this.alteredRotation(angle, shape);
            if (alteredAngle == LocAngle.WEST) {
                if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ == destZ - srcSize && east >= destX && (collisionFlags & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (alteredAngle == LocAngle.NORTH) {
                if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ == destZ - srcSize && east >= destX && (collisionFlags & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (alteredAngle == LocAngle.EAST) {
                if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ == destZ + 1 && east >= destX && (collisionFlags & CollisionFlag.WALL_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            } else if (alteredAngle == LocAngle.SOUTH) {
                if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                    return true;
                } else if (srcX <= destX && srcZ == destZ + 1 && east >= destX && (collisionFlags & CollisionFlag.WALL_SOUTH) == CollisionFlag.OPEN) {
                    return true;
                }
                return false;
            }
            return false;
        } else if (shape == LocShape.WALLDECOR_DIAGONAL_BOTH) {
            if (srcX <= destX && srcZ == destZ + 1 && east >= destX && (collisionFlags & CollisionFlag.WALL_SOUTH) == 0) {
                return true;
            } else if (srcX <= destX && srcZ == destZ - srcSize && east >= destX && (collisionFlags & CollisionFlag.WALL_NORTH) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX - srcSize && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_EAST) == CollisionFlag.OPEN) {
                return true;
            } else if (srcX == destX + 1 && srcZ <= destZ && north >= destZ && (collisionFlags & CollisionFlag.WALL_WEST) == CollisionFlag.OPEN) {
                return true;
            }
            return false;
        }
        return false;
    }
}
