import {__set, allocateIfAbsent, canTravel, CollisionFlag, CollisionType, deallocateIfPresent} from '../../dist/rsmod-pathfinder';

function buildCollisionMap(x1: number, z1: number, x2: number, z2: number) {
    for (let level = 0; level < 4; level++) {
        for (let z = Math.min(z1, z2); z <= Math.max(z1, z2); z++) {
            for (let x = Math.min(x1, x2); x <= Math.max(x1, x2); x++) {
                allocateIfAbsent(x, z, level);
            }
        }
    }
}

function buildCollisionMapWithFlag(x1: number, z1: number, x2: number, z2: number, mask: number) {
    for (let level = 0; level < 4; level++) {
        for (let z = Math.min(z1, z2); z <= Math.max(z1, z2); z++) {
            for (let x = Math.min(x1, x2); x <= Math.max(x1, x2); x++) {
                __set(x, z, level, mask);
            }
        }
    }
}

beforeEach(() => {
    deallocateIfPresent(3200, 3200, 0);
    deallocateIfPresent(3200, 3200, 1);
    deallocateIfPresent(3200, 3200, 2);
    deallocateIfPresent(3200, 3200, 3);

    deallocateIfPresent(3200, 3198, 0);
    deallocateIfPresent(3200, 3198, 1);
    deallocateIfPresent(3200, 3198, 2);
    deallocateIfPresent(3200, 3198, 3);

    deallocateIfPresent(3198, 3200, 0);
    deallocateIfPresent(3198, 3200, 1);
    deallocateIfPresent(3198, 3200, 2);
    deallocateIfPresent(3198, 3200, 3);

    deallocateIfPresent(3199, 3199, 0);
    deallocateIfPresent(3199, 3199, 1);
    deallocateIfPresent(3199, 3199, 2);
    deallocateIfPresent(3199, 3199, 3);
});

