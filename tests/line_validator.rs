use rsmod::rsmod::{has_line_of_sight, has_line_of_walk};
use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;

const ARGS: [[i32; 2]; 4] = [[0, -1], [0, 1], [-1, 0], [1, 0]];

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

#[test]
fn test_has_low_partial_line_of_walk() {
    let src_x = 3200;
    let src_z = 3200;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(3200, 3205, 0, CollisionFlag::LOC as u32);

        let line = has_line_of_walk(&collision, 0, src_x, src_z, 3200, 3207, 1, 1, 0, 0, 0);
        assert!(!line);
    }
}

#[test]
fn test_has_low_clear_line_of_walk() {
    for [dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x * 3;
        let dest_z = src_z + dir_z * 3;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                collision.allocate_if_absent(src_x + dir_x, src_z + dir_z, y);

                let line =
                    has_line_of_walk(&collision, y, src_x, src_z, dest_x, dest_z, 1, 1, 0, 0, 0);
                assert!(line);
            }
        }
    }
}

#[test]
fn test_has_low_loc_blocking() {
    for [dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x * 3;
        let dest_z = src_z + dir_z * 3;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                collision.set(src_x + dir_x, src_z + dir_z, y, CollisionFlag::LOC as u32);

                let line =
                    has_line_of_walk(&collision, y, src_x, src_z, dest_x, dest_z, 1, 1, 0, 0, 0);
                assert!(!line);
            }
        }
    }
}

#[test]
fn test_has_low_extra_flag_blocking() {
    let flags = [
        CollisionFlag::PLAYER as u32,
        CollisionFlag::NPC as u32,
        CollisionFlag::PLAYER as u32 | CollisionFlag::NPC as u32,
    ];

    for [dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x * 3;
        let dest_z = src_z + dir_z * 3;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                for flag in flags {
                    collision.set(src_x + dir_x, src_z + dir_z, y, flag);

                    let line = has_line_of_walk(
                        &collision, y, src_x, src_z, dest_x, dest_z, 1, 1, 0, 0, flag,
                    );
                    assert!(!line);
                }
            }
        }
    }
}

#[test]
fn test_has_los_with_extra_flag_on_target_coords() {
    let src_x = 3200;
    let src_z = 3200;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.add(src_x, src_z, 0, CollisionFlag::PLAYER as u32);

        let line = has_line_of_sight(
            &collision,
            0,
            3200,
            3202,
            3200,
            3200,
            1,
            1,
            1,
            1,
            CollisionFlag::PLAYER as u32,
        );
        assert!(line);
    }
}

#[test]
fn test_has_los_with_extra_flag_past_target_coords() {
    let src_x = 3200;
    let src_z = 3200;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.add(src_x, src_z, 0, CollisionFlag::PLAYER as u32);

        let line = has_line_of_sight(
            &collision,
            0,
            3200,
            3202,
            3200,
            3199,
            1,
            1,
            1,
            1,
            CollisionFlag::PLAYER as u32,
        );
        assert!(!line);
    }
}

#[test]
fn test_has_los_on_top_of_loc_fails_line_of_sight() {
    let src_x = 3200;
    let src_z = 3200;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.add(src_x, src_z, 0, CollisionFlag::LOC as u32);

        let line = has_line_of_sight(&collision, 0, src_x, src_z, 3200, 3201, 1, 1, 0, 0, 0);
        assert!(!line);
    }
}

#[test]
fn test_has_los_on_top_of_extra_flag_fails_line_of_sight() {
    let src_x = 3200;
    let src_z = 3200;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.add(src_x, src_z, 0, CollisionFlag::PLAYER as u32);

        let line = has_line_of_sight(
            &collision,
            0,
            src_x,
            src_z,
            3200,
            3201,
            1,
            1,
            0,
            0,
            CollisionFlag::PLAYER as u32,
        );
        assert!(!line);
    }
}

// #[test]
// fn test_has_los_same_tile_has_line_of_sight() {
//     let src_x = 3200;
//     let src_z = 3200;
//
//     let mut collision = CollisionFlagMap::new();
//
//     unsafe {
//         collision.allocate_if_absent(src_x, src_z, 0);
//
//         let line = has_line_of_sight(&collision, 0, src_x, src_z, src_x, src_z, 1, 1, 0, 0, 0);
//         assert!(line.len() > 0);
//     }
// }

#[test]
fn test_has_los_partial_line_of_sight() {
    let src_x = 3200;
    let src_z = 3200;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(3200, 3205, 0, CollisionFlag::LOC_PROJ_BLOCKER as u32);

        let line = has_line_of_sight(&collision, 0, src_x, src_z, 3200, 3207, 1, 1, 0, 0, 0);
        assert!(!line);
    }
}

#[test]
fn test_has_los_valid_line_of_sight() {
    let flags = [
        CollisionFlag::OPEN as u32,
        CollisionFlag::FLOOR as u32,
        CollisionFlag::FLOOR_DECORATION as u32,
        CollisionFlag::FLOOR as u32 | CollisionFlag::FLOOR_DECORATION as u32,
    ];

    for [dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x * 3;
        let dest_z = src_z + dir_z * 3;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                for flag in flags {
                    collision.set(src_x + dir_x, src_z + dir_z, y, flag);
                }
                let line =
                    has_line_of_sight(&collision, y, src_x, src_z, dest_x, dest_z, 1, 1, 0, 0, 0);
                assert!(line);
            }
        }
    }
}

#[test]
fn test_has_los_loc_blocking() {
    for [dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x * 3;
        let dest_z = src_z + dir_z * 3;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                collision.set(
                    src_x + dir_x,
                    src_z + dir_z,
                    y,
                    CollisionFlag::LOC_PROJ_BLOCKER as u32,
                );
                let line =
                    has_line_of_sight(&collision, y, src_x, src_z, dest_x, dest_z, 1, 1, 0, 0, 0);
                assert!(!line);
            }
        }
    }
}

#[test]
fn test_has_los_extra_flag_blocking() {
    let flags = [
        CollisionFlag::PLAYER as u32,
        CollisionFlag::NPC as u32,
        CollisionFlag::PLAYER as u32 | CollisionFlag::NPC as u32,
    ];

    for [dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x * 3;
        let dest_z = src_z + dir_z * 3;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                for flag in flags {
                    collision.set(src_x + dir_x, src_z + dir_z, y, flag);

                    let line = has_line_of_sight(
                        &collision, y, src_x, src_z, dest_x, dest_z, 1, 1, 0, 0, flag,
                    );
                    assert!(!line);
                }
            }
        }
    }
}
