pub struct CoordGrid {
    pub packed: u32,
}

impl CoordGrid {
    #[inline(always)]
    pub fn new(y: i32, x: i32, z: i32) -> CoordGrid {
        return CoordGrid {
            packed: ((z & 0x3fff) | ((x & 0x3fff) << 14) | ((y & 0x3) << 28)) as u32,
        };
    }

    #[inline(always)]
    pub fn from(packed: u32) -> CoordGrid {
        return CoordGrid { packed };
    }

    #[inline(always)]
    pub fn y(&self) -> u32 {
        return (self.packed >> 28) & 0x3;
    }

    #[inline(always)]
    pub fn x(&self) -> u32 {
        return (self.packed >> 14) & 0x3fff;
    }

    #[inline(always)]
    pub fn z(&self) -> u32 {
        return self.packed & 0x3fff;
    }
}
