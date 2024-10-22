#![allow(non_camel_case_types)]

use std::cmp::PartialEq;
use std::process;

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(i8)]
#[derive(PartialEq)]
#[wasm_bindgen]
pub enum LocShape {
    WALL_STRAIGHT = 0,
    WALL_DIAGONAL_CORNER = 1,
    WALL_L = 2,
    WALL_SQUARE_CORNER = 3,
    WALLDECOR_STRAIGHT_NOOFFSET = 4,
    WALLDECOR_STRAIGHT_OFFSET = 5,
    WALLDECOR_DIAGONAL_OFFSET = 6,
    WALLDECOR_DIAGONAL_NOOFFSET = 7,
    WALLDECOR_DIAGONAL_BOTH = 8,
    WALL_DIAGONAL = 9,
    CENTREPIECE_STRAIGHT = 10,
    CENTREPIECE_DIAGONAL = 11,
    ROOF_STRAIGHT = 12,
    ROOF_DIAGONAL_WITH_ROOFEDGE = 13,
    ROOF_DIAGONAL = 14,
    ROOF_L_CONCAVE = 15,
    ROOF_L_CONVEX = 16,
    ROOF_FLAT = 17,
    ROOFEDGE_STRAIGHT = 18,
    ROOFEDGE_DIAGONAL_CORNER = 19,
    ROOFEDGE_L = 20,
    ROOFEDGE_SQUARE_CORNER = 21,
    GROUND_DECOR = 22,
}

impl From<i8> for LocShape {
    #[inline(always)]
    fn from(value: i8) -> LocShape {
        return match value {
            0 => LocShape::WALL_STRAIGHT,
            1 => LocShape::WALL_DIAGONAL_CORNER,
            2 => LocShape::WALL_L,
            3 => LocShape::WALL_SQUARE_CORNER,
            4 => LocShape::WALLDECOR_STRAIGHT_NOOFFSET,
            5 => LocShape::WALLDECOR_STRAIGHT_OFFSET,
            6 => LocShape::WALLDECOR_DIAGONAL_OFFSET,
            7 => LocShape::WALLDECOR_DIAGONAL_NOOFFSET,
            8 => LocShape::WALLDECOR_DIAGONAL_BOTH,
            9 => LocShape::WALL_DIAGONAL,
            10 => LocShape::CENTREPIECE_STRAIGHT,
            11 => LocShape::CENTREPIECE_DIAGONAL,
            12 => LocShape::ROOF_STRAIGHT,
            13 => LocShape::ROOF_DIAGONAL_WITH_ROOFEDGE,
            14 => LocShape::ROOF_DIAGONAL,
            15 => LocShape::ROOF_L_CONCAVE,
            16 => LocShape::ROOF_L_CONVEX,
            17 => LocShape::ROOF_FLAT,
            18 => LocShape::ROOFEDGE_STRAIGHT,
            19 => LocShape::ROOFEDGE_DIAGONAL_CORNER,
            20 => LocShape::ROOFEDGE_L,
            21 => LocShape::ROOFEDGE_SQUARE_CORNER,
            22 => LocShape::GROUND_DECOR,
            _ => process::abort(), // unreachable!("[LocShape] Invalid value used for shape! {}", value),
        };
    }
}

impl PartialEq<LocShape> for i8 {
    #[inline(always)]
    fn eq(&self, other: &LocShape) -> bool {
        return LocShape::from(*self) == *other;
    }
}
