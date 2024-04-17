import {CollisionFlag} from './flag/CollisionFlag';

export default class Line {
    static readonly SIGHT_BLOCKED_NORTH: i32 = CollisionFlag.LOC_PROJ_BLOCKER | CollisionFlag.WALL_NORTH_PROJ_BLOCKER;
    static readonly SIGHT_BLOCKED_EAST: i32 = CollisionFlag.LOC_PROJ_BLOCKER | CollisionFlag.WALL_EAST_PROJ_BLOCKER;
    static readonly SIGHT_BLOCKED_SOUTH: i32 = CollisionFlag.LOC_PROJ_BLOCKER | CollisionFlag.WALL_SOUTH_PROJ_BLOCKER;
    static readonly SIGHT_BLOCKED_WEST: i32 = CollisionFlag.LOC_PROJ_BLOCKER | CollisionFlag.WALL_WEST_PROJ_BLOCKER;

    static readonly WALK_BLOCKED_NORTH: i32 = CollisionFlag.WALL_NORTH | CollisionFlag.WALK_BLOCKED;
    static readonly WALK_BLOCKED_EAST: i32 = CollisionFlag.WALL_EAST | CollisionFlag.WALK_BLOCKED;
    static readonly WALK_BLOCKED_SOUTH: i32 = CollisionFlag.WALL_SOUTH | CollisionFlag.WALK_BLOCKED;
    static readonly WALK_BLOCKED_WEST: i32 = CollisionFlag.WALL_WEST | CollisionFlag.WALK_BLOCKED;

    static readonly HALF_TILE: i32 = Line.scaleUp(1) / 2;

    @inline
    static scaleUp(tiles: i32): i32 {
        return tiles << 16;
    }

    @inline
    static scaleDown(tiles: i32): i32 {
        return tiles >>> 16;
    }

    @inline
    static coordinate(a: i32, b: i32, size: i32): i32 {
        if (a >= b) {
            return a;
        } else if (a + size - 1 <= b) {
            return a + size - 1;
        }
        return b;
    }
}
