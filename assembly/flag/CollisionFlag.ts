export enum CollisionFlag {
    NULL = 0xffffffff, // -1
    OPEN = 0x0,
    WALL_NORTH_WEST = 0x1,
    WALL_NORTH = 0x2,
    WALL_NORTH_EAST = 0x4,
    WALL_EAST = 0x8,
    WALL_SOUTH_EAST = 0x10,
    WALL_SOUTH = 0x20,
    WALL_SOUTH_WEST = 0x40,
    WALL_WEST = 0x80,
    LOC = 0x100,
    WALL_NORTH_WEST_PROJ_BLOCKER = 0x200,
    WALL_NORTH_PROJ_BLOCKER = 0x400,
    WALL_NORTH_EAST_PROJ_BLOCKER = 0x800,
    WALL_EAST_PROJ_BLOCKER = 0x1000,
    WALL_SOUTH_EAST_PROJ_BLOCKER = 0x2000,
    WALL_SOUTH_PROJ_BLOCKER = 0x4000,
    WALL_SOUTH_WEST_PROJ_BLOCKER = 0x8000,
    WALL_WEST_PROJ_BLOCKER = 0x10000,
    LOC_PROJ_BLOCKER = 0x20000,
    FLOOR_DECORATION = 0x40000,

    /**
     * Custom flag dedicated to blocking NPCs.
     * It should be noted that this is a custom flag, and you do not need to use this.
     * The pathfinder takes the flag as a custom option, so you may use any other flag, this just defines
     * a reliable constant to use
     */
    NPC = 0x80000,

    /**
     * Custom flag dedicated to blocking players, projectiles as well as NPCs.
     * An example of a monster to set this flag is Brawler. Note that it is unclear if this flag
     * prevents NPCs, as there is a separate flag option for it.
     * This flag is similar to the one above, except it's strictly for NPCs.
     */
    PLAYER = 0x100000,

    FLOOR = 0x200000,
    WALL_NORTH_WEST_ROUTE_BLOCKER = 0x400000,
    WALL_NORTH_ROUTE_BLOCKER = 0x800000,
    WALL_NORTH_EAST_ROUTE_BLOCKER = 0x1000000,
    WALL_EAST_ROUTE_BLOCKER = 0x2000000,
    WALL_SOUTH_EAST_ROUTE_BLOCKER = 0x4000000,
    WALL_SOUTH_ROUTE_BLOCKER = 0x8000000,
    WALL_SOUTH_WEST_ROUTE_BLOCKER = 0x10000000,
    WALL_WEST_ROUTE_BLOCKER = 0x20000000,
    LOC_ROUTE_BLOCKER = 0x40000000,

    /**
     * Roof flag, used to bind NPCs to not leave the buildings they spawn in. This is a custom flag.
     */
    ROOF = 0x80000000,

    /* A shorthand combination of both the floor flags. */
    FLOOR_BLOCKED = CollisionFlag.FLOOR | CollisionFlag.FLOOR_DECORATION,

    WALK_BLOCKED = CollisionFlag.LOC | CollisionFlag.FLOOR_BLOCKED,

    /* Mixed masks of the above flags */
    BLOCK_WEST = CollisionFlag.WALL_EAST | CollisionFlag.WALK_BLOCKED,
    BLOCK_EAST = CollisionFlag.WALL_WEST | CollisionFlag.WALK_BLOCKED,
    BLOCK_SOUTH = CollisionFlag.WALL_NORTH | CollisionFlag.WALK_BLOCKED,
    BLOCK_NORTH = CollisionFlag.WALL_SOUTH | CollisionFlag.WALK_BLOCKED,

    BLOCK_SOUTH_WEST = CollisionFlag.WALL_NORTH | CollisionFlag.WALL_NORTH_EAST | CollisionFlag.WALL_EAST | CollisionFlag.WALK_BLOCKED,
    BLOCK_SOUTH_EAST = CollisionFlag.WALL_NORTH_WEST | CollisionFlag.WALL_NORTH | CollisionFlag.WALL_WEST | CollisionFlag.WALK_BLOCKED,
    BLOCK_NORTH_WEST = CollisionFlag.WALL_EAST | CollisionFlag.WALL_SOUTH_EAST | CollisionFlag.WALL_SOUTH | CollisionFlag.WALK_BLOCKED,
    BLOCK_NORTH_EAST = CollisionFlag.WALL_SOUTH | CollisionFlag.WALL_SOUTH_WEST | CollisionFlag.WALL_WEST | CollisionFlag.WALK_BLOCKED,
    BLOCK_NORTH_AND_SOUTH_EAST = CollisionFlag.WALL_NORTH | CollisionFlag.WALL_NORTH_EAST | CollisionFlag.WALL_EAST | CollisionFlag.WALL_SOUTH_EAST | CollisionFlag.WALL_SOUTH | CollisionFlag.WALK_BLOCKED,
    BLOCK_NORTH_AND_SOUTH_WEST = CollisionFlag.WALL_NORTH_WEST | CollisionFlag.WALL_NORTH | CollisionFlag.WALL_SOUTH | CollisionFlag.WALL_SOUTH_WEST | CollisionFlag.WALL_WEST | CollisionFlag.WALK_BLOCKED,
    BLOCK_NORTH_EAST_AND_WEST = CollisionFlag.WALL_NORTH_WEST | CollisionFlag.WALL_NORTH | CollisionFlag.WALL_NORTH_EAST | CollisionFlag.WALL_EAST | CollisionFlag.WALL_WEST | CollisionFlag.WALK_BLOCKED,
    BLOCK_SOUTH_EAST_AND_WEST = CollisionFlag.WALL_EAST | CollisionFlag.WALL_SOUTH_EAST | CollisionFlag.WALL_SOUTH | CollisionFlag.WALL_SOUTH_WEST | CollisionFlag.WALL_WEST | CollisionFlag.WALK_BLOCKED,

    /* Route blocker flags. These are used in ~550+ clients to generate paths through bankers and such. */
    BLOCK_WEST_ROUTE_BLOCKER = CollisionFlag.WALL_EAST_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_EAST_ROUTE_BLOCKER = CollisionFlag.WALL_WEST_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_SOUTH_ROUTE_BLOCKER = CollisionFlag.WALL_NORTH_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_NORTH_ROUTE_BLOCKER = CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_SOUTH_WEST_ROUTE_BLOCKER = CollisionFlag.WALL_NORTH_ROUTE_BLOCKER | CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER | CollisionFlag.WALL_EAST_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_SOUTH_EAST_ROUTE_BLOCKER = CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER | CollisionFlag.WALL_NORTH_ROUTE_BLOCKER | CollisionFlag.WALL_WEST_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_NORTH_WEST_ROUTE_BLOCKER = CollisionFlag.WALL_EAST_ROUTE_BLOCKER | CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER | CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_NORTH_EAST_ROUTE_BLOCKER = CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER | CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER | CollisionFlag.WALL_WEST_ROUTE_BLOCKER | CollisionFlag.LOC_ROUTE_BLOCKER | CollisionFlag.FLOOR_BLOCKED,
    BLOCK_NORTH_AND_SOUTH_EAST_ROUTE_BLOCKER =
        CollisionFlag.WALL_NORTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER |
        CollisionFlag.LOC_ROUTE_BLOCKER |
        CollisionFlag.FLOOR_BLOCKED,
    BLOCK_NORTH_AND_SOUTH_WEST_ROUTE_BLOCKER =
        CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_WEST_ROUTE_BLOCKER |
        CollisionFlag.LOC_ROUTE_BLOCKER |
        CollisionFlag.FLOOR_BLOCKED,
    BLOCK_NORTH_EAST_AND_WEST_ROUTE_BLOCKER =
        CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_WEST_ROUTE_BLOCKER |
        CollisionFlag.LOC_ROUTE_BLOCKER |
        CollisionFlag.FLOOR_BLOCKED,
    BLOCK_SOUTH_EAST_AND_WEST_ROUTE_BLOCKER =
        CollisionFlag.WALL_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER |
        CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER |
        CollisionFlag.WALL_WEST_ROUTE_BLOCKER |
        CollisionFlag.LOC_ROUTE_BLOCKER |
        CollisionFlag.FLOOR_BLOCKED,
}
