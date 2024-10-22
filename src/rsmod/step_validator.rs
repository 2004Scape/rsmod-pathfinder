use crate::rsmod::{CollisionStrategies, CollisionStrategy};
use crate::rsmod::collision::collision::CollisionFlagMap;
use crate::rsmod::collision_flag::CollisionFlag;

#[rustfmt::skip]
#[inline(always)]
pub unsafe fn can_travel(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    offset_x: i8,
    offset_z: i8,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match (offset_x, offset_z) {
        (0, -1) => !is_blocked_south(flags, y, x, z, size, extra_flag, collision),
        (0, 1) => !is_blocked_north(flags, y, x, z, size, extra_flag, collision),
        (-1, 0) => !is_blocked_west(flags, y, x, z, size, extra_flag, collision),
        (1, 0) => !is_blocked_east(flags, y, x, z, size, extra_flag, collision),
        (-1, -1) => !is_blocked_southwest(flags, y, x, z, size, extra_flag, collision),
        (-1, 1) => !is_blocked_northwest(flags, y, x, z, size, extra_flag, collision),
        (1, -1) => !is_blocked_southeast(flags, y, x, z, size, extra_flag, collision),
        (1, 1) => !is_blocked_northeast(flags, y, x, z, size, extra_flag, collision),
        _ => false,
    };
}

