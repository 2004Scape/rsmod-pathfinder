@final
export default class DirectionFlag {
    @inline static readonly NORTH: i8 = 0x1;
    @inline static readonly EAST: i8 = 0x2;
    @inline static readonly SOUTH: i8 = 0x4;
    @inline static readonly WEST: i8 = 0x8;

    @inline static readonly SOUTH_WEST: i8 = DirectionFlag.WEST | DirectionFlag.SOUTH;
    @inline static readonly NORTH_WEST: i8 = DirectionFlag.WEST | DirectionFlag.NORTH;
    @inline static readonly SOUTH_EAST: i8 = DirectionFlag.EAST | DirectionFlag.SOUTH;
    @inline static readonly NORTH_EAST: i8 = DirectionFlag.EAST | DirectionFlag.NORTH;
}
