use rand::Rng;

use crate::rsmod::{can_travel, CollisionStrategies, CoordGrid};
use crate::rsmod::collision::collision::CollisionFlagMap;

const DIRECTIONS: [[i32; 2]; 4] = [
    [-1, 0], // West
    [1, 0],  // East
    [0, 1],  // North
    [0, -1], // South
];

// https://gist.github.com/Z-Kris/2eb1c2fbc22aa7486a57089c82f293f8
// https://gist.github.com/Z-Kris/fe476d75a51374f12dca999700f009f7
#[inline(always)]
pub unsafe fn find_naive_path(
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
    extra_flag: u32,
    collision: &CollisionStrategies,
) -> Vec<u32> {
    // If we are intersecting at all, the path needs to try to move out of the way.
    if intersects(
        src_x,
        src_z,
        src_width,
        src_height,
        dest_x,
        dest_z,
        dest_width,
        dest_height,
    ) {
        return cardinal_destination(y, src_x, src_z);
    }
    let dest: Vec<u32> = naive_destination(
        y,
        src_x,
        src_z,
        src_width as i32,
        src_height as i32,
        dest_x,
        dest_z,
        1,
        1,
    );
    let dx: i32 = CoordGrid::from(dest[0]).x() as i32;
    let dz: i32 = CoordGrid::from(dest[0]).z() as i32;
    if is_diagonal(
        dx,
        dz,
        src_width as i32,
        src_height as i32,
        dest_x,
        dest_z,
        dest_width as i32,
        dest_height as i32,
    ) {
        return dest;
    }
    /* If we can interact from this coord(or overlap with the target), allow the pathfinder to exit. */
    if intersects(
        dx,
        dz,
        src_width,
        src_height,
        dest_x,
        dest_z,
        dest_width,
        dest_height,
    ) {
        return dest;
    }
    let mut currX: i32 = dx;
    let mut currZ: i32 = dz;
    while currX != dest_x && currZ != dest_z {
        let dx: i8 = (dest_x - currX).signum() as i8;
        let dz: i8 = (dest_z - currZ).signum() as i8;
        if can_travel(
            flags, y, currX, currZ, dx, dz, src_width, extra_flag, collision,
        ) {
            currX += dx as i32;
            currZ += dz as i32;
        } else if dx != 0
            && can_travel(
                flags, y, currX, currZ, dx, 0, src_width, extra_flag, collision,
            )
        {
            currX += dx as i32;
        } else if dz != 0
            && can_travel(
                flags, y, currX, currZ, 0, dz, src_width, extra_flag, collision,
            )
        {
            currZ += dz as i32;
        } else {
            /* If we can't step anywhere, exit out, we've arrived. */
            break;
        }
    }
    return vec![CoordGrid::new(y, currX, currZ).packed];
}

/**
 * Fast way to check if two squares are intersecting.
 * @param src_x The starting SW X.
 * @param src_z The starting SW Z.
 * @param src_width The width on the X axis.
 * @param src_height The length on the Z axis.
 * @param dest_x The ending SW X.
 * @param dest_z The ending SW Z.
 * @param dest_width The end width on the X axis.
 * @param dest_height The end length on the Z axis.
 */
#[inline(always)]
fn intersects(
    src_x: i32,
    src_z: i32,
    src_width: u8,
    src_height: u8,
    dest_x: i32,
    dest_z: i32,
    dest_width: u8,
    dest_height: u8,
) -> bool {
    let srcHorizontal: i32 = src_x + src_width as i32;
    let srcVertical: i32 = src_z + src_height as i32;
    let destHorizontal: i32 = dest_x + dest_width as i32;
    let destVertical: i32 = dest_z + dest_height as i32;
    return !(dest_x >= srcHorizontal
        || destHorizontal <= src_x
        || dest_z >= srcVertical
        || destVertical <= src_z);
}

#[inline(always)]
fn is_diagonal(
    src_x: i32,
    src_z: i32,
    src_width: i32,
    src_height: i32,
    dest_x: i32,
    dest_z: i32,
    dest_width: i32,
    dest_height: i32,
) -> bool {
    if src_x + src_width == dest_x && src_z + src_height == dest_z {
        return true;
    }
    if src_x - 1 == dest_x + dest_width - 1 && src_z - 1 == dest_z + dest_height - 1 {
        return true;
    }
    if src_x + src_width == dest_x && src_z - 1 == dest_z + dest_height - 1 {
        return true;
    }
    return src_x - 1 == dest_x + dest_width - 1 && src_z + src_height == dest_z;
}

