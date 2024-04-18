// The entry file of your WebAssembly module.
import PathFinder from './rsmod/PathFinder';
import CollisionFlagMap from './rsmod/collision/CollisionFlagMap';
import {CollisionFlag} from './rsmod/flag/CollisionFlag';
import {LocAngle} from './rsmod/LocAngle';
import {LocShape} from './rsmod/LocShape';
import {LocLayer} from './rsmod/LocLayer';
import {CollisionStrategy, CollisionType} from './rsmod/collision/CollisionStrategy';
import StepValidator from './rsmod/StepValidator';
import CollisionStrategies from './rsmod/collision/CollisionStrategies';
import LineValidator from './rsmod/LineValidator';
import LinePathFinder from './rsmod/LinePathFinder';
import ReachStrategy from './rsmod/reach/ReachStrategy';
import NaivePathFinder from './rsmod/NaivePathFinder';

const flags: CollisionFlagMap = new CollisionFlagMap();
const pathfinder: PathFinder = new PathFinder(flags);
const stepValidator: StepValidator = new StepValidator(flags);
const lineValidator: LineValidator = new LineValidator(flags);
const linePathFinder: LinePathFinder = new LinePathFinder(flags);
const naivePathfinder: NaivePathFinder = new NaivePathFinder(stepValidator);

export {CollisionFlag, LocShape, LocAngle, CollisionType, LocLayer};

// prettier-ignore
export function findPath(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcSize: i32 = 1,
    destWidth: i32 = 1,
    destHeight: i32 = 1,
    angle: i32 = 0,
    shape: i32 = -1,
    moveNear: bool = true,
    blockAccessFlags: i32 = 0,
    maxWaypoints: i32 = 25,
    collision: CollisionType = CollisionType.NORMAL
): StaticArray<i32> {
    return pathfinder.findPath(
        level,
        srcX,
        srcZ,
        destX,
        destZ,
        srcSize,
        destWidth,
        destHeight,
        angle,
        shape,
        moveNear,
        blockAccessFlags,
        maxWaypoints,
        getCollisionStrategy(collision)
    );
}

// prettier-ignore
export function findNaivePath(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: i32,
    srcHeight: i32,
    destWidth: i32,
    destHeight: i32,
    blockAccessFlags: i32,
    collision: CollisionType = CollisionType.NORMAL
): StaticArray<i32> {
    return naivePathfinder.findPath(
        level,
        srcX,
        srcZ,
        destX,
        destZ,
        srcWidth,
        srcHeight,
        destWidth,
        destHeight,
        blockAccessFlags,
        getCollisionStrategy(collision)
    );
}

// prettier-ignore
export function intersects(
    srcX: i32,
    srcZ: i32,
    srcWidth: i32,
    srcHeight: i32,
    destX: i32,
    destZ: i32,
    destWidth: i32,
    destHeight: i32
): bool {
    return naivePathfinder.intersects(
        srcX,
        srcZ,
        srcWidth,
        srcHeight,
        destX,
        destZ,
        destWidth,
        destHeight
    );
}

export function changeFloor(x: i32, z: i32, level: i32, add: bool): void {
    if (add) {
        flags.add(x, z, level, CollisionFlag.FLOOR);
    } else {
        flags.remove(x, z, level, CollisionFlag.FLOOR);
    }
}

export function changeLoc(x: i32, z: i32, level: i32, width: i32, length: i32, blockrange: bool, breakroutefinding: bool, add: bool): void {
    let mask: i32 = CollisionFlag.LOC;
    if (blockrange) {
        mask |= CollisionFlag.LOC_PROJ_BLOCKER;
    }
    if (breakroutefinding) {
        mask |= CollisionFlag.LOC_ROUTE_BLOCKER;
    }
    for (let index: i32 = 0; index < width * length; index++) {
        const deltaX: i32 = x + (index % width);
        const deltaZ: i32 = z + index / width;
        if (add) {
            flags.add(deltaX, deltaZ, level, mask);
        } else {
            flags.remove(deltaX, deltaZ, level, mask);
        }
    }
}

export function changeNpc(x: i32, z: i32, level: i32, size: i32, add: bool): void {
    const mask: i32 = CollisionFlag.NPC;
    for (let index: i32 = 0; index < size * size; index++) {
        const deltaX: i32 = x + (index % size);
        const deltaZ: i32 = z + index / size;
        if (add) {
            flags.add(deltaX, deltaZ, level, mask);
        } else {
            flags.remove(deltaX, deltaZ, level, mask);
        }
    }
}

