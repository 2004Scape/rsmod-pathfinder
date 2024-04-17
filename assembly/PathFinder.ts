import CollisionFlagMap from './collision/CollisionFlagMap';
import {CollisionStrategy} from './collision/CollisionStrategy';
import DirectionFlag from './flag/DirectionFlag';
import ReachStrategy from './reach/ReachStrategy';
import {CollisionFlag} from './flag/CollisionFlag';
import RotationUtils from './utils/RotationUtils';

export default class PathFinder {
    private static readonly DEFAULT_SEARCH_MAP_SIZE: i32 = 128;
    private static readonly DEFAULT_RING_BUFFER_SIZE: i32 = 4096;
    private static readonly DEFAULT_DISTANCE_VALUE: i32 = 99_999_999;
    private static readonly DEFAULT_SRC_DIRECTION_VALUE: i32 = 99;
    private static readonly MAX_ALTERNATIVE_ROUTE_LOWEST_COST: i32 = 1000;
    private static readonly MAX_ALTERNATIVE_ROUTE_SEEK_RANGE: i32 = 100;
    private static readonly MAX_ALTERNATIVE_ROUTE_DISTANCE_FROM_DESTINATION: i32 = 10;

    private readonly flags: CollisionFlagMap;
    private readonly searchMapSize: i32;
    private readonly ringBufferSize: i32;
    private readonly directions: StaticArray<i32>;
    private readonly distances: StaticArray<i32>;
    private readonly validLocalX: StaticArray<i32>;
    private readonly validLocalZ: StaticArray<i32>;

    private currLocalX: i32 = 0;
    private currLocalZ: i32 = 0;
    private bufReaderIndex: i32 = 0;
    private bufWriterIndex: i32 = 0;

    constructor(flags: CollisionFlagMap, searchMapSize: i32 = PathFinder.DEFAULT_SEARCH_MAP_SIZE, ringBufferSize: i32 = PathFinder.DEFAULT_RING_BUFFER_SIZE) {
        this.flags = flags;
        this.searchMapSize = searchMapSize;
        this.ringBufferSize = ringBufferSize;
        this.directions = new StaticArray<i32>(searchMapSize * searchMapSize);
        this.distances = new StaticArray<i32>(searchMapSize * searchMapSize).fill(PathFinder.DEFAULT_DISTANCE_VALUE);
        this.validLocalX = new StaticArray<i32>(ringBufferSize);
        this.validLocalZ = new StaticArray<i32>(ringBufferSize);
    }

