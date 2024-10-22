use crate::rsmod::{LocAngle, LocShape};
use crate::rsmod::collision::collision::CollisionFlagMap;
use crate::rsmod::collision_flag::CollisionFlag;
use crate::rsmod::reach::rectangle_boundary::{collides, reach_rectangle_1, reach_rectangle_n};
use crate::rsmod::rotation::{rotate, rotate_flags};

pub struct ReachStrategy;

impl ReachStrategy {
    const WALL_STRATEGY: i32 = 0;
    const WALL_DECOR_STRATEGY: i32 = 1;
    const RECTANGLE_STRATEGY: i32 = 2;
    const NO_STRATEGY: i32 = 3;
    const RECTANGLE_EXCLUSIVE_STRATEGY: i32 = 4;

    #[inline(always)]
    fn exit_strategy(shape: i8) -> i32 {
        if shape == -2 {
            return ReachStrategy::RECTANGLE_EXCLUSIVE_STRATEGY;
        } else if shape == -1 {
            return ReachStrategy::NO_STRATEGY;
        } else if (shape >= 0 && shape <= 3) || shape == 9 {
            return ReachStrategy::WALL_STRATEGY;
        } else if shape < 9 {
            return ReachStrategy::WALL_DECOR_STRATEGY;
        } else if (shape >= 10 && shape <= 11) || shape == 22 {
            return ReachStrategy::RECTANGLE_STRATEGY;
        }
        return ReachStrategy::NO_STRATEGY;
    }

    #[inline(always)]
    fn altered_rotation(angle: u8, shape: i8) -> u8 {
        return if shape == 7 { (angle + 2) & 0x3 } else { angle };
    }

    #[inline(always)]
    pub unsafe fn reached(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        dest_width: u8,
        dest_height: u8,
        src_size: u8,
        angle: u8,
        shape: i8,
        block_access_flags: u8,
    ) -> bool {
        let exit_strategy: i32 = ReachStrategy::exit_strategy(shape);
        if exit_strategy != ReachStrategy::RECTANGLE_EXCLUSIVE_STRATEGY
            && src_x == dest_x
            && src_z == dest_z
        {
            return true;
        }
        return match exit_strategy {
            ReachStrategy::WALL_STRATEGY => {
                return ReachStrategy::reach_wall(
                    flags, y, src_x, src_z, dest_x, dest_z, src_size, shape, angle,
                )
            }
            ReachStrategy::WALL_DECOR_STRATEGY => ReachStrategy::reach_wall_decor(
                flags, y, src_x, src_z, dest_x, dest_z, src_size, shape, angle,
            ),
            ReachStrategy::RECTANGLE_STRATEGY => ReachStrategy::reach_rectangle(
                flags,
                y,
                src_x,
                src_z,
                dest_x,
                dest_z,
                src_size,
                dest_width,
                dest_height,
                angle,
                block_access_flags,
            ),
            ReachStrategy::RECTANGLE_EXCLUSIVE_STRATEGY => {
                return ReachStrategy::reach_exclusive_rectangle(
                    flags,
                    y,
                    src_x,
                    src_z,
                    dest_x,
                    dest_z,
                    src_size,
                    dest_width,
                    dest_height,
                    angle,
                    block_access_flags,
                )
            }
            _ => return false,
        };
    }

    #[inline(always)]
    unsafe fn reach_rectangle(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        src_size: u8,
        dest_width: u8,
        dest_height: u8,
        angle: u8,
        block_access_flags: u8,
    ) -> bool {
        let rotated_width: u8 = rotate(angle, dest_width, dest_height);
        let rotated_height: u8 = rotate(angle, dest_height, dest_width);
        let rotated_block_access: u8 = rotate_flags(angle, block_access_flags);

        let collides: bool = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_size,
            src_size,
            rotated_width,
            rotated_height,
        );

