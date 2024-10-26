use std::collections::VecDeque;

use crate::rsmod::{CollisionStrategies, CollisionStrategy, CoordGrid};
use crate::rsmod::collision::collision::CollisionFlagMap;
use crate::rsmod::collision_flag::CollisionFlag;
use crate::rsmod::direction_flag::DirectionFlag;
use crate::rsmod::reach_strategy::ReachStrategy;
use crate::rsmod::rotation::rotate;

#[derive(Clone)]
pub struct PathFinder {
    search_map_size: i32,
    ring_buffer_size: i32,
    search_half_map_size: i32,
    directions: Vec<i8>,
    distances: Vec<i32>,
    valid_local_x: Vec<i32>,
    valid_local_z: Vec<i32>,
    curr_local_x: i32,
    curr_local_z: i32,
    buf_reader_index: usize,
    buf_writer_index: usize,
}

impl PathFinder {
    const DEFAULT_SEARCH_MAP_SIZE: i32 = 128;
    const DEFAULT_RING_BUFFER_SIZE: i32 = 4096;
    const DEFAULT_DISTANCE_VALUE: i32 = 99_999_999;
    const DEFAULT_SRC_DIRECTION_VALUE: i8 = 99;
    const MAX_ALTERNATIVE_ROUTE_LOWEST_COST: i32 = 1000;
    const MAX_ALTERNATIVE_ROUTE_SEEK_RANGE: i32 = 100;
    const MAX_ALTERNATIVE_ROUTE_DISTANCE_FROM_DESTINATION: i32 = 10;

    const EMPTY: Vec<u32> = vec![];

    #[inline(always)]
    pub fn new() -> PathFinder {
        let search_map_size = PathFinder::DEFAULT_SEARCH_MAP_SIZE;
        let ring_buffer_size = PathFinder::DEFAULT_RING_BUFFER_SIZE;
        return PathFinder {
            search_map_size,
            search_half_map_size: search_map_size / 2,
            ring_buffer_size,
            directions: vec![0; (search_map_size * search_map_size) as usize],
            distances: vec![
                PathFinder::DEFAULT_DISTANCE_VALUE;
                (search_map_size * search_map_size) as usize
            ],
            valid_local_x: vec![0; ring_buffer_size as usize],
            valid_local_z: vec![0; ring_buffer_size as usize],
            curr_local_x: 0,
            curr_local_z: 0,
            buf_reader_index: 0,
            buf_writer_index: 0,
        };
    }