    findPath(
        level: i32,
        srcX: i32,
        srcZ: i32,
        destX: i32,
        destZ: i32,
        srcSize: i32,
        destWidth: i32,
        destHeight: i32,
        angle: i32,
        shape: i32,
        moveNear: bool,
        blockAccessFlags: i32,
        maxWaypoints: i32,
        collision: CollisionStrategy
    ): Int32Array {
        if (!(srcX >= 0 && srcX <= 0x7fff && srcZ >= 0 && srcZ <= 0x7fff)) {
            throw new Error(`[findPath] Failed requirement. srcX was: ${srcX}, srcZ was: ${srcZ}.`);
        }
        if (!(destX >= 0 && destX <= 0x7fff && destZ >= 0 && destZ <= 0x7fff)) {
            throw new Error(`[findPath]Failed requirement. destX was: ${destX}, destZ was: ${destZ}.`);
        }
        if (!(level >= 0 && level <= 0x3)) {
            throw new Error(`[findPath]Failed requirement. level was: ${level}. must be 0-3.`);
        }
        this.reset();
        const baseX: i32 = srcX - this.searchMapSize / 2;
        const baseZ: i32 = srcZ - this.searchMapSize / 2;
        const localSrcX: i32 = srcX - baseX;
        const localSrcZ: i32 = srcZ - baseZ;
        const localDestX: i32 = destX - baseX;
        const localDestZ: i32 = destZ - baseZ;
        this.appendDirection(localSrcX, localSrcZ, PathFinder.DEFAULT_SRC_DIRECTION_VALUE, 0);

        let pathFound: bool;
        switch (srcSize) {
            case 1:
                pathFound = this.findPath1(baseX, baseZ, level, localDestX, localDestZ, destWidth, destHeight, srcSize, angle, shape, blockAccessFlags, collision);
                break;
            case 2:
                pathFound = this.findPath2(baseX, baseZ, level, localDestX, localDestZ, destWidth, destHeight, srcSize, angle, shape, blockAccessFlags, collision);
                break;
            default:
                pathFound = this.findPathN(baseX, baseZ, level, localDestX, localDestZ, destWidth, destHeight, srcSize, angle, shape, blockAccessFlags, collision);
                break;
        }
        if (!pathFound) {
            if (!moveNear) {
                return new Int32Array(0); // Route.FAILED;
            }
            const foundApproachPoint: bool = this.findClosestApproachPoint(localDestX, localDestZ, RotationUtils.rotate(angle, destWidth, destHeight), RotationUtils.rotate(angle, destHeight, destWidth));
            if (!foundApproachPoint) {
                return new Int32Array(0); // Route.FAILED;
            }
        }
        const waypoints: i32[] = [];
        let nextDir: i32 = unchecked(this.directions[this.localIndex(this.currLocalX, this.currLocalZ)]);
        let currDir: i32 = -1;

        for (let index: i32 = 0; index < this.directions.length; index++) {
            if (this.currLocalX === localSrcX && this.currLocalZ === localSrcZ) {
                break;
            }
            if (currDir !== nextDir) {
                currDir = nextDir;
                if (waypoints.length >= maxWaypoints) {
                    waypoints.pop();
                }
                waypoints.unshift(((baseZ + this.currLocalZ) & 0x3fff) | (((baseX + this.currLocalX) & 0x3fff) << 14) | ((level & 0x3) << 28));
            }
            if ((currDir & DirectionFlag.EAST) !== 0) {
                this.currLocalX++;
            } else if ((currDir & DirectionFlag.WEST) !== 0) {
                this.currLocalX--;
            }
            if ((currDir & DirectionFlag.NORTH) !== 0) {
                this.currLocalZ++;
            } else if ((currDir & DirectionFlag.SOUTH) !== 0) {
                this.currLocalZ--;
            }
            nextDir = unchecked(this.directions[this.localIndex(this.currLocalX, this.currLocalZ)]);
        }
        const route: Int32Array = new Int32Array(waypoints.length);
        for (let i: i32 = 0; i < waypoints.length; i++) {
            route[i] = waypoints[i];
        }
        return route;
    }