export function changePlayer(x: i32, z: i32, level: i32, size: i32, add: bool): void {
    const mask: i32 = CollisionFlag.PLAYER;
    for (let index: i32 = 0; index < size * size; index++) {
        const deltaX: i32 = x + (index % size);
        const deltaZ: i32 = z + index / size;
        if (add) {
            flags.add(deltaX, deltaZ, level, mask);
        } else {
            flags.remove(deltaX, deltaZ, level, mask);
        }
    }
}

export function changeRoof(x: i32, z: i32, level: i32, add: bool): void {
    if (add) {
        flags.add(x, z, level, CollisionFlag.ROOF);
    } else {
        flags.remove(x, z, level, CollisionFlag.ROOF);
    }
}

export function changeWall(x: i32, z: i32, level: i32, angle: i32, shape: i32, blockrange: bool, breakroutefinding: bool, add: bool): void {
    if (shape === LocShape.WALL_STRAIGHT) {
        changeWallStraight(x, z, level, angle, blockrange, breakroutefinding, add);
    } else if (shape === LocShape.WALL_DIAGONAL_CORNER || shape === LocShape.WALL_SQUARE_CORNER) {
        changeWallCorner(x, z, level, angle, blockrange, breakroutefinding, add);
    } else if (shape === LocShape.WALL_L) {
        changeWallL(x, z, level, angle, blockrange, breakroutefinding, add);
    }
}

function changeWallStraight(x: i32, z: i32, level: i32, angle: i32, blockrange: bool, breakroutefinding: bool, add: bool): void {
    const west: i32 = breakroutefinding ? CollisionFlag.WALL_WEST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_WEST_PROJ_BLOCKER : CollisionFlag.WALL_WEST;
    const east: i32 = breakroutefinding ? CollisionFlag.WALL_EAST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_EAST_PROJ_BLOCKER : CollisionFlag.WALL_EAST;
    const north: i32 = breakroutefinding ? CollisionFlag.WALL_NORTH_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_NORTH_PROJ_BLOCKER : CollisionFlag.WALL_NORTH;
    const south: i32 = breakroutefinding ? CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_SOUTH_PROJ_BLOCKER : CollisionFlag.WALL_SOUTH;

    if (angle === LocAngle.WEST) {
        if (add) {
            flags.add(x, z, level, west);
            flags.add(x - 1, z, level, east);
        } else {
            flags.remove(x, z, level, west);
            flags.remove(x - 1, z, level, east);
        }
    } else if (angle === LocAngle.NORTH) {
        if (add) {
            flags.add(x, z, level, north);
            flags.add(x, z + 1, level, south);
        } else {
            flags.remove(x, z, level, north);
            flags.remove(x, z + 1, level, south);
        }
    } else if (angle === LocAngle.EAST) {
        if (add) {
            flags.add(x, z, level, east);
            flags.add(x + 1, z, level, west);
        } else {
            flags.remove(x, z, level, east);
            flags.remove(x + 1, z, level, west);
        }
    } else if (angle === LocAngle.SOUTH) {
        if (add) {
            flags.add(x, z, level, south);
            flags.add(x, z - 1, level, north);
        } else {
            flags.remove(x, z, level, south);
            flags.remove(x, z - 1, level, north);
        }
    }
    if (breakroutefinding) {
        return changeWallStraight(x, z, level, angle, blockrange, false, add);
    }
    if (blockrange) {
        // If just blocked projectiles, then block normally next.
        return changeWallStraight(x, z, level, angle, false, false, add);
    }
}

function changeWallCorner(x: i32, z: i32, level: i32, angle: i32, blockrange: bool, breakroutefinding: bool, add: bool): void {
    const northWest: i32 = breakroutefinding ? CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_NORTH_WEST_PROJ_BLOCKER : CollisionFlag.WALL_NORTH_WEST;
    const southEast: i32 = breakroutefinding ? CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_SOUTH_EAST_PROJ_BLOCKER : CollisionFlag.WALL_SOUTH_EAST;
    const northEast: i32 = breakroutefinding ? CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_NORTH_EAST_PROJ_BLOCKER : CollisionFlag.WALL_NORTH_EAST;
    const southWest: i32 = breakroutefinding ? CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_SOUTH_WEST_PROJ_BLOCKER : CollisionFlag.WALL_SOUTH_WEST;

    if (angle === LocAngle.WEST) {
        if (add) {
            flags.add(x, z, level, northWest);
            flags.add(x - 1, z + 1, level, southEast);
        } else {
            flags.remove(x, z, level, northWest);
            flags.remove(x - 1, z + 1, level, southEast);
        }
    } else if (angle === LocAngle.NORTH) {
        if (add) {
            flags.add(x, z, level, northEast);
            flags.add(x + 1, z + 1, level, southWest);
        } else {
            flags.remove(x, z, level, northEast);
            flags.remove(x + 1, z + 1, level, southWest);
        }
    } else if (angle === LocAngle.EAST) {
        if (add) {
            flags.add(x, z, level, southEast);
            flags.add(x + 1, z - 1, level, northWest);
        } else {
            flags.remove(x, z, level, southEast);
            flags.remove(x + 1, z - 1, level, northWest);
        }
    } else if (angle === LocAngle.SOUTH) {
        if (add) {
            flags.add(x, z, level, southWest);
            flags.add(x - 1, z - 1, level, northEast);
        } else {
            flags.remove(x, z, level, southWest);
            flags.remove(x - 1, z - 1, level, northEast);
        }
    }
    if (breakroutefinding) {
        return changeWallCorner(x, z, level, angle, blockrange, false, add);
    }
    if (blockrange) {
        // If just blocked projectiles, then block normally next.
        return changeWallCorner(x, z, level, angle, false, false, add);
    }
}

