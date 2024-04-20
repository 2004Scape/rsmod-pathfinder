import {__add, __set, allocateIfAbsent, CollisionFlag, deallocateIfPresent, hasLineOfSight, hasLineOfWalk} from '../../dist/rsmod-pathfinder';

import {beforeEach, describe, expect, test} from 'vitest';

function buildCollisionMap(x1: number, z1: number, x2: number, z2: number) {
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

describe('LineValidator', () => {
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
        test('test same tile has line of walk', () => {
            // const map = new CollisionFlagMap();
            allocateIfAbsent(srcX, srcZ, 0);
            expect(hasLineOfWalk(0, srcX, srcZ, srcX, srcZ)).toBeTruthy();
        });

        describe('with flags', () => {
            test('test partial line of walk', () => {
                // const map = new CollisionFlagMap();
                __set(3200, 3205, 0, CollisionFlag.LOC);
                expect(hasLineOfWalk(0, srcX, srcZ, 3200, 3207)).toBeFalsy();
            });

            test.each(args)('test clear line of walk', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    allocateIfAbsent(srcX + dirX, srcZ + dirZ, level);
                    expect(hasLineOfWalk(level, srcX, srcZ, destX, destZ)).toBeTruthy();
                }
            });

            test.each(args)('test loc blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    __set(srcX + dirX, srcZ + dirZ, level, CollisionFlag.LOC);
                    expect(hasLineOfWalk(level, srcX, srcZ, destX, destZ)).toBeFalsy();
                }
            });

            test.each(args)('test extra flag blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    for (const flag of extraFlags) {
                        __set(srcX + dirX, srcZ + dirZ, level, flag);
                        expect(hasLineOfWalk(level, srcX, srcZ, destX, destZ, 1, 0, 0, flag)).toBeFalsy();
                    }
                }
            });
        });
    });

    describe('line of sight', () => {
        test('test on top of loc fails line of sight', () => {
            __add(srcX, srcZ, 0, CollisionFlag.LOC);
            expect(hasLineOfSight(0, srcX, srcZ, 3200, 3201)).toBeFalsy();
        });

        test('test on top of extra flag fails line of sight', () => {
            __add(srcX, srcZ, 0, CollisionFlag.PLAYER);
            expect(hasLineOfSight(0, srcX, srcZ, 3200, 3201, 1, 0, 0, CollisionFlag.PLAYER)).toBeFalsy();
        });

        test('test same tile has line of sight', () => {
            allocateIfAbsent(srcX, srcZ, 0);
            expect(hasLineOfSight(0, srcX, srcZ, srcX, srcZ)).toBeTruthy();
        });

        describe('with flags', () => {
            test('test partial line of sight', () => {
                __set(3200, 3205, 0, CollisionFlag.LOC_PROJ_BLOCKER);
                expect(hasLineOfSight(0, srcX, srcZ, 3200, 3207)).toBeFalsy();
            });

            test.each(args)('test valid line of sight', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    for (const flag of flags) {
                        __set(srcX + dirX, srcZ + dirZ, level, flag);
                        expect(hasLineOfSight(level, srcX, srcZ, destX, destZ)).toBeTruthy();
                    }
                }
            });

            test.each(args)('test loc blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    __set(srcX + dirX, srcZ + dirZ, level, CollisionFlag.LOC_PROJ_BLOCKER);
                    expect(hasLineOfSight(level, srcX, srcZ, destX, destZ)).toBeFalsy();
                }
            });

            test.each(args)('test extra flag blocking', (dirX, dirZ) => {
                const destX = srcX + dirX * 3;
                const destZ = srcZ + dirZ * 3;

                buildCollisionMap(srcX, srcZ, destX, destZ);

                for (let level = 0; level < 4; level++) {
                    for (const flag of extraFlags) {
                        __set(srcX + dirX, srcZ + dirZ, level, flag);
                        expect(hasLineOfSight(level, srcX, srcZ, destX, destZ, 1, 0, 0, flag)).toBeFalsy();
                    }
                }
            });
        });
    });
});
