@final
export default class DirectionFlag {
    @inline static readonly NORTH: i32 = 0x1;
    @inline static readonly EAST: i32 = 0x2;
    @inline static readonly SOUTH: i32 = 0x4;
    @inline static readonly WEST: i32 = 0x8;

    @inline static readonly SOUTH_WEST: i32 = DirectionFlag.WEST | DirectionFlag.SOUTH;
    @inline static readonly NORTH_WEST: i32 = DirectionFlag.WEST | DirectionFlag.NORTH;
    @inline static readonly SOUTH_EAST: i32 = DirectionFlag.EAST | DirectionFlag.SOUTH;
    @inline static readonly NORTH_EAST: i32 = DirectionFlag.EAST | DirectionFlag.NORTH;
}
