use crate::rsmod::block_flag::BlockAccessFlag;
use crate::rsmod::collision::collision::CollisionFlagMap;
use crate::rsmod::collision_flag::CollisionFlag;

#[inline(always)]
pub fn collides(
    src_x: i32,
    src_z: i32,
    dest_x: i32,
    dest_z: i32,
    src_width: u8,
    src_height: u8,
    dest_width: u8,
    dest_height: u8,
) -> bool {
    return if src_x >= dest_x + dest_width as i32 || src_x + src_width as i32 <= dest_x {
        false
    } else {
        src_z < dest_z + dest_height as i32 && dest_z < src_height as i32 + src_z
    };
}

#[inline(always)]
pub unsafe fn reach_rectangle_1(
    flags: &CollisionFlagMap,
    y: i32,
    src_x: i32,
    src_z: i32,
    dest_x: i32,
    dest_z: i32,
    dest_width: u8,
    dest_height: u8,
    block_access_flags: u8,
) -> bool {
    let east: i32 = dest_x + dest_width as i32 - 1;
    let north: i32 = dest_z + dest_height as i32 - 1;

    if src_x == dest_x - 1
        && src_z >= dest_z
        && src_z <= north
        && (flags.get(src_x, src_z, y) & CollisionFlag::WALL_EAST as u32)
            == CollisionFlag::OPEN as u32
        && (block_access_flags & BlockAccessFlag::BLOCK_WEST) == 0
    {
        return true;
    }

    if src_x == east + 1
        && src_z >= dest_z
        && src_z <= north
        && (flags.get(src_x, src_z, y) & CollisionFlag::WALL_WEST as u32)
            == CollisionFlag::OPEN as u32
        && (block_access_flags & BlockAccessFlag::BLOCK_EAST) == 0
    {
        return true;
    }

    if src_z + 1 == dest_z
        && src_x >= dest_x
        && src_x <= east
        && (flags.get(src_x, src_z, y) & CollisionFlag::WALL_NORTH as u32)
            == CollisionFlag::OPEN as u32
        && (block_access_flags & BlockAccessFlag::BLOCK_SOUTH) == 0
    {
        return true;
    }

    return src_z == north + 1
        && src_x >= dest_x
        && src_x <= east
        && (flags.get(src_x, src_z, y) & CollisionFlag::WALL_SOUTH as u32)
            == CollisionFlag::OPEN as u32
        && (block_access_flags & BlockAccessFlag::BLOCK_NORTH) == 0;
}

#[inline(always)]
pub unsafe fn reach_rectangle_n(
    flags: &CollisionFlagMap,
    y: i32,
    src_x: i32,
    src_z: i32,
    dest_x: i32,
    dest_z: i32,
    src_width: u8,
    src_height: u8,
    dest_width: u8,
    dest_height: u8,
    block_access_flags: u8,
) -> bool {
    let src_east: i32 = src_x + src_width as i32;
    let src_north: i32 = src_height as i32 + src_z;
    let dest_east: i32 = dest_width as i32 + dest_x;
    let dest_north: i32 = dest_height as i32 + dest_z;

    if dest_east == src_x && (block_access_flags & BlockAccessFlag::BLOCK_EAST) == 0 {
        let from_z: i32 = src_z.max(dest_z);
        let to_z: i32 = src_north.min(dest_north);
        for side_z in from_z..to_z {
            if (flags.get(dest_east - 1, side_z, y) & CollisionFlag::WALL_EAST as u32)
                == CollisionFlag::OPEN as u32
            {
                return true;
            }
        }
    } else if src_east == dest_x && (block_access_flags & BlockAccessFlag::BLOCK_WEST) == 0 {
        let from_z: i32 = src_z.max(dest_z);
        let to_z: i32 = src_north.min(dest_north);
        for side_z in from_z..to_z {
            if (flags.get(dest_x, side_z, y) & CollisionFlag::WALL_WEST as u32)
                == CollisionFlag::OPEN as u32
            {
                return true;
            }
        }
    } else if src_z == dest_north && (block_access_flags & BlockAccessFlag::BLOCK_NORTH) == 0 {
        let from_x: i32 = src_x.max(dest_x);
        let to_x: i32 = src_east.min(dest_east);
        for side_x in from_x..to_x {
            if (flags.get(side_x, dest_north - 1, y) & CollisionFlag::WALL_NORTH as u32)
                == CollisionFlag::OPEN as u32
            {
                return true;
            }
        }
    } else if dest_z == src_north && (block_access_flags & BlockAccessFlag::BLOCK_SOUTH) == 0 {
        let from_x: i32 = src_x.max(dest_x);
        let to_x: i32 = src_east.min(dest_east);
        for side_x in from_x..to_x {
            if (flags.get(side_x, dest_z, y) & CollisionFlag::WALL_SOUTH as u32)
                == CollisionFlag::OPEN as u32
            {
                return true;
            }
        }
    }
    return false;
}