    #[inline(always)]
    pub unsafe fn find_path(
        &mut self,
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
        shape: i8,
        move_near: bool,
        block_access_flags: u8,
        max_waypoints: u8,
        collision: &CollisionStrategies,
    ) -> Vec<u32> {
        self.reset();
        let base_x: i32 = src_x - self.search_half_map_size;
        let base_z: i32 = src_z - self.search_half_map_size;
        let local_src_x: i32 = src_x - base_x;
        let local_srx_z: i32 = src_z - base_z;
        let local_dest_x: i32 = dest_x - base_x;
        let local_dest_z: i32 = dest_z - base_z;
        self.append_direction(
            local_src_x,
            local_srx_z,
            PathFinder::DEFAULT_SRC_DIRECTION_VALUE,
            0,
        );
        let path_found: bool = match src_size {
            1 => self.find_path_1(
                flags,
                base_x,
                base_z,
                y,
                local_dest_x,
                local_dest_z,
                dest_width,
                dest_height,
                src_size,
                angle,
                shape,
                block_access_flags,
                collision,
            ),
            2 => self.find_path_2(
                flags,
                base_x,
                base_z,
                y,
                local_dest_x,
                local_dest_z,
                dest_width,
                dest_height,
                src_size,
                angle,
                shape,
                block_access_flags,
                collision,
            ),
            _ => self.find_path_n(
                flags,
                base_x,
                base_z,
                y,
                local_dest_x,
                local_dest_z,
                dest_width,
                dest_height,
                src_size,
                angle,
                shape,
                block_access_flags,
                collision,
            ),
        };
        if !path_found {
            if !move_near {
                return PathFinder::EMPTY;
            }
            let found_approach_point: bool = self.find_closest_approach_point(
                local_dest_x,
                local_dest_z,
                rotate(angle, dest_width, dest_height),
                rotate(angle, dest_height, dest_width),
            );
            if !found_approach_point {
                return PathFinder::EMPTY;
            }
        }

        let limit: usize = max_waypoints as usize;
        let mut waypoints: VecDeque<u32> = VecDeque::with_capacity(limit);

        let mut next: i8 = *self
            .directions
            .as_ptr()
            .add(self.local_index(self.curr_local_x, self.curr_local_z));
        let mut curr: i8 = -1;

        for _ in 0..self.directions.len() {
            if self.curr_local_x == local_src_x && self.curr_local_z == local_srx_z {
                break;
            }
            if curr != next {
                curr = next;
                if waypoints.len() >= limit {
                    waypoints.pop_back();
                }
                waypoints.push_front(
                    CoordGrid::new(y, base_x + self.curr_local_x, base_z + self.curr_local_z)
                        .packed,
                );
            }

            if curr & DirectionFlag::East != 0 {
                self.curr_local_x += 1;
            } else if curr & DirectionFlag::West != 0 {
                self.curr_local_x -= 1;
            }

            if curr & DirectionFlag::North != 0 {
                self.curr_local_z += 1;
            } else if curr & DirectionFlag::South != 0 {
                self.curr_local_z -= 1;
            }

            next = *self
                .directions
                .as_ptr()
                .add(self.local_index(self.curr_local_x, self.curr_local_z));
        }
        return Vec::from(waypoints);
    }

    #[inline(always)]
    unsafe fn find_path_1(
        &mut self,
        flags: &CollisionFlagMap,
        base_x: i32,
        base_z: i32,
        y: i32,
        local_dest_x: i32,
        local_dest_z: i32,
        dest_width: u8,
        dest_height: u8,
        src_size: u8,
        angle: u8,
        shape: i8,
        block_access_flags: u8,
        collision: &CollisionStrategies,
    ) -> bool {
        let mut x: i32;
        let mut z: i32;
        let mut clip_flag: CollisionFlag;
        let mut dir_flag: DirectionFlag;
        let relative_search_size: i32 = self.search_map_size - 1;

        while self.buf_writer_index != self.buf_reader_index {
            self.curr_local_x = *self.valid_local_x.as_ptr().add(self.buf_reader_index);
            self.curr_local_z = *self.valid_local_z.as_ptr().add(self.buf_reader_index);
            self.buf_reader_index =
                (self.buf_reader_index + 1) & (self.ring_buffer_size - 1) as usize;

            let reached: bool = ReachStrategy::reached(
                flags,
                y,
                self.curr_local_x + base_x,
                self.curr_local_z + base_z,
                local_dest_x + base_x,
                local_dest_z + base_z,
                dest_width,
                dest_height,
                src_size,
                angle,
                shape,
                block_access_flags,
            );
            if reached {
                return true;
            }

            let next_distance: i32 = *self
                .distances
                .as_ptr()
                .add(self.local_index(self.curr_local_x, self.curr_local_z))
                + 1;

            /* east to west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z;
            clip_flag = CollisionFlag::BLOCK_WEST;
            dir_flag = DirectionFlag::East;
            if self.curr_local_x > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    clip_flag as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }

            /* west to east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z;
            clip_flag = CollisionFlag::BLOCK_EAST;
            dir_flag = DirectionFlag::West;
            if self.curr_local_x < relative_search_size
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    clip_flag as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }

            /* north to south  */
            x = self.curr_local_x;
            z = self.curr_local_z - 1;
            clip_flag = CollisionFlag::BLOCK_SOUTH;
            dir_flag = DirectionFlag::North;
            if self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    clip_flag as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }

            /* south to north */
            x = self.curr_local_x;
            z = self.curr_local_z + 1;
            clip_flag = CollisionFlag::BLOCK_NORTH;
            dir_flag = DirectionFlag::South;
            if self.curr_local_z < relative_search_size
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    clip_flag as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }

