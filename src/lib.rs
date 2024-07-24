#![allow(non_snake_case)]
#![allow(warnings)]

pub mod rsmod;

use once_cell::sync::Lazy;
use wasm_bindgen::prelude::wasm_bindgen;
use crate::rsmod::{CollisionFlag, CollisionFlagMap, CollisionType, LocAngle, LocLayer, LocShape};

static mut FLAGS: Lazy<Box<CollisionFlagMap>> = Lazy::new(|| Box::new(CollisionFlagMap::new()));

#[wasm_bindgen]
pub fn findPath(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcSize: i32,
    destWidth: i32,
    destHeight: i32,
    angle: i32,
    shape: i32,
    moveNear: bool,
    blockAccessFlags: i32,
    maxWaypoints: i32,
    collision: CollisionType
) -> Vec<i32> {
    return vec![];
}

#[wasm_bindgen]
pub fn findNaivePath(
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
    collision: CollisionType
) -> Vec<i32> {
    return vec![];
}

#[wasm_bindgen]
pub unsafe fn changeFloor(x: i32, z: i32, y: u8, add: bool) {
    if add {
        FLAGS.add(x, z, y, CollisionFlag::FLOOR as u32);
    } else {
        FLAGS.remove(x, z, y, CollisionFlag::FLOOR as u32);
    }
}

#[wasm_bindgen]
pub unsafe fn changeLoc(x: i32, z: i32, y: u8, width: u8, length: u8, blockrange: bool, breakroutefinding: bool, add: bool) {
    let mut mask: u32 = CollisionFlag::LOC as u32;
    if blockrange {
        mask |= CollisionFlag::LOC_PROJ_BLOCKER as u32;
    }
    if breakroutefinding {
        mask |= CollisionFlag::LOC_ROUTE_BLOCKER as u32;
    }
    for index in 0..width*length {
        let dx = x + (index % width) as i32;
        let dz = z + (index / width) as i32;
        if add {
            FLAGS.add(dx, dz, y, mask);
        } else {
            FLAGS.remove(dx, dz, y, mask);
        }
    }
}

#[wasm_bindgen]
pub unsafe fn changeNpc(x: i32, z: i32, y: u8, size: u8, add: bool) {
    let mask: u32 = CollisionFlag::NPC as u32;
    for index in 0..size*size {
        let dx = x + (index % size) as i32;
        let dz = z + (index / size) as i32;
        if add {
            FLAGS.add(dx, dz, y, mask);
        } else {
            FLAGS.remove(dx, dz, y, mask);
        }
    }
}

#[wasm_bindgen]
pub unsafe fn changePlayer(x: i32, z: i32, y: u8, size: u8, add: bool) {
    let mask: u32 = CollisionFlag::PLAYER as u32;
    for index in 0..size*size {
        let dx = x + (index % size) as i32;
        let dz = z + (index / size) as i32;
        if add {
            FLAGS.add(dx, dz, y, mask);
        } else {
            FLAGS.remove(dx, dz, y, mask);
        }
    }
}

#[wasm_bindgen]
pub unsafe fn changeRoof(x: i32, z: i32, y: u8, add: bool) {
    let mask: u32 = CollisionFlag::ROOF as u32;
    if add {
        FLAGS.add(x, z, y, mask);
    } else {
        FLAGS.remove(x, z, y, mask);
    }
}

#[wasm_bindgen]
pub unsafe fn changeWall(x: i32, z: i32, y: u8, angle: u8, shape: u8, blockrange: bool, breakroutefinding: bool, add: bool) {
    match LocShape::try_from(shape) {
        Ok(shape) => {
            match shape {
                LocShape::WALL_STRAIGHT => changeWallStraight(x, z, y, angle, blockrange, breakroutefinding, add),
                LocShape::WALL_DIAGONAL_CORNER | LocShape::WALL_SQUARE_CORNER => changeWallCorner(x, z, y, angle, blockrange, breakroutefinding, add),
                LocShape::WALL_L => changeWallL(x, z, y, angle, blockrange, breakroutefinding, add),
                _ => {} // do nothing
            }
        }
        Err(str) => panic!("{}", str)
    }
}

