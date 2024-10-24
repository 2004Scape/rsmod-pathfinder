#[inline(always)]
pub fn rotate(angle: u8, a: u8, b: u8) -> u8 {
    return if (angle & 0x1) != 0 { b } else { a };
}

#[inline(always)]
pub fn rotate_flags(angle: u8, block_access_flags: u8) -> u8 {
    return if angle == 0 {
        block_access_flags
    } else {
        ((block_access_flags << angle) & 0xf) | (block_access_flags >> (4 - angle))
    };
}
