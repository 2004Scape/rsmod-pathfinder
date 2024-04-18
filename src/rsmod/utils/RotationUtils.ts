@final
export default class RotationUtils {
    @inline
    static rotate(angle: i8, dimensionA: i8, dimensionB: i8): i8 {
        return (angle & 0x1) != 0 ? dimensionB : dimensionA;
    }

    @inline
    static rotateFlags(angle: i8, blockAccessFlags: i8): i8 {
        return angle == 0 ? blockAccessFlags : ((blockAccessFlags << angle) & 0xf) | (blockAccessFlags >> (4 - angle));
    }
}
