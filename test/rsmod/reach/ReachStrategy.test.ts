import {__set, allocateIfAbsent, BlockAccessFlag, CollisionFlag, reached} from '../../../dist/rsmod-pathfinder';

function buildCollisionMap(x1: number, z1: number, x2: number, z2: number) {
    for (let level = 0; level < 4; level++) {
        for (let z = Math.min(z1, z2); z <= Math.max(z1, z2); z++) {
            for (let x = Math.min(x1, x2); x <= Math.max(x1, x2); x++) {
                allocateIfAbsent(x, z, level);
            }
        }
    }
}

function flag(baseX: number, baseZ: number, width: number, height: number, mask: number) {
    for (let level = 0; level < 4; level++) {
        for (let z = 0; z < height; z++) {
            for (let x = 0; x < width; x++) {
                __set(baseX + x, baseZ + z, level, mask);
            }
        }
    }
}

describe('ReachStrategy', () => {
    const ROTATED_OBJECT_TEST_ARGS = [
        [3203, 3203, {width: 1, height: 1}],
        [3203, 3203, {width: 1, height: 2}],
        [3203, 3203, {width: 1, height: 3}],
        [3203, 3203, {width: 2, height: 1}],
        [3203, 3203, {width: 2, height: 2}],
        [3203, 3203, {width: 2, height: 3}],
        [3203, 3203, {width: 3, height: 1}],
        [3203, 3203, {width: 3, height: 2}],
        [3203, 3203, {width: 3, height: 3}]
    ] as const;

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
    test.each(ROTATED_OBJECT_TEST_ARGS)('test rotated object normal ', (objX, objZ, {width, height}) => {
        const LEVEL = 0;

        const minX = objX - 16,
            minZ = objZ - 16;
        const maxX = objX + 16,
            maxZ = objZ + 16;

        buildCollisionMap(minX, minZ, maxX, maxZ);
        flag(objX, objZ, width, height, CollisionFlag.LOC);

        const reachedc = (srcX: number, srcZ: number, rot: number, blockAccessFlags: number = 0) => {
            return reached(
                LEVEL,
                srcX,
                srcZ,
                objX,
                objZ,
                width,
                height,
                1,
                rot,
                -2, // Use rectangular excludive strategy
                blockAccessFlags
            );
        };

        for (let x = 0; x < width; x++) {
            // Test coming from south tiles.
            expect(reachedc(objX + x, objZ - 1, 0)).toBeTruthy();
            expect(reachedc(objX + x, objZ - 1, 2)).toBeTruthy();
            // Test coming from north tiles.
            expect(reachedc(objX + x, objZ + height, 0)).toBeTruthy();
            expect(reachedc(objX + x, objZ + height, 2)).toBeTruthy();
            // Test coming from south tiles with access blocked.
            expect(reachedc(objX + x, objZ - 1, 0, BlockAccessFlag.BLOCK_SOUTH)).toBeFalsy();
            expect(reachedc(objX + x, objZ - 1, 2, BlockAccessFlag.BLOCK_NORTH)).toBeFalsy();
            // Test coming from north tiles with access blocked.
            expect(reachedc(objX + x, objZ + height, 0, BlockAccessFlag.BLOCK_NORTH)).toBeFalsy();
            expect(reachedc(objX + x, objZ + height, 2, BlockAccessFlag.BLOCK_SOUTH)).toBeFalsy();
        }

        for (let z = 0; z < height; z++) {
            // Test coming from west tiles.
            expect(reachedc(objX - 1, objZ + z, 0)).toBeTruthy();
            expect(reachedc(objX - 1, objZ + z, 2)).toBeTruthy();
            // Test coming from east tiles.
            expect(reachedc(objX + width, objZ + z, 0)).toBeTruthy();
            expect(reachedc(objX + width, objZ + z, 2)).toBeTruthy();
            // Test coming from west tiles with access blocked.
            expect(reachedc(objX - 1, objZ + z, 0, BlockAccessFlag.BLOCK_WEST)).toBeFalsy();
            expect(reachedc(objX - 1, objZ + z, 2, BlockAccessFlag.BLOCK_EAST)).toBeFalsy();
            // Test coming from east tiles with access blocked.
            expect(reachedc(objX + width, objZ + z, 0, BlockAccessFlag.BLOCK_EAST)).toBeFalsy();
            expect(reachedc(objX + width, objZ + z, 2, BlockAccessFlag.BLOCK_WEST)).toBeFalsy();
        }
    });

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
    test.each(ROTATED_OBJECT_TEST_ARGS)('test rotated object flipped', (objX, objZ, {width, height}) => {
        const LEVEL = 0;

        const minX = objX - 16,
            minZ = objZ - 16;
        const maxX = objX + 16,
            maxZ = objZ + 16;

        buildCollisionMap(minX, minZ, maxX, maxZ);
        flag(objX, objZ, width, height, CollisionFlag.LOC);

        const reachedc = (srcX: number, srcZ: number, rot: number, blockAccessFlags: number = 0) => {
            return reached(
                LEVEL,
                srcX,
                srcZ,
                objX,
                objZ,
                width,
                height,
                1,
                rot,
                -2, // Use rectangular exclusive strategy
                blockAccessFlags
            );
        };

        for (let x = 0; x < height; x++) {
            // width and height are swapped
            // Test coming from south tiles.
            expect(reachedc(objX + x, objZ - 1, 1)).toBeTruthy();
            expect(reachedc(objX + x, objZ - 1, 3)).toBeTruthy();
            // Test coming from north tiles.
            expect(reachedc(objX + x, objZ + width, 1)).toBeTruthy(); // width and height are swapped
            expect(reachedc(objX + x, objZ + width, 3)).toBeTruthy(); // width and height are swapped
            // Test coming from south tiles with access blocked.
            expect(reachedc(objX + x, objZ - 1, 1, BlockAccessFlag.BLOCK_EAST)).toBeFalsy();
            expect(reachedc(objX + x, objZ - 1, 3, BlockAccessFlag.BLOCK_WEST)).toBeFalsy();
            // Test coming from north tiles with access blocked.
            expect(reachedc(objX + x, objZ + width, 1, BlockAccessFlag.BLOCK_WEST)).toBeFalsy(); // width and height are swapped
            expect(reachedc(objX + x, objZ + width, 3, BlockAccessFlag.BLOCK_EAST)).toBeFalsy(); // width and height are swapped
        }

        for (let z = 0; z < width; z++) {
            // width and height are swapped
            // Test coming from west tiles.
            expect(reachedc(objX - 1, objZ + z, 1)).toBeTruthy();
            expect(reachedc(objX - 1, objZ + z, 3)).toBeTruthy();
            // Test coming from east tiles.
            expect(reachedc(objX + height, objZ + z, 1)).toBeTruthy(); // width and height are swapped
            expect(reachedc(objX + height, objZ + z, 3)).toBeTruthy(); // width and height are swapped
            // Test coming from west tiles with access blocked.
            expect(reachedc(objX - 1, objZ + z, 1, BlockAccessFlag.BLOCK_SOUTH)).toBeFalsy();
            expect(reachedc(objX - 1, objZ + z, 3, BlockAccessFlag.BLOCK_NORTH)).toBeFalsy();
            // Test coming from east tiles with access blocked.
            expect(reachedc(objX + height, objZ + z, 1, BlockAccessFlag.BLOCK_NORTH)).toBeFalsy(); // width and height are swapped
            expect(reachedc(objX + height, objZ + z, 3, BlockAccessFlag.BLOCK_SOUTH)).toBeFalsy(); // width and height are swapped
        }
    });
});
