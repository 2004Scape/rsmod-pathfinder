#![allow(non_snake_case)]
#![allow(non_upper_case_globals)]
#![allow(unused_must_use)]
#![warn(static_mut_refs)]

use std::ptr::addr_of;

use once_cell::sync::Lazy;
use wasm_bindgen::prelude::wasm_bindgen;

use crate::rsmod::{
    Blocked, can_travel, CollisionStrategies, CollisionType, find_naive_path, has_line_of_sight,
    has_line_of_walk, Indoors, line_of_sight, line_of_walk, LineOfSight, LocAngle, LocLayer,
    LocShape, Normal, Outdoors, PathFinder,
};
use crate::rsmod::collision::collision::CollisionFlagMap;
use crate::rsmod::collision_flag::CollisionFlag;
use crate::rsmod::reach_strategy::ReachStrategy;

pub mod rsmod;

// alloc on the heap for the wasm module globally.
static mut COLLISION_FLAGS: Lazy<CollisionFlagMap> = Lazy::new(|| CollisionFlagMap::new());
static mut PATHFINDER: Lazy<PathFinder> = Lazy::new(|| PathFinder::new());

#[wasm_bindgen]
pub unsafe fn findPath(
    y: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcSize: u8,
    destWidth: u8,
    destHeight: u8,
    angle: u8,
    shape: i8,
    moveNear: bool,
    blockAccessFlags: u8,
    maxWaypoints: u8,
    collision: CollisionType,
) -> Vec<u32> {
    return PATHFINDER.find_path(
        &**addr_of!(COLLISION_FLAGS),
        y,
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
        &get_collision_strategy(collision),
    );
}

#[wasm_bindgen]
pub unsafe fn findNaivePath(
    y: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: u8,
    srcHeight: u8,
    destWidth: u8,
    destHeight: u8,
    extraFlag: u32,
    collision: CollisionType,
) -> Vec<u32> {
    return find_naive_path(
        &**addr_of!(COLLISION_FLAGS),
        y,
        srcX,
        srcZ,
        destX,
        destZ,
        srcWidth,
        srcHeight,
        destWidth,
        destHeight,
        extraFlag,
        &get_collision_strategy(collision),
    );
}

#[wasm_bindgen]
pub unsafe fn changeFloor(x: i32, z: i32, y: i32, add: bool) {
    if add {
        COLLISION_FLAGS.add(x, z, y, CollisionFlag::FLOOR as u32);
    } else {
        COLLISION_FLAGS.remove(x, z, y, CollisionFlag::FLOOR as u32);
    }
}

#[wasm_bindgen]
pub unsafe fn changeLoc(
    x: i32,
    z: i32,
    y: i32,
    width: i32,
    length: i32,
    blockrange: bool,
    breakroutefinding: bool,
    add: bool,
) {
    let mut mask: u32 = CollisionFlag::LOC as u32;
    if blockrange {
        mask |= CollisionFlag::LOC_PROJ_BLOCKER as u32;
    }
    if breakroutefinding {
        mask |= CollisionFlag::LOC_ROUTE_BLOCKER as u32;
    }
    let area: i32 = width * length;
    if add {
        for index in 0..area {
            let dx: i32 = x + (index % width);
            let dz: i32 = z + (index / width);
            COLLISION_FLAGS.add(dx, dz, y, mask);
        }
    } else {
        for index in 0..area {
            let dx: i32 = x + (index % width);
            let dz: i32 = z + (index / width);
            COLLISION_FLAGS.remove(dx, dz, y, mask);
        }
    }
}

#[wasm_bindgen]
pub unsafe fn changeNpc(x: i32, z: i32, y: i32, size: i32, add: bool) {
    let mask: u32 = CollisionFlag::NPC as u32;
    let area: i32 = size * size;
    if add {
        for index in 0..area {
            let dx: i32 = x + (index % size);
            let dz: i32 = z + (index / size);
            COLLISION_FLAGS.add(dx, dz, y, mask);
        }
    } else {
        for index in 0..area {
            let dx: i32 = x + (index % size);
            let dz: i32 = z + (index / size);
            COLLISION_FLAGS.remove(dx, dz, y, mask);
        }
    }
}

