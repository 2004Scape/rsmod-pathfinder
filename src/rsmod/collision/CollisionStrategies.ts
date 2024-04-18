import {CollisionStrategy} from './CollisionStrategy';
import {CollisionFlag} from '../flag/CollisionFlag';

@final
class Normal implements CollisionStrategy {
    @inline
    canMove(tileFlag: i32, blockFlag: i32): bool {
        return (tileFlag & blockFlag) === CollisionFlag.OPEN;
    }
}

@final
class Blocked implements CollisionStrategy {
    @inline
    canMove(tileFlag: i32, blockFlag: i32): bool {
        const flag: i32 = blockFlag & ~CollisionFlag.FLOOR;
        return (tileFlag & flag) === 0 && (tileFlag & CollisionFlag.FLOOR) !== CollisionFlag.OPEN;
    }
}

@final
class Indoors implements CollisionStrategy {
    @inline
    canMove(tileFlag: i32, blockFlag: i32): bool {
        return (tileFlag & blockFlag) === 0 && (tileFlag & CollisionFlag.ROOF) !== CollisionFlag.OPEN;
    }
}

@final
class Outdoors implements CollisionStrategy {
    @inline
    canMove(tileFlag: i32, blockFlag: i32): bool {
        return (tileFlag & (blockFlag | CollisionFlag.ROOF)) === CollisionFlag.OPEN;
    }
}

@final
class LineOfSight implements CollisionStrategy {
    private static readonly BLOCK_MOVEMENT: i32 =
        CollisionFlag.WALL_NORTH_WEST |
        CollisionFlag.WALL_NORTH |
        CollisionFlag.WALL_NORTH_EAST |
        CollisionFlag.WALL_EAST |
        CollisionFlag.WALL_SOUTH_EAST |
        CollisionFlag.WALL_SOUTH |
        CollisionFlag.WALL_SOUTH_WEST |
        CollisionFlag.WALL_WEST |
        CollisionFlag.LOC;

    private static readonly BLOCK_ROUTE: i32 =
        CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_WEST_ROUTE_BLOCKER |
        CollisionFlag.LOC_ROUTE_BLOCKER;

    @inline
    canMove(tileFlag: i32, blockFlag: i32): bool {
        const movementFlags: i32 = (blockFlag & LineOfSight.BLOCK_MOVEMENT) << 9;
        const routeFlags: i32 = (blockFlag & LineOfSight.BLOCK_ROUTE) >> 13;
        const finalBlockFlag: i32 = movementFlags | routeFlags;
        return (tileFlag & finalBlockFlag) === CollisionFlag.OPEN;
    }
}

@final
export default class CollisionStrategies {
    static NORMAL: CollisionStrategy = new Normal();
    static BLOCKED: CollisionStrategy = new Blocked();
    static INDOORS: CollisionStrategy = new Indoors();
    static OUTDOORS: CollisionStrategy = new Outdoors();
    static LINE_OF_SIGHT: CollisionStrategy = new LineOfSight();
}