            /* north-east to south-west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z - 1;
            dir_flag = DirectionFlag::NorthEast;
            if self.curr_local_x > 0
                && self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z, y),
                    CollisionFlag::BLOCK_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x, z, y),
                    CollisionFlag::BLOCK_SOUTH as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }

            /* north-west to south-east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z - 1;
            dir_flag = DirectionFlag::NorthWest;
            if self.curr_local_x < relative_search_size
                && self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z, y),
                    CollisionFlag::BLOCK_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x, z, y),
                    CollisionFlag::BLOCK_SOUTH as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }

            /* south-east to north-west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z + 1;
            dir_flag = DirectionFlag::SouthEast;
            if self.curr_local_x > 0
                && self.curr_local_z < relative_search_size
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_NORTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z, y),
                    CollisionFlag::BLOCK_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x, z, y),
                    CollisionFlag::BLOCK_NORTH as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }

            /* south-west to north-east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z + 1;
            dir_flag = DirectionFlag::SouthWest;
            if self.curr_local_x < relative_search_size
                && self.curr_local_z < relative_search_size
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_NORTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z, y),
                    CollisionFlag::BLOCK_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x, z, y),
                    CollisionFlag::BLOCK_NORTH as u32,
                )
            {
                self.append_direction(x, z, dir_flag as i8, next_distance);
            }
        }
        return false;
    }

    #[inline(always)]
    unsafe fn find_path_2(
        &mut self,
        flags: &CollisionFlagMap,
        base_x: i32,
        base_z: i32,
        y: i32,
        local_dest_x: i32,
        local_dest_z: i32,
        dest_width: u8,
        dest_height: u8,
        src_size: u8,
        angle: u8,
        shape: i8,
        block_access_flags: u8,
        collision: &CollisionStrategies,
    ) -> bool {
        let mut x: i32;
        let mut z: i32;
        let mut dirFlag: DirectionFlag;
        let relativeSearchSize: i32 = self.search_map_size - 2;

        while self.buf_writer_index != self.buf_reader_index {
            self.curr_local_x = *self.valid_local_x.as_ptr().add(self.buf_reader_index);
            self.curr_local_z = *self.valid_local_z.as_ptr().add(self.buf_reader_index);
            self.buf_reader_index =
                (self.buf_reader_index + 1) & (self.ring_buffer_size - 1) as usize;

            let reached: bool = ReachStrategy::reached(
                flags,
                y,
                self.curr_local_x + base_x,
                self.curr_local_z + base_z,
                local_dest_x + base_x,
                local_dest_z + base_z,
                dest_width,
                dest_height,
                src_size,
                angle,
                shape,
                block_access_flags,
            );
            if reached {
                return true;
            }

            let next_distance: i32 = *self
                .distances
                .as_ptr()
                .add(self.local_index(self.curr_local_x, self.curr_local_z))
                + 1;

            /* east to west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z;
            dirFlag = DirectionFlag::East;
            if self.curr_local_x > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z + 1, y),
                    CollisionFlag::BLOCK_NORTH_WEST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }

            /* west to east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z;
            dirFlag = DirectionFlag::West;
            if self.curr_local_x < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x + 2, z, y),
                    CollisionFlag::BLOCK_SOUTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + 2,
                        self.curr_local_z + 1,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_EAST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }

            /* north to south  */
            x = self.curr_local_x;
            z = self.curr_local_z - 1;
            dirFlag = DirectionFlag::North;
            if self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x + 1, z, y),
                    CollisionFlag::BLOCK_SOUTH_EAST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }

            /* south to north */
            x = self.curr_local_x;
            z = self.curr_local_z + 1;
            dirFlag = DirectionFlag::South;
            if self.curr_local_z < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z + 2, y),
                    CollisionFlag::BLOCK_NORTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + 1,
                        self.curr_local_z + 2,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_EAST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }

            /* north-east to south-west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z - 1;
            dirFlag = DirectionFlag::NorthEast;
            if self.curr_local_x > 0
                && self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x, z, y),
                    CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }

            /* north-west to south-east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z - 1;
            dirFlag = DirectionFlag::NorthWest;
            if self.curr_local_x < relativeSearchSize
                && self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x + 2, z, y),
                    CollisionFlag::BLOCK_SOUTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + 2,
                        self.curr_local_z,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }

            /* south-east to north-west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z + 1;
            dirFlag = DirectionFlag::SouthEast;
            if self.curr_local_x > 0
                && self.curr_local_z < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z + 2, y),
                    CollisionFlag::BLOCK_NORTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x,
                        self.curr_local_z + 2,
                        y,
                    ),
                    CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }

            /* south-west to north-east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z + 1;
            dirFlag = DirectionFlag::SouthWest;
            if self.curr_local_x < relativeSearchSize
                && self.curr_local_z < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, self.curr_local_z + 2, y),
                    CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + 2,
                        self.curr_local_z + 2,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, self.curr_local_x + 2, z, y),
                    CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32,
                )
            {
                self.append_direction(x, z, dirFlag as i8, next_distance);
            }
        }
        return false;
    }

    #[inline(always)]
    unsafe fn find_path_n(
        &mut self,
        flags: &CollisionFlagMap,
        base_x: i32,
        base_z: i32,
        y: i32,
        local_dest_x: i32,
        local_dest_z: i32,
        dest_width: u8,
        dest_height: u8,
        src_size: u8,
        angle: u8,
        shape: i8,
        block_access_flags: u8,
        collision: &CollisionStrategies,
    ) -> bool {
        let mut x: i32;
        let mut z: i32;
        let mut dirFlag: DirectionFlag;
        let relativeSearchSize: i32 = self.search_map_size - src_size as i32;

        while self.buf_writer_index != self.buf_reader_index {
            self.curr_local_x = *self.valid_local_x.as_ptr().add(self.buf_reader_index);
            self.curr_local_z = *self.valid_local_z.as_ptr().add(self.buf_reader_index);
            self.buf_reader_index =
                (self.buf_reader_index + 1) & (self.ring_buffer_size - 1) as usize;

            let reached: bool = ReachStrategy::reached(
                flags,
                y,
                self.curr_local_x + base_x,
                self.curr_local_z + base_z,
                local_dest_x + base_x,
                local_dest_z + base_z,
                dest_width,
                dest_height,
                src_size,
                angle,
                shape,
                block_access_flags,
            );
            if reached {
                return true;
            }

            let next_distance: i32 = *self
                .distances
                .as_ptr()
                .add(self.local_index(self.curr_local_x, self.curr_local_z))
                + 1;

            /* east to west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z;
            dirFlag = DirectionFlag::East;
            if self.curr_local_x > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        x,
                        self.curr_local_z + src_size as i32 - 1,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_WEST as u32,
                )
            {
                let clipFlag: u32 = CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 - 1 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            x,
                            self.curr_local_z + index,
                            y,
                        ),
                        clipFlag,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }

            /* west to east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z;
            dirFlag = DirectionFlag::West;
            if self.curr_local_x < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + src_size as i32,
                        z,
                        y,
                    ),
                    CollisionFlag::BLOCK_SOUTH_EAST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + src_size as i32,
                        self.curr_local_z + src_size as i32 - 1,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_EAST as u32,
                )
            {
                let clipFlag: u32 = CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 - 1 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + src_size as i32,
                            self.curr_local_z + index,
                            y,
                        ),
                        clipFlag,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }

            /* north to south  */
            x = self.curr_local_x;
            z = self.curr_local_z - 1;
            dirFlag = DirectionFlag::North;
            if self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + src_size as i32 - 1,
                        z,
                        y,
                    ),
                    CollisionFlag::BLOCK_SOUTH_EAST as u32,
                )
            {
                let clipFlag: u32 = CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 - 1 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + index,
                            z,
                            y,
                        ),
                        clipFlag,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }

            /* south to north */
            x = self.curr_local_x;
            z = self.curr_local_z + 1;
            dirFlag = DirectionFlag::South;
            if self.curr_local_z < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        x,
                        self.curr_local_z + src_size as i32,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_WEST as u32,
                )
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + src_size as i32 - 1,
                        self.curr_local_z + src_size as i32,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_EAST as u32,
                )
            {
                let clipFlag: u32 = CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 - 1 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            x + index,
                            self.curr_local_z + src_size as i32,
                            y,
                        ),
                        clipFlag,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }

            /* north-east to south-west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z - 1;
            dirFlag = DirectionFlag::NorthEast;
            if self.curr_local_x > 0
                && self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(flags, base_x, base_z, x, z, y),
                    CollisionFlag::BLOCK_SOUTH_WEST as u32,
                )
            {
                let clipFlag1: u32 = CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32;
                let clipFlag2: u32 = CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            x,
                            self.curr_local_z + index - 1,
                            y,
                        ),
                        clipFlag1,
                    ) || !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + index - 1,
                            z,
                            y,
                        ),
                        clipFlag2,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }

            /* north-west to south-east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z - 1;
            dirFlag = DirectionFlag::NorthWest;
            if self.curr_local_x < relativeSearchSize
                && self.curr_local_z > 0
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + src_size as i32,
                        z,
                        y,
                    ),
                    CollisionFlag::BLOCK_SOUTH_EAST as u32,
                )
            {
                let clipFlag1: u32 = CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32;
                let clipFlag2: u32 = CollisionFlag::BLOCK_NORTH_EAST_AND_WEST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + src_size as i32,
                            self.curr_local_z + index - 1,
                            y,
                        ),
                        clipFlag1,
                    ) || !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + index,
                            z,
                            y,
                        ),
                        clipFlag2,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }

            /* south-east to north-west */
            x = self.curr_local_x - 1;
            z = self.curr_local_z + 1;
            dirFlag = DirectionFlag::SouthEast;
            if self.curr_local_x > 0
                && self.curr_local_z < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        x,
                        self.curr_local_z + src_size as i32,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_WEST as u32,
                )
            {
                let clipFlag1: u32 = CollisionFlag::BLOCK_NORTH_AND_SOUTH_EAST as u32;
                let clipFlag2: u32 = CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            x,
                            self.curr_local_z + index,
                            y,
                        ),
                        clipFlag1,
                    ) || !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + index - 1,
                            self.curr_local_z + src_size as i32,
                            y,
                        ),
                        clipFlag2,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }

            /* south-west to north-east */
            x = self.curr_local_x + 1;
            z = self.curr_local_z + 1;
            dirFlag = DirectionFlag::SouthWest;
            if self.curr_local_x < relativeSearchSize
                && self.curr_local_z < relativeSearchSize
                && *self.directions.as_ptr().add(self.local_index(x, z)) == 0
                && collision.can_move(
                    PathFinder::collision_flag(
                        flags,
                        base_x,
                        base_z,
                        self.curr_local_x + src_size as i32,
                        self.curr_local_z + src_size as i32,
                        y,
                    ),
                    CollisionFlag::BLOCK_NORTH_EAST as u32,
                )
            {
                let clipFlag1: u32 = CollisionFlag::BLOCK_SOUTH_EAST_AND_WEST as u32;
                let clipFlag2: u32 = CollisionFlag::BLOCK_NORTH_AND_SOUTH_WEST as u32;
                let mut blocked: bool = false;
                for index in 1..src_size as i32 {
                    if !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + index,
                            self.curr_local_z + src_size as i32,
                            y,
                        ),
                        clipFlag1,
                    ) || !collision.can_move(
                        PathFinder::collision_flag(
                            flags,
                            base_x,
                            base_z,
                            self.curr_local_x + src_size as i32,
                            self.curr_local_z + index,
                            y,
                        ),
                        clipFlag2,
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if !blocked {
                    self.append_direction(x, z, dirFlag as i8, next_distance);
                }
            }
        }
        return false;
    }

    #[inline(always)]
    unsafe fn find_closest_approach_point(
        &mut self,
        local_dest_x: i32,
        local_dest_z: i32,
        width: u8,
        height: u8,
    ) -> bool {
        let mut lowest_cost: i32 = PathFinder::MAX_ALTERNATIVE_ROUTE_LOWEST_COST;
        let mut max_alternative_path: i32 = PathFinder::MAX_ALTERNATIVE_ROUTE_SEEK_RANGE;
        let alternative_route_range: i32 =
            PathFinder::MAX_ALTERNATIVE_ROUTE_DISTANCE_FROM_DESTINATION;

        for x in local_dest_x - alternative_route_range..=local_dest_x + alternative_route_range {
            for z in local_dest_z - alternative_route_range..=local_dest_z + alternative_route_range
            {
                if !(x >= 0 && x < self.search_map_size)
                    || !(z >= 0 && z < self.search_map_size)
                    || *self.distances.as_ptr().add(self.local_index(x, z))
                        >= PathFinder::MAX_ALTERNATIVE_ROUTE_SEEK_RANGE
                {
                    continue;
                }

                let mut dx: i32 = 0;
                if x < local_dest_x {
                    dx = local_dest_x - x;
                } else if x > local_dest_x + width as i32 - 1 {
                    dx = x - (width as i32 + local_dest_x - 1);
                }

                let mut dz: i32 = 0;
                if z < local_dest_z {
                    dz = local_dest_z - z;
                } else if z > local_dest_z + height as i32 - 1 {
                    dz = z - (height as i32 + local_dest_z - 1);
                }

                let cost: i32 = dx * dx + dz * dz;
                if cost < lowest_cost
                    || (cost == lowest_cost
                        && max_alternative_path
                            > *self.distances.as_ptr().add(self.local_index(x, z)))
                {
                    self.curr_local_x = x;
                    self.curr_local_z = z;
                    lowest_cost = cost;
                    max_alternative_path = *self.distances.as_ptr().add(self.local_index(x, z));
                }
            }
        }
        return lowest_cost != PathFinder::MAX_ALTERNATIVE_ROUTE_LOWEST_COST;
    }

    #[inline(always)]
    fn local_index(&self, x: i32, z: i32) -> usize {
        return (x * self.search_map_size + z) as usize;
    }

    #[inline(always)]
    unsafe fn collision_flag(
        flags: &CollisionFlagMap,
        base_x: i32,
        base_z: i32,
        local_x: i32,
        local_z: i32,
        y: i32,
    ) -> u32 {
        return flags.get(base_x + local_x, base_z + local_z, y);
    }

    #[inline(always)]
    unsafe fn append_direction(&mut self, x: i32, z: i32, direction: i8, distance: i32) {
        let index: usize = self.local_index(x, z);
        *self.directions.as_mut_ptr().add(index) = direction;
        *self.distances.as_mut_ptr().add(index) = distance;
        *self.valid_local_x.as_mut_ptr().add(self.buf_writer_index) = x;
        *self.valid_local_z.as_mut_ptr().add(self.buf_writer_index) = z;
        self.buf_writer_index = (self.buf_writer_index + 1) & (self.ring_buffer_size - 1) as usize;
    }

    #[inline(always)]
    unsafe fn reset(&mut self) {
        self.directions.fill(0);
        self.distances.fill(PathFinder::DEFAULT_DISTANCE_VALUE);
        self.buf_reader_index = 0;
        self.buf_writer_index = 0;
    }
}
