#![allow(non_camel_case_types)]

use std::process;

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
#[derive(PartialEq)]
#[wasm_bindgen]
pub enum LocAngle {
    WEST = 0,
    NORTH = 1,
    EAST = 2,
    SOUTH = 3,
}

impl From<u8> for LocAngle {
    #[inline(always)]
    fn from(value: u8) -> LocAngle {
        return match value {
            0 => LocAngle::WEST,
            1 => LocAngle::NORTH,
            2 => LocAngle::EAST,
            3 => LocAngle::SOUTH,
            _ => process::abort(), //unreachable!("[LocAngle] Invalid value used for angle! {}", value),
        };
    }
}

impl PartialEq<LocAngle> for u8 {
    #[inline(always)]
    fn eq(&self, other: &LocAngle) -> bool {
        return LocAngle::from(*self) == *other;
    }
}
