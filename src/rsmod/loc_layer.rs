#![allow(non_camel_case_types)]

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
#[wasm_bindgen]
pub enum LocLayer {
    WALL = 0,
    WALL_DECOR = 1,
    GROUND = 2,
    GROUND_DECOR = 3
}