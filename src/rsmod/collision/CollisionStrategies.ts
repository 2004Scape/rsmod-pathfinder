import CollisionStrategy from './CollisionStrategy';
import CollisionFlag from '../flag/CollisionFlag';

class Normal implements CollisionStrategy {
    canMove(tileFlag: number, blockFlag: number): boolean {
        return (tileFlag & blockFlag) === CollisionFlag.OPEN;
    }
}

class Blocked implements CollisionStrategy {
    canMove(tileFlag: number, blockFlag: number): boolean {
        const flag: number = blockFlag & ~CollisionFlag.FLOOR;
        return (tileFlag & flag) === 0 && (tileFlag & CollisionFlag.FLOOR) !== CollisionFlag.OPEN;
    }
}

class Indoors implements CollisionStrategy {
    canMove(tileFlag: number, blockFlag: number): boolean {
        return (tileFlag & blockFlag) === 0 && (tileFlag & CollisionFlag.ROOF) !== CollisionFlag.OPEN;
    }
}

class Outdoors implements CollisionStrategy {
    canMove(tileFlag: number, blockFlag: number): boolean {
        return (tileFlag & (blockFlag | CollisionFlag.ROOF)) === CollisionFlag.OPEN;
    }
}

class LineOfSight implements CollisionStrategy {
    private static readonly BLOCK_MOVEMENT: number =
        CollisionFlag.WALL_NORTH_WEST |
        CollisionFlag.WALL_NORTH |
        CollisionFlag.WALL_NORTH_EAST |
        CollisionFlag.WALL_EAST |
        CollisionFlag.WALL_SOUTH_EAST |
        CollisionFlag.WALL_SOUTH |
        CollisionFlag.WALL_SOUTH_WEST |
        CollisionFlag.WALL_WEST |
        CollisionFlag.LOC;

    private static readonly BLOCK_ROUTE: number =
        CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_WEST_ROUTE_BLOCKER |
        CollisionFlag.LOC_ROUTE_BLOCKER;

    canMove(tileFlag: number, blockFlag: number): boolean {
        const movementFlags: number = (blockFlag & LineOfSight.BLOCK_MOVEMENT) << 9;
        const routeFlags: number = (blockFlag & LineOfSight.BLOCK_ROUTE) >> 13;
        const finalBlockFlag: number = movementFlags | routeFlags;
        return (tileFlag & finalBlockFlag) === CollisionFlag.OPEN;
    }
}

export default class CollisionStrategies {
    static NORMAL: CollisionStrategy = new Normal();
    static BLOCKED: CollisionStrategy = new Blocked();
    static INDOORS: CollisionStrategy = new Indoors();
    static OUTDOORS: CollisionStrategy = new Outdoors();
    static LINE_OF_SIGHT: CollisionStrategy = new LineOfSight();
}
