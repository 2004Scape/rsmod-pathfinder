use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;
use rsmod::rsmod::reach_strategy::ReachStrategy;

const BLOCK_ACCESS_FLAG_TEST_ARGS: [[i32; 3]; 4] = [
    [0, 1, 1],  // north
    [1, 0, 2],  // east
    [0, -1, 4], // south
    [-1, 0, 8], // west
];

const DIMENSIONS_TEST_ARGS: [[i32; 2]; 9] = [
    [1, 1],
    [1, 2],
    [1, 3],
    [2, 1],
    [2, 2],
    [2, 3],
    [3, 1],
    [3, 2],
    [3, 3],
];

const WALL_STRAIGHT_STRATEGY_TEST_ARGS: [[i32; 4]; 8] = [
    [0, 0, 1, CollisionFlag::WALL_SOUTH as i32],
    [0, 0, -1, CollisionFlag::WALL_NORTH as i32],
    [1, -1, 0, CollisionFlag::WALL_EAST as i32],
    [1, 1, 0, CollisionFlag::WALL_WEST as i32],
    [2, 0, 1, CollisionFlag::WALL_SOUTH as i32],
    [2, 0, -1, CollisionFlag::WALL_NORTH as i32],
    [3, -1, 0, CollisionFlag::WALL_EAST as i32],
    [3, 1, 0, CollisionFlag::WALL_WEST as i32],
];

const WALL_L_STRATEGY_TEST_ARGS: [[i32; 4]; 8] = [
    [0, 1, 0, CollisionFlag::WALL_WEST as i32],
    [0, 0, -1, CollisionFlag::WALL_NORTH as i32],
    [1, -1, 0, CollisionFlag::WALL_EAST as i32],
    [1, 0, -1, CollisionFlag::BLOCK_NORTH as i32],
    [2, -1, 0, CollisionFlag::BLOCK_EAST as i32],
    [2, 0, 1, CollisionFlag::BLOCK_NORTH as i32],
    [3, 0, 1, CollisionFlag::BLOCK_SOUTH as i32],
    [3, 1, 0, CollisionFlag::BLOCK_WEST as i32],
];

const WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS: [[i32; 4]; 8] = [
    [0, 1, 0, CollisionFlag::WALL_WEST as i32],
    [0, 0, -1, CollisionFlag::WALL_NORTH as i32],
    [1, -1, 0, CollisionFlag::WALL_EAST as i32],
    [1, 0, -1, CollisionFlag::WALL_NORTH as i32],
    [2, -1, 0, CollisionFlag::WALL_EAST as i32],
    [2, 0, 1, CollisionFlag::WALL_SOUTH as i32],
    [3, 1, 0, CollisionFlag::WALL_WEST as i32],
    [3, 0, 1, CollisionFlag::WALL_SOUTH as i32],
];

unsafe fn build_collision_map(x1: i32, z1: i32, x2: i32, z2: i32) -> CollisionFlagMap {
    let mut collision = CollisionFlagMap::new();
    for y in 0..4 {
        for z in z1.min(z2)..=z1.max(z2) {
            for x in x1.min(x2)..=x1.max(x2) {
                collision.allocate_if_absent(x, z, y);
            }
        }
    }
    return collision;
}

unsafe fn flag(
    flags: &mut CollisionFlagMap,
    base_x: i32,
    base_z: i32,
    width: i32,
    height: i32,
    mask: CollisionFlag,
) {
    for y in 0..4 {
        for z in 0..height {
            for x in 0..width {
                flags.set(base_x + x, base_z + z, y, mask as u32);
            }
        }
    }
}

#[test]
fn test_strategy_wall_decor_shape_6() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                6,
                0,
            );
            assert!(!reached);

            collision.set(obj_x + dir_x, obj_z + dir_z, 0, CollisionFlag::OPEN as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                6,
                0,
            );
            assert!(reached);
        }
    }
}

#[test]
fn test_strategy_wall_decor_shape_7() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                ReachStrategy::altered_rotation(rotation as u8, 7),
                7,
                0,
            );
            assert!(!reached);

            collision.set(obj_x + dir_x, obj_z + dir_z, 0, CollisionFlag::OPEN as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                ReachStrategy::altered_rotation(rotation as u8, 7),
                7,
                0,
            );
            assert!(reached);
        }
    }
}

#[test]
fn test_strategy_wall_decor_shape_8() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                8,
                0,
            );
            assert!(!reached);

            collision.set(obj_x + dir_x, obj_z + dir_z, 0, CollisionFlag::OPEN as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                8,
                0,
            );
            assert!(reached);
        }
    }
}