#[wasm_bindgen]
pub unsafe fn changePlayer(x: i32, z: i32, y: i32, size: i32, add: bool) {
    let mask: u32 = CollisionFlag::PLAYER as u32;
    let area: i32 = size * size;
    if add {
        for index in 0..area {
            let dx: i32 = x + (index % size);
            let dz: i32 = z + (index / size);
            COLLISION_FLAGS.add(dx, dz, y, mask);
        }
    } else {
        for index in 0..area {
            let dx: i32 = x + (index % size);
            let dz: i32 = z + (index / size);
            COLLISION_FLAGS.remove(dx, dz, y, mask);
        }
    }
}

#[wasm_bindgen]
pub unsafe fn changeRoof(x: i32, z: i32, y: i32, add: bool) {
    if add {
        COLLISION_FLAGS.add(x, z, y, CollisionFlag::ROOF as u32);
    } else {
        COLLISION_FLAGS.remove(x, z, y, CollisionFlag::ROOF as u32);
    }
}

#[wasm_bindgen]
pub unsafe fn changeWall(
    x: i32,
    z: i32,
    y: i32,
    angle: u8,
    shape: i8,
    blockrange: bool,
    breakroutefinding: bool,
    add: bool,
) {
    match LocShape::from(shape) {
        LocShape::WALL_STRAIGHT => {
            changeWallStraight(x, z, y, angle, blockrange, breakroutefinding, add)
        }
        LocShape::WALL_DIAGONAL_CORNER | LocShape::WALL_SQUARE_CORNER => {
            changeWallCorner(x, z, y, angle, blockrange, breakroutefinding, add)
        }
        LocShape::WALL_L => changeWallL(x, z, y, angle, blockrange, breakroutefinding, add),
        _ => {}
    }
}

#[inline(always)]
unsafe fn changeWallStraight(
    x: i32,
    z: i32,
    y: i32,
    angle: u8,
    blockrange: bool,
    breakroutefinding: bool,
    add: bool,
) {
    let west: u32 = if breakroutefinding {
        CollisionFlag::WALL_WEST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_WEST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_WEST
    } as u32;
    let east: u32 = if breakroutefinding {
        CollisionFlag::WALL_EAST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_EAST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_EAST
    } as u32;
    let north: u32 = if breakroutefinding {
        CollisionFlag::WALL_NORTH_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_NORTH_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_NORTH
    } as u32;
    let south: u32 = if breakroutefinding {
        CollisionFlag::WALL_SOUTH_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_SOUTH_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_SOUTH
    } as u32;

    match LocAngle::from(angle) {
        LocAngle::WEST => {
            if add {
                COLLISION_FLAGS.add(x, z, y, west);
                COLLISION_FLAGS.add(x - 1, z, y, east);
            } else {
                COLLISION_FLAGS.remove(x, z, y, west);
                COLLISION_FLAGS.remove(x - 1, z, y, east);
            }
        }
        LocAngle::NORTH => {
            if add {
                COLLISION_FLAGS.add(x, z, y, north);
                COLLISION_FLAGS.add(x, z + 1, y, south);
            } else {
                COLLISION_FLAGS.remove(x, z, y, north);
                COLLISION_FLAGS.remove(x, z + 1, y, south);
            }
        }
        LocAngle::EAST => {
            if add {
                COLLISION_FLAGS.add(x, z, y, east);
                COLLISION_FLAGS.add(x + 1, z, y, west);
            } else {
                COLLISION_FLAGS.remove(x, z, y, east);
                COLLISION_FLAGS.remove(x + 1, z, y, west);
            }
        }
        LocAngle::SOUTH => {
            if add {
                COLLISION_FLAGS.add(x, z, y, south);
                COLLISION_FLAGS.add(x, z - 1, y, north);
            } else {
                COLLISION_FLAGS.remove(x, z, y, south);
                COLLISION_FLAGS.remove(x, z - 1, y, north);
            }
        }
    }
    if breakroutefinding {
        return changeWallStraight(x, z, y, angle, blockrange, false, add);
    }
    if blockrange {
        return changeWallStraight(x, z, y, angle, false, false, add);
    }
}