describe('StepValidator', () => {
    const srcX = 3200;
    const srcZ = 3200;

    const args = [
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
        [3, 1, 1]
    ];

    const extraFlags = [CollisionFlag.PLAYER, CollisionFlag.NPC, CollisionFlag.PLAYER | CollisionFlag.NPC];

    test.each(args)('test clear path', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;

        buildCollisionMap(srcX, srcZ, destX, destZ);

        for (let level = 0; level < 4; level++) {
            expect(canTravel(level, srcX, srcZ, dirX, dirZ, size, 0, CollisionType.NORMAL)).toBeTruthy();
        }
    });

    test.each(args)('test loc blocking', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;

        buildCollisionMap(srcX, srcZ, destX, destZ);

        for (let level = 0; level < 4; level++) {
            for (let index = 0; index < size * size; index++) {
                const deltaX = destX + (index % size);
                const deltaZ = destZ + index / size;
                __set(deltaX, deltaZ, level, CollisionFlag.LOC);
            }
        }

        for (let level = 0; level < 4; level++) {
            expect(canTravel(level, srcX, srcZ, dirX, dirZ, size, 0, CollisionType.NORMAL)).toBeFalsy();
        }
    });

    test.each(args)('test extra flag blocking', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;

        buildCollisionMap(srcX, srcZ, destX, destZ);

        for (let level = 0; level < 4; level++) {
            for (const flag of extraFlags) {
                for (let index = 0; index < size * size; index++) {
                    const deltaX = destX + (index % size);
                    const deltaZ = destZ + index / size;
                    __set(deltaX, deltaZ, level, flag);
                }
            }
        }

        for (let level = 0; level < 4; level++) {
            for (const flag of extraFlags) {
                expect(canTravel(level, srcX, srcZ, dirX, dirZ, size, flag, CollisionType.NORMAL)).toBeFalsy();
            }
        }
    });

    test.each(args)('test blocked flag strategy', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;

        buildCollisionMapWithFlag(srcX, srcZ, destX, destZ, CollisionFlag.FLOOR);

        for (let level = 0; level < 4; level++) {
            for (const flag of extraFlags) {
                expect(canTravel(level, srcX, srcZ, dirX, dirZ, 1, 0, CollisionType.BLOCKED)).toBeTruthy();
            }
        }
    });

    test.each(args)('test indoors flag strategy', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;
        const outdoorsX = destX + dirX;
        const outdoorsZ = destZ + dirZ;

        for (let level = 0; level < 4; level++) {
            for (let x = Math.min(srcX, Math.min(destX, outdoorsX)); x <= Math.max(srcX, Math.max(destX, outdoorsX)); x++) {
                for (let z = Math.min(srcZ, Math.min(destZ, outdoorsZ)); z <= Math.max(srcZ, Math.max(destZ, outdoorsZ)); z++) {
                    __set(x, z, level, CollisionFlag.ROOF);
                }
            }
        }

        for (let level = 0; level < 4; level++) {
            __set(outdoorsX, outdoorsZ, level, CollisionFlag.OPEN);
        }

        for (let level = 0; level < 4; level++) {
            for (const flag of extraFlags) {
                expect(canTravel(level, srcX, srcZ, dirX, dirZ, 1, 0, CollisionType.INDOORS)).toBeTruthy();
                expect(canTravel(level, destX, destZ, dirX, dirZ, 1, 0, CollisionType.INDOORS)).toBeFalsy();
            }
        }
    });

    test.each(args)('test outdoors flag strategy', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;
        const indoorsX = destX + dirX;
        const indoorsZ = destZ + dirZ;

        for (let level = 0; level < 4; level++) {
            for (let x = Math.min(srcX, Math.min(destX, indoorsX)); x <= Math.max(srcX, Math.max(destX, indoorsX)); x++) {
                for (let z = Math.min(srcZ, Math.min(destZ, indoorsZ)); z <= Math.max(srcZ, Math.max(destZ, indoorsZ)); z++) {
                    allocateIfAbsent(x, z, level);
                }
            }
        }

        for (let level = 0; level < 4; level++) {
            __set(indoorsX, indoorsZ, level, CollisionFlag.ROOF);
        }

        for (let level = 0; level < 4; level++) {
            for (const flag of extraFlags) {
                expect(canTravel(level, srcX, srcZ, dirX, dirZ, 1, 0, CollisionType.OUTDOORS)).toBeTruthy();
                expect(canTravel(level, destX, destZ, dirX, dirZ, 1, 0, CollisionType.OUTDOORS)).toBeFalsy();
            }
        }
    });

    test.each(args)('test line of sight flag strategy loc', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;
        const blockedX = destX + dirX;
        const blockedZ = destZ + dirZ;

        for (let level = 0; level < 4; level++) {
            for (let x = Math.min(srcX, Math.min(destX, blockedX)); x <= Math.max(srcX, Math.max(destX, blockedX)); x++) {
                for (let z = Math.min(srcZ, Math.min(destZ, blockedZ)); z <= Math.max(srcZ, Math.max(destZ, blockedZ)); z++) {
                    allocateIfAbsent(x, z, level);
                }
            }
        }

        for (let level = 0; level < 4; level++) {
            __set(blockedX, blockedZ, level, CollisionFlag.LOC_PROJ_BLOCKER);
        }

        for (let level = 0; level < 4; level++) {
            for (const flag of extraFlags) {
                expect(canTravel(level, srcX, srcZ, dirX, dirZ, 1, 0, CollisionType.LINE_OF_SIGHT)).toBeTruthy();
                expect(canTravel(level, destX, destZ, dirX, dirZ, 1, 0, CollisionType.LINE_OF_SIGHT)).toBeFalsy();
            }
        }
    });

    test.each(args)('test line of sight flag strategy player', (size, dirX, dirZ) => {
        const destX = srcX + dirX;
        const destZ = srcZ + dirZ;
        const blockedX = destX + dirX;
        const blockedZ = destZ + dirZ;

        for (let level = 0; level < 4; level++) {
            for (let x = Math.min(srcX, Math.min(destX, blockedX)); x <= Math.max(srcX, Math.max(destX, blockedX)); x++) {
                for (let z = Math.min(srcZ, Math.min(destZ, blockedZ)); z <= Math.max(srcZ, Math.max(destZ, blockedZ)); z++) {
                    allocateIfAbsent(x, z, level);
                }
            }
        }

        for (let level = 0; level < 4; level++) {
            __set(blockedX, blockedZ, level, CollisionFlag.PLAYER);
        }

        for (let level = 0; level < 4; level++) {
            for (const flag of extraFlags) {
                expect(canTravel(level, srcX, srcZ, dirX, dirZ, 1, 0, CollisionType.LINE_OF_SIGHT)).toBeTruthy();
                expect(canTravel(level, destX, destZ, dirX, dirZ, 1, 0, CollisionType.LINE_OF_SIGHT)).toBeTruthy();
            }
        }
    });
});
