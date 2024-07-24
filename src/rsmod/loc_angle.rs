#![allow(non_camel_case_types)]

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
#[wasm_bindgen]
pub enum LocAngle {
    WEST = 0,
    NORTH = 1,
    EAST = 2,
    SOUTH = 3
}

impl TryFrom<u8> for LocAngle {
    type Error = &'static str;

    fn try_from(value: u8) -> Result<Self, Self::Error> {
        match value {
            0 => Ok(LocAngle::WEST),
            1 => Ok(LocAngle::NORTH),
            2 => Ok(LocAngle::EAST),
            3 => Ok(LocAngle::SOUTH),
            _ => Err("Invalid loc angle value.")
        }
    }
}