#[inline(always)]
unsafe fn is_blocked_south(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => !collision.can_move(
            flags.get(x, z - 1, y),
            CollisionFlag::BLOCK_SOUTH as u32 | extra_flag,
        ),
        2 => {
            !collision.can_move(
                flags.get(x, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 1, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_EAST as u32 | extra_flag,
            )
        }
        _ => {
            if !collision.can_move(
                flags.get(x, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_WEST as u32 | extra_flag,
            ) {
                return true;
            } else if !collision.can_move(
                flags.get(x + size as i32 - 1, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_EAST as u32 | extra_flag,
            ) {
                return true;
            }
            for midX in x + 1..x + size as i32 - 1 {
                if !collision.can_move(
                    flags.get(midX, z - 1, y),
                    CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}

#[inline(always)]
unsafe fn is_blocked_north(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => !collision.can_move(
            flags.get(x, z + 1, y),
            CollisionFlag::BLOCK_NORTH as u32 | extra_flag,
        ),
        2 => {
            !collision.can_move(
                flags.get(x, z + 2, y),
                CollisionFlag::BLOCK_NORTH_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 1, z + 2, y),
                CollisionFlag::BLOCK_NORTH_EAST as u32 | extra_flag,
            )
        }
        _ => {
            if !collision.can_move(
                flags.get(x, z + size as i32, y),
                CollisionFlag::BLOCK_NORTH_WEST as u32 | extra_flag,
            ) {
                return true;
            } else if !collision.can_move(
                flags.get(x + size as i32 - 1, z + size as i32, y),
                CollisionFlag::BLOCK_NORTH_EAST as u32 | extra_flag,
            ) {
                return true;
            }
            for midX in x + 1..x + size as i32 - 1 {
                if !collision.can_move(
                    flags.get(midX, z + size as i32, y),
                    CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}

#[inline(always)]
unsafe fn is_blocked_west(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => !collision.can_move(
            flags.get(x - 1, z, y),
            CollisionFlag::BLOCK_WEST as u32 | extra_flag,
        ),
        2 => {
            !collision.can_move(
                flags.get(x - 1, z, y),
                CollisionFlag::BLOCK_SOUTH_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x - 1, z + 1, y),
                CollisionFlag::BLOCK_NORTH_WEST as u32 | extra_flag,
            )
        }
        _ => {
            if !collision.can_move(
                flags.get(x - 1, z, y),
                CollisionFlag::BLOCK_SOUTH_WEST as u32 | extra_flag,
            ) {
                return true;
            } else if !collision.can_move(
                flags.get(x - 1, z + size as i32 - 1, y),
                CollisionFlag::BLOCK_NORTH_WEST as u32 | extra_flag,
            ) {
                return true;
            }
            for midZ in z + 1..z + size as i32 - 1 {
                if !collision.can_move(
                    flags.get(x - 1, midZ, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}

#[inline(always)]
unsafe fn is_blocked_east(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => !collision.can_move(
            flags.get(x + 1, z, y),
            CollisionFlag::BLOCK_EAST as u32 | extra_flag,
        ),
        2 => {
            !collision.can_move(
                flags.get(x + 2, z, y),
                CollisionFlag::BLOCK_SOUTH_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 2, z + 1, y),
                CollisionFlag::BLOCK_NORTH_EAST as u32 | extra_flag,
            )
        }
        _ => {
            if !collision.can_move(
                flags.get(x + size as i32, z, y),
                CollisionFlag::BLOCK_SOUTH_EAST as u32 | extra_flag,
            ) {
                return true;
            } else if !collision.can_move(
                flags.get(x + size as i32, z + size as i32 - 1, y),
                CollisionFlag::BLOCK_NORTH_EAST as u32 | extra_flag,
            ) {
                return true;
            }
            for midZ in z + 1..z + size as i32 - 1 {
                if !collision.can_move(
                    flags.get(x + size as i32, midZ, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}

#[inline(always)]
unsafe fn is_blocked_southwest(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => {
            !collision.can_move(
                flags.get(x - 1, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x - 1, z, y),
                CollisionFlag::BLOCK_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x, z - 1, y),
                CollisionFlag::BLOCK_SOUTH as u32 | extra_flag,
            )
        }
        2 => {
            !collision.can_move(
                flags.get(x - 1, z, y),
                CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x - 1, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x, z - 1, y),
                CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32 | extra_flag,
            )
        }
        _ => {
            if !collision.can_move(
                flags.get(x - 1, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_WEST as u32 | extra_flag,
            ) {
                return true;
            }
            for mid in 1..size {
                if !collision.can_move(
                    flags.get(x - 1, z + mid as i32 - 1, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32 | extra_flag,
                ) {
                    return true;
                } else if !collision.can_move(
                    flags.get(x + mid as i32 - 1, z - 1, y),
                    CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}

#[inline(always)]
unsafe fn is_blocked_northwest(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => {
            !collision.can_move(
                flags.get(x - 1, z + 1, y),
                CollisionFlag::BLOCK_NORTH_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x - 1, z, y),
                CollisionFlag::BLOCK_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x, z + 1, y),
                CollisionFlag::BLOCK_NORTH as u32 | extra_flag,
            )
        }
        2 => {
            !collision.can_move(
                flags.get(x - 1, z + 1, y),
                CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x - 1, z + 2, y),
                CollisionFlag::BLOCK_NORTH_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x, z + 2, y),
                CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32 | extra_flag,
            )
        }
        _ => {
            if !collision.can_move(
                flags.get(x - 1, z + size as i32, y),
                CollisionFlag::BLOCK_NORTH_WEST as u32 | extra_flag,
            ) {
                return true;
            }
            for mid in 1..size {
                if !collision.can_move(
                    flags.get(x - 1, z + mid as i32, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32 | extra_flag,
                ) {
                    return true;
                } else if !collision.can_move(
                    flags.get(x + mid as i32 - 1, z + size as i32, y),
                    CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}

#[inline(always)]
unsafe fn is_blocked_southeast(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => {
            !collision.can_move(
                flags.get(x + 1, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 1, z, y),
                CollisionFlag::BLOCK_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x, z - 1, y),
                CollisionFlag::BLOCK_SOUTH as u32 | extra_flag,
            )
        }
        2 => {
            !collision.can_move(
                flags.get(x + 1, z - 1, y),
                CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 2, z - 1, y),
                CollisionFlag::BLOCK_SOUTH_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 2, z, y),
                CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32 | extra_flag,
            )
        }
        _ => {
            for mid in 1..size {
                if !collision.can_move(
                    flags.get(x + size as i32, z + mid as i32 - 1, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32 | extra_flag,
                ) {
                    return true;
                } else if !collision.can_move(
                    flags.get(x + mid as i32, z - 1, y),
                    CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}

#[inline(always)]
unsafe fn is_blocked_northeast(
    flags: &CollisionFlagMap,
    y: i32,
    x: i32,
    z: i32,
    size: u8,
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> bool {
    return match size {
        1 => {
            !collision.can_move(
                flags.get(x + 1, z + 1, y),
                CollisionFlag::BLOCK_NORTH_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 1, z, y),
                CollisionFlag::BLOCK_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x, z + 1, y),
                CollisionFlag::BLOCK_NORTH as u32 | extra_flag,
            )
        }
        2 => {
            !collision.can_move(
                flags.get(x + 1, z + 2, y),
                CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 2, z + 2, y),
                CollisionFlag::BLOCK_NORTH_EAST as u32 | extra_flag,
            ) || !collision.can_move(
                flags.get(x + 2, z + 1, y),
                CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32 | extra_flag,
            )
        }
        _ => {
            if !collision.can_move(
                flags.get(x + size as i32, z + size as i32, y),
                CollisionFlag::BLOCK_NORTH_EAST as u32 | extra_flag,
            ) {
                return true;
            }
            for mid in 1..size {
                if !collision.can_move(
                    flags.get(x + mid as i32, z + size as i32, y),
                    CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32 | extra_flag,
                ) {
                    return true;
                } else if !collision.can_move(
                    flags.get(x + size as i32, z + mid as i32, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32 | extra_flag,
                ) {
                    return true;
                }
            }
            false
        }
    };
}
