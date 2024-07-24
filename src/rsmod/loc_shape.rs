#![allow(non_camel_case_types)]

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
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
    GROUND_DECOR = 22
}

impl TryFrom<u8> for LocShape {
    type Error = &'static str;

    fn try_from(value: u8) -> Result<Self, Self::Error> {
        match value {
            0 => Ok(LocShape::WALL_STRAIGHT),
            1 => Ok(LocShape::WALL_DIAGONAL_CORNER),
            2 => Ok(LocShape::WALL_L),
            3 => Ok(LocShape::WALL_SQUARE_CORNER),
            4 => Ok(LocShape::WALLDECOR_STRAIGHT_NOOFFSET),
            5 => Ok(LocShape::WALLDECOR_STRAIGHT_OFFSET),
            6 => Ok(LocShape::WALLDECOR_DIAGONAL_OFFSET),
            7 => Ok(LocShape::WALLDECOR_DIAGONAL_NOOFFSET),
            8 => Ok(LocShape::WALLDECOR_DIAGONAL_BOTH),
            9 => Ok(LocShape::WALL_DIAGONAL),
            10 => Ok(LocShape::CENTREPIECE_STRAIGHT),
            11 => Ok(LocShape::CENTREPIECE_DIAGONAL),
            12 => Ok(LocShape::ROOF_STRAIGHT),
            13 => Ok(LocShape::ROOF_DIAGONAL_WITH_ROOFEDGE),
            14 => Ok(LocShape::ROOF_DIAGONAL),
            15 => Ok(LocShape::ROOF_L_CONCAVE),
            16 => Ok(LocShape::ROOF_L_CONVEX),
            17 => Ok(LocShape::ROOF_FLAT),
            18 => Ok(LocShape::ROOFEDGE_STRAIGHT),
            19 => Ok(LocShape::ROOFEDGE_DIAGONAL_CORNER),
            20 => Ok(LocShape::ROOFEDGE_L),
            21 => Ok(LocShape::ROOFEDGE_SQUARE_CORNER),
            22 => Ok(LocShape::GROUND_DECOR),
            _ => Err("Invalid loc shape value.")
        }
    }
}