import CollisionFlagMap from './collision/CollisionFlagMap';
import Line from './Line';
import {CollisionFlag} from './flag/CollisionFlag';

export default class LinePathFinder {
    private readonly flags: CollisionFlagMap;

    constructor(flags: CollisionFlagMap) {
        this.flags = flags;
    }

    lineOfSight(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcSize: i32,
        destWidth: i32,
        destHeight: i32,
        extraFlag: i32
    ): Int32Array {
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
            true
        );
    }

    lineOfWalk(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcSize: i32,
        destWidth: i32,
        destHeight: i32,
        extraFlag: i32
    ): Int32Array {
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
            false
        );
    }

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
        flagObject: i32,
        los: bool
    ): Int32Array {
        const startX: i32 = Line.coordinate(srcX, destX, srcSize);
        const startZ: i32 = Line.coordinate(srcZ, destZ, srcSize);

        if (los && this.flags.isFlagged(startX, startZ, level, flagObject)) {
            return new Int32Array(0); // RayCast.FAILED;
        }

        const endX: i32 = Line.coordinate(destX, srcX, destWidth);
        const endZ: i32 = Line.coordinate(destZ, srcZ, destHeight);

        if (startX === endX && startZ === endZ) {
            return new Int32Array(0); // RayCast.EMPTY_SUCCESS;
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
            while (currX !== endX) {
                currX += offsetX;
                const currZ: i32 = Line.scaleDown(scaledZ);
                if (los && currX === endX && currZ === endZ) {
                    xFlags = (xFlags & ~CollisionFlag.LOC_PROJ_BLOCKER) | (xFlags & ~CollisionFlag.PLAYER);
                }
                if (this.flags.isFlagged(currX, currZ, level, xFlags)) {
                    const route: Int32Array = new Int32Array(coordinates.length);
                    for (let i: i32 = 0; i < coordinates.length; i++) {
                        route[i] = coordinates[i];
                    }
                    return route;
                    // return new RayCast(coordinates, coordinates.length > 0, false);
                }
                coordinates.push(((currX) & 0x3fff) | (((currZ) & 0x3fff) << 14) | ((level & 0x3) << 28));
                // coordinates.push(new RouteCoordinates(currX, currZ, level));

                scaledZ += tangent;

                const nextZ: i32 = Line.scaleDown(scaledZ);
                if (nextZ !== currZ) {
                    if (los && currX === endX && nextZ === endZ) {
                        zFlags = (zFlags & ~CollisionFlag.LOC_PROJ_BLOCKER) | (zFlags & ~CollisionFlag.PLAYER);
                    }
                    if (this.flags.isFlagged(currX, nextZ, level, zFlags)) {
                        const route: Int32Array = new Int32Array(coordinates.length);
                        for (let i: i32 = 0; i < coordinates.length; i++) {
                            route[i] = coordinates[i];
                        }
                        return route;
                        // return new RayCast(coordinates, coordinates.length > 0, false);
                    }
                    coordinates.push(((currX) & 0x3fff) | (((nextZ) & 0x3fff) << 14) | ((level & 0x3) << 28));
                    // coordinates.push(new RouteCoordinates(currX, nextZ, level));
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
                    zFlags = (zFlags & ~CollisionFlag.LOC_PROJ_BLOCKER) | (zFlags & ~CollisionFlag.PLAYER);
                }
                if (this.flags.isFlagged(currX, currZ, level, zFlags)) {
                    const route: Int32Array = new Int32Array(coordinates.length);
                    for (let i: i32 = 0; i < coordinates.length; i++) {
                        route[i] = coordinates[i];
                    }
                    return route;
                    // return new RayCast(coordinates, coordinates.length > 0, false);
                }
                coordinates.push(((currX) & 0x3fff) | (((currZ) & 0x3fff) << 14) | ((level & 0x3) << 28));
                // coordinates.push(new RouteCoordinates(currX, currZ, level));

                scaledX += tangent;

                const nextX: i32 = Line.scaleDown(scaledX);
                if (nextX !== currX) {
                    if (los && nextX === endX && currZ === endZ) {
                        xFlags = (xFlags & ~CollisionFlag.LOC_PROJ_BLOCKER) | (xFlags & ~CollisionFlag.PLAYER);
                    }
                    if (this.flags.isFlagged(nextX, currZ, level, xFlags)) {
                        const route: Int32Array = new Int32Array(coordinates.length);
                        for (let i: i32 = 0; i < coordinates.length; i++) {
                            route[i] = coordinates[i];
                        }
                        return route;
                        // return new RayCast(coordinates, coordinates.length > 0, false);
                    }
                    coordinates.push(((nextX) & 0x3fff) | (((currZ) & 0x3fff) << 14) | ((level & 0x3) << 28));
                    // coordinates.push(new RouteCoordinates(nextX, currZ, level));
                }
            }
        }
        const route: Int32Array = new Int32Array(coordinates.length);
        for (let i: i32 = 0; i < coordinates.length; i++) {
            route[i] = coordinates[i];
        }
        return route;
        // return new RayCast(coordinates, false, true);
    }
}
