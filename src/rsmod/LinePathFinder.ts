import CollisionFlagMap from './collision/CollisionFlagMap';
import Line from './Line';
import {CollisionFlag} from './flag/CollisionFlag';
import RouteCoordinates from './RouteCoordinates';

@final
export default class LinePathFinder {
    private static readonly EMPTY: StaticArray<i32> = new StaticArray(0);

    private readonly flags: CollisionFlagMap;

    constructor(flags: CollisionFlagMap) {
        this.flags = flags;
    }

    // prettier-ignore
    @inline
    lineOfSight(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcWidth: i32,
        srcHeight: i32,
        destWidth: i32,
        destHeight: i32,
        extraFlag: i32
    ): StaticArray<i32> {
        return this.rayCast(
            level,
            srcX,
            srcZ,
            destX,
            destZ,
            srcWidth,
            srcHeight,
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
    lineOfWalk(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcWidth: i32,
        srcHeight: i32,
        destWidth: i32,
        destHeight: i32,
        extraFlag: i32
    ): StaticArray<i32> {
        return this.rayCast(
            level,
            srcX,
            srcZ,
            destX,
            destZ,
            srcWidth,
            srcHeight,
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
        srcWidth: i32,
        srcHeight: i32,
        destWidth: i32,
        destHeight: i32,
        flagWest: i32,
        flagEast: i32,
        flagSouth: i32,
        flagNorth: i32,
        flagLoc: i32,
        flagProj: i32,
        los: bool
    ): StaticArray<i32> {
        const startX: i32 = Line.coordinate(srcX, destX, srcWidth);
        const startZ: i32 = Line.coordinate(srcZ, destZ, srcHeight);

        const endX: i32 = Line.coordinate(destX, srcX, destWidth);
        const endZ: i32 = Line.coordinate(destZ, srcZ, destHeight);

        if (startX == endX && startZ == endZ) {
            return LinePathFinder.EMPTY;
        }

        if (los && this.flags.isFlagged(startX, startZ, level, flagLoc)) {
            return LinePathFinder.EMPTY;
        }

        const deltaX: i32 = endX - startX;
        const deltaZ: i32 = endZ - startZ;
        const absoluteDeltaX: i32 = <i32>Math.abs(deltaX);
        const absoluteDeltaZ: i32 = <i32>Math.abs(deltaZ);

        const travelEast: bool = deltaX >= 0;
        const travelNorth: bool = deltaZ >= 0;

        let xFlags: i32 = travelEast ? flagWest : flagEast;
        let zFlags: i32 = travelNorth ? flagSouth : flagNorth;

        const coordinates: i32[] = [];
        if (absoluteDeltaX > absoluteDeltaZ) {
            const offsetX: i32 = travelEast ? 1 : -1;
            const offsetZ: i32 = travelNorth ? 0 : -1;

            let scaledZ: i32 = Line.scaleUp(startZ) + Line.HALF_TILE + offsetZ;
            const tangent: i32 = Line.scaleUp(deltaZ) / absoluteDeltaX;

            let currX: i32 = startX;
            while (currX != endX) {
                currX += offsetX;
                const currZ: i32 = Line.scaleDown(scaledZ);
                if (los && currX == endX && currZ == endZ) {
                    xFlags = xFlags & ~flagProj;
                }
                if (this.flags.isFlagged(currX, currZ, level, xFlags)) {
                    return LinePathFinder.EMPTY; // alternative
                }
                coordinates.push(RouteCoordinates.pack(level, currX, currZ));

                scaledZ += tangent;

                const nextZ: i32 = Line.scaleDown(scaledZ);
                if (nextZ != currZ) {
                    if (los && currX == endX && nextZ == endZ) {
                        zFlags = zFlags & ~flagProj;
                    }
                    if (this.flags.isFlagged(currX, nextZ, level, zFlags)) {
                        return LinePathFinder.EMPTY; // alternative
                    }
                    coordinates.push(RouteCoordinates.pack(level, currX, nextZ));
                }
            }
        } else {
            const offsetX: i32 = travelEast ? 0 : -1;
            const offsetZ: i32 = travelNorth ? 1 : -1;

            let scaledX: i32 = Line.scaleUp(startX) + Line.HALF_TILE + offsetX;
            const tangent: i32 = Line.scaleUp(deltaX) / absoluteDeltaZ;

            let currZ: i32 = startZ;
            while (currZ != endZ) {
                currZ += offsetZ;
                const currX: i32 = Line.scaleDown(scaledX);
                if (los && currX == endX && currZ == endZ) {
                    zFlags = zFlags & ~flagProj;
                }
                if (this.flags.isFlagged(currX, currZ, level, zFlags)) {
                    return LinePathFinder.EMPTY; // alternative
                }
                coordinates.push(RouteCoordinates.pack(level, currX, currZ));

                scaledX += tangent;

                const nextX: i32 = Line.scaleDown(scaledX);
                if (nextX != currX) {
                    if (los && nextX == endX && currZ == endZ) {
                        xFlags = xFlags & ~flagProj;
                    }
                    if (this.flags.isFlagged(nextX, currZ, level, xFlags)) {
                        return LinePathFinder.EMPTY; // alternative
                    }
                    coordinates.push(RouteCoordinates.pack(level, nextX, currZ));
                }
            }
        }
        const route: StaticArray<i32> = new StaticArray<i32>(coordinates.length);
        for (let i: i32 = 0; i < coordinates.length; i++) {
            unchecked(route[i] = coordinates[i]);
        }
        return route;
    }
}