#[inline(always)]
unsafe fn changeWallCorner(
    x: i32,
    z: i32,
    y: i32,
    angle: u8,
    blockrange: bool,
    breakroutefinding: bool,
    add: bool,
) {
    let north_west: u32 = if breakroutefinding {
        CollisionFlag::WALL_NORTH_WEST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_NORTH_WEST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_NORTH_WEST
    } as u32;
    let south_east: u32 = if breakroutefinding {
        CollisionFlag::WALL_SOUTH_EAST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_SOUTH_EAST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_SOUTH_EAST
    } as u32;
    let north_east: u32 = if breakroutefinding {
        CollisionFlag::WALL_NORTH_EAST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_NORTH_EAST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_NORTH_EAST
    } as u32;
    let south_west: u32 = if breakroutefinding {
        CollisionFlag::WALL_SOUTH_WEST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_SOUTH_WEST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_SOUTH_WEST
    } as u32;

    match LocAngle::from(angle) {
        LocAngle::WEST => {
            if add {
                COLLISION_FLAGS.add(x, z, y, north_west);
                COLLISION_FLAGS.add(x - 1, z + 1, y, south_east);
            } else {
                COLLISION_FLAGS.remove(x, z, y, north_west);
                COLLISION_FLAGS.remove(x - 1, z + 1, y, south_east);
            }
        }
        LocAngle::NORTH => {
            if add {
                COLLISION_FLAGS.add(x, z, y, north_east);
                COLLISION_FLAGS.add(x + 1, z + 1, y, south_west);
            } else {
                COLLISION_FLAGS.remove(x, z, y, north_east);
                COLLISION_FLAGS.remove(x + 1, z + 1, y, south_west);
            }
        }
        LocAngle::EAST => {
            if add {
                COLLISION_FLAGS.add(x, z, y, south_east);
                COLLISION_FLAGS.add(x + 1, z - 1, y, north_west);
            } else {
                COLLISION_FLAGS.remove(x, z, y, south_east);
                COLLISION_FLAGS.remove(x + 1, z - 1, y, north_west);
            }
        }
        LocAngle::SOUTH => {
            if add {
                COLLISION_FLAGS.add(x, z, y, south_west);
                COLLISION_FLAGS.add(x - 1, z - 1, y, north_east);
            } else {
                COLLISION_FLAGS.remove(x, z, y, south_west);
                COLLISION_FLAGS.remove(x - 1, z - 1, y, north_east);
            }
        }
    }
    if breakroutefinding {
        return changeWallCorner(x, z, y, angle, blockrange, false, add);
    }
    if blockrange {
        return changeWallCorner(x, z, y, angle, false, false, add);
    }
}