        return match src_size {
            1 => {
                collides
                    || reach_rectangle_1(
                        flags,
                        y,
                        src_x,
                        src_z,
                        dest_x,
                        dest_z,
                        rotated_width,
                        rotated_height,
                        rotated_block_access,
                    )
            }
            _ => {
                collides
                    || reach_rectangle_n(
                        flags,
                        y,
                        src_x,
                        src_z,
                        dest_x,
                        dest_z,
                        src_size,
                        src_size,
                        rotated_width,
                        rotated_height,
                        rotated_block_access,
                    )
            }
        };
    }

    #[inline(always)]
    unsafe fn reach_exclusive_rectangle(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        src_size: u8,
        dest_width: u8,
        dest_height: u8,
        angle: u8,
        block_access_flags: u8,
    ) -> bool {
        let rotated_width: u8 = rotate(angle, dest_width, dest_height);
        let rotated_height: u8 = rotate(angle, dest_height, dest_width);
        let rotated_block_access: u8 = rotate_flags(angle, block_access_flags);

        let collides: bool = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_size,
            src_size,
            rotated_width,
            rotated_height,
        );

        return match src_size {
            1 => {
                !collides
                    && reach_rectangle_1(
                        flags,
                        y,
                        src_x,
                        src_z,
                        dest_x,
                        dest_z,
                        rotated_width,
                        rotated_height,
                        rotated_block_access,
                    )
            }
            _ => {
                !collides
                    && reach_rectangle_n(
                        flags,
                        y,
                        src_x,
                        src_z,
                        dest_x,
                        dest_z,
                        src_size,
                        src_size,
                        rotated_width,
                        rotated_height,
                        rotated_block_access,
                    )
            }
        };
    }

    #[inline(always)]
    unsafe fn reach_wall(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        src_size: u8,
        shape: i8,
        angle: u8,
    ) -> bool {
        if src_size == 1 && src_x == dest_x && src_z == dest_z {
            return true;
        } else if src_size != 1
            && dest_x >= src_x
            && src_size as i32 + src_x - 1 >= dest_x
            && dest_z >= src_z
            && src_size as i32 + src_z - 1 >= dest_z
        {
            return true;
        } else if src_size == 1 {
            return ReachStrategy::reach_wall_1(
                flags, y, src_x, src_z, dest_x, dest_z, shape, angle,
            );
        }
        return ReachStrategy::reach_wall_n(
            flags, y, src_x, src_z, dest_x, dest_z, src_size, shape, angle,
        );
    }

    #[inline(always)]
    unsafe fn reach_wall_decor(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        src_size: u8,
        shape: i8,
        angle: u8,
    ) -> bool {
        if src_size == 1 && src_x == dest_x && src_z == dest_z {
            return true;
        } else if src_size != 1
            && dest_x >= src_x
            && src_size as i32 + src_x - 1 >= dest_x
            && dest_z >= src_z
            && src_size as i32 + src_z - 1 >= dest_z
        {
            return true;
        } else if src_size == 1 {
            return ReachStrategy::reach_wall_decor_1(
                flags, y, src_x, src_z, dest_x, dest_z, shape, angle,
            );
        }
        return ReachStrategy::reach_wall_decor_n(
            flags, y, src_x, src_z, dest_x, dest_z, src_size, shape, angle,
        );
    }

    #[inline(always)]
    unsafe fn reach_wall_1(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        shape: i8,
        angle: u8,
    ) -> bool {
        let collisionFlags: u32 = flags.get(src_x, src_z, y);
        if shape == LocShape::WALL_STRAIGHT {
            return match LocAngle::from(angle) {
                LocAngle::WEST => {
                    if src_x == dest_x - 1 && src_z == dest_z {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z - 1
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::NORTH => {
                    if src_x == dest_x && src_z == dest_z + 1 {
                        return true;
                    } else if src_x == dest_x - 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::EAST => {
                    if src_x == dest_x + 1 && src_z == dest_z {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z - 1
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::SOUTH => {
                    if src_x == dest_x && src_z == dest_z - 1 {
                        return true;
                    } else if src_x == dest_x - 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
            };
        } else if shape == LocShape::WALL_L {
            return match LocAngle::from(angle) {
                LocAngle::WEST => {
                    if src_x == dest_x - 1 && src_z == dest_z {
                        return true;
                    } else if src_x == dest_x && src_z == dest_z + 1 {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z - 1
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::NORTH => {
                    if src_x == dest_x - 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x && src_z == dest_z + 1 {
                        return true;
                    } else if src_x == dest_x + 1 && src_z == dest_z {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z - 1
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::EAST => {
                    if src_x == dest_x - 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1 && src_z == dest_z {
                        return true;
                    } else if src_x == dest_x && src_z == dest_z - 1 {
                        return true;
                    }
                    false
                }
                LocAngle::SOUTH => {
                    if src_x == dest_x - 1 && src_z == dest_z {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x && src_z == dest_z - 1 {
                        return true;
                    }
                    false
                }
            };
        } else if shape == LocShape::WALL_DIAGONAL {
            if src_x == dest_x
                && src_z == dest_z + 1
                && (collisionFlags & CollisionFlag::WALL_SOUTH as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x
                && src_z == dest_z - 1
                && (collisionFlags & CollisionFlag::WALL_NORTH as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x - 1
                && src_z == dest_z
                && (collisionFlags & CollisionFlag::WALL_EAST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x + 1
                && src_z == dest_z
                && (collisionFlags & CollisionFlag::WALL_WEST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            }
            return false;
        }
        return false;
    }

    #[inline(always)]
    unsafe fn reach_wall_n(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        src_size: u8,
        shape: i8,
        angle: u8,
    ) -> bool {
        let collisionFlags: u32 = flags.get(src_x, src_z, y);
        let east: i32 = src_x + src_size as i32 - 1;
        let north: i32 = src_z + src_size as i32 - 1;
        if shape == LocShape::WALL_STRAIGHT {
            return match LocAngle::from(angle) {
                LocAngle::WEST => {
                    if src_x == dest_x - src_size as i32 && src_z <= dest_z && north >= dest_z {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z - src_size as i32
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::NORTH => {
                    if dest_x >= src_x && dest_x <= east && src_z == dest_z + 1 {
                        return true;
                    } else if src_x == dest_x - src_size as i32
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::EAST => {
                    if src_x == dest_x + 1 && src_z <= dest_z && north >= dest_z {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z - src_size as i32
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::SOUTH => {
                    if dest_x >= src_x && dest_x <= east && src_z == dest_z - src_size as i32 {
                        return true;
                    } else if src_x == dest_x - src_size as i32
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
            };
        } else if shape == LocShape::WALL_L {
            return match LocAngle::from(angle) {
                LocAngle::WEST => {
                    if src_x == dest_x - src_size as i32 && src_z <= dest_z && north >= dest_z {
                        return true;
                    } else if dest_x >= src_x && dest_x <= east && src_z == dest_z + 1 {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z - src_size as i32
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::NORTH => {
                    if src_x == dest_x - src_size as i32
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if dest_x >= src_x && dest_x <= east && src_z == dest_z + 1 {
                        return true;
                    } else if src_x == dest_x + 1 && src_z <= dest_z && north >= dest_z {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z - src_size as i32
                        && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::EAST => {
                    if src_x == dest_x - src_size as i32
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1 && src_z <= dest_z && north >= dest_z {
                        return true;
                    } else if dest_x >= src_x && dest_x <= east && src_z == dest_z - src_size as i32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::SOUTH => {
                    if src_x == dest_x - src_size as i32 && src_z <= dest_z && north >= dest_z {
                        return true;
                    } else if dest_x >= src_x
                        && dest_x <= east
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x + 1
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::BLOCK_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if dest_x >= src_x && dest_x <= east && src_z == dest_z - src_size as i32
                    {
                        return true;
                    }
                    false
                }
            };
        } else if shape == LocShape::WALL_DIAGONAL {
            if dest_x >= src_x
                && dest_x <= east
                && src_z == dest_z + 1
                && (collisionFlags & CollisionFlag::BLOCK_NORTH as u32)
                    == CollisionFlag::OPEN as u32
            {
                return true;
            } else if dest_x >= src_x
                && dest_x <= east
                && src_z == dest_z - src_size as i32
                && (collisionFlags & CollisionFlag::BLOCK_SOUTH as u32)
                    == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x - src_size as i32
                && src_z <= dest_z
                && north >= dest_z
                && (collisionFlags & CollisionFlag::BLOCK_WEST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x + 1
                && src_z <= dest_z
                && north >= dest_z
                && (collisionFlags & CollisionFlag::BLOCK_EAST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            }
            return false;
        }
        return false;
    }

    #[inline(always)]
    unsafe fn reach_wall_decor_1(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        shape: i8,
        angle: u8,
    ) -> bool {
        let collisionFlags: u32 = flags.get(src_x, src_z, y);
        if shape == LocShape::WALLDECOR_DIAGONAL_OFFSET
            || shape == LocShape::WALLDECOR_DIAGONAL_NOOFFSET
        {
            return match LocAngle::from(ReachStrategy::altered_rotation(angle, shape)) {
                LocAngle::WEST => {
                    if src_x == dest_x + 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::WALL_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z - 1
                        && (collisionFlags & CollisionFlag::WALL_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::NORTH => {
                    if src_x == dest_x - 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::WALL_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z - 1
                        && (collisionFlags & CollisionFlag::WALL_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::EAST => {
                    if src_x == dest_x - 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::WALL_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::WALL_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::SOUTH => {
                    if src_x == dest_x + 1
                        && src_z == dest_z
                        && (collisionFlags & CollisionFlag::WALL_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x == dest_x
                        && src_z == dest_z + 1
                        && (collisionFlags & CollisionFlag::WALL_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
            };
        } else if shape == LocShape::WALLDECOR_DIAGONAL_BOTH {
            if src_x == dest_x
                && src_z == dest_z + 1
                && (collisionFlags & CollisionFlag::WALL_SOUTH as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x
                && src_z == dest_z - 1
                && (collisionFlags & CollisionFlag::WALL_NORTH as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x - 1
                && src_z == dest_z
                && (collisionFlags & CollisionFlag::WALL_EAST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x + 1
                && src_z == dest_z
                && (collisionFlags & CollisionFlag::WALL_WEST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            }
            return false;
        }
        return false;
    }

    #[inline(always)]
    unsafe fn reach_wall_decor_n(
        flags: &CollisionFlagMap,
        y: i32,
        src_x: i32,
        src_z: i32,
        dest_x: i32,
        dest_z: i32,
        src_size: u8,
        shape: i8,
        angle: u8,
    ) -> bool {
        let collisionFlags: u32 = flags.get(src_x, src_z, y);
        let east: i32 = src_x + src_size as i32 - 1;
        let north: i32 = src_z + src_size as i32 - 1;
        if shape == LocShape::WALLDECOR_DIAGONAL_OFFSET
            || shape == LocShape::WALLDECOR_DIAGONAL_NOOFFSET
        {
            return match LocAngle::from(ReachStrategy::altered_rotation(angle, shape)) {
                LocAngle::WEST => {
                    if src_x == dest_x + 1
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::WALL_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x <= dest_x
                        && src_z == dest_z - src_size as i32
                        && east >= dest_x
                        && (collisionFlags & CollisionFlag::WALL_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::NORTH => {
                    if src_x == dest_x - src_size as i32
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::WALL_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x <= dest_x
                        && src_z == dest_z - src_size as i32
                        && east >= dest_x
                        && (collisionFlags & CollisionFlag::WALL_NORTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::EAST => {
                    if src_x == dest_x - src_size as i32
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::WALL_EAST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x <= dest_x
                        && src_z == dest_z + 1
                        && east >= dest_x
                        && (collisionFlags & CollisionFlag::WALL_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
                LocAngle::SOUTH => {
                    if src_x == dest_x + 1
                        && src_z <= dest_z
                        && north >= dest_z
                        && (collisionFlags & CollisionFlag::WALL_WEST as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    } else if src_x <= dest_x
                        && src_z == dest_z + 1
                        && east >= dest_x
                        && (collisionFlags & CollisionFlag::WALL_SOUTH as u32)
                            == CollisionFlag::OPEN as u32
                    {
                        return true;
                    }
                    false
                }
            };
        } else if shape == LocShape::WALLDECOR_DIAGONAL_BOTH {
            if src_x <= dest_x
                && src_z == dest_z + 1
                && east >= dest_x
                && (collisionFlags & CollisionFlag::WALL_SOUTH as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x <= dest_x
                && src_z == dest_z - src_size as i32
                && east >= dest_x
                && (collisionFlags & CollisionFlag::WALL_NORTH as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x - src_size as i32
                && src_z <= dest_z
                && north >= dest_z
                && (collisionFlags & CollisionFlag::WALL_EAST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            } else if src_x == dest_x + 1
                && src_z <= dest_z
                && north >= dest_z
                && (collisionFlags & CollisionFlag::WALL_WEST as u32) == CollisionFlag::OPEN as u32
            {
                return true;
            }
            return false;
        }
        return false;
    }
}
