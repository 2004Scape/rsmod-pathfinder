@final
export default class RotationUtils {
    @inline
    static rotate(angle: i32, dimensionA: i32, dimensionB: i32): i32 {
        return (angle & 0x1) != 0 ? dimensionB : dimensionA;
    }

    @inline
    static rotateFlags(angle: i32, blockAccessFlags: i32): i32 {
        return angle == 0 ? blockAccessFlags : ((blockAccessFlags << angle) & 0xf) | (blockAccessFlags >> (4 - angle));
    }
}
