#![allow(non_camel_case_types)]

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
#[wasm_bindgen]
pub enum BlockAccessFlag {
    BLOCK_NORTH = 0x1,
    BLOCK_EAST = 0x2,
    BLOCK_SOUTH = 0x4,
    BLOCK_WEST = 0x8
}