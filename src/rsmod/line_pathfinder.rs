use crate::rsmod::collision::collision::CollisionFlagMap;
use crate::rsmod::collision_flag::CollisionFlag;
use crate::rsmod::CoordGrid;
use crate::rsmod::line::Line;

#[inline(always)]
pub unsafe fn line_of_sight(
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
) -> Vec<u32> {
    return rayCastPath(
        flags,
        y,
        src_x,
        src_z,
        dest_x,
        dest_z,
        src_width,
        src_height,
        dest_width,
        dest_height,
        Line::SIGHT_BLOCKED_WEST | extra_flag,
        Line::SIGHT_BLOCKED_EAST | extra_flag,
        Line::SIGHT_BLOCKED_SOUTH | extra_flag,
        Line::SIGHT_BLOCKED_NORTH | extra_flag,
        CollisionFlag::LOC as u32 | extra_flag,
        CollisionFlag::LOC_PROJ_BLOCKER as u32 | extra_flag,
        true,
    );
}

#[inline(always)]
pub unsafe fn line_of_walk(
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
) -> Vec<u32> {
    return rayCastPath(
        flags,
        y,
        src_x,
        src_z,
        dest_x,
        dest_z,
        src_width,
        src_height,
        dest_width,
        dest_height,
        Line::WALK_BLOCKED_WEST | extra_flag,
        Line::WALK_BLOCKED_EAST | extra_flag,
        Line::WALK_BLOCKED_SOUTH | extra_flag,
        Line::WALK_BLOCKED_NORTH | extra_flag,
        CollisionFlag::LOC as u32 | extra_flag,
        CollisionFlag::LOC_PROJ_BLOCKER as u32 | extra_flag,
        false,
    );
}

#[inline(always)]
unsafe fn rayCastPath(
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
    flag_west: u32,
    flag_east: u32,
    flag_south: u32,
    flag_north: u32,
    flag_loc: u32,
    flag_proj: u32,
    los: bool,
) -> Vec<u32> {
    let start_x: i32 = Line::coordinate(src_x, dest_x, src_width);
    let start_z: i32 = Line::coordinate(src_z, dest_z, src_height);

    let end_x: i32 = Line::coordinate(dest_x, src_x, dest_width);
    let end_z: i32 = Line::coordinate(dest_z, src_z, dest_height);

    if start_x == end_x && start_z == end_z {
        return vec![];
    }

    if los && flags.is_flagged(start_x, start_z, y, flag_loc) {
        return vec![];
    }

    let delta_x: i32 = end_x - start_x;
    let delta_z: i32 = end_z - start_z;
    let absolute_delta_x: i32 = delta_x.abs();
    let absolute_delta_z: i32 = delta_z.abs();

    let travel_east: bool = delta_x >= 0;
    let travel_north: bool = delta_z >= 0;

    let mut x_flags: u32 = if travel_east { flag_west } else { flag_east };
    let mut z_flags: u32 = if travel_north { flag_south } else { flag_north };

    let mut coordinates: Vec<u32> = vec![];
    if absolute_delta_x > absolute_delta_z {
        let offset_x: i32 = if travel_east { 1 } else { -1 };
        let offset_z: i32 = if travel_north { 0 } else { -1 };

        let mut scaled_z: i32 = Line::scale_up(start_z) + Line::HALF_TILE + offset_z;
        let tangent: i32 = Line::scale_up(delta_z) / absolute_delta_x;

        let mut curr_x: i32 = start_x;
        while curr_x != end_x {
            curr_x += offset_x;
            let curr_z: i32 = Line::scale_down(scaled_z);
            if los && curr_x == end_x && curr_z == end_z {
                x_flags &= !flag_proj;
            }
            if flags.is_flagged(curr_x, curr_z, y, x_flags) {
                return vec![]; // alternative
            }
            coordinates.push(CoordGrid::new(y, curr_x, curr_z).packed);

            scaled_z += tangent;

            let nextZ: i32 = Line::scale_down(scaled_z);
            if nextZ != curr_z {
                if los && curr_x == end_x && nextZ == end_z {
                    z_flags &= !flag_proj;
                }
                if flags.is_flagged(curr_x, nextZ, y, z_flags) {
                    return vec![]; // alternative
                }
                coordinates.push(CoordGrid::new(y, curr_x, nextZ).packed);
            }
        }
    } else {
        let offset_x: i32 = if travel_east { 0 } else { -1 };
        let offset_z: i32 = if travel_north { 1 } else { -1 };

        let mut scaled_x: i32 = Line::scale_up(start_x) + Line::HALF_TILE + offset_x;
        let tangent: i32 = Line::scale_up(delta_x) / absolute_delta_z;

        let mut curr_z: i32 = start_z;
        while curr_z != end_z {
            curr_z += offset_z;
            let curr_x: i32 = Line::scale_down(scaled_x);
            if los && curr_x == end_x && curr_z == end_z {
                z_flags &= !flag_proj;
            }
            if flags.is_flagged(curr_x, curr_z, y, z_flags) {
                return vec![]; // alternative
            }
            coordinates.push(CoordGrid::new(y, curr_x, curr_z).packed);

            scaled_x += tangent;

            let nextX: i32 = Line::scale_down(scaled_x);
            if nextX != curr_x {
                if los && nextX == end_x && curr_z == end_z {
                    x_flags &= !flag_proj;
                }
                if flags.is_flagged(nextX, curr_z, y, x_flags) {
                    return vec![]; // alternative
                }
                coordinates.push(CoordGrid::new(y, nextX, curr_z).packed);
            }
        }
    }
    return coordinates;
}
