use crate::rsmod::collision_flag::CollisionFlag;

#[derive(Clone)]
pub struct CollisionFlagMap {
    pub flags: Vec<Option<Vec<u32>>>,
}

impl CollisionFlagMap {
    const ZONE_TILE_COUNT: usize = 8 * 8;
    const TOTAL_ZONE_COUNT: usize = 256 * 256 * 4 * CollisionFlagMap::ZONE_TILE_COUNT;

    #[inline(always)]
    pub fn zone_index(x: i32, z: i32, y: i32) -> usize {
        return (((x >> 3) & 0x7ff) | (((z >> 3) & 0x7ff) << 11) | ((y & 0x3) << 22)) as usize;
    }

    #[inline(always)]
    pub fn tile_index(x: i32, z: i32) -> usize {
        return ((x & 0x7) | ((z & 0x7) << 3)) as usize;
    }

    #[inline(always)]
    pub fn new() -> CollisionFlagMap {
        return CollisionFlagMap {
            flags: vec![None; CollisionFlagMap::TOTAL_ZONE_COUNT],
        };
    }

    #[rustfmt::skip]
    #[inline(always)]
    pub unsafe fn get(&self, x: i32, z: i32, y: i32) -> u32 {
        if let Some(ref flags) = *self.flags.as_ptr().add(CollisionFlagMap::zone_index(x, z, y)) {
            return *flags.as_ptr().add(CollisionFlagMap::tile_index(x, z));
        }
        return CollisionFlag::NULL as u32
    }

    #[inline(always)]
    pub unsafe fn set(&mut self, x: i32, z: i32, y: i32, mask: u32) {
        *self
            .allocate_if_absent_return(CollisionFlagMap::zone_index(x, z, y))
            .as_mut_ptr()
            .add(CollisionFlagMap::tile_index(x, z)) = mask;
    }

    #[inline(always)]
    pub unsafe fn add(&mut self, x: i32, z: i32, y: i32, mask: u32) {
        *self
            .allocate_if_absent_return(CollisionFlagMap::zone_index(x, z, y))
            .as_mut_ptr()
            .add(CollisionFlagMap::tile_index(x, z)) |= mask;
    }

    #[inline(always)]
    pub unsafe fn remove(&mut self, x: i32, z: i32, y: i32, mask: u32) {
        *self
            .allocate_if_absent_return(CollisionFlagMap::zone_index(x, z, y))
            .as_mut_ptr()
            .add(CollisionFlagMap::tile_index(x, z)) &= !mask;
    }

    #[inline(always)]
    pub unsafe fn allocate_if_absent(&mut self, x: i32, z: i32, y: i32) {
        self.allocate_if_absent_return(CollisionFlagMap::zone_index(x, z, y));
    }

    #[inline(always)]
    unsafe fn allocate_if_absent_return(&mut self, zone_idx: usize) -> &mut Vec<u32> {
        return (*self.flags.as_mut_ptr().add(zone_idx)).get_or_insert_with(|| {
            vec![CollisionFlag::OPEN as u32; CollisionFlagMap::ZONE_TILE_COUNT]
        });
    }

    #[rustfmt::skip]
    #[inline(always)]
    pub unsafe fn deallocate_if_present(&mut self, x: i32, z: i32, y: i32) {
        *self.flags.as_mut_ptr().add(CollisionFlagMap::zone_index(x, z, y)) = None;
    }

    #[rustfmt::skip]
    #[inline(always)]
    pub unsafe fn is_zone_allocated(&self, x: i32, z: i32, y: i32) -> bool {
        return (*self.flags.as_ptr().add(CollisionFlagMap::zone_index(x, z, y))).is_some();
    }

    #[rustfmt::skip]
    #[inline(always)]
    pub unsafe fn is_flagged(&self, x: i32, z: i32, y: i32, masks: u32) -> bool {
        return match &*self.flags.as_ptr().add(CollisionFlagMap::zone_index(x, z, y)) {
            None => false,
            Some(flags) => {
                *flags.as_ptr().add(CollisionFlagMap::tile_index(x, z)) & masks != CollisionFlag::OPEN as u32
            }
        };
    }
}
