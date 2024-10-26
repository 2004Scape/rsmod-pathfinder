use crate::rsmod::collision_flag::CollisionFlag;

pub struct Line;

impl Line {
    pub const SIGHT_BLOCKED_NORTH: u32 =
        CollisionFlag::LOC_PROJ_BLOCKER as u32 | CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32;
    pub const SIGHT_BLOCKED_EAST: u32 =
        CollisionFlag::LOC_PROJ_BLOCKER as u32 | CollisionFlag::WALL_EAST_PROJ_BLOCKER as u32;
    pub const SIGHT_BLOCKED_SOUTH: u32 =
        CollisionFlag::LOC_PROJ_BLOCKER as u32 | CollisionFlag::WALL_SOUTH_PROJ_BLOCKER as u32;
    pub const SIGHT_BLOCKED_WEST: u32 =
        CollisionFlag::LOC_PROJ_BLOCKER as u32 | CollisionFlag::WALL_WEST_PROJ_BLOCKER as u32;

    pub const WALK_BLOCKED_NORTH: u32 =
        CollisionFlag::WALL_NORTH as u32 | CollisionFlag::WALK_BLOCKED as u32;
    pub const WALK_BLOCKED_EAST: u32 =
        CollisionFlag::WALL_EAST as u32 | CollisionFlag::WALK_BLOCKED as u32;
    pub const WALK_BLOCKED_SOUTH: u32 =
        CollisionFlag::WALL_SOUTH as u32 | CollisionFlag::WALK_BLOCKED as u32;
    pub const WALK_BLOCKED_WEST: u32 =
        CollisionFlag::WALL_WEST as u32 | CollisionFlag::WALK_BLOCKED as u32;

    pub const HALF_TILE: i32 = (1 << 16) / 2;

    #[inline(always)]
    pub fn scale_up(tiles: i32) -> i32 {
        return tiles << 16;
    }

    #[inline(always)]
    pub fn scale_down(tiles: i32) -> i32 {
        return tiles >> 16;
    }

    #[inline(always)]
    pub fn coordinate(a: i32, b: i32, size: u8) -> i32 {
        if a >= b {
            return a;
        } else if a + size as i32 - 1 <= b {
            return a + size as i32 - 1;
        }
        return b;
    }
}