#[inline(always)]
fn cardinal_destination(y: i32, src_x: i32, src_z: i32) -> Vec<u32> {
    let direction: [i32; 2] = DIRECTIONS[rand::thread_rng().gen_range(0..DIRECTIONS.len())];
    vec![CoordGrid::new(y, src_x + direction[0], src_z + direction[1]).packed]
}

/**
 * Calculates coordinates for [sourceX]/[sourceZ] to move to interact with [targetX]/[targetZ]
 * We first determine the cardinal direction of the source relative to the target by comparing if
 * the source lies to the left or right of diagonal \ and anti-diagonal / lines.
 * \ <= North <= /
 *  +------------+  >
 *  |            |  East
 *  +------------+  <
 * / <= South <= \
 * We then further bisect the area into three section relative to the south-west tile (zero):
 * 1. Greater than zero: follow their diagonal until the target side is reached (clamped at the furthest most tile)
 * 2. Less than zero: zero minus the size of the source
 * 3. Equal to zero: move directly towards zero / the south-west coordinate
 *
 * <  \ 0 /   <   /
 *     +---------+
 *     |         |
 *     +---------+
 * This method is equivalent to returning the last coordinate in a sequence of steps towards south-west when moving
 * ordinal then cardinally until entity side comes into contact with another.
 */
#[inline(always)]
fn naive_destination(
    y: i32,
    src_x: i32,
    src_z: i32,
    src_width: i32,
    src_height: i32,
    dest_x: i32,
    dest_z: i32,
    dest_width: i32,
    dest_height: i32,
) -> Vec<u32> {
    let diagonal: i32 = src_x - dest_x + (src_z - dest_z);
    let anti: i32 = src_x - dest_x - (src_z - dest_z);
    let southwest_clockwise: bool = anti < 0;
    let northwest_clockwise: bool = diagonal >= dest_height - 1 - (src_width - 1);
    let northeast_clockwise: bool = anti > src_width - src_height;
    let southeast_clockwise: bool = diagonal <= dest_width - 1 - (src_height - 1);

    return if southwest_clockwise && !northwest_clockwise {
        // West
        let mut off_z: i32 = 0;
        if diagonal >= -src_width {
            off_z = coerceAtMost(diagonal + src_width, dest_height - 1);
        } else if anti > -src_width {
            off_z = -(src_width + anti);
        }
        vec![CoordGrid::new(y, -src_width + dest_x, off_z + dest_z).packed]
    } else if northwest_clockwise && !northeast_clockwise {
        // North
        let mut off_x: i32 = 0;
        if anti >= -dest_height {
            off_x = coerceAtMost(anti + dest_height, dest_width - 1);
        } else if diagonal < dest_height {
            off_x = coerceAtLeast(diagonal - dest_height, -(src_width - 1));
        }
        vec![CoordGrid::new(y, off_x + dest_x, dest_height + dest_z).packed]
    } else if northeast_clockwise && !southeast_clockwise {
        // East
        let mut off_z: i32 = 0;
        if anti <= dest_width {
            off_z = dest_height - anti;
        } else if diagonal < dest_width {
            off_z = coerceAtLeast(diagonal - dest_width, -(src_height - 1));
        }
        vec![CoordGrid::new(y, dest_width + dest_x, off_z + dest_z).packed]
    } else {
        if !(southeast_clockwise && !southwest_clockwise) {
            // South
            // throw new Error(`Failed requirement. southEastClockwise was: ${southEastClockwise}, southWestClockwise was: ${southWestClockwise}.`);
        }
        let mut off_x: i32 = 0;
        if diagonal > -src_height {
            off_x = coerceAtMost(diagonal + src_height, dest_width - 1);
        } else if anti < src_height {
            off_x = coerceAtLeast(anti - src_height, -(src_height - 1));
        }
        vec![CoordGrid::new(y, off_x + dest_x, -src_height + dest_z).packed]
    };
}

/**
 * Ensures that this value is not greater than the specified maximumValue.
 */
#[inline(always)]
fn coerceAtMost(value: i32, max: i32) -> i32 {
    return if value > max { max } else { value };
}

/**
 * Ensures that this value is not less than the specified minimumValue.
 */
#[inline(always)]
fn coerceAtLeast(value: i32, min: i32) -> i32 {
    return if value < min { min } else { value };
}
