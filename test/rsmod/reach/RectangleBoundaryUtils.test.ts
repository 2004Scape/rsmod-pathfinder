import {__collides, __reachRectangle1, __reachRectangleN, __set, BlockAccessFlag, CollisionFlag, deallocateIfPresent} from '../../../dist/rsmod-pathfinder';

describe('RectangleBoundaryUtils', () => {
    beforeEach(() => {
        deallocateIfPresent(0, 0, 0);
    });

    describe('reachRectangleN', () => {
        describe('no collision flags', () => {
            describe('size 2', () => {
                test('should return true when src is west of destination', () => {
                    const srcX = 0,
                        srcZ = 2,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, 0)).toBeTruthy();
                });

                test('should return true when src is east of destination', () => {
                    const srcX = 4,
                        srcZ = 2,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, 0)).toBeTruthy();
                });

                test('should return true when src is south of destination', () => {
                    const srcX = 2,
                        srcZ = 4,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, 0)).toBeTruthy();
                });

                test('should return true when src is north of destination', () => {
                    const srcX = 2,
                        srcZ = 0,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, 0)).toBeTruthy();
                });
            });
        });

        describe('block access flags', () => {
            describe('size 2', () => {
                test('should return false when a wall is to the east of src and we cannot pass', () => {
                    const srcX = 0,
                        srcZ = 2,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.WALL_EAST);
                    const blockAccessFlags = BlockAccessFlag.BLOCK_WEST;

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, blockAccessFlags)).toBeFalsy();
                });

                test('should return false when a wall is to the west of src and we cannot pass', () => {
                    const srcX = 4,
                        srcZ = 2,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.WALL_WEST);
                    const blockAccessFlags = BlockAccessFlag.BLOCK_EAST;

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, blockAccessFlags)).toBeFalsy();
                });

                test('should return false when a wall is to the south of src and we cannot pass', () => {
                    const srcX = 2,
                        srcZ = 4,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH);
                    const blockAccessFlags = BlockAccessFlag.BLOCK_NORTH;

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, blockAccessFlags)).toBeFalsy();
                });

                test('should return false when a wall is to the north of src and we cannot pass', () => {
                    const srcX = 2,
                        srcZ = 0,
                        destX = 2,
                        destZ = 2,
                        srcWidth = 2,
                        srcHeight = 2,
                        destWidth = 2,
                        destHeight = 2;

                    __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH);
                    const blockAccessFlags = BlockAccessFlag.BLOCK_SOUTH;

                    expect(__collides(srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight)).toBeFalsy();
                    expect(__reachRectangleN(0, srcX, srcZ, destX, destZ, srcWidth, srcHeight, destWidth, destHeight, blockAccessFlags)).toBeFalsy();
                });
            });
        });
    });

    describe('reachRectangle1', () => {
        describe('no collision flags', () => {
            test('should return true when src is west of destination', () => {
                const srcX = 1,
                    srcZ = 2,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, 0)).toBe(true);
            });

            test('should return true when src is east of destination', () => {
                const srcX = 4,
                    srcZ = 2,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, 0)).toBe(true);
            });

            test('should return true when src is south of destination', () => {
                const srcX = 2,
                    srcZ = 1,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, 0)).toBe(true);
            });

            test('should return true when src is north of destination', () => {
                const srcX = 2,
                    srcZ = 4,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, 0)).toBe(true);
            });
        });

        describe('block access flags', () => {
            test('should return false when a wall is to the east of src and we cannot pass', () => {
                const srcX = 1,
                    srcZ = 2,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.WALL_EAST);
                const blockAccessFlags = BlockAccessFlag.BLOCK_WEST;

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, blockAccessFlags)).toBe(false);
            });

            test('should return false when a wall is to the west of src and we cannot pass', () => {
                const srcX = 4,
                    srcZ = 2,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.WALL_WEST);
                const blockAccessFlags = BlockAccessFlag.BLOCK_EAST;

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, blockAccessFlags)).toBe(false);
            });

            test('should return false when a wall is to the south of src and we cannot pass', () => {
                const srcX = 2,
                    srcZ = 1,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.WALL_NORTH);
                const blockAccessFlags = BlockAccessFlag.BLOCK_SOUTH;

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, blockAccessFlags)).toBe(false);
            });

            test('should return false when a wall is to the north of src and we cannot pass', () => {
                const srcX = 2,
                    srcZ = 4,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH);
                const blockAccessFlags = BlockAccessFlag.BLOCK_NORTH;

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, blockAccessFlags)).toBe(false);
            });
        });

        describe('positioning', () => {
            test('should return false when src is not adjacent to destination', () => {
                const srcX = 5,
                    srcZ = 5,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, 0)).toBe(false);
            });

            test('should return false when src is within the destination rectangle', () => {
                const srcX = 3,
                    srcZ = 3,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, 0)).toBe(false);
            });

            test('should return true when src is at the boundary and no wall blocking it', () => {
                const srcX = 3,
                    srcZ = 4,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.OPEN);

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, 0)).toBe(true);
            });

            test('should return false when src is at the boundary and there is a wall blocking it', () => {
                const srcX = 3,
                    srcZ = 4,
                    destX = 2,
                    destZ = 2,
                    destWidth = 2,
                    destHeight = 2;

                __set(srcX, srcZ, 0, CollisionFlag.WALL_SOUTH);
                const blockAccessFlags = BlockAccessFlag.BLOCK_NORTH;

                expect(__reachRectangle1(0, srcX, srcZ, destX, destZ, destWidth, destHeight, blockAccessFlags)).toBe(false);
            });
        });
    });
});
