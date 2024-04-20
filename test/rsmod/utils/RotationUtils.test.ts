import {describe, expect, test} from 'vitest';

import {__rotate, __rotateFlags, BlockAccessFlag} from "../../../dist/rsmod-pathfinder";

describe('RotationUtils', () => {
    test('test rotate width', () => {
        const width = 3;
        const height = 2;
        expect(__rotate(0, width, height)).toBe(width);
        expect(__rotate(1, width, height)).toBe(height);
        expect(__rotate(2, width, height)).toBe(width);
        expect(__rotate(3, width, height)).toBe(height);
    });

    test('test rotate height', () => {
        const width = 3;
        const height = 2;
        expect(__rotate(0, height, width)).toBe(height);
        expect(__rotate(1, height, width)).toBe(width);
        expect(__rotate(2, height, width)).toBe(height);
        expect(__rotate(3, height, width)).toBe(width);
    });

    test('test rotate block access flag north', () => {
        const north = BlockAccessFlag.BLOCK_NORTH;
        expect(__rotateFlags(0, north)).toBe(BlockAccessFlag.BLOCK_NORTH);
        expect(__rotateFlags(1, north)).toBe(BlockAccessFlag.BLOCK_EAST);
        expect(__rotateFlags(2, north)).toBe(BlockAccessFlag.BLOCK_SOUTH);
        expect(__rotateFlags(3, north)).toBe(BlockAccessFlag.BLOCK_WEST);
    });

    test('test rotate block access flag east', () => {
        const east = BlockAccessFlag.BLOCK_EAST;
        expect(__rotateFlags(0, east)).toBe(BlockAccessFlag.BLOCK_EAST);
        expect(__rotateFlags(1, east)).toBe(BlockAccessFlag.BLOCK_SOUTH);
        expect(__rotateFlags(2, east)).toBe(BlockAccessFlag.BLOCK_WEST);
        expect(__rotateFlags(3, east)).toBe(BlockAccessFlag.BLOCK_NORTH);
    });

    test('test rotate block access flag south', () => {
        const south = BlockAccessFlag.BLOCK_SOUTH;
        expect(__rotateFlags(0, south)).toBe(BlockAccessFlag.BLOCK_SOUTH);
        expect(__rotateFlags(1, south)).toBe(BlockAccessFlag.BLOCK_WEST);
        expect(__rotateFlags(2, south)).toBe(BlockAccessFlag.BLOCK_NORTH);
        expect(__rotateFlags(3, south)).toBe(BlockAccessFlag.BLOCK_EAST);
    });

    test('test rotate block access flag west', () => {
        const west = BlockAccessFlag.BLOCK_WEST;
        expect(__rotateFlags(0, west)).toBe(BlockAccessFlag.BLOCK_WEST);
        expect(__rotateFlags(1, west)).toBe(BlockAccessFlag.BLOCK_NORTH);
        expect(__rotateFlags(2, west)).toBe(BlockAccessFlag.BLOCK_EAST);
        expect(__rotateFlags(3, west)).toBe(BlockAccessFlag.BLOCK_SOUTH);
    });
});