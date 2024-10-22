use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;

#[test]
fn test_get_collision_flag_null_zone() {
    let collision: CollisionFlagMap = CollisionFlagMap::new();

    unsafe { assert_eq!(false, collision.is_zone_allocated(3200, 3200, 0)) }

    for x in 3200..3208 {
        for z in 3200..3208 {
            unsafe {
                assert_eq!(CollisionFlag::NULL as u32, collision.get(x, z, 0));
            }
        }
    }
}

#[test]
fn test_get_collision_flag_allocated_zone() {
    let mut collision: CollisionFlagMap = CollisionFlagMap::new();

    unsafe {
        assert_eq!(false, collision.is_zone_allocated(3200, 3200, 0));

        collision.allocate_if_absent(3200, 3200, 0);
        assert_eq!(true, collision.is_zone_allocated(3200, 3200, 0));
    }

    for x in 3200..3208 {
        for z in 3200..3208 {
            unsafe {
                assert_eq!(CollisionFlag::OPEN as u32, collision.get(x, z, 0));
            }
        }
    }
}

#[test]
fn test_set_collision_flag() {
    let mut collision: CollisionFlagMap = CollisionFlagMap::new();

    unsafe {
        assert_eq!(CollisionFlag::NULL as u32, collision.get(3200, 3200, 0));
        assert_eq!(CollisionFlag::NULL as u32, collision.get(3200, 3200, 1));
        assert_eq!(CollisionFlag::NULL as u32, collision.get(3200, 3200, 2));

        collision.set(3200, 3200, 0, CollisionFlag::LOC as u32);
        collision.set(3200, 3200, 1, CollisionFlag::FLOOR as u32);
        collision.set(3200, 3200, 2, CollisionFlag::OPEN as u32);

        assert_eq!(CollisionFlag::LOC as u32, collision.get(3200, 3200, 0));
        assert_eq!(CollisionFlag::FLOOR as u32, collision.get(3200, 3200, 1));
        assert_eq!(CollisionFlag::OPEN as u32, collision.get(3200, 3200, 2));
    }
}

#[test]
fn test_add_collision_flag() {
    let mut collision: CollisionFlagMap = CollisionFlagMap::new();

    unsafe {
        collision.allocate_if_absent(3200, 3200, 0);
        assert_eq!(CollisionFlag::OPEN as u32, collision.get(3200, 3200, 0));

        collision.add(3200, 3200, 0, CollisionFlag::WALL_EAST_PROJ_BLOCKER as u32);
        assert_eq!(
            CollisionFlag::WALL_EAST_PROJ_BLOCKER as u32,
            collision.get(3200, 3200, 0)
        );

        collision.add(3200, 3200, 0, CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32);
        assert_eq!(
            true,
            collision.is_flagged(3200, 3200, 0, CollisionFlag::WALL_EAST_PROJ_BLOCKER as u32)
        );
        assert_eq!(
            true,
            collision.is_flagged(3200, 3200, 0, CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32)
        );
    }

    for x in 3201..3208 {
        for z in 3201..3208 {
            unsafe {
                assert_eq!(CollisionFlag::OPEN as u32, collision.get(x, z, 0));
            }
        }
    }
}

#[test]
fn test_remove_collision_flag() {
    let mut collision: CollisionFlagMap = CollisionFlagMap::new();

    unsafe {
        collision.allocate_if_absent(3200, 3200, 0);
        assert_eq!(CollisionFlag::OPEN as u32, collision.get(3200, 3200, 0));

        collision.add(3200, 3200, 0, CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32);
        assert_eq!(
            CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32,
            collision.get(3200, 3200, 0)
        );

        collision.remove(3200, 3200, 0, CollisionFlag::WALL_NORTH_PROJ_BLOCKER as u32);
        assert_eq!(CollisionFlag::OPEN as u32, collision.get(3200, 3200, 0));
    }
}

#[test]
fn test_deallocate_if_present() {
    let mut collision: CollisionFlagMap = CollisionFlagMap::new();

    unsafe {
        collision.allocate_if_absent(3200, 3200, 0);
        assert_eq!(CollisionFlag::OPEN as u32, collision.get(3200, 3200, 0));
    }

    unsafe {
        collision.deallocate_if_present(3200, 3200, 0);
        assert_eq!(CollisionFlag::NULL as u32, collision.get(3200, 3200, 0));
    }
}

#[test]
fn test_zone_index() {
    assert_eq!(CollisionFlagMap::zone_index(0, 0, 0), 0);
}
