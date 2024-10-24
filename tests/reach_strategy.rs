use rsmod::rsmod::block_flag::BlockAccessFlag;
use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;
use rsmod::rsmod::reach_strategy::ReachStrategy;

const ARGS: [[i32; 4]; 9] = [
    [3203, 3203, 1, 1],
    [3203, 3203, 1, 2],
    [3203, 3203, 1, 3],
    [3203, 3203, 2, 1],
    [3203, 3203, 2, 2],
    [3203, 3203, 2, 3],
    [3203, 3203, 3, 1],
    [3203, 3203, 3, 2],
    [3203, 3203, 3, 3],
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

/**
 * Test that object rotations are taken into account within [ReachStrategy.reached]
 * and do not rely on external modifications. For example, given the parameters of
 * an object in coordinates (3203, 3203) with a dimension of 3 x 1 (width x height),
 * the following test should pass:
 *
 * Object rotation of [0] or [2]. (normal)
 * ```
 * --------
 * --------
 * --------
 * ---ooo--
 * --o   o-
 * ---ooo--
 * --------
 * --------
 * ```
 * Where:
 * - Area starts from bottom-left and makes its way to top-right. (3200,3200 - 3207,3207)
 * - ' ' (whitespace) are the tiles occupied by the rotated object.
 * - 'o' are the tiles that successfully pass [ReachStrategy.reached].
 * - '-' represents every other tile in the area. (in this case a zone, or 8x8 tile area)
 */
#[test]
fn test_reach_rotated_loc_normal() {
    for [obj_x, obj_z, width, height] in ARGS {
        let min_x = obj_x - 16;
        let min_z = obj_z - 16;
        let max_x = obj_x + 16;
        let max_z = obj_z + 16;

        unsafe {
            let mut collision = build_collision_map(min_x, min_z, max_x, max_z);
            flag(
                &mut collision,
                obj_x,
                obj_z,
                width,
                height,
                CollisionFlag::LOC,
            );

            let reached = |src_x: i32, src_z: i32, rot: u8, block_access_flags: u8| -> bool {
                ReachStrategy::reached(
                    &collision,
                    0,
                    src_x,
                    src_z,
                    obj_x,
                    obj_z,
                    width as u8,
                    height as u8,
                    1,
                    rot,
                    -2, // Use rectangular exclusive strategy
                    block_access_flags,
                )
            };

            for x in 0..width {
                // Test coming from south tiles.
                assert!(reached(obj_x + x, obj_z - 1, 0, 0));
                assert!(reached(obj_x + x, obj_z - 1, 2, 0));
                // Test coming from north tiles.
                assert!(reached(obj_x + x, obj_z + height, 0, 0));
                assert!(reached(obj_x + x, obj_z + height, 2, 0));
                // Test coming from south tiles with access blocked.
                assert!(!reached(
                    obj_x + x,
                    obj_z - 1,
                    0,
                    BlockAccessFlag::BLOCK_SOUTH as u8
                ));
                assert!(!reached(
                    obj_x + x,
                    obj_z - 1,
                    2,
                    BlockAccessFlag::BLOCK_NORTH as u8
                ));
                // Test coming from north tiles with access blocked.
                assert!(!reached(
                    obj_x + x,
                    obj_z + height,
                    0,
                    BlockAccessFlag::BLOCK_NORTH as u8
                ));
                assert!(!reached(
                    obj_x + x,
                    obj_z + height,
                    2,
                    BlockAccessFlag::BLOCK_SOUTH as u8
                ));
            }

            for z in 0..height {
                // Test coming from west tiles.
                assert!(reached(obj_x - 1, obj_z + z, 0, 0));
                assert!(reached(obj_x - 1, obj_z + z, 2, 0));
                // Test coming from east tiles.
                assert!(reached(obj_x + width, obj_z + z, 0, 0));
                assert!(reached(obj_x + width, obj_z + z, 2, 0));
                // Test coming from west tiles with access blocked.
                assert!(!reached(
                    obj_x - 1,
                    obj_z + z,
                    0,
                    BlockAccessFlag::BLOCK_WEST as u8
                ));
                assert!(!reached(
                    obj_x - 1,
                    obj_z + z,
                    2,
                    BlockAccessFlag::BLOCK_EAST as u8
                ));
                // Test coming from east tiles with access blocked.
                assert!(!reached(
                    obj_x + width,
                    obj_z + z,
                    0,
                    BlockAccessFlag::BLOCK_EAST as u8
                ));
                assert!(!reached(
                    obj_x + width,
                    obj_z + z,
                    2,
                    BlockAccessFlag::BLOCK_WEST as u8
                ));
            }
        }
    }
}

/**
 * Test that object rotations are taken into account within [ReachStrategy.reached]
 * and do not rely on external modifications. For example, given the parameters of
 * an object in coordinates (3203, 3203) with a dimension of 3 x 1 (width x height),
 * the following test should pass:
 *
 * Object rotation of [1] or [3]. (flipped)
 * ```
 * --------
 * ---o----
 * --o o---
 * --o o---
 * --o o---
 * ---o----
 * --------
 * --------
 * ```
 * Where:
 * - Area starts from bottom-left and makes its way to top-right. (3200,3200 - 3207,3207)
 * - ' ' (whitespace) are the tiles occupied by the rotated object.
 * - 'o' are the tiles that successfully pass [ReachStrategy.reached].
 * - '-' represents every other tile in the area. (in this case a zone, or 8x8 tile area)
 */
#[test]
fn test_reach_rotated_loc_flipped() {
    for [obj_x, obj_z, width, height] in ARGS {
        let min_x = obj_x - 16;
        let min_z = obj_z - 16;
        let max_x = obj_x + 16;
        let max_z = obj_z + 16;

        unsafe {
            let mut collision = build_collision_map(min_x, min_z, max_x, max_z);
            flag(
                &mut collision,
                obj_x,
                obj_z,
                width,
                height,
                CollisionFlag::LOC,
            );

            let reached = |src_x: i32, src_z: i32, rot: u8, block_access_flags: u8| -> bool {
                ReachStrategy::reached(
                    &collision,
                    0,
                    src_x,
                    src_z,
                    obj_x,
                    obj_z,
                    width as u8,
                    height as u8,
                    1,
                    rot,
                    -2, // Use rectangular exclusive strategy
                    block_access_flags,
                )
            };

            for x in 0..height {
                // width and height are swapped
                // Test coming from south tiles.
                assert!(reached(obj_x + x, obj_z - 1, 1, 0));
                assert!(reached(obj_x + x, obj_z - 1, 3, 0));
                // Test coming from north tiles.
                assert!(reached(obj_x + x, obj_z + width, 1, 0)); // width and height are swapped
                assert!(reached(obj_x + x, obj_z + width, 3, 0)); // width and height are swapped

                // Test coming from south tiles with access blocked.
                assert!(!reached(
                    obj_x + x,
                    obj_z - 1,
                    1,
                    BlockAccessFlag::BLOCK_EAST as u8
                ));
                assert!(!reached(
                    obj_x + x,
                    obj_z - 1,
                    3,
                    BlockAccessFlag::BLOCK_WEST as u8
                ));
                // Test coming from north tiles with access blocked.
                assert!(!reached(
                    obj_x + x,
                    obj_z + width, // width and height are swapped
                    1,
                    BlockAccessFlag::BLOCK_WEST as u8
                ));
                assert!(!reached(
                    obj_x + x,
                    obj_z + width, // width and height are swapped
                    3,
                    BlockAccessFlag::BLOCK_EAST as u8
                ));
            }

            for z in 0..width {
                // width and height are swapped
                // Test coming from west tiles.
                assert!(reached(obj_x - 1, obj_z + z, 1, 0));
                assert!(reached(obj_x - 1, obj_z + z, 3, 0));
                // Test coming from east tiles.
                assert!(reached(obj_x + height, obj_z + z, 1, 0)); // width and height are swapped
                assert!(reached(obj_x + height, obj_z + z, 3, 0)); // width and height are swapped

                // Test coming from west tiles with access blocked.
                assert!(!reached(
                    obj_x - 1,
                    obj_z + z,
                    1,
                    BlockAccessFlag::BLOCK_SOUTH as u8
                ));
                assert!(!reached(
                    obj_x - 1,
                    obj_z + z,
                    3,
                    BlockAccessFlag::BLOCK_NORTH as u8
                ));
                // Test coming from east tiles with access blocked.
                assert!(!reached(
                    obj_x + height, // width and height are swapped
                    obj_z + z,
                    1,
                    BlockAccessFlag::BLOCK_NORTH as u8
                ));
                assert!(!reached(
                    obj_x + height, // width and height are swapped
                    obj_z + z,
                    3,
                    BlockAccessFlag::BLOCK_SOUTH as u8
                ));
            }
        }
    }
}