#[test]
fn test_strategy_wall_no_flags_shape_0() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALL_STRAIGHT_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                obj_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                0,
                0,
            );
            assert!(!reached);

            let reached = ReachStrategy::reached(
                &collision,
                0,
                obj_x,
                obj_z,
                obj_x + dir_x,
                obj_z + dir_z,
                1,
                1,
                1,
                rotation as u8,
                0,
                0,
            );
            assert!(reached);

            collision.remove(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
        }
    }
}

#[test]
fn test_strategy_wall_no_flags_shape_2() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALL_L_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                obj_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                2,
                0,
            );
            assert!(!reached);

            let reached = ReachStrategy::reached(
                &collision,
                0,
                obj_x,
                obj_z,
                obj_x + dir_x,
                obj_z + dir_z,
                1,
                1,
                1,
                rotation as u8,
                2,
                0,
            );
            assert!(reached);

            collision.remove(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
        }
    }
}

#[test]
fn test_strategy_wall_no_flags_shape_9() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALL_STRAIGHT_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                obj_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                9,
                0,
            );
            assert!(!reached);

            let reached = ReachStrategy::reached(
                &collision,
                0,
                obj_x,
                obj_z,
                obj_x + dir_x,
                obj_z + dir_z,
                1,
                1,
                1,
                rotation as u8,
                9,
                0,
            );
            assert!(reached);

            collision.remove(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
        }
    }
}

#[test]
fn test_strategy_wall_with_flags_shape_0() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALL_STRAIGHT_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                0,
                0,
            );
            assert!(!reached);

            collision.set(obj_x + dir_x, obj_z + dir_z, 0, CollisionFlag::OPEN as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                0,
                0,
            );
            assert!(reached);

            collision.remove(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
        }
    }
}

#[test]
fn test_strategy_wall_with_flags_shape_2() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALL_L_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                2,
                0,
            );
            assert!(!reached);

            collision.set(obj_x + dir_x, obj_z + dir_z, 0, CollisionFlag::OPEN as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                2,
                0,
            );
            assert!(reached);

            collision.remove(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
        }
    }
}

#[test]
fn test_strategy_wall_with_flags_shape_9() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3200;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        for [rotation, dir_x, dir_z, flag] in WALL_STRAIGHT_STRATEGY_TEST_ARGS {
            collision.set(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                9,
                0,
            );
            assert!(!reached);

            collision.set(obj_x + dir_x, obj_z + dir_z, 0, CollisionFlag::OPEN as u32);
            let reached = ReachStrategy::reached(
                &collision,
                0,
                src_x + dir_x,
                obj_z + dir_z,
                obj_x,
                obj_z,
                1,
                1,
                1,
                rotation as u8,
                9,
                0,
            );
            assert!(reached);

            collision.remove(obj_x + dir_x, obj_z + dir_z, 0, flag as u32);
        }
    }
}

#[test]
fn test_strategy_divided_by_loc() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3201;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        // test blocked north
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH as u32);
        assert!(!ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));

        // test free east
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_EAST as u32);
        assert!(ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));

        // test free south
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH as u32);
        assert!(ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));

        // test free west
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_WEST as u32);
        assert!(ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));

        // test free northwest
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH_WEST as u32);
        assert!(ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));

        // test free northeast
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH_EAST as u32);
        assert!(ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));

        // test free southeast
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH_EAST as u32);
        assert!(ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));

        // test free southwest
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH_WEST as u32);
        assert!(ReachStrategy::reached(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 10, 0
        ));
    }
}

#[test]
fn test_strategy_divided_by_wall() {
    let src_x = 3200;
    let src_z = 3200;
    let obj_x = 3200;
    let obj_z = 3201;

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, obj_x, obj_z);

        // test blocked north
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH as u32);
        assert!(!ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));

        // test free east
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_EAST as u32);
        assert!(ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));

        // test free south
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH as u32);
        assert!(ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));

        // test free west
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_WEST as u32);
        assert!(ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));

        // test free northwest
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH_WEST as u32);
        assert!(ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));

        // test free northeast
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH_EAST as u32);
        assert!(ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));

        // test free southeast
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH_EAST as u32);
        assert!(ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));

        // test free southwest
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH_WEST as u32);
        assert!(ReachStrategy::reach_rectangle(
            &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, 0
        ));
    }
}

#[test]
fn test_strategy_block_access_flag() {
    let obj_x = 3205;
    let obj_z = 3205;

    let cardinal = [[0, -1], [0, 1], [-1, 0], [1, 0]];

    for [off_x, off_z, flag] in BLOCK_ACCESS_FLAG_TEST_ARGS {
        unsafe {
            let mut collision = build_collision_map(obj_x, obj_z, obj_x, obj_z);
            crate::flag(&mut collision, obj_x, obj_z, 1, 1, CollisionFlag::LOC);

            for [dx, dz] in cardinal {
                let src_x = obj_x + dx;
                let src_z = obj_z + dz;
                collision.allocate_if_absent(src_x, src_z, 0);

                let reached = ReachStrategy::reach_rectangle(
                    &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, flag as u8,
                );

                if dx == off_x && dz == off_z {
                    assert!(!reached);
                } else {
                    assert!(reached);
                }
            }
        }
    }
}