unsafe fn changeWallStraight(x: i32, z: i32, y: u8, angle: u8, blockrange: bool, breakroutefinding: bool, add: bool) {
    let west: u32 = if breakroutefinding { CollisionFlag::WALL_WEST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_WEST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_WEST as u32 };
    let east: u32 = if breakroutefinding { CollisionFlag::WALL_EAST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_EAST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_EAST as u32 };
    let north: u32 = if breakroutefinding { CollisionFlag::WALL_NORTH_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_NORTH as u32 };
    let south: u32 = if breakroutefinding { CollisionFlag::WALL_SOUTH_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_SOUTH_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_SOUTH as u32 };

    match LocAngle::try_from(angle) {
        Ok(angle) => {
            match angle {
                LocAngle::WEST => {
                    if add {
                        FLAGS.add(x, z, y, west);
                        FLAGS.add(x - 1, z, y, east);
                    } else {
                        FLAGS.remove(x, z, y, west);
                        FLAGS.remove(x - 1, z, y, east);
                    }
                }
                LocAngle::NORTH => {
                    if add {
                        FLAGS.add(x, z, y, north);
                        FLAGS.add(x, z + 1, y, south);
                    } else {
                        FLAGS.remove(x, z, y, north);
                        FLAGS.remove(x, z + 1, y, south);
                    }
                }
                LocAngle::EAST => {
                    if add {
                        FLAGS.add(x, z, y, east);
                        FLAGS.add(x + 1, z, y, west);
                    } else {
                        FLAGS.remove(x, z, y, east);
                        FLAGS.remove(x + 1, z, y, west);
                    }
                }
                LocAngle::SOUTH => {
                    if add {
                        FLAGS.add(x, z, y, south);
                        FLAGS.add(x, z - 1, y, north);
                    } else {
                        FLAGS.remove(x, z, y, south);
                        FLAGS.remove(x, z - 1, y, north);
                    }
                }
            }
            if breakroutefinding {
                return changeWallStraight(x, z, y, angle as u8, blockrange, false, add);
            }
            if blockrange {
                return changeWallStraight(x, z, y, angle as u8, false, false, add);
            }
        }
        Err(str) => panic!("{}", str)
    }
}

unsafe fn changeWallCorner(x: i32, z: i32, y: u8, angle: u8, blockrange: bool, breakroutefinding: bool, add: bool) {
    let north_west: u32 = if breakroutefinding { CollisionFlag::WALL_NORTH_WEST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_NORTH_WEST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_NORTH_WEST as u32 };
    let south_east: u32 = if breakroutefinding { CollisionFlag::WALL_SOUTH_EAST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_SOUTH_EAST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_SOUTH_EAST as u32 };
    let north_east: u32 = if breakroutefinding { CollisionFlag::WALL_NORTH_EAST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_NORTH_EAST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_NORTH_EAST as u32 };
    let south_west: u32 = if breakroutefinding { CollisionFlag::WALL_SOUTH_WEST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_SOUTH_WEST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_SOUTH_WEST as u32 };

    match LocAngle::try_from(angle) {
        Ok(angle) => {
            match angle {
                LocAngle::WEST => {
                    if add {
                        FLAGS.add(x, z, y, north_west);
                        FLAGS.add(x - 1, z + 1, y, south_east);
                    } else {
                        FLAGS.remove(x, z, y, north_west);
                        FLAGS.remove(x - 1, z + 1, y, south_east);
                    }
                }
                LocAngle::NORTH => {
                    if add {
                        FLAGS.add(x, z, y, north_east);
                        FLAGS.add(x + 1, z + 1, y, south_west);
                    } else {
                        FLAGS.remove(x, z, y, north_east);
                        FLAGS.remove(x + 1, z + 1, y, south_west);
                    }
                }
                LocAngle::EAST => {
                    if add {
                        FLAGS.add(x, z, y, south_east);
                        FLAGS.add(x + 1, z - 1, y, north_west);
                    } else {
                        FLAGS.remove(x, z, y, south_east);
                        FLAGS.remove(x + 1, z - 1, y, north_west);
                    }
                }
                LocAngle::SOUTH => {
                    if add {
                        FLAGS.add(x, z, y, south_west);
                        FLAGS.add(x - 1, z - 1, y, north_east);
                    } else {
                        FLAGS.remove(x, z, y, south_west);
                        FLAGS.remove(x - 1, z - 1, y, north_east);
                    }
                }
            }
            if breakroutefinding {
                return changeWallCorner(x, z, y, angle as u8, blockrange, false, add);
            }
            if blockrange {
                return changeWallCorner(x, z, y, angle as u8, false, false, add);
            }
        }
        Err(str) => panic!("{}", str)
    }
}

