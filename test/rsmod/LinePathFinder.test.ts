import {__add, __set, allocateIfAbsent, CollisionFlag, deallocateIfPresent, lineOfSight, lineOfWalk} from '../../dist/rsmod-pathfinder';

function buildCollisionMap(x1: number, z1: number, x2: number, z2: number) {
    // const map = new CollisionFlagMap();
    for (let level = 0; level < 4; level++) {
        for (let z = Math.min(z1, z2); z <= Math.max(z1, z2); z++) {
            for (let x = Math.min(x1, x2); x <= Math.max(x1, x2); x++) {
                allocateIfAbsent(x, z, level);
            }
        }
    }
}

beforeEach(() => {
    deallocateIfPresent(3200, 3200, 0);
});

describe('LinePathFinder', () => {
    const srcX = 3200;
    const srcZ = 3200;

    const args = [
        [0, -1],
        [0, 1],
        [-1, 0],
        [1, 0]
    ];

    const flags = [CollisionFlag.OPEN, CollisionFlag.FLOOR, CollisionFlag.FLOOR_DECORATION, CollisionFlag.FLOOR | CollisionFlag.FLOOR_DECORATION];

    const extraFlags = [CollisionFlag.PLAYER, CollisionFlag.NPC, CollisionFlag.PLAYER | CollisionFlag.NPC];

    describe('line of walk', () => {
        /*test('test same tile has line of walk', () => {
            // const map = new CollisionFlagMap();
            allocateIfAbsent(srcX, srcZ, 0);
            expect(lineOfWalk(0, srcX, srcZ, srcX, srcZ).length > 0).toBeTruthy();
        });*/

        describe('with flags', () => {
            test('test partial line of walk', () => {
                // const map = new CollisionFlagMap();
                __set(3200, 3205, 0, CollisionFlag.LOC);
                expect(lineOfWalk(0, srcX, srcZ, 3200, 3207).length > 0).toBeFalsy();
            });

            test.each(args)('test clear line of walk', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    allocateIfAbsent(srcX + dirX, srcZ + dirZ, level);
                    expect(lineOfWalk(level, srcX, srcZ, destX, destZ).length > 0).toBeTruthy();
                }
            });

            test.each(args)('test loc blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    __set(srcX + dirX, srcZ + dirZ, level, CollisionFlag.LOC);
                    expect(lineOfWalk(level, srcX, srcZ, destX, destZ).length > 0).toBeFalsy();
                }
            });

            test.each(args)('test extra flag blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    for (const flag of extraFlags) {
                        __set(srcX + dirX, srcZ + dirZ, level, flag);
                        expect(lineOfWalk(level, srcX, srcZ, destX, destZ, 1, 1, 0, 0, flag).length > 0).toBeFalsy();
                    }
                }
            });
        });
    });

    describe('line of sight', () => {
        test('test with extra flag on target coords', () => {
            __add(srcX, srcZ, 0, CollisionFlag.PLAYER);
            const raycast: ArrayLike<number> = lineOfSight(0, 3200, 3202, 3200, 3200, 1, 1, 1, 1, CollisionFlag.PLAYER);
            expect(raycast.length == 2).toBeTruthy();
            expect(raycast[0] & 0x3fff).toBe(3201);
            expect((raycast[0] >> 14) & 0x3fff).toBe(3200);
            expect(raycast[1] & 0x3fff).toBe(3200);
            expect((raycast[1] >> 14) & 0x3fff).toBe(3200);
        });

        test('test with extra flag past target coords', () => {
            __add(srcX, srcZ, 0, CollisionFlag.PLAYER);
            expect(lineOfSight(0, 3200, 3202, 3200, 3199, 1, 1, 1, 1, CollisionFlag.PLAYER).length > 0).toBeFalsy();
        });

        test('test on top of loc fails line of sight', () => {
            // const map = new CollisionFlagMap();
            __add(srcX, srcZ, 0, CollisionFlag.LOC);
            expect(lineOfSight(0, srcX, srcZ, 3200, 3201).length > 0).toBeFalsy();
        });

        test('test on top of extra flag fails line of sight', () => {
            // const map = new CollisionFlagMap();
            __add(srcX, srcZ, 0, CollisionFlag.PLAYER);
            expect(lineOfSight(0, srcX, srcZ, 3200, 3201, 1, 1, 0, 0, CollisionFlag.PLAYER).length > 0).toBeFalsy();
        });

        /*test('test same tile has line of sight', () => {
            // const map = new CollisionFlagMap();
            allocateIfAbsent(srcX, srcZ, 0);
            expect(lineOfSight(0, srcX, srcZ, srcX, srcZ).length > 0).toBeTruthy();
        });*/

        describe('with flags', () => {
            test('test partial line of sight', () => {
                // const map = new CollisionFlagMap();
                __set(3200, 3205, 0, CollisionFlag.LOC_PROJ_BLOCKER);
                expect(lineOfSight(0, srcX, srcZ, 3200, 3207).length > 0).toBeFalsy();
            });

            test.each(args)('test valid line of sight', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    for (const flag of flags) {
                        __set(srcX + dirX, srcZ + dirZ, level, flag);
                        expect(lineOfSight(level, srcX, srcZ, destX, destZ).length > 0).toBeTruthy();
                    }
                }
            });

            test.each(args)('test loc blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    __set(srcX + dirX, srcZ + dirZ, level, CollisionFlag.LOC_PROJ_BLOCKER);
                    expect(lineOfSight(level, srcX, srcZ, destX, destZ).length > 0).toBeFalsy();
                }
            });

            test.each(args)('test extra flag blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    for (const flag of extraFlags) {
                        __set(srcX + dirX, srcZ + dirZ, level, flag);
                        expect(lineOfSight(level, srcX, srcZ, destX, destZ, 1, 1, 0, 0, flag).length > 0).toBeFalsy();
                    }
                }
            });
        });
    });
});
