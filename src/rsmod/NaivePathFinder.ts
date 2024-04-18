// https://gist.github.com/Z-Kris/2eb1c2fbc22aa7486a57089c82f293f8
// https://gist.github.com/Z-Kris/fe476d75a51374f12dca999700f009f7

import StepValidator from './StepValidator';
import {CollisionStrategy} from './collision/CollisionStrategy';

@final
export default class NaivePathFinder {
    private static readonly DIRECTIONS: i32[][] = [
        [-1, 0], // West
        [1, 0], // East
        [0, 1], // North
        [0, -1] // South
    ];

    private readonly stepValidator: StepValidator;

    constructor(stepValidator: StepValidator) {
        this.stepValidator = stepValidator;
    }

    // prettier-ignore
    @inline
    findPath(
        level: i8,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcWidth: i8,
        srcHeight: i8,
        destWidth: i8,
        destHeight: i8,
        blockAccessFlags: i8,
        collision: CollisionStrategy
    ): StaticArray<i32> {
        if (!(srcX >= 0 && srcX <= 0x7fff && srcZ >= 0 && srcZ <= 0x7fff)) {
            throw new Error(`Failed requirement. srcX was: ${srcX}, srcZ was: ${srcZ}.`);
        }
        if (!(destX >= 0 && destX <= 0x7fff && destZ >= 0 && destZ <= 0x7fff)) {
            throw new Error(`Failed requirement. destX was: ${destX}, destZ was: ${destZ}.`);
        }
        if (!(level >= 0 && level <= 0x3)) {
            throw new Error(`Failed requirement. level was: ${level}.`);
        }
        // If we are intersecting at all, the path needs to try to move out of the way.
        if (this.intersects(srcX, srcZ, srcWidth, srcHeight, destX, destZ, destWidth, destHeight)) {
            return this.cardinalDestination(level, srcX, srcZ);
        }
        const dest: StaticArray<i32> = this.naiveDestination(level, srcX, srcZ, srcWidth, srcHeight, destX, destZ, 1, 1);
        const dx: i32 = dest[0] >> 14 & 0x3fff;
        const dz: i32 = dest[0] & 0x3fff;
        if (this.isDiagonal(dx, dz, srcWidth, srcHeight, destX, destZ, destWidth, destHeight)) {
            return dest;
        }
        /* If we can interact from this coord(or overlap with the target), allow the pathfinder to exit. */
        if (this.intersects(dx, dz, srcWidth, srcHeight, destX, destZ, destWidth, destHeight)) {
            return dest;
        }
        let currX: i32 = dx;
        let currZ: i32 = dz;
        while (currX != destX && currZ != destZ) {
            const dx: i8 = <i8>Math.sign(destX - currX);
            const dz: i8 = <i8>Math.sign(destZ - currZ);
            if (this.stepValidator.canTravel(level, currX, currZ, dx, dz, srcWidth, blockAccessFlags, collision)) {
                currX += dx;
                currZ += dz;
            } else if (dx != 0 && this.stepValidator.canTravel(level, currX, currZ, dx, 0, srcWidth, blockAccessFlags, collision)) {
                currX += dx;
            } else if (dz != 0 && this.stepValidator.canTravel(level, currX, currZ, 0, dz, srcWidth, blockAccessFlags, collision)) {
                currZ += dz;
            } else {
                /* If we can't step anywhere, exit out, we've arrived. */
                break;
            }
        }
        return StaticArray.fromArray([((currZ) & 0x3fff) | (((currX) & 0x3fff) << 14) | ((level & 0x3) << 28)]);
    }

    /**
     * Fast way to check if two squares are intersecting.
     * @param srcX The starting SW X.
     * @param srcZ The starting SW Z.
     * @param srcWidth The width on the X axis.
     * @param srcHeight The length on the Z axis.
     * @param destX The ending SW X.
     * @param destZ The ending SW Z.
     * @param destWidth The end width on the X axis.
     * @param destHeight The end length on the Z axis.
     */
    @inline
    intersects(srcX: i32, srcZ: i32, srcWidth: i32, srcHeight: i32, destX: i32, destZ: i32, destWidth: i32, destHeight: i32): bool {
        const srcHorizontal: i32 = srcX + srcWidth;
        const srcVertical: i32 = srcZ + srcHeight;
        const destHorizontal: i32 = destX + destWidth;
        const destVertical: i32 = destZ + destHeight;
        return !(destX >= srcHorizontal || destHorizontal <= srcX || destZ >= srcVertical || destVertical <= srcZ);
    }

    @inline
    private isDiagonal(srcX: i32, srcZ: i32, srcWidth: i32, srcHeight: i32, destX: i32, destZ: i32, destWidth: i32, destHeight: i32): bool {
        if (srcX + srcWidth == destX && srcZ + srcHeight == destZ) {
            return true;
        }
        if (srcX - 1 == destX + destWidth - 1 && srcZ - 1 == destZ + destHeight - 1) {
            return true;
        }
        if (srcX + srcWidth == destX && srcZ - 1 == destZ + destHeight - 1) {
            return true;
        }
        return srcX - 1 == destX + destWidth - 1 && srcZ + srcHeight == destZ;
    }