#[inline(always)]
unsafe fn changeWallL(
    x: i32,
    z: i32,
    y: i32,
    angle: u8,
    blockrange: bool,
    breakroutefinding: bool,
    add: bool,
) {
    let west: u32 = if breakroutefinding {
        CollisionFlag::WALL_WEST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_WEST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_WEST
    } as u32;
    let east: u32 = if breakroutefinding {
        CollisionFlag::WALL_EAST_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_EAST_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_EAST
    } as u32;
    let north: u32 = if breakroutefinding {
        CollisionFlag::WALL_NORTH_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_NORTH_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_NORTH
    } as u32;
    let south: u32 = if breakroutefinding {
        CollisionFlag::WALL_SOUTH_ROUTE_BLOCKER
    } else if blockrange {
        CollisionFlag::WALL_SOUTH_PROJ_BLOCKER
    } else {
        CollisionFlag::WALL_SOUTH
    } as u32;

    match LocAngle::from(angle) {
        LocAngle::WEST => {
            if add {
                COLLISION_FLAGS.add(x, z, y, north | west);
                COLLISION_FLAGS.add(x - 1, z, y, east);
                COLLISION_FLAGS.add(x, z + 1, y, south);
            } else {
                COLLISION_FLAGS.remove(x, z, y, north | west);
                COLLISION_FLAGS.remove(x - 1, z, y, east);
                COLLISION_FLAGS.remove(x, z + 1, y, south);
            }
        }
        LocAngle::NORTH => {
            if add {
                COLLISION_FLAGS.add(x, z, y, north | east);
                COLLISION_FLAGS.add(x, z + 1, y, south);
                COLLISION_FLAGS.add(x + 1, z, y, west);
            } else {
                COLLISION_FLAGS.remove(x, z, y, north | east);
                COLLISION_FLAGS.remove(x, z + 1, y, south);
                COLLISION_FLAGS.remove(x + 1, z, y, west);
            }
        }
        LocAngle::EAST => {
            if add {
                COLLISION_FLAGS.add(x, z, y, south | east);
                COLLISION_FLAGS.add(x + 1, z, y, west);
                COLLISION_FLAGS.add(x, z - 1, y, north);
            } else {
                COLLISION_FLAGS.remove(x, z, y, south | east);
                COLLISION_FLAGS.remove(x + 1, z, y, west);
                COLLISION_FLAGS.remove(x, z - 1, y, north);
            }
        }
        LocAngle::SOUTH => {
            if add {
                COLLISION_FLAGS.add(x, z, y, south | west);
                COLLISION_FLAGS.add(x, z - 1, y, north);
                COLLISION_FLAGS.add(x - 1, z, y, east);
            } else {
                COLLISION_FLAGS.remove(x, z, y, south | west);
                COLLISION_FLAGS.remove(x, z - 1, y, north);
                COLLISION_FLAGS.remove(x - 1, z, y, east);
            }
        }
    }
    if breakroutefinding {
        return changeWallL(x, z, y, angle, blockrange, false, add);
    }
    if blockrange {
        return changeWallL(x, z, y, angle, false, false, add);
    }
}

#[wasm_bindgen]
pub unsafe fn allocateIfAbsent(x: i32, z: i32, y: i32) {
    COLLISION_FLAGS.allocate_if_absent(x, z, y);
}

#[wasm_bindgen]
pub unsafe fn deallocateIfPresent(x: i32, z: i32, y: i32) {
    COLLISION_FLAGS.deallocate_if_present(x, z, y);
}

#[wasm_bindgen]
pub unsafe fn isZoneAllocated(x: i32, z: i32, y: i32) -> bool {
    return COLLISION_FLAGS.is_zone_allocated(x, z, y);
}

#[wasm_bindgen]
pub unsafe fn isFlagged(x: i32, z: i32, y: i32, masks: CollisionFlag) -> bool {
    return COLLISION_FLAGS.is_flagged(x, z, y, masks as u32);
}

#[wasm_bindgen]
pub unsafe fn canTravel(
    y: i32,
    x: i32,
    z: i32,
    offsetX: i8,
    offsetZ: i8,
    size: u8,
    extraFlag: u32,
    collision: CollisionType,
) -> bool {
    return can_travel(
        &**addr_of!(COLLISION_FLAGS),
        y,
        x,
        z,
        offsetX,
        offsetZ,
        size,
        extraFlag,
        &get_collision_strategy(collision),
    );
}

#[wasm_bindgen]
pub unsafe fn hasLineOfSight(
    y: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: u8,
    srcHeight: u8,
    destWidth: u8,
    destHeight: u8,
    extraFlag: u32,
) -> bool {
    return has_line_of_sight(
        &**addr_of!(COLLISION_FLAGS),
        y,
        srcX,
        srcZ,
        destX,
        destZ,
        srcWidth,
        srcHeight,
        destWidth,
        destHeight,
        extraFlag,
    );
}

#[wasm_bindgen]
pub unsafe fn hasLineOfWalk(
    y: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: u8,
    srcHeight: u8,
    destWidth: u8,
    destHeight: u8,
    extraFlag: u32,
) -> bool {
    return has_line_of_walk(
        &**addr_of!(COLLISION_FLAGS),
        y,
        srcX,
        srcZ,
        destX,
        destZ,
        srcWidth,
        srcHeight,
        destWidth,
        destHeight,
        extraFlag,
    );
}

