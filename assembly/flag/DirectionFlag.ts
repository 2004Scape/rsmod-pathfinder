export default class DirectionFlag {
    static readonly NORTH: i32 = 0x1;
    static readonly EAST: i32 = 0x2;
    static readonly SOUTH: i32 = 0x4;
    static readonly WEST: i32 = 0x8;

    static readonly SOUTH_WEST: i32 = DirectionFlag.WEST | DirectionFlag.SOUTH;
    static readonly NORTH_WEST: i32 = DirectionFlag.WEST | DirectionFlag.NORTH;
    static readonly SOUTH_EAST: i32 = DirectionFlag.EAST | DirectionFlag.SOUTH;
    static readonly NORTH_EAST: i32 = DirectionFlag.EAST | DirectionFlag.NORTH;
}