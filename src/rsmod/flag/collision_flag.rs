#![allow(non_camel_case_types)]

use wasm_bindgen::prelude::wasm_bindgen;

#[repr(u32)]
#[derive(Clone, PartialEq, Copy, Debug)]
#[wasm_bindgen]
pub enum CollisionFlag {
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
    FLOOR_BLOCKED = 0x240000,

    WALK_BLOCKED = 0x240100,

    /* Mixed masks of the above flags */
    BLOCK_WEST = 0x240108,
    BLOCK_EAST = 0x240180,
    BLOCK_SOUTH = 0x240102,
    BLOCK_NORTH = 0x240120,

    BLOCK_SOUTH_WEST = 0x24010E,
    BLOCK_SOUTH_EAST = 0x240183,
    BLOCK_NORTH_WEST = 0x240138,
    BLOCK_NORTH_EAST = 0x2401E0,
    BLOCK_NORTH_AND_SOUTH_EAST = 0x24013E,
    BLOCK_NORTH_AND_SOUTH_WEST = 0x2401E3,
    BLOCK_NORTH_EAST_AND_WEST = 0x24018F,
    BLOCK_SOUTH_EAST_AND_WEST = 0x2401F8,

    /* Route blocker flags. These are used in ~550+ clients to generate paths through bankers and such. */
    BLOCK_WEST_ROUTE_BLOCKER = 0x2260000,
    BLOCK_EAST_ROUTE_BLOCKER = 0x20260000,
    BLOCK_SOUTH_ROUTE_BLOCKER = 0x10878976,
    BLOCK_NORTH_ROUTE_BLOCKER = 0x8260000,

    BLOCK_SOUTH_WEST_ROUTE_BLOCKER = 0x43A40000,
    BLOCK_SOUTH_EAST_ROUTE_BLOCKER = 0x60E40000,
    BLOCK_NORTH_WEST_ROUTE_BLOCKER = 0x4E240000,
    BLOCK_NORTH_EAST_ROUTE_BLOCKER = 0x78240000,

    BLOCK_NORTH_AND_SOUTH_EAST_ROUTE_BLOCKER = 0x4FA40000,
    BLOCK_NORTH_AND_SOUTH_WEST_ROUTE_BLOCKER = 0x78E40000,
    BLOCK_NORTH_EAST_AND_WEST_ROUTE_BLOCKER = 0x63E40000,
    BLOCK_SOUTH_EAST_AND_WEST_ROUTE_BLOCKER = 0x7E240000,

    NULL = 0x7FFFFFFF,
}