unsafe fn changeWallL(x: i32, z: i32, y: u8, angle: u8, blockrange: bool, breakroutefinding: bool, add: bool) {
    let west: u32 = if breakroutefinding { CollisionFlag::WALL_WEST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_WEST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_WEST as u32 };
    let east: u32 = if breakroutefinding { CollisionFlag::WALL_EAST_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_EAST_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_EAST as u32 };
    let north: u32 = if breakroutefinding { CollisionFlag::WALL_NORTH_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_NORTH as u32 };
    let south: u32 = if breakroutefinding { CollisionFlag::WALL_SOUTH_ROUTE_BLOCKER as u32 } else if blockrange { CollisionFlag::WALL_SOUTH_PROJ_BLOCKER as u32 } else { CollisionFlag::WALL_SOUTH as u32 };

    match LocAngle::try_from(angle) {
        Ok(angle) => {
            match angle {
                LocAngle::WEST => {
                    if add {
                        FLAGS.add(x, z, y, north | west);
                        FLAGS.add(x - 1, z, y, east);
                        FLAGS.add(x, z + 1, y, south);
                    } else {
                        FLAGS.remove(x, z, y, north | west);
                        FLAGS.remove(x - 1, z, y, east);
                        FLAGS.remove(x, z + 1, y, south);
                    }
                }
                LocAngle::NORTH => {
                    if add {
                        FLAGS.add(x, z, y, north | east);
                        FLAGS.add(x, z + 1, y, south);
                        FLAGS.add(x + 1, z, y, west);
                    } else {
                        FLAGS.remove(x, z, y, north | east);
                        FLAGS.remove(x, z + 1, y, south);
                        FLAGS.remove(x + 1, z, y, west);
                    }
                }
                LocAngle::EAST => {
                    if add {
                        FLAGS.add(x, z, y, south | east);
                        FLAGS.add(x + 1, z, y, west);
                        FLAGS.add(x, z - 1, y, north);
                    } else {
                        FLAGS.remove(x, z, y, south | east);
                        FLAGS.remove(x + 1, z, y, west);
                        FLAGS.remove(x, z - 1, y, north);
                    }
                }
                LocAngle::SOUTH => {
                    if add {
                        FLAGS.add(x, z, y, south | west);
                        FLAGS.add(x, z - 1, y, north);
                        FLAGS.add(x - 1, z, y, east);
                    } else {
                        FLAGS.remove(x, z, y, south | west);
                        FLAGS.remove(x, z - 1, y, north);
                        FLAGS.remove(x - 1, z, y, east);
                    }
                }
            }
            if breakroutefinding {
                return changeWallL(x, z, y, angle as u8, blockrange, false, add);
            }
            if blockrange {
                return changeWallL(x, z, y, angle as u8, false, false, add);
            }
        }
        Err(str) => panic!("{}", str)
    }
}

#[wasm_bindgen]
pub unsafe fn allocateIfAbsent(x: i32, z: i32, y: u8) {
    FLAGS.allocate_if_absent(x, z, y);
}

#[wasm_bindgen]
pub fn deallocateIfPresent(absoluteX: i32, absoluteZ: i32, level: i32) {
}

#[wasm_bindgen]
pub fn isZoneAllocated(absoluteX: i32, absoluteZ: i32, level: i32) -> bool {
    return false;
}

#[wasm_bindgen]
pub unsafe fn isFlagged(x: i32, z: i32, level: u8, masks: u32) -> bool {
    return FLAGS.isFlagged(x, z, level, masks);
}

#[wasm_bindgen]
pub fn canTravel(
    level: i32,
    x: i32,
    z: i32,
    offsetX: i32,
    offsetZ: i32,
    size: i32,
    extraFlag: i32,
    collision: CollisionType
) -> bool {
    return true;
}

#[wasm_bindgen]
pub fn hasLineOfSight(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: i32,
    srcHeight: i32,
    destWidth: i32,
    destHeight: i32,
    extraFlag: i32
) -> bool {
    return false;
}

#[wasm_bindgen]
pub fn hasLineOfWalk(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: i32,
    srcHeight: i32,
    destWidth: i32,
    destHeight: i32,
    extraFlag: i32
) -> bool {
    return false;
}

#[wasm_bindgen]
pub fn lineOfSight(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: i32,
    srcHeight: i32,
    destWidth: i32,
    destHeight: i32,
    extraFlag: i32
) -> Vec<i32> {
    return vec![];
}

#[wasm_bindgen]
pub fn lineOfWalk(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    srcWidth: i32,
    srcHeight: i32,
    destWidth: i32,
    destHeight: i32,
    extraFlag: i32
) -> Vec<i32> {
    return vec![];
}

#[wasm_bindgen]
pub fn reached(
    level: i32,
    srcX: i32,
    srcZ: i32,
    destX: i32,
    destZ: i32,
    destWidth: i32,
    destHeight: i32,
    srcSize: i32,
    angle: i32,
    shape: i32,
    blockAccessFlags: i32
) -> bool {
    return false;
}

#[wasm_bindgen]
pub fn locShapeLayer(shape: LocShape) -> LocLayer {
    match shape {
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

        LocShape::GROUND_DECOR => LocLayer::GROUND_DECOR
    }
}
