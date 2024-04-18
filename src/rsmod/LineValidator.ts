import CollisionFlagMap from './collision/CollisionFlagMap';
import Line from './Line';
import {CollisionFlag} from './flag/CollisionFlag';

@final
export default class LineValidator {
    private readonly flags: CollisionFlagMap;

    constructor(flags: CollisionFlagMap) {
        this.flags = flags;
    }

    // prettier-ignore
    @inline
    hasLineOfSight(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcSize: i32,
        destWidth: i32,
        destHeight: i32,
        extraFlag: i32
    ): bool {
        return this.rayCast(
            level,
            srcX,
            srcZ,
            destX,
            destZ,
            srcSize,
            destWidth,
            destHeight,
            Line.SIGHT_BLOCKED_WEST | extraFlag,
            Line.SIGHT_BLOCKED_EAST | extraFlag,
            Line.SIGHT_BLOCKED_SOUTH | extraFlag,
            Line.SIGHT_BLOCKED_NORTH | extraFlag,
            CollisionFlag.LOC | extraFlag,
            CollisionFlag.LOC_PROJ_BLOCKER | extraFlag,
            true
        );
    }

    // prettier-ignore
    @inline
    hasLineOfWalk(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcSize: i32,
        destWidth: i32,
        destHeight: i32,
        extraFlag: i32
    ): bool {
        return this.rayCast(
            level,
            srcX,
            srcZ,
            destX,
            destZ,
            srcSize,
            destWidth,
            destHeight,
            Line.WALK_BLOCKED_WEST | extraFlag,
            Line.WALK_BLOCKED_EAST | extraFlag,
            Line.WALK_BLOCKED_SOUTH | extraFlag,
            Line.WALK_BLOCKED_NORTH | extraFlag,
            CollisionFlag.LOC | extraFlag,
            CollisionFlag.LOC_PROJ_BLOCKER | extraFlag,
            false
        );
    }

    // prettier-ignore
    @inline
    private rayCast(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcSize: i32,
        destWidth: i32,
        destHeight: i32,
        flagWest: i32,
        flagEast: i32,
        flagSouth: i32,
        flagNorth: i32,
        flagLoc: i32,
        flagProj: i32,
        los: bool
    ): bool {
        const startX: i32 = Line.coordinate(srcX, destX, srcSize);
        const startZ: i32 = Line.coordinate(srcZ, destZ, srcSize);

        if (los && this.flags.isFlagged(startX, startZ, level, flagLoc)) {
            return false;
        }

        const endX: i32 = Line.coordinate(destX, srcX, destWidth);
        const endZ: i32 = Line.coordinate(destZ, srcZ, destHeight);

        if (startX === endX && startZ === endZ) {
            return true;
        }

        const deltaX: i32 = endX - startX;
        const deltaZ: i32 = endZ - startZ;
        const absoluteDeltaX: i32 = <i32>Math.abs(deltaX);
        const absoluteDeltaZ: i32 = <i32>Math.abs(deltaZ);

        const travelEast: bool = deltaX >= 0;
        const travelNorth: bool = deltaZ >= 0;

        let xFlags: i32 = travelEast ? flagWest : flagEast;
        let zFlags: i32 = travelNorth ? flagSouth : flagNorth;

        if (absoluteDeltaX > absoluteDeltaZ) {
            const offsetX: i32 = travelEast ? 1 : -1;
            const offsetZ: i32 = travelNorth ? 0 : -1;

            let scaledZ: i32 = Line.scaleUp(startZ) + Line.HALF_TILE + offsetZ;
            const tangent: i32 = Line.scaleUp(deltaZ) / absoluteDeltaX;

            let currX: i32 = startX;
            while (currX !== endX) {
                currX += offsetX;
                const currZ: i32 = Line.scaleDown(scaledZ);
                if (los && currX === endX && currZ === endZ) {
                    xFlags = xFlags & ~flagProj;
                }
                if (this.flags.isFlagged(currX, currZ, level, xFlags)) {
                    return false;
                }

                scaledZ += tangent;

                const nextZ: i32 = Line.scaleDown(scaledZ);
                if (los && currX === endX && nextZ === endZ) {
                    zFlags = zFlags & ~flagProj;
                }
                if (nextZ !== currZ && this.flags.isFlagged(currX, nextZ, level, zFlags)) {
                    return false;
                }
            }
        } else {
            const offsetX: i32 = travelEast ? 0 : -1;
            const offsetZ: i32 = travelNorth ? 1 : -1;

            let scaledX: i32 = Line.scaleUp(startX) + Line.HALF_TILE + offsetX;
            const tangent: i32 = Line.scaleUp(deltaX) / absoluteDeltaZ;

            let currZ: i32 = startZ;
            while (currZ !== endZ) {
                currZ += offsetZ;
                const currX: i32 = Line.scaleDown(scaledX);
                if (los && currX === endX && currZ === endZ) {
                    zFlags = zFlags & ~flagProj;
                }
                if (this.flags.isFlagged(currX, currZ, level, zFlags)) {
                    return false;
                }

                scaledX += tangent;

                const nextX: i32 = Line.scaleDown(scaledX);
                if (los && nextX === endX && currZ === endZ) {
                    xFlags = xFlags & ~flagProj;
                }
                if (nextX !== currX && this.flags.isFlagged(nextX, currZ, level, xFlags)) {
                    return false;
                }
            }
        }
        return true;
    }
}
