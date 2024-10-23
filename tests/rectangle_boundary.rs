use rsmod::rsmod::block_flag::BlockAccessFlag;
use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;
use rsmod::rsmod::rectangle_boundary::{collides, reach_rectangle_1, reach_rectangle_n};

#[test]
fn rec_bound_n_no_flags_should_return_true_when_src_is_west_of_dest() {
    let src_x = 0;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_n_no_flags_should_return_true_when_src_is_east_of_dest() {
    let src_x = 4;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_n_no_flags_should_return_true_when_src_is_south_of_dest() {
    let src_x = 2;
    let src_z = 4;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_n_no_flags_should_return_true_when_src_is_north_of_dest() {
    let src_x = 2;
    let src_z = 0;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_n_block_flags_should_return_false_when_wall_is_east_of_src() {
    let src_x = 0;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_EAST as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_WEST as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_n_block_flags_should_return_false_when_wall_is_west_of_src() {
    let src_x = 4;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_WEST as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_EAST as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_n_block_flags_should_return_false_when_wall_is_south_of_src() {
    let src_x = 2;
    let src_z = 4;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_NORTH as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_n_block_flags_should_return_false_when_wall_is_north_of_src() {
    let src_x = 2;
    let src_z = 0;
    let dest_x = 2;
    let dest_z = 2;
    let src_width = 2;
    let src_height = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH as u32);

        let collides = collides(
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
        );
        assert!(!collides);

        let reached = reach_rectangle_n(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            src_width,
            src_height,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_SOUTH as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_1_no_flags_should_return_true_when_src_is_west_of_dest() {
    let src_x = 1;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);
        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_1_no_flags_should_return_true_when_src_is_east_of_dest() {
    let src_x = 4;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);
        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_1_no_flags_should_return_true_when_src_is_south_of_dest() {
    let src_x = 2;
    let src_z = 1;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);
        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_1_no_flags_should_return_true_when_src_is_north_of_dest() {
    let src_x = 2;
    let src_z = 4;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);
        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_false_when_wall_is_east_of_src() {
    let src_x = 1;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_EAST as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_WEST as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_false_when_wall_is_west_of_src() {
    let src_x = 4;
    let src_z = 2;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_WEST as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_EAST as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_false_when_wall_is_south_of_src() {
    let src_x = 2;
    let src_z = 1;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_NORTH as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_SOUTH as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_false_when_wall_is_north_of_src() {
    let src_x = 2;
    let src_z = 4;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_NORTH as u8,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_false_when_src_not_adjacent_to_dest() {
    let src_x = 5;
    let src_z = 5;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            0,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_false_when_src_is_within_dest_rect() {
    let src_x = 3;
    let src_z = 3;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            0,
        );
        assert!(!reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_true_when_src_is_at_boundary_and_no_wall_blocking() {
    let src_x = 3;
    let src_z = 4;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::OPEN as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            0,
        );
        assert!(reached);
    }
}

#[test]
fn rec_bound_1_block_flags_should_return_false_when_src_is_at_boundary_and_is_wall_blocking() {
    let src_x = 3;
    let src_z = 4;
    let dest_x = 2;
    let dest_z = 2;
    let dest_width = 2;
    let dest_height = 2;

    let mut collision = CollisionFlagMap::new();

    unsafe {
        collision.set(src_x, src_z, 0, CollisionFlag::WALL_SOUTH as u32);

        let reached = reach_rectangle_1(
            &collision,
            0,
            src_x,
            src_z,
            dest_x,
            dest_z,
            dest_width,
            dest_height,
            BlockAccessFlag::BLOCK_NORTH as u8,
        );
        assert!(!reached);
    }
}