function changeWallL(x: i32, z: i32, level: i32, angle: i32, blockrange: bool, breakroutefinding: bool, add: bool): void {
    const west: i32 = breakroutefinding ? CollisionFlag.WALL_WEST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_WEST_PROJ_BLOCKER : CollisionFlag.WALL_WEST;
    const east: i32 = breakroutefinding ? CollisionFlag.WALL_EAST_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_EAST_PROJ_BLOCKER : CollisionFlag.WALL_EAST;
    const north: i32 = breakroutefinding ? CollisionFlag.WALL_NORTH_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_NORTH_PROJ_BLOCKER : CollisionFlag.WALL_NORTH;
    const south: i32 = breakroutefinding ? CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER : blockrange ? CollisionFlag.WALL_SOUTH_PROJ_BLOCKER : CollisionFlag.WALL_SOUTH;

    if (angle === LocAngle.WEST) {
        if (add) {
            flags.add(x, z, level, north | west);
            flags.add(x - 1, z, level, east);
            flags.add(x, z + 1, level, south);
        } else {
            flags.remove(x, z, level, north | west);
            flags.remove(x - 1, z, level, east);
            flags.remove(x, z + 1, level, south);
        }
    } else if (angle === LocAngle.NORTH) {
        if (add) {
            flags.add(x, z, level, north | east);
            flags.add(x, z + 1, level, south);
            flags.add(x + 1, z, level, west);
        } else {
            flags.remove(x, z, level, north | east);
            flags.remove(x, z + 1, level, south);
            flags.remove(x + 1, z, level, west);
        }
    } else if (angle === LocAngle.EAST) {
        if (add) {
            flags.add(x, z, level, south | east);
            flags.add(x + 1, z, level, west);
            flags.add(x, z - 1, level, north);
        } else {
            flags.remove(x, z, level, south | east);
            flags.remove(x + 1, z, level, west);
            flags.remove(x, z - 1, level, north);
        }
    } else if (angle === LocAngle.SOUTH) {
        if (add) {
            flags.add(x, z, level, south | west);
            flags.add(x, z - 1, level, north);
            flags.add(x - 1, z, level, east);
        } else {
            flags.remove(x, z, level, south | west);
            flags.remove(x, z - 1, level, north);
            flags.remove(x - 1, z, level, east);
        }
    }
    if (breakroutefinding) {
        return changeWallL(x, z, level, angle, blockrange, false, add);
    }
    if (blockrange) {
        // If just blocked projectiles, then block normally next.
        return changeWallL(x, z, level, angle, false, false, add);
    }
}

export function allocateIfAbsent(absoluteX: i32, absoluteZ: i32, level: i32): StaticArray<i32> {
    return flags.allocateIfAbsent(absoluteX, absoluteZ, level);
}

export function deallocateIfPresent(absoluteX: i32, absoluteZ: i32, level: i32): void {
    return flags.deallocateIfPresent(absoluteX, absoluteZ, level);
}

export function isZoneAllocated(absoluteX: i32, absoluteZ: i32, level: i32): bool {
    return flags.isZoneAllocated(absoluteX, absoluteZ, level);
}

export function isFlagged(x: i32, z: i32, level: i32, masks: i32): bool {
    return flags.isFlagged(x, z, level, masks);
}

// prettier-ignore
export function canTravel(
    level: i32,
    x: i32,
    z: i32,
    offsetX: i32,
    offsetZ: i32,
    size: i32,
    extraFlag: i32,
    collision: CollisionType = CollisionType.NORMAL
): bool {
    return stepValidator.canTravel(
        level,
        x,
        z,
        offsetX,
        offsetZ,
        size,
        extraFlag,
        getCollisionStrategy(collision)
    );
}

