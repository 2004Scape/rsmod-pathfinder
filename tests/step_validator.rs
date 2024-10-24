use rsmod::rsmod::{
    Blocked, can_travel, CollisionStrategies, Indoors, LineOfSight, Normal, Outdoors,
};
use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;

const ARGS: [[i32; 3]; 24] = [
    [1, 0, -1],
    [1, 0, 1],
    [1, -1, 0],
    [1, 1, 0],
    [1, -1, -1],
    [1, -1, 1],
    [1, 1, -1],
    [1, 1, 1],
    [2, 0, -1],
    [2, 0, 1],
    [2, -1, 0],
    [2, 1, 0],
    [2, -1, -1],
    [2, -1, 1],
    [2, 1, -1],
    [2, 1, 1],
    [3, 0, -1],
    [3, 0, 1],
    [3, -1, 0],
    [3, 1, 0],
    [3, -1, -1],
    [3, -1, 1],
    [3, 1, -1],
    [3, 1, 1],
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

unsafe fn build_collision_map_with_flag(
    x1: i32,
    z1: i32,
    x2: i32,
    z2: i32,
    mask: CollisionFlag,
) -> CollisionFlagMap {
    let mut collision = CollisionFlagMap::new();
    for y in 0..4 {
        for z in z1.min(z2)..=z1.max(z2) {
            for x in x1.min(x2)..=x1.max(x2) {
                collision.set(x, z, y, mask as u32);
            }
        }
    }
    return collision;
}

#[test]
fn test_step_clear_path() {
    for [size, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;

        unsafe {
            let collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                let step = can_travel(
                    &collision,
                    y,
                    src_x,
                    src_z,
                    dir_x as i8,
                    dir_z as i8,
                    size as u8,
                    0,
                    &CollisionStrategies::Normal(Normal),
                );
                assert!(step);
            }
        }
    }
}

#[test]
fn test_step_loc_blocking() {
    for [size, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                let area = size * size;
                for index in 0..area {
                    let dx: i32 = dest_x + (index % size);
                    let dz: i32 = dest_z + (index / size);
                    collision.set(dx, dz, y, CollisionFlag::LOC as u32);
                }
            }
            for y in 0..4 {
                let step = can_travel(
                    &collision,
                    y,
                    src_x,
                    src_z,
                    dir_x as i8,
                    dir_z as i8,
                    size as u8,
                    0,
                    &CollisionStrategies::Normal(Normal),
                );
                assert!(!step);
            }
        }
    }
}

#[test]
fn test_step_extra_flag_blocking() {
    let flags = [
        CollisionFlag::PLAYER as u32,
        CollisionFlag::NPC as u32,
        CollisionFlag::PLAYER as u32 | CollisionFlag::NPC as u32,
    ];

    for [size, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);
            for y in 0..4 {
                let area = size * size;
                for flag in flags {
                    for index in 0..area {
                        let dx: i32 = dest_x + (index % size);
                        let dz: i32 = dest_z + (index / size);
                        collision.set(dx, dz, y, flag);
                    }
                }
            }
            for y in 0..4 {
                for flag in flags {
                    let step = can_travel(
                        &collision,
                        y,
                        src_x,
                        src_z,
                        dir_x as i8,
                        dir_z as i8,
                        size as u8,
                        flag,
                        &CollisionStrategies::Normal(Normal),
                    );
                    assert!(!step);
                }
            }
        }
    }
}

#[test]
fn test_step_blocked_flag_strategy() {
    for [_, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;

        unsafe {
            let collision =
                build_collision_map_with_flag(src_x, src_z, dest_x, dest_z, CollisionFlag::FLOOR);
            for y in 0..4 {
                let step = can_travel(
                    &collision,
                    y,
                    src_x,
                    src_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::Blocked(Blocked),
                );
                assert!(step);
            }
        }
    }
}

