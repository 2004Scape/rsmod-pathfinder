#![allow(non_camel_case_types)]

use wasm_bindgen::prelude::wasm_bindgen;

use crate::rsmod::collision_flag::CollisionFlag;

#[repr(u8)]
#[wasm_bindgen]
pub enum CollisionType {
    NORMAL = 0,
    BLOCKED = 1,
    INDOORS = 2,
    OUTDOORS = 3,
    LINE_OF_SIGHT = 4,
}

pub trait CollisionStrategy {
    fn can_move(&self, tile_flag: u32, block_flag: u32) -> bool;
}

pub struct Normal;

impl CollisionStrategy for Normal {
    #[inline(always)]
    fn can_move(&self, tile_flag: u32, block_flag: u32) -> bool {
        return (tile_flag & block_flag) == CollisionFlag::OPEN as u32;
    }
}

pub struct Blocked;

impl CollisionStrategy for Blocked {
    #[inline(always)]
    fn can_move(&self, tile_flag: u32, block_flag: u32) -> bool {
        let flag: u32 = block_flag & !(CollisionFlag::FLOOR as u32);
        return (tile_flag & flag) == CollisionFlag::OPEN as u32
            && (tile_flag & CollisionFlag::FLOOR as u32) != CollisionFlag::OPEN as u32;
    }
}

pub struct Indoors;

impl CollisionStrategy for Indoors {
    #[inline(always)]
    fn can_move(&self, tile_flag: u32, block_flag: u32) -> bool {
        return (tile_flag & block_flag) == CollisionFlag::OPEN as u32
            && (tile_flag & CollisionFlag::ROOF as u32) != CollisionFlag::OPEN as u32;
    }
}

pub struct Outdoors;

impl CollisionStrategy for Outdoors {
    #[inline(always)]
    fn can_move(&self, tile_flag: u32, block_flag: u32) -> bool {
        return (tile_flag & (block_flag | CollisionFlag::ROOF as u32))
            == CollisionFlag::OPEN as u32;
    }
}

pub struct LineOfSight;

impl LineOfSight {
    const MOVEMENT: u32 = CollisionFlag::WALL_NORTH_WEST as u32
        | CollisionFlag::WALL_NORTH as u32
        | CollisionFlag::WALL_NORTH_EAST as u32
        | CollisionFlag::WALL_EAST as u32
        | CollisionFlag::WALL_SOUTH_EAST as u32
        | CollisionFlag::WALL_SOUTH as u32
        | CollisionFlag::WALL_SOUTH_WEST as u32
        | CollisionFlag::WALL_WEST as u32
        | CollisionFlag::LOC as u32;

    const ROUTE: u32 = CollisionFlag::WALL_NORTH_WEST_ROUTE_BLOCKER as u32
        | CollisionFlag::WALL_NORTH_ROUTE_BLOCKER as u32
        | CollisionFlag::WALL_NORTH_EAST_ROUTE_BLOCKER as u32
        | CollisionFlag::WALL_EAST_ROUTE_BLOCKER as u32
        | CollisionFlag::WALL_SOUTH_EAST_ROUTE_BLOCKER as u32
        | CollisionFlag::WALL_SOUTH_ROUTE_BLOCKER as u32
        | CollisionFlag::WALL_SOUTH_WEST_ROUTE_BLOCKER as u32
        | CollisionFlag::WALL_WEST_ROUTE_BLOCKER as u32
        | CollisionFlag::LOC_ROUTE_BLOCKER as u32;
}

impl CollisionStrategy for LineOfSight {
    #[inline(always)]
    fn can_move(&self, tile_flag: u32, block_flag: u32) -> bool {
        let movement_flags: u32 = (block_flag & LineOfSight::MOVEMENT) << 9;
        let route_flags: u32 = (block_flag & LineOfSight::ROUTE) >> 13;
        let final_flag: u32 = movement_flags | route_flags;
        return (tile_flag & final_flag) == CollisionFlag::OPEN as u32;
    }
}

pub enum CollisionStrategies {
    Normal(Normal),
    Blocked(Blocked),
    Indoors(Indoors),
    Outdoors(Outdoors),
    LineOfSight(LineOfSight),
}

impl CollisionStrategy for CollisionStrategies {
    #[rustfmt::skip]
    #[inline(always)]
    fn can_move(&self, tile_flag: u32, block_flag: u32) -> bool {
        match self {
            CollisionStrategies::Normal(strategy) => strategy.can_move(tile_flag, block_flag),
            CollisionStrategies::Blocked(strategy) => strategy.can_move(tile_flag, block_flag),
            CollisionStrategies::Indoors(strategy) => strategy.can_move(tile_flag, block_flag),
            CollisionStrategies::Outdoors(strategy) => strategy.can_move(tile_flag, block_flag),
            CollisionStrategies::LineOfSight(strategy) => strategy.can_move(tile_flag, block_flag)
        }
    }
}