// prettier-ignore
export function hasLineOfSight(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcSize: i32 = 1,
    destWidth: i32 = 0,
    destHeight: i32 = 0,
    extraFlag: i32 = 0
): bool {
    return lineValidator.hasLineOfSight(
        level,
        srcX,
        srcZ,
        destX,
        destZ,
        srcSize,
        destWidth,
        destHeight,
        extraFlag
    );
}

// prettier-ignore
export function hasLineOfWalk(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcSize: i32 = 1,
    destWidth: i32 = 0,
    destHeight: i32 = 0,
    extraFlag: i32 = 0
): bool {
    return lineValidator.hasLineOfWalk(
        level,
        srcX,
        srcZ,
        destX,
        destZ,
        srcSize,
        destWidth,
        destHeight,
        extraFlag
    );
}

// prettier-ignore
export function lineOfSight(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcSize: i32 = 1,
    destWidth: i32 = 0,
    destHeight: i32 = 0,
    extraFlag: i32 = 0
): StaticArray<i32> {
    return linePathFinder.lineOfSight(
        level,
        srcX,
        srcZ,
        destX,
        destZ,
        srcSize,
        destWidth,
        destHeight,
        extraFlag
    );
}

// prettier-ignore
export function lineOfWalk(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcSize: i32 = 1,
    destWidth: i32 = 0,
    destHeight: i32 = 0,
    extraFlag: i32 = 0
): StaticArray<i32> {
    return linePathFinder.lineOfWalk(
        level,
        srcX,
        srcZ,
        destX,
        destZ,
        srcSize,
        destWidth,
        destHeight,
        extraFlag
    );
}

// prettier-ignore
export function reached(
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
    return ReachStrategy.reached(
        flags,
        level,
        srcX,
        srcZ,
        destX,
        destZ,
        destWidth,
        destHeight,
        srcSize,
        angle,
        shape,
        blockAccessFlags
    );
}

export function locShapeLayer(shape: LocShape): LocLayer {
    switch (shape) {
        case LocShape.WALL_STRAIGHT:
        case LocShape.WALL_DIAGONAL_CORNER:
        case LocShape.WALL_L:
        case LocShape.WALL_SQUARE_CORNER:
            return LocLayer.WALL;
        case LocShape.WALLDECOR_STRAIGHT_NOOFFSET:
        case LocShape.WALLDECOR_STRAIGHT_OFFSET:
        case LocShape.WALLDECOR_DIAGONAL_OFFSET:
        case LocShape.WALLDECOR_DIAGONAL_NOOFFSET:
        case LocShape.WALLDECOR_DIAGONAL_BOTH:
            return LocLayer.WALL_DECOR;
        case LocShape.WALL_DIAGONAL:
        case LocShape.CENTREPIECE_STRAIGHT:
        case LocShape.CENTREPIECE_DIAGONAL:
        case LocShape.ROOF_STRAIGHT:
        case LocShape.ROOF_DIAGONAL_WITH_ROOFEDGE:
        case LocShape.ROOF_DIAGONAL:
        case LocShape.ROOF_L_CONCAVE:
        case LocShape.ROOF_L_CONVEX:
        case LocShape.ROOF_FLAT:
        case LocShape.ROOFEDGE_STRAIGHT:
        case LocShape.ROOFEDGE_DIAGONAL_CORNER:
        case LocShape.ROOFEDGE_L:
        case LocShape.ROOFEDGE_SQUARE_CORNER:
            return LocLayer.GROUND;
        case LocShape.GROUND_DECOR:
            return LocLayer.GROUND_DECOR;
        default:
            throw new Error(`Invalid loc shape. was ${shape}.`);
    }
}

function getCollisionStrategy(collision: CollisionType): CollisionStrategy {
    if (!(collision >= 0 && collision <= 4)) {
        throw new Error(`[getCollisionStrategy] Failed requirement. collisionStrategy was: ${collision}. must be 0-4.`);
    }
    if (collision == CollisionType.NORMAL) {
        return CollisionStrategies.NORMAL;
    } else if (collision == CollisionType.BLOCKED) {
        return CollisionStrategies.BLOCKED;
    } else if (collision == CollisionType.INDOORS) {
        return CollisionStrategies.INDOORS;
    } else if (collision == CollisionType.OUTDOORS) {
        return CollisionStrategies.OUTDOORS;
    } else {
        return CollisionStrategies.LINE_OF_SIGHT;
    }
}