#[wasm_bindgen]
pub unsafe fn lineOfSight(
    y: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: u8,
    srcHeight: u8,
    destWidth: u8,
    destHeight: u8,
    extraFlag: u32,
) -> Vec<u32> {
    return line_of_sight(
        &**addr_of!(COLLISION_FLAGS),
        y,
        srcX,
        srcZ,
        destX,
        destZ,
        srcWidth,
        srcHeight,
        destWidth,
        destHeight,
        extraFlag,
    );
}

#[wasm_bindgen]
pub unsafe fn lineOfWalk(
    y: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: u8,
    srcHeight: u8,
    destWidth: u8,
    destHeight: u8,
    extraFlag: u32,
) -> Vec<u32> {
    return line_of_walk(
        &**addr_of!(COLLISION_FLAGS),
        y,
        srcX,
        srcZ,
        destX,
        destZ,
        srcWidth,
        srcHeight,
        destWidth,
        destHeight,
        extraFlag,
    );
}

#[wasm_bindgen]
pub unsafe fn reached(
    y: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    destWidth: u8,
    destHeight: u8,
    srcSize: u8,
    angle: u8,
    shape: i8,
    blockAccessFlags: u8,
) -> bool {
    return ReachStrategy::reached(
        &**addr_of!(COLLISION_FLAGS),
        y,
        srcX,
        srcZ,
        destX,
        destZ,
        destWidth,
        destHeight,
        srcSize,
        angle,
        shape,
        blockAccessFlags,
    );
}

#[wasm_bindgen]
pub fn locShapeLayer(shape: LocShape) -> LocLayer {
    return match shape {
        LocShape::WALL_STRAIGHT
        | LocShape::WALL_DIAGONAL_CORNER
        | LocShape::WALL_L
        | LocShape::WALL_SQUARE_CORNER => LocLayer::WALL,

        LocShape::WALLDECOR_STRAIGHT_NOOFFSET
        | LocShape::WALLDECOR_STRAIGHT_OFFSET
        | LocShape::WALLDECOR_DIAGONAL_OFFSET
        | LocShape::WALLDECOR_DIAGONAL_NOOFFSET
        | LocShape::WALLDECOR_DIAGONAL_BOTH => LocLayer::WALL_DECOR,

        LocShape::WALL_DIAGONAL
        | LocShape::CENTREPIECE_STRAIGHT
        | LocShape::CENTREPIECE_DIAGONAL
        | LocShape::ROOF_STRAIGHT
        | LocShape::ROOF_DIAGONAL_WITH_ROOFEDGE
        | LocShape::ROOF_DIAGONAL
        | LocShape::ROOF_L_CONCAVE
        | LocShape::ROOF_L_CONVEX
        | LocShape::ROOF_FLAT
        | LocShape::ROOFEDGE_STRAIGHT
        | LocShape::ROOFEDGE_DIAGONAL_CORNER
        | LocShape::ROOFEDGE_L
        | LocShape::ROOFEDGE_SQUARE_CORNER => LocLayer::GROUND,

        LocShape::GROUND_DECOR => LocLayer::GROUND_DECOR,
    };
}

// this is only to test benchmarking lumbridge.
#[wasm_bindgen]
pub unsafe fn __set(x: i32, z: i32, y: i32, mask: u32) {
    COLLISION_FLAGS.set(x, z, y, mask);
}

#[inline(always)]
pub fn get_collision_strategy(collision: CollisionType) -> CollisionStrategies {
    return match collision {
        CollisionType::NORMAL => CollisionStrategies::Normal(Normal),
        CollisionType::BLOCKED => CollisionStrategies::Blocked(Blocked),
        CollisionType::INDOORS => CollisionStrategies::Indoors(Indoors),
        CollisionType::OUTDOORS => CollisionStrategies::Outdoors(Outdoors),
        CollisionType::LINE_OF_SIGHT => CollisionStrategies::LineOfSight(LineOfSight),
    };
}
