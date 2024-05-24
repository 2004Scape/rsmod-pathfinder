import {__add, __get, __remove, __set, allocateIfAbsent, CollisionFlag, deallocateIfPresent, isFlagged, isZoneAllocated} from '../../../dist/rsmod-pathfinder';

beforeEach(() => {
    deallocateIfPresent(3200, 3200, 0);
});

describe('CollisionFlagMap', () => {
    test.concurrent('test get collision flag null zone', () => {
        expect(isZoneAllocated(3200, 3200, 0)).toBeFalsy();

        for (let x = 3200; x < 3208; x++) {
            for (let z = 3200; z < 3208; z++) {
                expect(__get(x, z, 0)).toBe(CollisionFlag.NULL);
            }
        }
    });

    test('test get collision flag allocated zone', () => {
        expect(isZoneAllocated(3200, 3200, 0)).toBeFalsy();

        allocateIfAbsent(3200, 3200, 0);
        expect(isZoneAllocated(3200, 3200, 0)).toBeTruthy();

        for (let x = 3200; x < 3208; x++) {
            for (let z = 3200; z < 3208; z++) {
                expect(__get(x, z, 0)).toBe(CollisionFlag.OPEN);
            }
        }
    });

    test('test set collision flag', () => {
        expect(__get(3200, 3200, 0)).toBe(CollisionFlag.NULL);
        expect(__get(3200, 3200, 1)).toBe(CollisionFlag.NULL);
        expect(__get(3200, 3200, 2)).toBe(CollisionFlag.NULL);

        __set(3200, 3200, 0, 0x800);
        __set(3200, 3200, 1, 0x200);
        __set(3200, 3200, 2, 0);

        expect(__get(3200, 3200, 0)).toBe(0x800);
        expect(__get(3200, 3200, 1)).toBe(0x200);
        expect(__get(3200, 3200, 2)).toBe(0);
    });

    test('test add collision flag', () => {
        allocateIfAbsent(3200, 3200, 0);
        expect(__get(3200, 3200, 0)).toBe(CollisionFlag.OPEN);

        __add(3200, 3200, 0, 0x1000);
        expect(__get(3200, 3200, 0)).toBe(0x1000);

        __add(3200, 3200, 0, 0x400);
        expect(isFlagged(3200, 3200, 0, 0x1000)).toBeTruthy();
        expect(isFlagged(3200, 3200, 0, 0x400)).toBeTruthy();

        for (let x = 3201; x < 3208; x++) {
            for (let z = 3201; z < 3208; z++) {
                expect(__get(x, z, 0)).toBe(CollisionFlag.OPEN);
            }
        }
    });

    test('test remove collision flag', () => {
        allocateIfAbsent(3200, 3200, 0);
        expect(__get(3200, 3200, 0)).toBe(CollisionFlag.OPEN);

        __add(3200, 3200, 0, 0x1000);
        expect(__get(3200, 3200, 0)).toBe(0x1000);

        __remove(3200, 3200, 0, 0x1000);
        expect(__get(3200, 3200, 0)).toBe(CollisionFlag.OPEN);
    });

    test('test deallocate if present', () => {
        allocateIfAbsent(3200, 3200, 0);
        expect(__get(3200, 3200, 0)).toBe(CollisionFlag.OPEN);

        deallocateIfPresent(3200, 3200, 0);
        expect(__get(3200, 3200, 0)).toBe(CollisionFlag.NULL);
    });
});
