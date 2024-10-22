#![allow(non_camel_case_types)]

use std::ops::BitAnd;
use std::process;

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u8)]
#[derive(PartialEq, Debug)]
#[wasm_bindgen]
pub enum BlockAccessFlag {
    BLOCK_NORTH = 0x1,
    BLOCK_EAST = 0x2,
    BLOCK_SOUTH = 0x4,
    BLOCK_WEST = 0x8,
}

impl From<u8> for BlockAccessFlag {
    #[inline(always)]
    fn from(value: u8) -> Self {
        return match value {
            1 => BlockAccessFlag::BLOCK_NORTH,
            2 => BlockAccessFlag::BLOCK_EAST,
            3 => BlockAccessFlag::BLOCK_SOUTH,
            4 => BlockAccessFlag::BLOCK_WEST,
            _ => process::abort(),
        };
    }
}

impl BitAnd<BlockAccessFlag> for u8 {
    type Output = u8;

    #[inline(always)]
    fn bitand(self, rhs: BlockAccessFlag) -> Self::Output {
        return self & rhs as u8;
    }
}

impl PartialEq<BlockAccessFlag> for u8 {
    #[inline(always)]
    fn eq(&self, other: &BlockAccessFlag) -> bool {
        return BlockAccessFlag::from(*self) == *other;
    }
}
