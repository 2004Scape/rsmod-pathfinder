import {__remove, __set, allocateIfAbsent, CollisionFlag, reached, __alteredRotation, __reachExclusiveRectangle, __reachRectangle, deallocateIfPresent} from '../../../dist/rsmod-pathfinder';

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
                deallocateIfPresent(baseX + x, baseZ + z, level);
            }
        }
    }
    for (let level = 0; level < 4; level++) {
        for (let z = 0; z < height; z++) {
            for (let x = 0; x < width; x++) {
                __set(baseX + x, baseZ + z, level, mask);
            }
        }
    }
}

beforeEach(() => {
    deallocateIfPresent(3200, 3200, 0);
    deallocateIfPresent(3200, 3200, 1);
    deallocateIfPresent(3200, 3200, 2);
    deallocateIfPresent(3200, 3200, 3);
});

describe('RectangularReachStrategy', () => {
    const BLOCK_ACCESS_FLAG_TEST_ARGS = [
        [0, 1, 1], // north
        [1, 0, 2], // east
        [0, -1, 4], // south
        [-1, 0, 8] // west
    ] as const;

    const DIMENSIONS_TEST_ARGS = [
        [1, 1],
        [1, 2],
        [1, 3],
        [2, 1],
        [2, 2],
        [2, 3],
        [3, 1],
        [3, 2],
        [3, 3]
    ] as const;

    const WALL_STRAIGHT_STRATEGY_TEST_ARGS = [
        [0, 0, 1, CollisionFlag.WALL_SOUTH],
        [0, 0, -1, CollisionFlag.WALL_NORTH],
        [1, -1, 0, CollisionFlag.WALL_EAST],
        [1, 1, 0, CollisionFlag.WALL_WEST],
        [2, 0, 1, CollisionFlag.WALL_SOUTH],
        [2, 0, -1, CollisionFlag.WALL_NORTH],
        [3, -1, 0, CollisionFlag.WALL_EAST],
        [3, 1, 0, CollisionFlag.WALL_WEST]
    ] as const;

    const WALL_L_STRATEGY_TEST_ARGS = [
        [0, 1, 0, CollisionFlag.WALL_WEST],
        [0, 0, -1, CollisionFlag.WALL_NORTH],
        [1, -1, 0, CollisionFlag.WALL_EAST],
        [1, 0, -1, CollisionFlag.BLOCK_NORTH],
        [2, -1, 0, CollisionFlag.BLOCK_EAST],
        [2, 0, 1, CollisionFlag.BLOCK_NORTH],
        [3, 0, 1, CollisionFlag.BLOCK_SOUTH],
        [3, 1, 0, CollisionFlag.BLOCK_WEST]
    ] as const;

    const WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS = [
        [0, 1, 0, CollisionFlag.WALL_WEST],
        [0, 0, -1, CollisionFlag.WALL_NORTH],
        [1, -1, 0, CollisionFlag.WALL_EAST],
        [1, 0, -1, CollisionFlag.WALL_NORTH],
        [2, -1, 0, CollisionFlag.WALL_EAST],
        [2, 0, 1, CollisionFlag.WALL_SOUTH],
        [3, 1, 0, CollisionFlag.WALL_WEST],
        [3, 0, 1, CollisionFlag.WALL_SOUTH]
    ];

    describe('test wall decor strategy', () => {
        const srcX = 3200;
        const srcZ = 3200;
        const objX = 3200;
        const objZ = 3200;
        buildCollisionMap(srcX, srcZ, objX, objZ);

        describe('shape 6', () => {
            deallocateIfPresent(3200, 3200, 0);
            test.each(WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                __set(objX + dirX, objZ + dirZ, 0, flag);
                expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 6)).toBeFalsy();

                __set(objX + dirX, objZ + dirZ, 0, CollisionFlag.OPEN);
                expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 6)).toBeTruthy();
            });
        });

        describe('shape 7', () => {
            test.each(WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                __set(objX + dirX, objZ + dirZ, 0, flag);
                expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, __alteredRotation(rotation, 7), 7)).toBeFalsy();

                __set(objX + dirX, objZ + dirZ, 0, CollisionFlag.OPEN);
                expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, __alteredRotation(rotation, 7), 7)).toBeTruthy();
            });
        });

        describe('shape 8', () => {
            test.each(WALLDECOR_DIAGONAL_OFFSET_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                __set(objX + dirX, objZ + dirZ, 0, flag);
                expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 8)).toBeFalsy();

                __set(objX + dirX, objZ + dirZ, 0, CollisionFlag.OPEN);
                expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 8)).toBeTruthy();
            });
        });
    });

    describe('test wall strategy', () => {
        describe('no flags', () => {
            const srcX = 3200;
            const srcZ = 3200;
            const objX = 3200;
            const objZ = 3200;

            describe('shape 0', () => {
                test.each(WALL_STRAIGHT_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                    buildCollisionMap(srcX, srcZ, objX, objZ);

                    __set(objX + dirX, objZ + dirZ, 0, flag);

                    expect(reached(0, objX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 0)).toBeFalsy();
                    expect(reached(0, objX, objZ, objX + dirX, objZ + dirZ, 1, 1, 1, rotation, 0)).toBeTruthy();

                    __remove(objX + dirX, objZ + dirZ, 0, flag);
                });
            });

            describe('shape 2', () => {
                test.each(WALL_L_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                    buildCollisionMap(srcX, srcZ, objX, objZ);

                    __set(objX + dirX, objZ + dirZ, 0, flag);

                    expect(reached(0, objX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 2)).toBeFalsy();
                    expect(reached(0, objX, objZ, objX + dirX, objZ + dirZ, 1, 1, 1, rotation, 2)).toBeTruthy();

                    __remove(objX + dirX, objZ + dirZ, 0, flag);
                });
            });

            describe('shape 9', () => {
                test.each(WALL_STRAIGHT_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                    buildCollisionMap(srcX, srcZ, objX, objZ);

                    __set(objX + dirX, objZ + dirZ, 0, flag);

                    expect(reached(0, objX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 9)).toBeFalsy();
                    expect(reached(0, objX, objZ, objX + dirX, objZ + dirZ, 1, 1, 1, rotation, 9)).toBeTruthy();

                    __remove(objX + dirX, objZ + dirZ, 0, flag);
                });
            });
        });

        describe('with flags', () => {
            const srcX = 3200;
            const srcZ = 3200;
            const objX = 3200;
            const objZ = 3200;

            describe('shape 0', () => {
                test.each(WALL_STRAIGHT_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                    buildCollisionMap(srcX, srcZ, objX, objZ);

                    __set(objX + dirX, objZ + dirZ, 0, flag);
                    expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 0)).toBeFalsy();

                    __set(objX + dirX, objZ + dirZ, 0, CollisionFlag.OPEN);
                    expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 0)).toBeTruthy();

                    __remove(objX + dirX, objZ + dirZ, 0, flag);
                });
            });

            describe('shape 2', () => {
                test.each(WALL_L_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                    buildCollisionMap(srcX, srcZ, objX, objZ);

                    __set(objX + dirX, objZ + dirZ, 0, flag);
                    expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 2)).toBeFalsy();

                    __set(objX + dirX, objZ + dirZ, 0, CollisionFlag.OPEN);
                    expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 2)).toBeTruthy();

                    __remove(objX + dirX, objZ + dirZ, 0, flag);
                });
            });

            describe('shape 9', () => {
                test.each(WALL_STRAIGHT_STRATEGY_TEST_ARGS)('test reach with dimensions', (rotation, dirX, dirZ, flag) => {
                    buildCollisionMap(srcX, srcZ, objX, objZ);

                    __set(objX + dirX, objZ + dirZ, 0, flag);
                    expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 9)).toBeFalsy();

                    __set(objX + dirX, objZ + dirZ, 0, CollisionFlag.OPEN);
                    expect(reached(0, srcX + dirX, objZ + dirZ, objX, objZ, 1, 1, 1, rotation, 9)).toBeTruthy();

                    __remove(objX + dirX, objZ + dirZ, 0, flag);
                });
            });
        });
    });

    describe('test divided by loc', () => {
        const srcX = 3200;
        const srcZ = 3200;
        const objX = 3200;
        const objZ = 3201;
        buildCollisionMap(srcX, srcZ, objX, objZ);
        __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH);

        test('test blocked north', () => {
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeFalsy();
        });

        test('test free east', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_EAST);
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeTruthy();
        });

        test('test free south', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH);
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeTruthy();
        });

        test('test free west', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_WEST);
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeTruthy();
        });

        test('test free northwest', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH_WEST);
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeTruthy();
        });

        test('test free northeast', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH_EAST);
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeTruthy();
        });

        test('test free southeast', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH_EAST);
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeTruthy();
        });

        test('test free southwest', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH_WEST);
            expect(reached(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 10)).toBeTruthy();
        });
    });

    describe('test divided by wall', () => {
        const srcX = 3200;
        const srcZ = 3200;
        const objX = 3200;
        const objZ = 3201;
        buildCollisionMap(srcX, srcZ, objX, objZ);
        __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH);

        test('test blocked north', () => {
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeFalsy();
        });

        test('test free east', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_EAST);
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeTruthy();
        });

        test('test free south', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH);
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeTruthy();
        });

        test('test free west', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_WEST);
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeTruthy();
        });

        test('test free northwest', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH_WEST);
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeTruthy();
        });

        test('test free northeast', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH_EAST);
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeTruthy();
        });

        test('test free southeast', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH_EAST);
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeTruthy();
        });

        test('test free southwest', () => {
            __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH_WEST);
            const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, 0);
            expect(reached).toBeTruthy();
        });
    });

    describe('test block access flag', () => {
        test.each(BLOCK_ACCESS_FLAG_TEST_ARGS)('test block access flag', (offX, offZ, directionFlag) => {
            const objX = 3205;
            const objZ = 3205;
            buildCollisionMap(objX, objZ, objX, objZ);
            flag(objX, objZ, 1, 1, CollisionFlag.LOC);

            const cardinal = [
                [0, -1],
                [0, 1],
                [-1, 0],
                [1, 0]
            ];

            for (const dir of cardinal) {
                const srcX = objX + dir[0];
                const srcZ = objZ + dir[1];
                allocateIfAbsent(srcX, srcZ, 0);

                const reached = __reachRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, directionFlag);

                if (dir[0] === offX && dir[1] === offZ) {
                    expect(reached).toBeFalsy();
                } else {
                    expect(reached).toBeTruthy();
                }
            }
        });

        test.each(BLOCK_ACCESS_FLAG_TEST_ARGS)('test block access flag exclusive', (offX, offZ, directionFlag) => {
            const objX = 3205;
            const objZ = 3205;
            buildCollisionMap(objX, objZ, objX, objZ);
            flag(objX, objZ, 1, 1, CollisionFlag.LOC);

            const cardinal = [
                [0, -1],
                [0, 1],
                [-1, 0],
                [1, 0]
            ];

            for (const dir of cardinal) {
                const srcX = objX + dir[0];
                const srcZ = objZ + dir[1];
                allocateIfAbsent(srcX, srcZ, 0);

                const reached = __reachExclusiveRectangle(0, srcX, srcZ, objX, objZ, 1, 1, 1, 0, directionFlag);

                if (dir[0] === offX && dir[1] === offZ) {
                    expect(reached).toBeFalsy();
                } else {
                    expect(reached).toBeTruthy();
                }
            }
        });
    });

    describe('test reach with dimensions', () => {
        test.each(DIMENSIONS_TEST_ARGS)('test reach with dimensions', (width, height) => {
            const objX = 3202 + width;
            const objZ = 3202;
            buildCollisionMap(objX - 1, objZ - 1, objX + width, objZ + height);
            flag(objX, objZ, width, height, CollisionFlag.LOC);

            const reached1 = __reachRectangle(0, objX - 2, objZ - 1, objX, objZ, 1, width, height, 0, 0);
            expect(reached1).toBeFalsy();

            const reached2 = __reachRectangle(0, objX - 1, objZ - 2, objX, objZ, 1, width, height, 0, 0);
            expect(reached2).toBeFalsy();

            for (let x = -1; x < width + 1; x++) {
                for (let z = -1; z < height + 1; z++) {
                    const reached3 = __reachRectangle(0, objX + x, objZ + z, objX, objZ, 1, width, height, 0, 0);
                    const diagonal = (z === -1 && x === -1) || (z === height && x === width) || (z === -1 && x === width) || (z === height && x === -1);
                    if (diagonal) {
                        expect(reached3).toBeFalsy();
                        continue;
                    }
                    expect(reached3).toBeTruthy();
                }
            }
        });

        test.each(DIMENSIONS_TEST_ARGS)('test reach with dimensions exclusive', (width, height) => {
            const objX = 3202 + width;
            const objZ = 3202;
            buildCollisionMap(objX - 1, objZ - 1, objX + width, objZ + height);
            flag(objX, objZ, width, height, CollisionFlag.LOC);

            const reached1 = __reachExclusiveRectangle(0, objX - 2, objZ - 1, objX, objZ, 1, width, height, 0, 0);
            expect(reached1).toBeFalsy();

            const reached2 = __reachExclusiveRectangle(0, objX - 1, objZ - 2, objX, objZ, 1, width, height, 0, 0);
            expect(reached2).toBeFalsy();

            for (let x = -1; x < width + 1; x++) {
                for (let z = -1; z < height + 1; z++) {
                    const reached3 = __reachExclusiveRectangle(0, objX + x, objZ + z, objX, objZ, 1, width, height, 0, 0);
                    const diagonal = (z === -1 && x === -1) || (z === height && x === width) || (z === -1 && x === width) || (z === height && x === -1);
                    if (diagonal) {
                        expect(reached3).toBeFalsy();
                        continue;
                    }
                    const inLocArea = 0 <= x && width > x && 0 <= z && height > z;
                    if (inLocArea) {
                        expect(reached3).toBeFalsy();
                        continue;
                    }
                    expect(reached3).toBeTruthy();
                }
            }
        });
    });
});