    private findPath1(
        baseX: i32,
        baseZ: i32,
        level: i32,
        localDestX: i32,
        localDestZ: i32,
        destWidth: i32,
        destHeight: i32,
        srcSize: i32,
        angle: i32,
        shape: i32,
        blockAccessFlags: i32,
        collision: CollisionStrategy
    ): bool {
        let x: i32;
        let z: i32;
        let clipFlag: i32;
        let dirFlag: i32;
        const relativeSearchSize: i32 = this.searchMapSize - 1;

        while (this.bufWriterIndex !== this.bufReaderIndex) {
            this.currLocalX = unchecked(this.validLocalX[this.bufReaderIndex]);
            this.currLocalZ = unchecked(this.validLocalZ[this.bufReaderIndex]);
            this.bufReaderIndex = (this.bufReaderIndex + 1) & (this.ringBufferSize - 1);

            const reached: bool = ReachStrategy.reached(this.flags, level, this.currLocalX + baseX, this.currLocalZ + baseZ, localDestX + baseX, localDestZ + baseZ, destWidth, destHeight, srcSize, angle, shape, blockAccessFlags);
            if (reached) {
                return true;
            }

            const nextDistance: i32 = unchecked(this.distances[this.localIndex(this.currLocalX, this.currLocalZ)]) + 1;

            /* east to west */
            x = this.currLocalX - 1;
            z = this.currLocalZ;
            clipFlag = CollisionFlag.BLOCK_WEST;
            dirFlag = DirectionFlag.EAST;
            if (this.currLocalX > 0 && unchecked(this.directions[this.localIndex(x, z)]) === 0 && collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), clipFlag)) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* west to east */
            x = this.currLocalX + 1;
            z = this.currLocalZ;
            clipFlag = CollisionFlag.BLOCK_EAST;
            dirFlag = DirectionFlag.WEST;
            if (this.currLocalX < relativeSearchSize && unchecked(this.directions[this.localIndex(x, z)]) === 0 && collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), clipFlag)) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* north to south  */
            x = this.currLocalX;
            z = this.currLocalZ - 1;
            clipFlag = CollisionFlag.BLOCK_SOUTH;
            dirFlag = DirectionFlag.NORTH;
            if (this.currLocalZ > 0 && unchecked(this.directions[this.localIndex(x, z)]) === 0 && collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), clipFlag)) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* south to north */
            x = this.currLocalX;
            z = this.currLocalZ + 1;
            clipFlag = CollisionFlag.BLOCK_NORTH;
            dirFlag = DirectionFlag.SOUTH;
            if (this.currLocalZ < relativeSearchSize && unchecked(this.directions[this.localIndex(x, z)]) === 0 && collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), clipFlag)) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* north-east to south-west */
            x = this.currLocalX - 1;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH_EAST;
            if (
                this.currLocalX > 0 &&
                this.currLocalZ > 0 &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ, level), CollisionFlag.BLOCK_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX, z, level), CollisionFlag.BLOCK_SOUTH)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* north-west to south-east */
            x = this.currLocalX + 1;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH_WEST;
            if (
                this.currLocalX < relativeSearchSize &&
                this.currLocalZ > 0 &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ, level), CollisionFlag.BLOCK_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX, z, level), CollisionFlag.BLOCK_SOUTH)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* south-east to north-west */
            x = this.currLocalX - 1;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH_EAST;
            if (
                this.currLocalX > 0 &&
                this.currLocalZ < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_NORTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ, level), CollisionFlag.BLOCK_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX, z, level), CollisionFlag.BLOCK_NORTH)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* south-west to north-east */
            x = this.currLocalX + 1;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH_WEST;
            if (
                this.currLocalX < relativeSearchSize &&
                this.currLocalZ < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_NORTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ, level), CollisionFlag.BLOCK_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX, z, level), CollisionFlag.BLOCK_NORTH)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }
        }
        return false;
    }

    private findPath2(
        baseX: i32,
        baseZ: i32,
        level: i32,
        localDestX: i32,
        localDestZ: i32,
        destWidth: i32,
        destHeight: i32,
        srcSize: i32,
        angle: i32,
        shape: i32,
        blockAccessFlags: i32,
        collision: CollisionStrategy
    ): bool {
        let x: i32;
        let z: i32;
        let dirFlag: i32;
        const relativeSearchSize: i32 = this.searchMapSize - 2;

        while (this.bufWriterIndex !== this.bufReaderIndex) {
            unchecked(this.currLocalX = this.validLocalX[this.bufReaderIndex]);
            unchecked(this.currLocalZ = this.validLocalZ[this.bufReaderIndex]);
            this.bufReaderIndex = (this.bufReaderIndex + 1) & (this.ringBufferSize - 1);

            const reached: bool = ReachStrategy.reached(this.flags, level, this.currLocalX + baseX, this.currLocalZ + baseZ, localDestX + baseX, localDestZ + baseZ, destWidth, destHeight, srcSize, angle, shape, blockAccessFlags);
            if (reached) {
                return true;
            }

            const nextDistance: i32 = unchecked(this.distances[this.localIndex(this.currLocalX, this.currLocalZ)]) + 1;

            /* east to west */
            x = this.currLocalX - 1;
            z = this.currLocalZ;
            dirFlag = DirectionFlag.EAST;
            if (
                this.currLocalX > 0 &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + 1, level), CollisionFlag.BLOCK_NORTH_WEST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* west to east */
            x = this.currLocalX + 1;
            z = this.currLocalZ;
            dirFlag = DirectionFlag.WEST;
            if (
                this.currLocalX < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 2, z, level), CollisionFlag.BLOCK_SOUTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 2, this.currLocalZ + 1, level), CollisionFlag.BLOCK_NORTH_EAST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* north to south  */
            x = this.currLocalX;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH;
            if (
                this.currLocalZ > 0 &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 1, z, level), CollisionFlag.BLOCK_SOUTH_EAST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* south to north */
            x = this.currLocalX;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH;
            if (
                this.currLocalZ < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + 2, level), CollisionFlag.BLOCK_NORTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 1, this.currLocalZ + 2, level), CollisionFlag.BLOCK_NORTH_EAST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* north-east to south-west */
            x = this.currLocalX - 1;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH_EAST;
            if (
                this.currLocalX > 0 &&
                this.currLocalZ > 0 &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX, z, level), CollisionFlag.BLOCK_NORTH_EAST_AND_WEST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* north-west to south-east */
            x = this.currLocalX + 1;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH_WEST;
            if (
                this.currLocalX < relativeSearchSize &&
                this.currLocalZ > 0 &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_NORTH_EAST_AND_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 2, z, level), CollisionFlag.BLOCK_SOUTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 2, this.currLocalZ, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* south-east to north-west */
            x = this.currLocalX - 1;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH_EAST;
            if (
                this.currLocalX > 0 &&
                this.currLocalZ < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + 2, level), CollisionFlag.BLOCK_NORTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX, this.currLocalZ + 2, level), CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }

            /* south-west to north-east */
            x = this.currLocalX + 1;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH_WEST;
            if (
                this.currLocalX < relativeSearchSize &&
                this.currLocalZ < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)] === 0) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + 2, level), CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 2, this.currLocalZ + 2, level), CollisionFlag.BLOCK_NORTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + 2, z, level), CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST)
            ) {
                this.appendDirection(x, z, dirFlag, nextDistance);
            }
        }
        return false;
    }

    private findPathN(
        baseX: i32,
        baseZ: i32,
        level: i32,
        localDestX: i32,
        localDestZ: i32,
        destWidth: i32,
        destHeight: i32,
        srcSize: i32,
        angle: i32,
        shape: i32,
        blockAccessFlags: i32,
        collision: CollisionStrategy
    ): bool {
        let x: i32;
        let z: i32;
        let dirFlag: i32;
        const relativeSearchSize: i32 = this.searchMapSize - srcSize;

        while (this.bufWriterIndex !== this.bufReaderIndex) {
            unchecked(this.currLocalX = this.validLocalX[this.bufReaderIndex]);
            unchecked(this.currLocalZ = this.validLocalZ[this.bufReaderIndex]);
            this.bufReaderIndex = (this.bufReaderIndex + 1) & (this.ringBufferSize - 1);

            const reached: bool = ReachStrategy.reached(this.flags, level, this.currLocalX + baseX, this.currLocalZ + baseZ, localDestX + baseX, localDestZ + baseZ, destWidth, destHeight, srcSize, angle, shape, blockAccessFlags);
            if (reached) {
                return true;
            }

            const nextDistance: i32 = unchecked(this.distances[this.localIndex(this.currLocalX, this.currLocalZ)]) + 1;

            /* east to west */
            x = this.currLocalX - 1;
            z = this.currLocalZ;
            dirFlag = DirectionFlag.EAST;
            if (
                this.currLocalX > 0 &&
                unchecked(this.directions[this.localIndex(x, z)]) === 0 &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + srcSize - 1, level), CollisionFlag.BLOCK_NORTH_WEST)
            ) {
                const clipFlag: i32 = CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize - 1; index++) {
                    if (!collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + index, level), clipFlag)) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }

            /* west to east */
            x = this.currLocalX + 1;
            z = this.currLocalZ;
            dirFlag = DirectionFlag.WEST;
            if (
                this.currLocalX < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)]) === 0 &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize, z, level), CollisionFlag.BLOCK_SOUTH_EAST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize, this.currLocalZ + srcSize - 1, level), CollisionFlag.BLOCK_NORTH_EAST)
            ) {
                const clipFlag: i32 = CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize - 1; index++) {
                    if (!collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize, this.currLocalZ + index, level), clipFlag)) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }

            /* north to south  */
            x = this.currLocalX;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH;
            if (
                this.currLocalZ > 0 &&
                unchecked(this.directions[this.localIndex(x, z)]) === 0 &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize - 1, z, level), CollisionFlag.BLOCK_SOUTH_EAST)
            ) {
                const clipFlag: i32 = CollisionFlag.BLOCK_NORTH_EAST_AND_WEST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize - 1; index++) {
                    if (!collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + index, z, level), clipFlag)) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }

            /* south to north */
            x = this.currLocalX;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH;
            if (
                this.currLocalZ < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)]) === 0 &&
                collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + srcSize, level), CollisionFlag.BLOCK_NORTH_WEST) &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize - 1, this.currLocalZ + srcSize, level), CollisionFlag.BLOCK_NORTH_EAST)
            ) {
                const clipFlag: i32 = CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize - 1; index++) {
                    if (!collision.canMove(this.collisionFlag(baseX, baseZ, x + index, this.currLocalZ + srcSize, level), clipFlag)) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }

            /* north-east to south-west */
            x = this.currLocalX - 1;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH_EAST;
            if (this.currLocalX > 0 && this.currLocalZ > 0 && unchecked(this.directions[this.localIndex(x, z)]) === 0 && collision.canMove(this.collisionFlag(baseX, baseZ, x, z, level), CollisionFlag.BLOCK_SOUTH_WEST)) {
                const clipFlag1: i32 = CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST;
                const clipFlag2: i32 = CollisionFlag.BLOCK_NORTH_EAST_AND_WEST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize; index++) {
                    if (!collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + index - 1, level), clipFlag1) || !collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + index - 1, z, level), clipFlag2)) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }

            /* north-west to south-east */
            x = this.currLocalX + 1;
            z = this.currLocalZ - 1;
            dirFlag = DirectionFlag.NORTH_WEST;
            if (this.currLocalX < relativeSearchSize && this.currLocalZ > 0 && unchecked(this.directions[this.localIndex(x, z)]) === 0 && collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize, z, level), CollisionFlag.BLOCK_SOUTH_EAST)) {
                const clipFlag1: i32 = CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST;
                const clipFlag2: i32 = CollisionFlag.BLOCK_NORTH_EAST_AND_WEST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize; index++) {
                    if (
                        !collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize, this.currLocalZ + index - 1, level), clipFlag1) ||
                        !collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + index, z, level), clipFlag2)
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }

            /* south-east to north-west */
            x = this.currLocalX - 1;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH_EAST;
            if (this.currLocalX > 0 && this.currLocalZ < relativeSearchSize && unchecked(this.directions[this.localIndex(x, z)]) === 0 && collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + srcSize, level), CollisionFlag.BLOCK_NORTH_WEST)) {
                const clipFlag1: i32 = CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST;
                const clipFlag2: i32 = CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize; index++) {
                    if (
                        !collision.canMove(this.collisionFlag(baseX, baseZ, x, this.currLocalZ + index, level), clipFlag1) ||
                        !collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + index - 1, this.currLocalZ + srcSize, level), clipFlag2)
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }

            /* south-west to north-east */
            x = this.currLocalX + 1;
            z = this.currLocalZ + 1;
            dirFlag = DirectionFlag.SOUTH_WEST;
            if (
                this.currLocalX < relativeSearchSize &&
                this.currLocalZ < relativeSearchSize &&
                unchecked(this.directions[this.localIndex(x, z)]) === 0 &&
                collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize, this.currLocalZ + srcSize, level), CollisionFlag.BLOCK_NORTH_EAST)
            ) {
                const clipFlag1: i32 = CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST;
                const clipFlag2: i32 = CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST;
                let blocked: bool = false;
                for (let index: i32 = 1; index < srcSize; index++) {
                    if (
                        !collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + index, this.currLocalZ + srcSize, level), clipFlag1) ||
                        !collision.canMove(this.collisionFlag(baseX, baseZ, this.currLocalX + srcSize, this.currLocalZ + index, level), clipFlag2)
                    ) {
                        blocked = true;
                        break;
                    }
                }
                if (!blocked) {
                    this.appendDirection(x, z, dirFlag, nextDistance);
                }
            }
        }
        return false;
    }

    private findClosestApproachPoint(localDestX: i32, localDestZ: i32, width: i32, height: i32): bool {
        let lowestCost: i32 = PathFinder.MAX_ALTERNATIVE_ROUTE_LOWEST_COST;
        let maxAlternativePath: i32 = PathFinder.MAX_ALTERNATIVE_ROUTE_SEEK_RANGE;
        const alternativeRouteRange: i32 = PathFinder.MAX_ALTERNATIVE_ROUTE_DISTANCE_FROM_DESTINATION;
        for (let x: i32 = localDestX - alternativeRouteRange; x <= localDestX + alternativeRouteRange; x++) {
            for (let z: i32 = localDestZ - alternativeRouteRange; z <= localDestZ + alternativeRouteRange; z++) {
                if (!(x >= 0 && x < this.searchMapSize) || !(z >= 0 && z < this.searchMapSize) || unchecked(this.distances[this.localIndex(x, z)]) >= PathFinder.MAX_ALTERNATIVE_ROUTE_SEEK_RANGE) {
                    continue;
                }

                let dx: i32 = 0;
                if (x < localDestX) {
                    dx = localDestX - x;
                } else if (x > localDestX + width - 1) {
                    dx = x - (width + localDestX - 1);
                }

                let dz: i32 = 0;
                if (z < localDestZ) {
                    dz = localDestZ - z;
                } else if (z > localDestZ + height - 1) {
                    dz = z - (height + localDestZ - 1);
                }
                const cost: i32 = dx * dx + dz * dz;
                if (cost < lowestCost || (cost === lowestCost && maxAlternativePath > unchecked(this.distances[this.localIndex(x, z)]))) {
                    this.currLocalX = x;
                    this.currLocalZ = z;
                    lowestCost = cost;
                    maxAlternativePath = unchecked(this.distances[this.localIndex(x, z)]);
                }
            }
        }
        return lowestCost !== PathFinder.MAX_ALTERNATIVE_ROUTE_LOWEST_COST;
    }

    @inline
    private localIndex(x: i32, z: i32): i32 {
        return x * this.searchMapSize + z;
    }

    private collisionFlag(baseX: i32, baseZ: i32, localX: i32, localZ: i32, level: i32): i32 {
        return this.flags.get(baseX + localX, baseZ + localZ, level);
    }

    private appendDirection(x: i32, z: i32, direction: i32, distance: i32): void {
        const index: i32 = this.localIndex(x, z);
        unchecked(this.directions[index] = direction);
        unchecked(this.distances[index] = distance);
        unchecked(this.validLocalX[this.bufWriterIndex] = x);
        unchecked(this.validLocalZ[this.bufWriterIndex] = z);
        this.bufWriterIndex = (this.bufWriterIndex + 1) & (this.ringBufferSize - 1);
    }

    private reset(): void {
        this.directions.fill(0);
        this.distances.fill(PathFinder.DEFAULT_DISTANCE_VALUE);
        this.bufReaderIndex = 0;
        this.bufWriterIndex = 0;
    }
}