#[test]
fn test_strategy_block_access_flag_exclusive() {
    let obj_x = 3205;
    let obj_z = 3205;

    let cardinal = [[0, -1], [0, 1], [-1, 0], [1, 0]];

    for [off_x, off_z, flag] in BLOCK_ACCESS_FLAG_TEST_ARGS {
        unsafe {
            let mut collision = build_collision_map(obj_x, obj_z, obj_x, obj_z);
            crate::flag(&mut collision, obj_x, obj_z, 1, 1, CollisionFlag::LOC);

            for [dx, dz] in cardinal {
                let src_x = obj_x + dx;
                let src_z = obj_z + dz;
                collision.allocate_if_absent(src_x, src_z, 0);

                let reached = ReachStrategy::reach_exclusive_rectangle(
                    &collision, 0, src_x, src_z, obj_x, obj_z, 1, 1, 1, 0, flag as u8,
                );

                if dx == off_x && dz == off_z {
                    assert!(!reached);
                } else {
                    assert!(reached);
                }
            }
        }
    }
}

#[test]
fn test_strategy_reach_with_dimensions() {
    for [width, height] in DIMENSIONS_TEST_ARGS {
        let obj_x = 3202 + width;
        let obj_z = 3205;

        unsafe {
            let mut collision =
                build_collision_map(obj_x - 1, obj_z - 1, obj_x + width, obj_z + height);
            flag(
                &mut collision,
                obj_x,
                obj_z,
                width,
                height,
                CollisionFlag::LOC,
            );

            let reached1 = ReachStrategy::reach_rectangle(
                &collision,
                0,
                obj_x - 2,
                obj_z - 1,
                obj_x,
                obj_z,
                1,
                width as u8,
                height as u8,
                0,
                0,
            );
            assert!(!reached1);

            let reached2 = ReachStrategy::reach_rectangle(
                &collision,
                0,
                obj_x - 1,
                obj_z - 2,
                obj_x,
                obj_z,
                1,
                width as u8,
                height as u8,
                0,
                0,
            );
            assert!(!reached2);

            for x in -1..width + 1 {
                for z in -1..height + 1 {
                    let reached3 = ReachStrategy::reach_rectangle(
                        &collision,
                        0,
                        obj_x + x,
                        obj_z + z,
                        obj_x,
                        obj_z,
                        1,
                        width as u8,
                        height as u8,
                        0,
                        0,
                    );
                    let diagonal = (z == -1 && x == -1)
                        || (z == height && x == width)
                        || (z == -1 && x == width)
                        || (z == height && x == -1);
                    if diagonal {
                        assert!(!reached3);
                        continue;
                    }
                    assert!(reached3);
                }
            }
        }
    }
}

#[test]
fn test_strategy_reach_with_dimensions_exclusive() {
    for [width, height] in DIMENSIONS_TEST_ARGS {
        let obj_x = 3202 + width;
        let obj_z = 3205;

        unsafe {
            let mut collision =
                build_collision_map(obj_x - 1, obj_z - 1, obj_x + width, obj_z + height);

            flag(
                &mut collision,
                obj_x,
                obj_z,
                width,
                height,
                CollisionFlag::LOC,
            );

            let reached1 = ReachStrategy::reach_exclusive_rectangle(
                &collision,
                0,
                obj_x - 2,
                obj_z - 1,
                obj_x,
                obj_z,
                1,
                width as u8,
                height as u8,
                0,
                0,
            );
            assert!(!reached1);

            let reached2 = ReachStrategy::reach_exclusive_rectangle(
                &collision,
                0,
                obj_x - 1,
                obj_z - 2,
                obj_x,
                obj_z,
                1,
                width as u8,
                height as u8,
                0,
                0,
            );
            assert!(!reached2);

            for x in -1..width + 1 {
                for z in -1..height + 1 {
                    let reached3 = ReachStrategy::reach_exclusive_rectangle(
                        &collision,
                        0,
                        obj_x + x,
                        obj_z + z,
                        obj_x,
                        obj_z,
                        1,
                        width as u8,
                        height as u8,
                        0,
                        0,
                    );
                    let diagonal = (z == -1 && x == -1)
                        || (z == height && x == width)
                        || (z == -1 && x == width)
                        || (z == height && x == -1);
                    if diagonal {
                        assert!(!reached3);
                        continue;
                    }
                    let in_loc_area = 0 <= x && width > x && 0 <= z && height > z;
                    if in_loc_area {
                        assert!(!reached3);
                        continue;
                    }
                    assert!(reached3);
                }
            }
        }
    }
}
