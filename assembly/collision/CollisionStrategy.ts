export enum CollisionType {
    NORMAL = 0,
    BLOCKED = 1,
    INDOORS = 2,
    OUTDOORS = 3,
    LINE_OF_SIGHT = 4
}

export interface CollisionStrategy {
    canMove(tileFlag: i32, blockFlag: i32): bool;
}