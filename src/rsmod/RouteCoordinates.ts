@final
export default class RouteCoordinates {
    @inline
    static pack(level: i32, x: i32, z: i32): i32 {
        return (z & 0x3fff) | ((x & 0x3fff) << 14) | ((level & 0x3) << 28);
    }

    @inline
    static level(packed: i32): i32 {
        return (packed >> 28) & 0x3;
    }

    @inline
    static x(packed: i32): i32 {
        return (packed >> 14) & 0x3fff;
    }

    @inline
    static z(packed: i32): i32 {
        return packed & 0x3fff;
    }
}