    @inline
    private cardinalDestination(level: i32, srcX: i32, srcZ: i32): StaticArray<i32> {
        const direction: i32[] = NaivePathFinder.DIRECTIONS[<i32>Math.floor(Math.random() * NaivePathFinder.DIRECTIONS.length)];
        return StaticArray.fromArray([((srcZ + direction[1]) & 0x3fff) | (((srcX + direction[0]) & 0x3fff) << 14) | ((level & 0x3) << 28)]);
    }

    /**
     * Calculates coordinates for [sourceX]/[sourceZ] to move to interact with [targetX]/[targetZ]
     * We first determine the cardinal direction of the source relative to the target by comparing if
     * the source lies to the left or right of diagonal \ and anti-diagonal / lines.
     * \ <= North <= /
     *  +------------+  >
     *  |            |  East
     *  +------------+  <
     * / <= South <= \
     * We then further bisect the area into three section relative to the south-west tile (zero):
     * 1. Greater than zero: follow their diagonal until the target side is reached (clamped at the furthest most tile)
     * 2. Less than zero: zero minus the size of the source
     * 3. Equal to zero: move directly towards zero / the south-west coordinate
     *
     * <  \ 0 /   <   /
     *     +---------+
     *     |         |
     *     +---------+
     * This method is equivalent to returning the last coordinate in a sequence of steps towards south-west when moving
     * ordinal then cardinally until entity side comes into contact with another.
     */
    @inline
    private naiveDestination(level: i32, srcX: i32, srcZ: i32, srcWidth: i32, srcHeight: i32, destX: i32, destZ: i32, destWidth: i32, destHeight: i32): StaticArray<i32> {
        const diagonal: i32 = srcX - destX + (srcZ - destZ);
        const anti: i32 = srcX - destX - (srcZ - destZ);
        const southWestClockwise: bool = anti < 0;
        const northWestClockwise: bool = diagonal >= destHeight - 1 - (srcWidth - 1);
        const northEastClockwise: bool = anti > srcWidth - srcHeight;
        const southEastClockwise: bool = diagonal <= destWidth - 1 - (srcHeight - 1);

        if (southWestClockwise && !northWestClockwise) {
            // West
            let offZ: i32 = 0;
            if (diagonal >= -srcWidth) {
                offZ = this.coerceAtMost(diagonal + srcWidth, destHeight - 1);
            } else if (anti > -srcWidth) {
                offZ = -(srcWidth + anti);
            }
            return StaticArray.fromArray([((offZ + destZ) & 0x3fff) | (((-srcWidth + destX) & 0x3fff) << 14) | ((level & 0x3) << 28)]);
        } else if (northWestClockwise && !northEastClockwise) {
            // North
            let offX: i32 = 0;
            if (anti >= -destHeight) {
                offX = this.coerceAtMost(anti + destHeight, destWidth - 1);
            } else if (diagonal < destHeight) {
                offX = this.coerceAtLeast(diagonal - destHeight, -(srcWidth - 1));
            }
            return StaticArray.fromArray([((destHeight + destZ) & 0x3fff) | (((offX + destX) & 0x3fff) << 14) | ((level & 0x3) << 28)]);
        } else if (northEastClockwise && !southEastClockwise) {
            // East
            let offZ: i32 = 0;
            if (anti <= destWidth) {
                offZ = destHeight - anti;
            } else if (diagonal < destWidth) {
                offZ = this.coerceAtLeast(diagonal - destWidth, -(srcHeight - 1));
            }
            return StaticArray.fromArray([((offZ + destZ) & 0x3fff) | (((destWidth + destX) & 0x3fff) << 14) | ((level & 0x3) << 28)]);
        } else {
            if (!(southEastClockwise && !southWestClockwise)) {
                // South
                throw new Error(`Failed requirement. southEastClockwise was: ${southEastClockwise}, southWestClockwise was: ${southWestClockwise}.`);
            }
            let offX: i32 = 0;
            if (diagonal > -srcHeight) {
                offX = this.coerceAtMost(diagonal + srcHeight, destWidth - 1);
            } else if (anti < srcHeight) {
                offX = this.coerceAtLeast(anti - srcHeight, -(srcHeight - 1));
            }
            return StaticArray.fromArray([((-srcHeight + destZ) & 0x3fff) | (((offX + destX) & 0x3fff) << 14) | ((level & 0x3) << 28)]);
        }
    }

    /**
     * Ensures that this value is not greater than the specified maximumValue.
     */
    @inline
    private coerceAtMost(value: i32, maximumValue: i32): i32 {
        return value > maximumValue ? maximumValue : value;
    }

    /**
     * Ensures that this value is not less than the specified minimumValue.
     */
    @inline
    private coerceAtLeast(value: i32, minimumValue: i32): i32 {
        return value < minimumValue ? minimumValue : value;
    }
}
