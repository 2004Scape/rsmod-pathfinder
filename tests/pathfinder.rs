use rsmod::rsmod::{CollisionStrategies, Normal, PathFinder};
use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;

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
fn test_pf_coord_matches_level_input() {
    let src_x = 3200;
    let src_z = 3200;
    let dest_x = 3201;
    let dest_z = 3200;

    let mut pf = PathFinder::new();

    unsafe {
        let collision = build_collision_map(src_x, src_z, dest_x, dest_z);

        let mut route = pf.find_path(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );
        assert!(route.len() > 0);
        for index in 0..route.len() {
            assert_eq!(0, (route[index] >> 28) & 0x3);
        }

        route = pf.find_path(
            &collision,
            1,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );
        assert!(route.len() > 0);
        for index in 0..route.len() {
            assert_eq!(1, (route[index] >> 28) & 0x3);
        }

        route = pf.find_path(
            &collision,
            2,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );
        assert!(route.len() > 0);
        for index in 0..route.len() {
            assert_eq!(2, (route[index] >> 28) & 0x3);
        }

        route = pf.find_path(
            &collision,
            3,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );
        assert!(route.len() > 0);
        for index in 0..route.len() {
            assert_eq!(3, (route[index] >> 28) & 0x3);
        }
    }
}

#[test]
fn test_pf_surrounded_by_locs_allow_move_near() {
    let src_x = 3200;
    let src_z = 3200;
    let dest_x = 3205;
    let dest_z = 3200;

    let mut pf = PathFinder::new();

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);

        flag(
            &mut collision,
            src_x - 1,
            src_z - 1,
            3,
            3,
            CollisionFlag::LOC,
        );
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32); // Remove collision flag from source tile

        let route = pf.find_path(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );
        // expect(route.alternative).toBeTruthy();
        assert_eq!(route.len(), 0);
    }
}

#[test]
fn test_pf_surrounded_by_locs_no_move_near() {
    let src_x = 3200;
    let src_z = 3200;
    let dest_x = 3205;
    let dest_z = 3200;

    let mut pf = PathFinder::new();

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);

        flag(
            &mut collision,
            src_x - 1,
            src_z - 1,
            3,
            3,
            CollisionFlag::LOC,
        );
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32); // Remove collision flag from source tile

        let route = pf.find_path(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            false,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );
        // expect(route.failed).toBeTruthy();
        assert_eq!(route.len(), 0);
    }
}

#[test]
fn test_pf_single_exit_point() {
    let src_x = 3200;
    let src_z = 3200;
    let dest_x = 3200;
    let dest_z = 3205;

    let mut pf = PathFinder::new();

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);

        flag(
            &mut collision,
            src_x - 1,
            src_z - 1,
            3,
            3,
            CollisionFlag::LOC,
        );
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32); // Remove collision flag from source tile
        collision.set(src_x, src_z - 1, 0, CollisionFlag::OPEN as u32); // Remove collision flag from tile south of source tile.

        let route = pf.find_path(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );
        // expect(route.success).toBeTruthy();
        assert_eq!(route.len(), 4);

        assert_eq!(3200, (route[0] >> 14) & 0x3fff);
        assert_eq!(3198, route[0] & 0x3fff);

        assert_eq!(3198, (route[1] >> 14) & 0x3fff);
        assert_eq!(3198, route[1] & 0x3fff);

        assert_eq!(3198, (route[2] >> 14) & 0x3fff);
        assert_eq!(3203, route[2] & 0x3fff);

        assert_eq!(dest_x as u32, (route[3] >> 14) & 0x3fff);
        assert_eq!(dest_z as u32, route[3] & 0x3fff);
    }
}

#[test]
fn test_pf_standing_on_closest_approach_point() {
    let src_x = 3200;
    let src_z = 3200;
    let dest_x = 3200;
    let dest_z = 3201;

    let mut pf = PathFinder::new();

    unsafe {
        let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);

        collision.add(
            dest_x,
            dest_z,
            0,
            CollisionFlag::WALL_NORTH as u32
                | CollisionFlag::WALL_SOUTH as u32
                | CollisionFlag::WALL_WEST as u32
                | CollisionFlag::WALL_EAST as u32,
        );

        let route = pf.find_path(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            1,
            1,
            1,
            0,
            -1,
            true,
            0,
            25,
            &CollisionStrategies::Normal(Normal),
        );

        // expect(route.success).toBeTruthy();
        // expect(route.alternative).toBeTruthy();
        assert_eq!(route.len(), 0);
    }
}

#[test]
fn test_pf_find_path_any_size() {
    for size in 1..=3 {
        let src_x = 3200;
        let src_z = 3200;
        let dest_x = 3200;
        let dest_z = 3210 + size;

        let mut pf = PathFinder::new();

        unsafe {
            let mut collision = build_collision_map(src_x, src_z, dest_x, dest_z);

            collision.set(src_x, src_z + 1, 0, CollisionFlag::LOC as u32);

            let route = pf.find_path(
                &collision,
                0,
                src_x,
                src_z,
                dest_x,
                dest_z,
                size as u8,
                1,
                1,
                0,
                -1,
                true,
                0,
                25,
                &CollisionStrategies::Normal(Normal),
            );

            assert!(route.len() > 0);
            // expect(route.alternative).toBeFalsy();
        }
    }
}
