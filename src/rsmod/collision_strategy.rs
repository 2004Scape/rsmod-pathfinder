#![allow(non_camel_case_types)]

use crate::rsmod::CollisionFlag;

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
#[wasm_bindgen]
pub enum CollisionType {
    NORMAL = 0,
    BLOCKED = 1,
    INDOORS = 2,
    OUTDOORS = 3,
    LINE_OF_SIGHT = 4
}

pub trait CollisionStrategy {
    fn can_move(self, tile_flag: u32, block_flag: u32) -> bool;
}

pub struct Normal;
impl CollisionStrategy for Normal {
    fn can_move(self, tile_flag: u32, block_flag: u32) -> bool {
        return (tile_flag & block_flag) == CollisionFlag::OPEN as u32;
    }
}

pub struct Blocked;
impl CollisionStrategy for Blocked {
    fn can_move(self, tile_flag: u32, block_flag: u32) -> bool {
        let flag: u32 = block_flag & !(CollisionFlag::FLOOR as u32);
        return (tile_flag & flag) == 0 && (tile_flag & CollisionFlag::FLOOR as u32) != CollisionFlag::OPEN as u32;
    }
}

pub struct Indoors;
impl CollisionStrategy for Indoors {
    fn can_move(self, tile_flag: u32, block_flag: u32) -> bool {
        return (tile_flag & block_flag) == 0 && (tile_flag & CollisionFlag::ROOF as u32) != CollisionFlag::OPEN as u32;
    }
}

pub struct Outdoors;
impl CollisionStrategy for Outdoors {
    fn can_move(self, tile_flag: u32, block_flag: u32) -> bool {
        return (tile_flag & (block_flag | CollisionFlag::ROOF as u32)) == CollisionFlag::OPEN as u32;
    }
}

pub struct LineOfSight;
impl CollisionStrategy for LineOfSight {
    fn can_move(self, tile_flag: u32, block_flag: u32) -> bool {
        let block_movement: u32 =
            CollisionFlag::WALL_NORTH_WEST as u32 |
            CollisionFlag::WALL_NORTH as u32 |
            CollisionFlag::WALL_NORTH_EAST as u32 |
            CollisionFlag::WALL_EAST as u32 |
            CollisionFlag::WALL_SOUTH_EAST as u32 |
            CollisionFlag::WALL_SOUTH as u32 |
            CollisionFlag::WALL_SOUTH_WEST as u32 |
            CollisionFlag::WALL_WEST as u32 |
            CollisionFlag::LOC as u32;

        let block_route: u32 =
            CollisionFlag::WALL_NORTH_WEST_ROUTE_BLOCKER as u32 |
            CollisionFlag::WALL_NORTH_ROUTE_BLOCKER as u32 |
            CollisionFlag::WALL_NORTH_EAST_ROUTE_BLOCKER as u32 |
            CollisionFlag::WALL_EAST_ROUTE_BLOCKER as u32 |
            CollisionFlag::WALL_SOUTH_EAST_ROUTE_BLOCKER as u32 |
            CollisionFlag::WALL_SOUTH_ROUTE_BLOCKER as u32 |
            CollisionFlag::WALL_SOUTH_WEST_ROUTE_BLOCKER as u32 |
            CollisionFlag::WALL_WEST_ROUTE_BLOCKER as u32 |
            CollisionFlag::LOC_ROUTE_BLOCKER as u32;

        let movement_flags: u32 = (block_flag & block_movement) << 9;
        let route_flags: u32 = (block_flag & block_route) >> 13;
        let final_flag: u32 = movement_flags | route_flags;
        return (tile_flag & final_flag) == CollisionFlag::OPEN as u32;
    }
}
