#![allow(non_camel_case_types)]

use std::ops::BitAnd;

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
#[derive(Debug)]
#[wasm_bindgen]
pub enum BlockAccessFlag {
    BLOCK_NORTH = 0x1,
    BLOCK_EAST = 0x2,
    BLOCK_SOUTH = 0x4,
    BLOCK_WEST = 0x8,
}

impl BitAnd<BlockAccessFlag> for u8 {
    type Output = u8;

    #[inline(always)]
    fn bitand(self, rhs: BlockAccessFlag) -> Self::Output {
        return self & rhs as u8;
    }
}