#[test]
fn test_step_indoors_flag_strategy() {
    for [_, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;
        let outdoors_x = dest_x + dir_x;
        let outdoors_z = dest_z + dir_z;

        let mut collision = CollisionFlagMap::new();

        unsafe {
            for y in 0..4 {
                for x in src_x.min(dest_x.min(outdoors_x))..=src_x.max(dest_x.max(outdoors_x)) {
                    for z in src_z.min(dest_z.min(outdoors_z))..=src_z.max(dest_z.max(outdoors_z)) {
                        collision.set(x, z, y, CollisionFlag::ROOF as u32);
                    }
                }
            }

            for y in 0..4 {
                collision.set(outdoors_x, outdoors_z, y, CollisionFlag::OPEN as u32);
            }

            for y in 0..4 {
                let step1 = can_travel(
                    &collision,
                    y,
                    src_x,
                    src_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::Indoors(Indoors),
                );
                assert!(step1);

                let step2 = can_travel(
                    &collision,
                    y,
                    dest_x,
                    dest_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::Indoors(Indoors),
                );
                assert!(!step2);
            }
        }
    }
}

#[test]
fn test_step_outdoors_flag_strategy() {
    for [_, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;
        let indoors_x = dest_x + dir_x;
        let indoors_z = dest_z + dir_z;

        let mut collision = CollisionFlagMap::new();

        unsafe {
            for y in 0..4 {
                for x in src_x.min(dest_x.min(indoors_x))..=src_x.max(dest_x.max(indoors_x)) {
                    for z in src_z.min(dest_z.min(indoors_z))..=src_z.max(dest_z.max(indoors_z)) {
                        collision.allocate_if_absent(x, z, y);
                    }
                }
            }

            for y in 0..4 {
                collision.set(indoors_x, indoors_z, y, CollisionFlag::ROOF as u32);
            }

            for y in 0..4 {
                let step1 = can_travel(
                    &collision,
                    y,
                    src_x,
                    src_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::Outdoors(Outdoors),
                );
                assert!(step1);

                let step2 = can_travel(
                    &collision,
                    y,
                    dest_x,
                    dest_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::Outdoors(Outdoors),
                );
                assert!(!step2);
            }
        }
    }
}

#[test]
fn test_step_line_of_sight_strategy_loc() {
    for [_, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;
        let blocked_x = dest_x + dir_x;
        let blocked_z = dest_z + dir_z;

        let mut collision = CollisionFlagMap::new();

        unsafe {
            for y in 0..4 {
                for x in src_x.min(dest_x.min(blocked_x))..=src_x.max(dest_x.max(blocked_x)) {
                    for z in src_z.min(dest_z.min(blocked_z))..=src_z.max(dest_z.max(blocked_z)) {
                        collision.allocate_if_absent(x, z, y);
                    }
                }
            }

            for y in 0..4 {
                collision.set(
                    blocked_x,
                    blocked_z,
                    y,
                    CollisionFlag::LOC_PROJ_BLOCKER as u32,
                );
            }

            for y in 0..4 {
                let step1 = can_travel(
                    &collision,
                    y,
                    src_x,
                    src_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::LineOfSight(LineOfSight),
                );
                assert!(step1);

                let step2 = can_travel(
                    &collision,
                    y,
                    dest_x,
                    dest_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::LineOfSight(LineOfSight),
                );
                assert!(!step2);
            }
        }
    }
}

#[test]
fn test_step_line_of_sight_strategy_player() {
    for [_, dir_x, dir_z] in ARGS {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = src_x + dir_x;
        let dest_z = src_z + dir_z;
        let blocked_x = dest_x + dir_x;
        let blocked_z = dest_z + dir_z;

        let mut collision = CollisionFlagMap::new();

        unsafe {
            for y in 0..4 {
                for x in src_x.min(dest_x.min(blocked_x))..=src_x.max(dest_x.max(blocked_x)) {
                    for z in src_z.min(dest_z.min(blocked_z))..=src_z.max(dest_z.max(blocked_z)) {
                        collision.allocate_if_absent(x, z, y);
                    }
                }
            }

            for y in 0..4 {
                collision.set(blocked_x, blocked_z, y, CollisionFlag::PLAYER as u32);
            }

            for y in 0..4 {
                let step1 = can_travel(
                    &collision,
                    y,
                    src_x,
                    src_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::LineOfSight(LineOfSight),
                );
                assert!(step1);

                let step2 = can_travel(
                    &collision,
                    y,
                    dest_x,
                    dest_z,
                    dir_x as i8,
                    dir_z as i8,
                    1,
                    0,
                    &CollisionStrategies::LineOfSight(LineOfSight),
                );
                assert!(step2);
            }
        }
    }
}
