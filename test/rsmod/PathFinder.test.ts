import {__add, __set, allocateIfAbsent, CollisionFlag, deallocateIfPresent, findPath} from '../../dist/rsmod-pathfinder';

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

function flag(baseX: number, baseZ: number, width: number, height: number, mask: number) {
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
});

describe('PathFinder', () => {
    test('route coordinates match level input', () => {
        const srcX = 3200,
            srcZ = 3200;
        const destX = 3201,
            destZ = 3200;

        buildCollisionMap(srcX, srcZ, destX, destZ);
        // const pathFinder = new PathFinder(map);

        let route = findPath(0, srcX, srcZ, destX, destZ);
        expect(route.length > 0).toBeTruthy();
        for (let index = 0; index < route.length; index++) {
            expect((route[index] >> 28) & 0x3).toBe(0);
        }

        route = findPath(1, srcX, srcZ, destX, destZ);
        expect(route.length > 0).toBeTruthy();
        for (let index = 0; index < route.length; index++) {
            expect((route[index] >> 28) & 0x3).toBe(1);
        }

        route = findPath(2, srcX, srcZ, destX, destZ);
        expect(route.length > 0).toBeTruthy();
        for (let index = 0; index < route.length; index++) {
            expect((route[index] >> 28) & 0x3).toBe(2);
        }

        route = findPath(3, srcX, srcZ, destX, destZ);
        expect(route.length > 0).toBeTruthy();
        for (let index = 0; index < route.length; index++) {
            expect((route[index] >> 28) & 0x3).toBe(3);
        }
    });

    test('surrounded by objects allow move near', () => {
        const srcX = 3200,
            srcZ = 3200;
        const destX = 3205,
            destZ = 3200;

        buildCollisionMap(srcX, srcZ, destX, destZ);
        flag(srcX - 1, srcZ - 1, 3, 3, CollisionFlag.LOC);
        __set(srcX, srcZ, 0, CollisionFlag.OPEN); // Remove collision flag from source tile

        const route = findPath(0, srcX, srcZ, destX, destZ);
        // expect(route.alternative).toBeTruthy();
        expect(route.length === 0).toBeTruthy();
    });

    test('surrounded by objects no move near', () => {
        const srcX = 3200,
            srcZ = 3200;
        const destX = 3205,
            destZ = 3200;

        buildCollisionMap(srcX, srcZ, destX, destZ);
        flag(srcX - 1, srcZ - 1, 3, 3, CollisionFlag.LOC);
        __set(srcX, srcZ, 0, CollisionFlag.OPEN); // Remove collision flag from source tile

        // const pathFinder = new PathFinder(map);
        const route = findPath(0, srcX, srcZ, destX, destZ, 1, 1, 1, 0, -1, false);
        // expect(route.failed).toBeTruthy();
        expect(route.length === 0).toBeTruthy();
    });

    test('single exit point', () => {
        const srcX = 3200,
            srcZ = 3200;
        const destX = 3200,
            destZ = 3205;

        buildCollisionMap(srcX, srcZ, destX, destZ);
        flag(srcX - 1, srcZ - 1, 3, 3, CollisionFlag.LOC);
        __set(srcX, srcZ, 0, CollisionFlag.OPEN); // Remove collision flag from source tile
        __set(srcX, srcZ - 1, 0, CollisionFlag.OPEN); // Remove collision flag from tile south of source tile.

        // const pathFinder = new PathFinder(map);
        const route = findPath(0, srcX, srcZ, destX, destZ);
        // expect(route.success).toBeTruthy();
        expect(route.length === 4).toBeTruthy();

        expect((route[0] >> 14) & 0x3fff).toEqual(3200);
        expect(route[0] & 0x3fff).toEqual(3198);

        expect((route[1] >> 14) & 0x3fff).toEqual(3198);
        expect(route[1] & 0x3fff).toEqual(3198);

        expect((route[2] >> 14) & 0x3fff).toEqual(3198);
        expect(route[2] & 0x3fff).toEqual(3203);

        expect((route[3] >> 14) & 0x3fff).toEqual(destX);
        expect(route[3] & 0x3fff).toEqual(destZ);
    });

    test('standing on closest approach point', () => {
        const srcX = 3200,
            srcZ = 3200;
        const objX = 3200,
            objZ = 3201;

        buildCollisionMap(srcX, srcZ, objX, objZ);
        __add(objX, objZ, 0, CollisionFlag.WALL_NORTH | CollisionFlag.WALL_SOUTH | CollisionFlag.WALL_WEST | CollisionFlag.WALL_EAST);

        const route = findPath(0, srcX, srcZ, objX, objZ);
        // expect(route.success).toBeTruthy();
        // expect(route.alternative).toBeTruthy();
        expect(route.length === 0).toBeTruthy();
    });

    test('find path any size', () => {
        for (let size = 1; size <= 3; size++) {
            const srcX = 3200,
                srcZ = 3200;
            const objX = 3200,
                objZ = 3210 + size;

            buildCollisionMap(srcX, srcZ, objX, objZ);
            __set(srcX, srcZ + 1, 0, CollisionFlag.LOC);

            const route = findPath(0, srcX, srcZ, objX, objZ, size);
            expect(route.length > 0).toBeTruthy();
            // expect(route.alternative).toBeFalsy();
        }
    });
});
