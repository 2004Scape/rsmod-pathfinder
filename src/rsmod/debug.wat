(module
 (type $0 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func (param i32 i32 i32 i32 i32)))
 (type $3 (func (param i32 i32)))
 (type $4 (func (param i32 i32) (result i32)))
 (type $5 (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $6 (func (param i32 i32 i32 i32)))
 (type $7 (func))
 (type $8 (func (param i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $9 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $10 (func (param i32 i32 i32 i32 i32 i32 i32)))
 (type $11 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $12 (func (param i32 i32 i32) (result i32)))
 (type $13 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $14 (func (param i32 i32 i32 i32) (result i32)))
 (type $15 (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
 (type $16 (func (param i32)))
 (type $17 (func (param i32 i32 i64)))
 (type $18 (func (param i32 i32 i32)))
 (type $19 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $20 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $21 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "console.log" (func $~lib/bindings/dom/console.log (param i32)))
 (global $assembly/index/flags (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $assembly/Line/Line.HALF_TILE (mut i32) (i32.const 0))
 (global $assembly/index/linePathFinder (mut i32) (i32.const 0))
 (global $assembly/index/lineValidator (mut i32) (i32.const 0))
 (global $assembly/LinePathFinder/LinePathFinder.EMPTY (mut i32) (i32.const 0))
 (global $assembly/collision/CollisionStrategies/CollisionStrategies.LINE_OF_SIGHT (mut i32) (i32.const 0))
 (global $assembly/collision/CollisionStrategies/CollisionStrategies.OUTDOORS (mut i32) (i32.const 0))
 (global $assembly/collision/CollisionStrategies/CollisionStrategies.INDOORS (mut i32) (i32.const 0))
 (global $assembly/collision/CollisionStrategies/CollisionStrategies.BLOCKED (mut i32) (i32.const 0))
 (global $assembly/collision/CollisionStrategies/CollisionStrategies.NORMAL (mut i32) (i32.const 0))
 (global $assembly/PathFinder/PathFinder.EMPTY (mut i32) (i32.const 0))
 (global $assembly/index/stepValidator (mut i32) (i32.const 0))
 (global $assembly/index/pathfinder (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/fromSpace (mut i32) (i32.const 0))
 (global $assembly/LocShape/LocShape.GROUND_DECOR i32 (i32.const 22))
 (global $assembly/LocShape/LocShape.ROOFEDGE_SQUARE_CORNER i32 (i32.const 21))
 (global $assembly/LocShape/LocShape.ROOFEDGE_L i32 (i32.const 20))
 (global $assembly/LocShape/LocShape.ROOFEDGE_DIAGONAL_CORNER i32 (i32.const 19))
 (global $assembly/LocShape/LocShape.ROOFEDGE_STRAIGHT i32 (i32.const 18))
 (global $assembly/LocShape/LocShape.ROOF_FLAT i32 (i32.const 17))
 (global $assembly/LocShape/LocShape.ROOF_L_CONVEX i32 (i32.const 16))
 (global $assembly/LocShape/LocShape.ROOF_L_CONCAVE i32 (i32.const 15))
 (global $assembly/LocShape/LocShape.ROOF_DIAGONAL i32 (i32.const 14))
 (global $assembly/LocShape/LocShape.ROOF_DIAGONAL_WITH_ROOFEDGE i32 (i32.const 13))
 (global $assembly/LocShape/LocShape.ROOF_STRAIGHT i32 (i32.const 12))
 (global $assembly/LocShape/LocShape.CENTREPIECE_DIAGONAL i32 (i32.const 11))
 (global $assembly/LocShape/LocShape.CENTREPIECE_STRAIGHT i32 (i32.const 10))
 (global $assembly/LocShape/LocShape.WALL_DIAGONAL i32 (i32.const 9))
 (global $assembly/LocShape/LocShape.WALLDECOR_DIAGONAL_BOTH i32 (i32.const 8))
 (global $assembly/LocShape/LocShape.WALLDECOR_DIAGONAL_NOOFFSET i32 (i32.const 7))
 (global $assembly/LocShape/LocShape.WALLDECOR_DIAGONAL_OFFSET i32 (i32.const 6))
 (global $assembly/LocShape/LocShape.WALLDECOR_STRAIGHT_OFFSET i32 (i32.const 5))
 (global $assembly/LocShape/LocShape.WALLDECOR_STRAIGHT_NOOFFSET i32 (i32.const 4))
 (global $assembly/LocShape/LocShape.WALL_SQUARE_CORNER i32 (i32.const 3))
 (global $assembly/LocShape/LocShape.WALL_L i32 (i32.const 2))
 (global $assembly/LocShape/LocShape.WALL_DIAGONAL_CORNER i32 (i32.const 1))
 (global $assembly/LocShape/LocShape.WALL_STRAIGHT i32 (i32.const 0))
 (global $assembly/LocAngle/LocAngle.SOUTH i32 (i32.const 3))
 (global $assembly/LocAngle/LocAngle.EAST i32 (i32.const 2))
 (global $assembly/LocAngle/LocAngle.NORTH i32 (i32.const 1))
 (global $assembly/LocAngle/LocAngle.WEST i32 (i32.const 0))
 (global $assembly/collision/CollisionStrategy/CollisionType.LINE_OF_SIGHT i32 (i32.const 4))
 (global $assembly/collision/CollisionStrategy/CollisionType.OUTDOORS i32 (i32.const 3))
 (global $assembly/collision/CollisionStrategy/CollisionType.INDOORS i32 (i32.const 2))
 (global $assembly/collision/CollisionStrategy/CollisionType.BLOCKED i32 (i32.const 1))
 (global $assembly/collision/CollisionStrategy/CollisionType.NORMAL i32 (i32.const 0))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST_ROUTE_BLOCKER i32 (i32.const 2116288512))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST_AND_WEST_ROUTE_BLOCKER i32 (i32.const 1675886592))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST_ROUTE_BLOCKER i32 (i32.const 2028208128))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST_ROUTE_BLOCKER i32 (i32.const 1336147968))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST_ROUTE_BLOCKER i32 (i32.const 2015625216))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_WEST_ROUTE_BLOCKER i32 (i32.const 1310982144))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST_ROUTE_BLOCKER i32 (i32.const 1625554944))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_WEST_ROUTE_BLOCKER i32 (i32.const 1134821376))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_ROUTE_BLOCKER i32 (i32.const 1210318848))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_ROUTE_BLOCKER i32 (i32.const 1084489728))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_EAST_ROUTE_BLOCKER i32 (i32.const 1612972032))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_WEST_ROUTE_BLOCKER i32 (i32.const 1109655552))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST i32 (i32.const 2359800))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST_AND_WEST i32 (i32.const 2359695))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST i32 (i32.const 2359779))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST i32 (i32.const 2359614))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST i32 (i32.const 2359776))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_WEST i32 (i32.const 2359608))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST i32 (i32.const 2359683))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_WEST i32 (i32.const 2359566))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH i32 (i32.const 2359584))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH i32 (i32.const 2359554))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_EAST i32 (i32.const 2359680))
 (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_WEST i32 (i32.const 2359560))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALK_BLOCKED i32 (i32.const 2359552))
 (global $assembly/flag/CollisionFlag/CollisionFlag.FLOOR_BLOCKED i32 (i32.const 2359296))
 (global $assembly/flag/CollisionFlag/CollisionFlag.ROOF i32 (i32.const -2147483648))
 (global $assembly/flag/CollisionFlag/CollisionFlag.LOC_ROUTE_BLOCKER i32 (i32.const 1073741824))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_WEST_ROUTE_BLOCKER i32 (i32.const 536870912))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER i32 (i32.const 268435456))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER i32 (i32.const 134217728))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER i32 (i32.const 67108864))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_EAST_ROUTE_BLOCKER i32 (i32.const 33554432))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER i32 (i32.const 16777216))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_ROUTE_BLOCKER i32 (i32.const 8388608))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER i32 (i32.const 4194304))
 (global $assembly/flag/CollisionFlag/CollisionFlag.FLOOR i32 (i32.const 2097152))
 (global $assembly/flag/CollisionFlag/CollisionFlag.PLAYER i32 (i32.const 1048576))
 (global $assembly/flag/CollisionFlag/CollisionFlag.NPC i32 (i32.const 524288))
 (global $assembly/flag/CollisionFlag/CollisionFlag.FLOOR_DECORATION i32 (i32.const 262144))
 (global $assembly/flag/CollisionFlag/CollisionFlag.LOC_PROJ_BLOCKER i32 (i32.const 131072))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_WEST_PROJ_BLOCKER i32 (i32.const 65536))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_WEST_PROJ_BLOCKER i32 (i32.const 32768))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_PROJ_BLOCKER i32 (i32.const 16384))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_EAST_PROJ_BLOCKER i32 (i32.const 8192))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_EAST_PROJ_BLOCKER i32 (i32.const 4096))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_EAST_PROJ_BLOCKER i32 (i32.const 2048))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_PROJ_BLOCKER i32 (i32.const 1024))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_WEST_PROJ_BLOCKER i32 (i32.const 512))
 (global $assembly/flag/CollisionFlag/CollisionFlag.LOC i32 (i32.const 256))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_WEST i32 (i32.const 128))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_WEST i32 (i32.const 64))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH i32 (i32.const 32))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_EAST i32 (i32.const 16))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_EAST i32 (i32.const 8))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_EAST i32 (i32.const 4))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH i32 (i32.const 2))
 (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_WEST i32 (i32.const 1))
 (global $assembly/flag/CollisionFlag/CollisionFlag.OPEN i32 (i32.const 0))
 (global $assembly/flag/CollisionFlag/CollisionFlag.NULL i32 (i32.const -1))
 (memory $0 1)
 (data $0 (i32.const 1036) ",")
 (data $0.1 (i32.const 1048) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $1 (i32.const 1084) "<")
 (data $1.1 (i32.const 1096) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $2 (i32.const 1148) "<")
 (data $2.1 (i32.const 1160) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $3 (i32.const 1212) "<")
 (data $3.1 (i32.const 1224) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00c\00m\00s\00.\00t\00s")
 (data $4 (i32.const 1276) "<")
 (data $4.1 (i32.const 1288) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $6 (i32.const 1372) "|")
 (data $6.1 (i32.const 1384) "\02\00\00\00l\00\00\00[\00f\00i\00n\00d\00P\00a\00t\00h\00]\00 \00F\00a\00i\00l\00e\00d\00 \00r\00e\00q\00u\00i\00r\00e\00m\00e\00n\00t\00.\00 \00c\00o\00l\00l\00i\00s\00i\00o\00n\00S\00t\00r\00a\00t\00e\00g\00y\00 \00w\00a\00s\00:\00 ")
 (data $7 (i32.const 1500) ",")
 (data $7.1 (i32.const 1512) "\02\00\00\00\1c\00\00\00.\00 \00m\00u\00s\00t\00 \00b\00e\00 \000\00-\004\00.")
 (data $8 (i32.const 1548) "\1c\00\00\00\03\00\00\00\00\00\00\00\11\00\00\00\0c\00\00\00p\05\00\00\00\00\00\00\f0\05")
 (data $9 (i32.const 1580) "|")
 (data $9.1 (i32.const 1592) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $10 (i32.const 1708) "<")
 (data $10.1 (i32.const 1720) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $11 (i32.const 1772) "\1c")
 (data $11.1 (i32.const 1784) "\02\00\00\00\02\00\00\000")
 (data $12 (i32.const 1804) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
 (data $13 (i32.const 2204) "\1c\04")
 (data $13.1 (i32.const 2216) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
 (data $14 (i32.const 3260) "\\")
 (data $14.1 (i32.const 3272) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $15 (i32.const 3356) "\1c")
 (data $15.1 (i32.const 3368) "\02")
 (data $16 (i32.const 3388) "<")
 (data $16.1 (i32.const 3400) "\02\00\00\00\"\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00d\00e\00x\00.\00t\00s")
 (data $17 (i32.const 3452) "l")
 (data $17.1 (i32.const 3464) "\02\00\00\00R\00\00\00[\00f\00i\00n\00d\00P\00a\00t\00h\00]\00 \00F\00a\00i\00l\00e\00d\00 \00r\00e\00q\00u\00i\00r\00e\00m\00e\00n\00t\00.\00 \00s\00r\00c\00X\00 \00w\00a\00s\00:\00 ")
 (data $18 (i32.const 3564) ",")
 (data $18.1 (i32.const 3576) "\02\00\00\00\18\00\00\00,\00 \00s\00r\00c\00Z\00 \00w\00a\00s\00:\00 ")
 (data $19 (i32.const 3612) "\1c")
 (data $19.1 (i32.const 3624) "\02\00\00\00\02\00\00\00.")
 (data $20 (i32.const 3644) ",\00\00\00\03\00\00\00\00\00\00\00\11\00\00\00\14\00\00\00\90\r\00\00\00\00\00\00\00\0e\00\00\00\00\00\000\0e")
 (data $21 (i32.const 3692) "<")
 (data $21.1 (i32.const 3704) "\02\00\00\00,\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00P\00a\00t\00h\00F\00i\00n\00d\00e\00r\00.\00t\00s")
 (data $22 (i32.const 3756) "l")
 (data $22.1 (i32.const 3768) "\02\00\00\00T\00\00\00[\00f\00i\00n\00d\00P\00a\00t\00h\00]\00 \00F\00a\00i\00l\00e\00d\00 \00r\00e\00q\00u\00i\00r\00e\00m\00e\00n\00t\00.\00 \00d\00e\00s\00t\00X\00 \00w\00a\00s\00:\00 ")
 (data $23 (i32.const 3868) ",")
 (data $23.1 (i32.const 3880) "\02\00\00\00\1a\00\00\00,\00 \00d\00e\00s\00t\00Z\00 \00w\00a\00s\00:\00 ")
 (data $24 (i32.const 3916) ",\00\00\00\03\00\00\00\00\00\00\00\11\00\00\00\14\00\00\00\c0\0e\00\00\00\00\00\000\0f\00\00\00\00\00\000\0e")
 (data $25 (i32.const 3964) "l")
 (data $25.1 (i32.const 3976) "\02\00\00\00T\00\00\00[\00f\00i\00n\00d\00P\00a\00t\00h\00]\00 \00F\00a\00i\00l\00e\00d\00 \00r\00e\00q\00u\00i\00r\00e\00m\00e\00n\00t\00.\00 \00l\00e\00v\00e\00l\00 \00w\00a\00s\00:\00 ")
 (data $26 (i32.const 4076) ",")
 (data $26.1 (i32.const 4088) "\02\00\00\00\1c\00\00\00.\00 \00m\00u\00s\00t\00 \00b\00e\00 \000\00-\003\00.")
 (data $27 (i32.const 4124) "\1c\00\00\00\03\00\00\00\00\00\00\00\11\00\00\00\0c\00\00\00\90\0f\00\00\00\00\00\00\00\10")
 (data $28 (i32.const 4156) "\1c")
 (data $28.1 (i32.const 4168) "\01")
 (data $29 (i32.const 4188) ",")
 (data $29.1 (i32.const 4200) "\02\00\00\00\1c\00\00\00A\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y")
 (data $30 (i32.const 4236) ",")
 (data $30.1 (i32.const 4248) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $31 (i32.const 4284) "\8c")
 (data $31.1 (i32.const 4296) "\02\00\00\00n\00\00\00[\00c\00a\00n\00T\00r\00a\00v\00e\00l\00]\00 \00F\00a\00i\00l\00e\00d\00 \00r\00e\00q\00u\00i\00r\00e\00m\00e\00n\00t\00.\00 \00c\00o\00l\00l\00i\00s\00i\00o\00n\00S\00t\00r\00a\00t\00e\00g\00y\00 \00w\00a\00s\00:\00 ")
 (data $32 (i32.const 4428) "\1c\00\00\00\03\00\00\00\00\00\00\00\11\00\00\00\0c\00\00\00\d0\10\00\00\00\00\00\00\f0\05")
 (data $33 (i32.const 4460) "L")
 (data $33.1 (i32.const 4472) "\02\00\00\00<\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00o\00f\00f\00s\00e\00t\00s\00:\00 \00o\00f\00f\00s\00e\00t\00X\00 \00w\00a\00s\00:\00 ")
 (data $34 (i32.const 4540) "<")
 (data $34.1 (i32.const 4552) "\02\00\00\00\1e\00\00\00,\00 \00o\00f\00f\00s\00e\00t\00Z\00 \00w\00a\00s\00:\00 ")
 (data $35 (i32.const 4604) ",\00\00\00\03\00\00\00\00\00\00\00\11\00\00\00\10\00\00\00\80\11\00\00\00\00\00\00\d0\11")
 (data $36 (i32.const 4652) "L")
 (data $36.1 (i32.const 4664) "\02\00\00\002\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00S\00t\00e\00p\00V\00a\00l\00i\00d\00a\00t\00o\00r\00.\00t\00s")
 (data $37 (i32.const 4732) "\1c")
 (data $37.1 (i32.const 4744) "\01")
 (export "findPath" (func $assembly/index/findPath@varargs))
 (export "changeFloor" (func $assembly/index/changeFloor))
 (export "changeLoc" (func $assembly/index/changeLoc))
 (export "changeNpc" (func $assembly/index/changeNpc))
 (export "changePlayer" (func $assembly/index/changePlayer))
 (export "changeRoof" (func $assembly/index/changeRoof))
 (export "changeWall" (func $assembly/index/changeWall))
 (export "allocateIfAbsent" (func $assembly/index/allocateIfAbsent))
 (export "isFlagged" (func $assembly/index/isFlagged))
 (export "canTravel" (func $assembly/index/canTravel@varargs))
 (export "hasLineOfSight" (func $assembly/index/hasLineOfSight@varargs))
 (export "hasLineOfWalk" (func $assembly/index/hasLineOfWalk@varargs))
 (export "lineOfSight" (func $assembly/index/lineOfSight@varargs))
 (export "lineOfWalk" (func $assembly/index/lineOfWalk@varargs))
 (export "reached" (func $assembly/index/reached@varargs))
 (export "CollisionFlag.NULL" (global $assembly/flag/CollisionFlag/CollisionFlag.NULL))
 (export "CollisionFlag.OPEN" (global $assembly/flag/CollisionFlag/CollisionFlag.OPEN))
 (export "CollisionFlag.WALL_NORTH_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_WEST))
 (export "CollisionFlag.WALL_NORTH" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH))
 (export "CollisionFlag.WALL_NORTH_EAST" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_EAST))
 (export "CollisionFlag.WALL_EAST" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_EAST))
 (export "CollisionFlag.WALL_SOUTH_EAST" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_EAST))
 (export "CollisionFlag.WALL_SOUTH" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH))
 (export "CollisionFlag.WALL_SOUTH_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_WEST))
 (export "CollisionFlag.WALL_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_WEST))
 (export "CollisionFlag.LOC" (global $assembly/flag/CollisionFlag/CollisionFlag.LOC))
 (export "CollisionFlag.WALL_NORTH_WEST_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_WEST_PROJ_BLOCKER))
 (export "CollisionFlag.WALL_NORTH_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_PROJ_BLOCKER))
 (export "CollisionFlag.WALL_NORTH_EAST_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_EAST_PROJ_BLOCKER))
 (export "CollisionFlag.WALL_EAST_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_EAST_PROJ_BLOCKER))
 (export "CollisionFlag.WALL_SOUTH_EAST_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_EAST_PROJ_BLOCKER))
 (export "CollisionFlag.WALL_SOUTH_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_PROJ_BLOCKER))
 (export "CollisionFlag.WALL_SOUTH_WEST_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_WEST_PROJ_BLOCKER))
 (export "CollisionFlag.WALL_WEST_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_WEST_PROJ_BLOCKER))
 (export "CollisionFlag.LOC_PROJ_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.LOC_PROJ_BLOCKER))
 (export "CollisionFlag.FLOOR_DECORATION" (global $assembly/flag/CollisionFlag/CollisionFlag.FLOOR_DECORATION))
 (export "CollisionFlag.NPC" (global $assembly/flag/CollisionFlag/CollisionFlag.NPC))
 (export "CollisionFlag.PLAYER" (global $assembly/flag/CollisionFlag/CollisionFlag.PLAYER))
 (export "CollisionFlag.FLOOR" (global $assembly/flag/CollisionFlag/CollisionFlag.FLOOR))
 (export "CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.WALL_NORTH_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_ROUTE_BLOCKER))
 (export "CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_NORTH_EAST_ROUTE_BLOCKER))
 (export "CollisionFlag.WALL_EAST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_EAST_ROUTE_BLOCKER))
 (export "CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_EAST_ROUTE_BLOCKER))
 (export "CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_ROUTE_BLOCKER))
 (export "CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_SOUTH_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.WALL_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.WALL_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.LOC_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.LOC_ROUTE_BLOCKER))
 (export "CollisionFlag.ROOF" (global $assembly/flag/CollisionFlag/CollisionFlag.ROOF))
 (export "CollisionFlag.FLOOR_BLOCKED" (global $assembly/flag/CollisionFlag/CollisionFlag.FLOOR_BLOCKED))
 (export "CollisionFlag.WALK_BLOCKED" (global $assembly/flag/CollisionFlag/CollisionFlag.WALK_BLOCKED))
 (export "CollisionFlag.BLOCK_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_WEST))
 (export "CollisionFlag.BLOCK_EAST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_EAST))
 (export "CollisionFlag.BLOCK_SOUTH" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH))
 (export "CollisionFlag.BLOCK_NORTH" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH))
 (export "CollisionFlag.BLOCK_SOUTH_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_WEST))
 (export "CollisionFlag.BLOCK_SOUTH_EAST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST))
 (export "CollisionFlag.BLOCK_NORTH_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_WEST))
 (export "CollisionFlag.BLOCK_NORTH_EAST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST))
 (export "CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST))
 (export "CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST))
 (export "CollisionFlag.BLOCK_NORTH_EAST_AND_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST_AND_WEST))
 (export "CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST))
 (export "CollisionFlag.BLOCK_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_EAST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_EAST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_SOUTH_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_NORTH_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_SOUTH_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_SOUTH_EAST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_NORTH_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_NORTH_EAST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_EAST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_AND_SOUTH_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_NORTH_EAST_AND_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_NORTH_EAST_AND_WEST_ROUTE_BLOCKER))
 (export "CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST_ROUTE_BLOCKER" (global $assembly/flag/CollisionFlag/CollisionFlag.BLOCK_SOUTH_EAST_AND_WEST_ROUTE_BLOCKER))
 (export "LocShape.WALL_STRAIGHT" (global $assembly/LocShape/LocShape.WALL_STRAIGHT))
 (export "LocShape.WALL_DIAGONAL_CORNER" (global $assembly/LocShape/LocShape.WALL_DIAGONAL_CORNER))
 (export "LocShape.WALL_L" (global $assembly/LocShape/LocShape.WALL_L))
 (export "LocShape.WALL_SQUARE_CORNER" (global $assembly/LocShape/LocShape.WALL_SQUARE_CORNER))
 (export "LocShape.WALLDECOR_STRAIGHT_NOOFFSET" (global $assembly/LocShape/LocShape.WALLDECOR_STRAIGHT_NOOFFSET))
 (export "LocShape.WALLDECOR_STRAIGHT_OFFSET" (global $assembly/LocShape/LocShape.WALLDECOR_STRAIGHT_OFFSET))
 (export "LocShape.WALLDECOR_DIAGONAL_OFFSET" (global $assembly/LocShape/LocShape.WALLDECOR_DIAGONAL_OFFSET))
 (export "LocShape.WALLDECOR_DIAGONAL_NOOFFSET" (global $assembly/LocShape/LocShape.WALLDECOR_DIAGONAL_NOOFFSET))
 (export "LocShape.WALLDECOR_DIAGONAL_BOTH" (global $assembly/LocShape/LocShape.WALLDECOR_DIAGONAL_BOTH))
 (export "LocShape.WALL_DIAGONAL" (global $assembly/LocShape/LocShape.WALL_DIAGONAL))
 (export "LocShape.CENTREPIECE_STRAIGHT" (global $assembly/LocShape/LocShape.CENTREPIECE_STRAIGHT))
 (export "LocShape.CENTREPIECE_DIAGONAL" (global $assembly/LocShape/LocShape.CENTREPIECE_DIAGONAL))
 (export "LocShape.ROOF_STRAIGHT" (global $assembly/LocShape/LocShape.ROOF_STRAIGHT))
 (export "LocShape.ROOF_DIAGONAL_WITH_ROOFEDGE" (global $assembly/LocShape/LocShape.ROOF_DIAGONAL_WITH_ROOFEDGE))
 (export "LocShape.ROOF_DIAGONAL" (global $assembly/LocShape/LocShape.ROOF_DIAGONAL))
 (export "LocShape.ROOF_L_CONCAVE" (global $assembly/LocShape/LocShape.ROOF_L_CONCAVE))
 (export "LocShape.ROOF_L_CONVEX" (global $assembly/LocShape/LocShape.ROOF_L_CONVEX))
 (export "LocShape.ROOF_FLAT" (global $assembly/LocShape/LocShape.ROOF_FLAT))
 (export "LocShape.ROOFEDGE_STRAIGHT" (global $assembly/LocShape/LocShape.ROOFEDGE_STRAIGHT))
 (export "LocShape.ROOFEDGE_DIAGONAL_CORNER" (global $assembly/LocShape/LocShape.ROOFEDGE_DIAGONAL_CORNER))
 (export "LocShape.ROOFEDGE_L" (global $assembly/LocShape/LocShape.ROOFEDGE_L))
 (export "LocShape.ROOFEDGE_SQUARE_CORNER" (global $assembly/LocShape/LocShape.ROOFEDGE_SQUARE_CORNER))
 (export "LocShape.GROUND_DECOR" (global $assembly/LocShape/LocShape.GROUND_DECOR))
 (export "LocAngle.WEST" (global $assembly/LocAngle/LocAngle.WEST))
 (export "LocAngle.NORTH" (global $assembly/LocAngle/LocAngle.NORTH))
 (export "LocAngle.EAST" (global $assembly/LocAngle/LocAngle.EAST))
 (export "LocAngle.SOUTH" (global $assembly/LocAngle/LocAngle.SOUTH))
 (export "CollisionType.NORMAL" (global $assembly/collision/CollisionStrategy/CollisionType.NORMAL))
 (export "CollisionType.BLOCKED" (global $assembly/collision/CollisionStrategy/CollisionType.BLOCKED))
 (export "CollisionType.INDOORS" (global $assembly/collision/CollisionStrategy/CollisionType.INDOORS))
 (export "CollisionType.OUTDOORS" (global $assembly/collision/CollisionStrategy/CollisionType.OUTDOORS))
 (export "CollisionType.LINE_OF_SIGHT" (global $assembly/collision/CollisionStrategy/CollisionType.LINE_OF_SIGHT))
 (export "memory" (memory $0))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (start $~start)
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  i32.const -4
  i32.and
  local.tee $3
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.clz
   i32.sub
   local.tee $4
   i32.const 7
   i32.sub
   local.set $2
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.set $4
  local.get $1
  i32.load offset=8
  local.set $5
  local.get $1
  i32.load offset=4
  local.tee $3
  if
   local.get $3
   local.get $5
   i32.store offset=8
  end
  local.get $5
  if
   local.get $5
   local.get $3
   i32.store offset=4
  end
  local.get $1
  local.get $0
  local.get $2
  i32.const 4
  i32.shl
  local.get $4
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.tee $1
  i32.load offset=96
  i32.eq
  if
   local.get $1
   local.get $5
   i32.store offset=96
   local.get $5
   i32.eqz
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    local.tee $1
    i32.load offset=4
    i32.const -2
    local.get $4
    i32.rotl
    i32.and
    local.set $3
    local.get $1
    local.get $3
    i32.store offset=4
    local.get $3
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const -2
     local.get $2
     i32.rotl
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 4
  i32.add
  local.tee $6
  local.get $1
  i32.load
  local.tee $3
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $3
   i32.const 4
   i32.add
   local.get $2
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
   local.get $6
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   i32.load
   local.set $2
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $1
   i32.load
   local.set $6
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $6
   i32.const 4
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
  end
  local.get $4
  local.get $2
  i32.const 2
  i32.or
  i32.store
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $5
   local.get $2
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $2
  local.get $5
  i32.const 4
  i32.shl
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $3
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $3
  if
   local.get $3
   local.get $1
   i32.store offset=4
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $5
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.get $5
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 1
  local.get $2
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $1
   i32.const 16
   i32.sub
   local.tee $5
   local.get $3
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $5
    local.set $1
   end
  end
  local.get $2
  i32.wrap_i64
  i32.const -16
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 20
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $3
  i32.const 8
  i32.sub
  local.tee $3
  i32.const 1
  i32.or
  i32.or
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.add
  local.get $3
  i32.add
  local.tee $3
  i32.const 2
  i32.store
  local.get $0
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  memory.size
  local.tee $0
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
   local.get $0
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  i32.const 4768
  i32.const 0
  i32.store
  i32.const 6336
  i32.const 0
  i32.store
  loop $for-loop|0
   local.get $1
   i32.const 23
   i32.lt_u
   if
    local.get $1
    i32.const 2
    i32.shl
    i32.const 4768
    i32.add
    i32.const 0
    i32.store offset=4
    i32.const 0
    local.set $0
    loop $for-loop|1
     local.get $0
     i32.const 16
     i32.lt_u
     if
      local.get $1
      i32.const 4
      i32.shl
      local.get $0
      i32.add
      i32.const 2
      i32.shl
      i32.const 4768
      i32.add
      i32.const 0
      i32.store offset=96
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      br $for-loop|1
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 4768
  i32.const 6340
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 4768
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/prepareSize (param $0 i32) (result i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1168
   i32.const 1296
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $0
   i32.const 19
   i32.add
   i32.const -16
   i32.and
   i32.const 4
   i32.sub
  end
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $1
  else
   local.get $1
   i32.const 536870910
   i32.lt_u
   if
    local.get $1
    i32.const 1
    i32.const 27
    local.get $1
    i32.clz
    i32.sub
    i32.shl
    i32.add
    i32.const 1
    i32.sub
    local.set $1
   end
   local.get $1
   i32.const 31
   local.get $1
   i32.clz
   i32.sub
   local.tee $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
   local.set $1
   local.get $2
   i32.const 7
   i32.sub
   local.set $2
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $0
    local.get $1
    i32.ctz
    local.tee $0
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    i32.ctz
    local.get $0
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/tlsf/prepareBlock (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.load
  local.tee $3
  i32.const -4
  i32.and
  local.get $2
  i32.sub
  local.tee $4
  i32.const 16
  i32.ge_u
  if
   local.get $1
   local.get $2
   local.get $3
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $1
   i32.const 4
   i32.add
   local.get $2
   i32.add
   local.tee $1
   local.get $4
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $1
   local.get $3
   i32.const -2
   i32.and
   i32.store
   local.get $1
   i32.const 4
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $0
   local.get $0
   i32.load
   i32.const -3
   i32.and
   i32.store
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/prepareSize
  local.tee $2
  call $~lib/rt/tlsf/searchBlock
  local.tee $1
  i32.eqz
  if
   memory.size
   local.tee $3
   local.get $2
   i32.const 256
   i32.ge_u
   if (result i32)
    local.get $2
    i32.const 536870910
    i32.lt_u
    if (result i32)
     local.get $2
     i32.const 1
     i32.const 27
     local.get $2
     i32.clz
     i32.sub
     i32.shl
     i32.add
     i32.const 1
     i32.sub
    else
     local.get $2
    end
   else
    local.get $2
   end
   i32.const 4
   local.get $0
   i32.load offset=1568
   local.get $3
   i32.const 16
   i32.shl
   i32.const 4
   i32.sub
   i32.ne
   i32.shl
   i32.add
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $1
   local.get $1
   local.get $3
   i32.lt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $1
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
   local.get $0
   local.get $3
   i32.const 16
   i32.shl
   memory.size
   i64.extend_i32_s
   i64.const 16
   i64.shl
   call $~lib/rt/tlsf/addMemory
   local.get $0
   local.get $2
   call $~lib/rt/tlsf/searchBlock
   local.set $1
  end
  local.get $1
  i32.load
  drop
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/removeBlock
  local.get $0
  local.get $1
  local.get $2
  call $~lib/rt/tlsf/prepareBlock
  local.get $1
 )
 (func $~lib/rt/tcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1168
   i32.const 1232
   i32.const 125
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/tlsf/allocateBlock
  local.tee $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  global.get $~lib/rt/tcms/fromSpace
  local.tee $0
  i32.load offset=8
  local.set $1
  local.get $2
  local.get $0
  i32.store offset=4
  local.get $2
  local.get $1
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store offset=8
  global.get $~lib/rt/tcms/total
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
  i32.add
  global.set $~lib/rt/tcms/total
  local.get $2
  i32.const 20
  i32.add
 )
 (func $~lib/staticarray/StaticArray<i32>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1056
   i32.const 1104
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 2
  i32.shl
  local.tee $0
  i32.const 4
  call $~lib/rt/tcms/__new
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $start:assembly/index
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 1348
  i32.const 1344
  i32.store
  i32.const 1352
  i32.const 1344
  i32.store
  i32.const 1344
  global.set $~lib/rt/tcms/fromSpace
  i32.const 0
  call $~lib/staticarray/StaticArray<i32>#constructor
  global.set $assembly/PathFinder/PathFinder.EMPTY
  i32.const 0
  i32.const 6
  call $~lib/rt/tcms/__new
  local.tee $0
  if (result i32)
   local.get $0
  else
   i32.const 0
   i32.const 0
   call $~lib/rt/tcms/__new
  end
  global.set $assembly/collision/CollisionStrategies/CollisionStrategies.NORMAL
  i32.const 0
  i32.const 7
  call $~lib/rt/tcms/__new
  local.tee $0
  if (result i32)
   local.get $0
  else
   i32.const 0
   i32.const 0
   call $~lib/rt/tcms/__new
  end
  global.set $assembly/collision/CollisionStrategies/CollisionStrategies.BLOCKED
  i32.const 0
  i32.const 8
  call $~lib/rt/tcms/__new
  local.tee $0
  if (result i32)
   local.get $0
  else
   i32.const 0
   i32.const 0
   call $~lib/rt/tcms/__new
  end
  global.set $assembly/collision/CollisionStrategies/CollisionStrategies.INDOORS
  i32.const 0
  i32.const 9
  call $~lib/rt/tcms/__new
  local.tee $0
  if (result i32)
   local.get $0
  else
   i32.const 0
   i32.const 0
   call $~lib/rt/tcms/__new
  end
  global.set $assembly/collision/CollisionStrategies/CollisionStrategies.OUTDOORS
  i32.const 0
  i32.const 10
  call $~lib/rt/tcms/__new
  local.tee $0
  if (result i32)
   local.get $0
  else
   i32.const 0
   i32.const 0
   call $~lib/rt/tcms/__new
  end
  global.set $assembly/collision/CollisionStrategies/CollisionStrategies.LINE_OF_SIGHT
  i32.const 32768
  global.set $assembly/Line/Line.HALF_TILE
  i32.const 0
  call $~lib/staticarray/StaticArray<i32>#constructor
  global.set $assembly/LinePathFinder/LinePathFinder.EMPTY
  i32.const 4
  i32.const 11
  call $~lib/rt/tcms/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/tcms/__new
   local.set $0
  end
  i32.const 67108864
  i32.const 12
  call $~lib/rt/tcms/__new
  local.tee $2
  i32.const 0
  i32.const 67108864
  memory.fill
  local.get $0
  local.get $2
  i32.store
  local.get $0
  global.set $assembly/index/flags
  i32.const 1
  global.set $~argumentsLength
  global.get $assembly/index/flags
  local.set $0
  i32.const 44
  i32.const 13
  call $~lib/rt/tcms/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  local.get $2
  i32.const 0
  i32.store offset=16
  local.get $2
  i32.const 0
  i32.store offset=20
  local.get $2
  i32.const 0
  i32.store offset=24
  local.get $2
  i32.const 0
  i32.store offset=28
  local.get $2
  i32.const 0
  i32.store offset=32
  local.get $2
  i32.const 0
  i32.store offset=36
  local.get $2
  i32.const 0
  i32.store offset=40
  local.get $2
  local.get $0
  i32.store
  local.get $2
  i32.const 128
  i32.store offset=4
  local.get $2
  i32.const 4096
  i32.store offset=8
  local.get $2
  i32.const 16384
  call $~lib/staticarray/StaticArray<i32>#constructor
  i32.store offset=12
  i32.const 16384
  call $~lib/staticarray/StaticArray<i32>#constructor
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $3
   i32.lt_s
   if
    local.get $0
    local.get $1
    i32.const 2
    i32.shl
    i32.add
    i32.const 99999999
    i32.store
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
  local.get $0
  i32.store offset=16
  local.get $2
  i32.const 4096
  call $~lib/staticarray/StaticArray<i32>#constructor
  i32.store offset=20
  local.get $2
  i32.const 4096
  call $~lib/staticarray/StaticArray<i32>#constructor
  i32.store offset=24
  local.get $2
  global.set $assembly/index/pathfinder
  global.get $assembly/index/flags
  local.set $0
  i32.const 4
  i32.const 14
  call $~lib/rt/tcms/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  local.get $0
  i32.store
  local.get $1
  global.set $assembly/index/stepValidator
  global.get $assembly/index/flags
  local.set $0
  i32.const 4
  i32.const 15
  call $~lib/rt/tcms/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  local.get $0
  i32.store
  local.get $1
  global.set $assembly/index/lineValidator
  global.get $assembly/index/flags
  local.set $0
  i32.const 4
  i32.const 16
  call $~lib/rt/tcms/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  local.get $0
  i32.store
  local.get $1
  global.set $assembly/index/linePathFinder
 )
 (func $~lib/util/number/itoa32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.eqz
  if
   i32.const 1792
   return
  end
  i32.const 0
  local.get $0
  i32.sub
  local.get $0
  local.get $0
  i32.const 31
  i32.shr_u
  i32.const 1
  i32.shl
  local.tee $4
  select
  local.tee $1
  i32.const 100000
  i32.lt_u
  if (result i32)
   local.get $1
   i32.const 100
   i32.lt_u
   if (result i32)
    local.get $1
    i32.const 10
    i32.ge_u
    i32.const 1
    i32.add
   else
    local.get $1
    i32.const 10000
    i32.ge_u
    i32.const 3
    i32.add
    local.get $1
    i32.const 1000
    i32.ge_u
    i32.add
   end
  else
   local.get $1
   i32.const 10000000
   i32.lt_u
   if (result i32)
    local.get $1
    i32.const 1000000
    i32.ge_u
    i32.const 6
    i32.add
   else
    local.get $1
    i32.const 1000000000
    i32.ge_u
    i32.const 8
    i32.add
    local.get $1
    i32.const 100000000
    i32.ge_u
    i32.add
   end
  end
  local.tee $0
  i32.const 1
  i32.shl
  local.get $4
  i32.add
  i32.const 2
  call $~lib/rt/tcms/__new
  local.tee $3
  local.get $4
  i32.add
  local.set $5
  loop $while-continue|0
   local.get $1
   i32.const 10000
   i32.ge_u
   if
    local.get $1
    i32.const 10000
    i32.rem_u
    local.set $2
    local.get $1
    i32.const 10000
    i32.div_u
    local.set $1
    local.get $5
    local.get $0
    i32.const 4
    i32.sub
    local.tee $0
    i32.const 1
    i32.shl
    i32.add
    local.get $2
    i32.const 100
    i32.div_u
    i32.const 2
    i32.shl
    i32.const 1804
    i32.add
    i64.load32_u
    local.get $2
    i32.const 100
    i32.rem_u
    i32.const 2
    i32.shl
    i32.const 1804
    i32.add
    i64.load32_u
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $1
  i32.const 100
  i32.ge_u
  if
   local.get $5
   local.get $0
   i32.const 2
   i32.sub
   local.tee $0
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 100
   i32.rem_u
   i32.const 2
   i32.shl
   i32.const 1804
   i32.add
   i32.load
   i32.store
   local.get $1
   i32.const 100
   i32.div_u
   local.set $1
  end
  local.get $1
  i32.const 10
  i32.ge_u
  if
   local.get $5
   local.get $0
   i32.const 2
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 2
   i32.shl
   i32.const 1804
   i32.add
   i32.load
   i32.store
  else
   local.get $5
   local.get $0
   i32.const 1
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 48
   i32.add
   i32.store16
  end
  local.get $4
  if
   local.get $3
   i32.const 45
   i32.store16
  end
  local.get $3
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#join (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 3376
  local.set $3
  block $__inlined_func$~lib/util/string/joinStringArray$89
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   local.tee $7
   i32.const 1
   i32.sub
   local.tee $5
   i32.const 0
   i32.lt_s
   br_if $__inlined_func$~lib/util/string/joinStringArray$89
   local.get $5
   i32.eqz
   if
    local.get $0
    i32.load
    local.tee $3
    i32.eqz
    if
     i32.const 3376
     local.set $3
    end
    br $__inlined_func$~lib/util/string/joinStringArray$89
   end
   loop $for-loop|0
    local.get $4
    local.get $7
    i32.lt_s
    if
     local.get $0
     local.get $4
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $3
     if
      local.get $1
      local.get $3
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.add
      local.set $1
     end
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
   local.get $1
   i32.const 3372
   i32.load
   i32.const 1
   i32.shr_u
   local.tee $1
   local.get $5
   i32.mul
   i32.add
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/tcms/__new
   local.set $3
   loop $for-loop|1
    local.get $5
    local.get $6
    i32.gt_s
    if
     local.get $0
     local.get $6
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $4
     if
      local.get $3
      local.get $2
      i32.const 1
      i32.shl
      i32.add
      local.get $4
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      local.tee $4
      i32.const 1
      i32.shl
      memory.copy
      local.get $2
      local.get $4
      i32.add
      local.set $2
     end
     local.get $1
     if
      local.get $3
      local.get $2
      i32.const 1
      i32.shl
      i32.add
      i32.const 3376
      local.get $1
      i32.const 1
      i32.shl
      memory.copy
      local.get $1
      local.get $2
      i32.add
      local.set $2
     end
     local.get $6
     i32.const 1
     i32.add
     local.set $6
     br $for-loop|1
    end
   end
   local.get $0
   local.get $5
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   if
    local.get $3
    local.get $2
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const -2
    i32.and
    memory.copy
   end
  end
  local.get $3
 )
 (func $assembly/reach/ReachStrategy/ReachStrategy.reachWall1 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (result i32)
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$1 (result i32)
   i32.const -1
   local.get $0
   i32.load
   local.get $2
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $3
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $1
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$1
   drop
   i32.const -1
   local.get $2
   i32.const 7
   i32.and
   local.get $3
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.tee $1
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$1
   drop
   local.get $0
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.set $0
  block $folding-inner1
   block $folding-inner0
    local.get $6
    if
     local.get $6
     i32.const 2
     i32.eq
     if
      local.get $7
      if
       local.get $7
       i32.const 1
       i32.eq
       if
        local.get $0
        i32.const 2359560
        i32.and
        i32.eqz
        local.get $3
        local.get $5
        i32.eq
        local.tee $1
        local.get $2
        local.get $4
        i32.const 1
        i32.sub
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        local.get $2
        local.get $4
        i32.eq
        local.tee $6
        local.get $3
        local.get $5
        i32.const 1
        i32.add
        i32.eq
        i32.and
        br_if $folding-inner0
        local.get $2
        local.get $4
        i32.const 1
        i32.add
        i32.eq
        local.get $1
        i32.and
        br_if $folding-inner0
        local.get $0
        i32.const 2359554
        i32.and
        i32.eqz
        local.get $6
        local.get $3
        local.get $5
        i32.const 1
        i32.sub
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        br $folding-inner1
       else
        local.get $7
        i32.const 2
        i32.eq
        if
         local.get $0
         i32.const 2359560
         i32.and
         i32.eqz
         local.get $3
         local.get $5
         i32.eq
         local.tee $1
         local.get $2
         local.get $4
         i32.const 1
         i32.sub
         i32.eq
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $0
         i32.const 2359584
         i32.and
         i32.eqz
         local.get $2
         local.get $4
         i32.eq
         local.tee $0
         local.get $3
         local.get $5
         i32.const 1
         i32.add
         i32.eq
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $2
         local.get $4
         i32.const 1
         i32.add
         i32.eq
         local.get $1
         i32.and
         br_if $folding-inner0
         local.get $0
         local.get $3
         local.get $5
         i32.const 1
         i32.sub
         i32.eq
         i32.and
         br_if $folding-inner0
         br $folding-inner1
        else
         local.get $7
         i32.const 3
         i32.eq
         if
          local.get $3
          local.get $5
          i32.eq
          local.tee $1
          local.get $2
          local.get $4
          i32.const 1
          i32.sub
          i32.eq
          i32.and
          br_if $folding-inner0
          local.get $0
          i32.const 2359584
          i32.and
          i32.eqz
          local.get $2
          local.get $4
          i32.eq
          local.tee $6
          local.get $3
          local.get $5
          i32.const 1
          i32.add
          i32.eq
          i32.and
          i32.and
          br_if $folding-inner0
          local.get $0
          i32.const 2359680
          i32.and
          i32.eqz
          local.get $2
          local.get $4
          i32.const 1
          i32.add
          i32.eq
          local.get $1
          i32.and
          i32.and
          br_if $folding-inner0
          local.get $6
          local.get $3
          local.get $5
          i32.const 1
          i32.sub
          i32.eq
          i32.and
          br_if $folding-inner0
          br $folding-inner1
         end
        end
       end
      else
       local.get $3
       local.get $5
       i32.eq
       local.tee $1
       local.get $2
       local.get $4
       i32.const 1
       i32.sub
       i32.eq
       i32.and
       br_if $folding-inner0
       local.get $2
       local.get $4
       i32.eq
       local.tee $6
       local.get $3
       local.get $5
       i32.const 1
       i32.add
       i32.eq
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 2359680
       i32.and
       i32.eqz
       local.get $2
       local.get $4
       i32.const 1
       i32.add
       i32.eq
       local.get $1
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 2359554
       i32.and
       i32.eqz
       local.get $6
       local.get $3
       local.get $5
       i32.const 1
       i32.sub
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      end
      br $folding-inner1
     else
      local.get $6
      i32.const 9
      i32.eq
      if
       local.get $0
       i32.const 32
       i32.and
       i32.eqz
       local.get $2
       local.get $4
       i32.eq
       local.tee $1
       local.get $3
       local.get $5
       i32.const 1
       i32.add
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 2
       i32.and
       i32.eqz
       local.get $1
       local.get $3
       local.get $5
       i32.const 1
       i32.sub
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 8
       i32.and
       i32.eqz
       local.get $3
       local.get $5
       i32.eq
       local.tee $1
       local.get $2
       local.get $4
       i32.const 1
       i32.sub
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 128
       i32.and
       i32.eqz
       local.get $2
       local.get $4
       i32.const 1
       i32.add
       i32.eq
       local.get $1
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      end
     end
    else
     local.get $7
     if
      local.get $7
      i32.const 1
      i32.eq
      if
       local.get $3
       local.get $5
       i32.const 1
       i32.add
       i32.eq
       local.get $2
       local.get $4
       i32.eq
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 2359560
       i32.and
       i32.eqz
       local.get $3
       local.get $5
       i32.eq
       local.tee $1
       local.get $2
       local.get $4
       i32.const 1
       i32.sub
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 2359680
       i32.and
       i32.eqz
       local.get $2
       local.get $4
       i32.const 1
       i32.add
       i32.eq
       local.get $1
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      else
       local.get $7
       i32.const 2
       i32.eq
       if
        local.get $3
        local.get $5
        i32.eq
        local.get $2
        local.get $4
        i32.const 1
        i32.add
        i32.eq
        i32.and
        br_if $folding-inner0
        local.get $0
        i32.const 2359584
        i32.and
        i32.eqz
        local.get $2
        local.get $4
        i32.eq
        local.tee $1
        local.get $3
        local.get $5
        i32.const 1
        i32.add
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        local.get $0
        i32.const 2359554
        i32.and
        i32.eqz
        local.get $1
        local.get $3
        local.get $5
        i32.const 1
        i32.sub
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        br $folding-inner1
       else
        local.get $7
        i32.const 3
        i32.eq
        if
         local.get $3
         local.get $5
         i32.const 1
         i32.sub
         i32.eq
         local.get $2
         local.get $4
         i32.eq
         i32.and
         br_if $folding-inner0
         local.get $0
         i32.const 2359560
         i32.and
         i32.eqz
         local.get $3
         local.get $5
         i32.eq
         local.tee $1
         local.get $2
         local.get $4
         i32.const 1
         i32.sub
         i32.eq
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $0
         i32.const 2359680
         i32.and
         i32.eqz
         local.get $2
         local.get $4
         i32.const 1
         i32.add
         i32.eq
         local.get $1
         i32.and
         i32.and
         br_if $folding-inner0
         br $folding-inner1
        end
       end
      end
     else
      local.get $3
      local.get $5
      i32.eq
      local.get $2
      local.get $4
      i32.const 1
      i32.sub
      i32.eq
      i32.and
      br_if $folding-inner0
      local.get $0
      i32.const 2359584
      i32.and
      i32.eqz
      local.get $2
      local.get $4
      i32.eq
      local.tee $1
      local.get $3
      local.get $5
      i32.const 1
      i32.add
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $0
      i32.const 2359554
      i32.and
      i32.eqz
      local.get $1
      local.get $3
      local.get $5
      i32.const 1
      i32.sub
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      br $folding-inner1
     end
     br $folding-inner1
    end
    i32.const 0
    return
   end
   i32.const 1
   return
  end
  i32.const 0
 )
 (func $assembly/reach/ReachStrategy/ReachStrategy.reachWallN (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  (local $9 i32)
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$2 (result i32)
   i32.const -1
   local.get $0
   i32.load
   local.get $2
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $3
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $1
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$2
   drop
   i32.const -1
   local.get $2
   i32.const 7
   i32.and
   local.get $3
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.tee $1
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$2
   drop
   local.get $0
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.set $1
  local.get $2
  local.get $6
  i32.add
  i32.const 1
  i32.sub
  local.set $9
  local.get $3
  local.get $6
  i32.add
  i32.const 1
  i32.sub
  local.set $0
  block $folding-inner1
   block $folding-inner0
    local.get $7
    if
     local.get $7
     i32.const 2
     i32.eq
     if
      local.get $8
      if
       local.get $8
       i32.const 1
       i32.eq
       if
        local.get $1
        i32.const 2359560
        i32.and
        i32.eqz
        local.get $0
        local.get $5
        i32.ge_s
        local.tee $0
        local.get $3
        local.get $5
        i32.le_s
        local.tee $7
        local.get $2
        local.get $4
        local.get $6
        i32.sub
        i32.eq
        i32.and
        i32.and
        i32.and
        br_if $folding-inner0
        local.get $2
        local.get $4
        i32.le_s
        local.get $4
        local.get $9
        i32.le_s
        i32.and
        local.tee $8
        local.get $3
        local.get $5
        i32.const 1
        i32.add
        i32.eq
        i32.and
        br_if $folding-inner0
        local.get $0
        local.get $7
        local.get $2
        local.get $4
        i32.const 1
        i32.add
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        local.get $1
        i32.const 2359554
        i32.and
        i32.eqz
        local.get $3
        local.get $5
        local.get $6
        i32.sub
        i32.eq
        local.get $8
        i32.and
        i32.and
        br_if $folding-inner0
        br $folding-inner1
       else
        local.get $8
        i32.const 2
        i32.eq
        if
         local.get $1
         i32.const 2359560
         i32.and
         i32.eqz
         local.get $0
         local.get $5
         i32.ge_s
         local.tee $0
         local.get $3
         local.get $5
         i32.le_s
         local.tee $7
         local.get $2
         local.get $4
         local.get $6
         i32.sub
         i32.eq
         i32.and
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $1
         i32.const 2359584
         i32.and
         i32.eqz
         local.get $2
         local.get $4
         i32.le_s
         local.get $4
         local.get $9
         i32.le_s
         i32.and
         local.tee $1
         local.get $3
         local.get $5
         i32.const 1
         i32.add
         i32.eq
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $0
         local.get $7
         local.get $2
         local.get $4
         i32.const 1
         i32.add
         i32.eq
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $3
         local.get $5
         local.get $6
         i32.sub
         i32.eq
         local.get $1
         i32.and
         br_if $folding-inner0
         br $folding-inner1
        else
         local.get $8
         i32.const 3
         i32.eq
         if
          local.get $0
          local.get $5
          i32.ge_s
          local.tee $0
          local.get $3
          local.get $5
          i32.le_s
          local.tee $7
          local.get $2
          local.get $4
          local.get $6
          i32.sub
          i32.eq
          i32.and
          i32.and
          br_if $folding-inner0
          local.get $1
          i32.const 2359584
          i32.and
          i32.eqz
          local.get $2
          local.get $4
          i32.le_s
          local.get $4
          local.get $9
          i32.le_s
          i32.and
          local.tee $8
          local.get $3
          local.get $5
          i32.const 1
          i32.add
          i32.eq
          i32.and
          i32.and
          br_if $folding-inner0
          local.get $1
          i32.const 2359680
          i32.and
          i32.eqz
          local.get $0
          local.get $7
          local.get $2
          local.get $4
          i32.const 1
          i32.add
          i32.eq
          i32.and
          i32.and
          i32.and
          br_if $folding-inner0
          local.get $3
          local.get $5
          local.get $6
          i32.sub
          i32.eq
          local.get $8
          i32.and
          br_if $folding-inner0
          br $folding-inner1
         end
        end
       end
      else
       local.get $0
       local.get $5
       i32.ge_s
       local.tee $0
       local.get $3
       local.get $5
       i32.le_s
       local.tee $7
       local.get $2
       local.get $4
       local.get $6
       i32.sub
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $2
       local.get $4
       i32.le_s
       local.get $4
       local.get $9
       i32.le_s
       i32.and
       local.tee $8
       local.get $3
       local.get $5
       i32.const 1
       i32.add
       i32.eq
       i32.and
       br_if $folding-inner0
       local.get $1
       i32.const 2359680
       i32.and
       i32.eqz
       local.get $0
       local.get $7
       local.get $2
       local.get $4
       i32.const 1
       i32.add
       i32.eq
       i32.and
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $1
       i32.const 2359554
       i32.and
       i32.eqz
       local.get $3
       local.get $5
       local.get $6
       i32.sub
       i32.eq
       local.get $8
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      end
      br $folding-inner1
     else
      local.get $7
      i32.const 9
      i32.eq
      if
       local.get $1
       i32.const 2359584
       i32.and
       i32.eqz
       local.get $2
       local.get $4
       i32.le_s
       local.get $4
       local.get $9
       i32.le_s
       i32.and
       local.tee $7
       local.get $3
       local.get $5
       i32.const 1
       i32.add
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $1
       i32.const 2359554
       i32.and
       i32.eqz
       local.get $3
       local.get $5
       local.get $6
       i32.sub
       i32.eq
       local.get $7
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $1
       i32.const 2359560
       i32.and
       i32.eqz
       local.get $0
       local.get $5
       i32.ge_s
       local.tee $0
       local.get $3
       local.get $5
       i32.le_s
       local.tee $3
       local.get $2
       local.get $4
       local.get $6
       i32.sub
       i32.eq
       i32.and
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $1
       i32.const 2359680
       i32.and
       i32.eqz
       local.get $0
       local.get $3
       local.get $2
       local.get $4
       i32.const 1
       i32.add
       i32.eq
       i32.and
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      end
     end
    else
     local.get $8
     if
      local.get $8
      i32.const 1
      i32.eq
      if
       local.get $2
       local.get $4
       i32.le_s
       local.get $4
       local.get $9
       i32.le_s
       i32.and
       local.get $3
       local.get $5
       i32.const 1
       i32.add
       i32.eq
       i32.and
       br_if $folding-inner0
       local.get $1
       i32.const 2359560
       i32.and
       i32.eqz
       local.get $0
       local.get $5
       i32.ge_s
       local.tee $0
       local.get $3
       local.get $5
       i32.le_s
       local.tee $3
       local.get $2
       local.get $4
       local.get $6
       i32.sub
       i32.eq
       i32.and
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $1
       i32.const 2359680
       i32.and
       i32.eqz
       local.get $0
       local.get $3
       local.get $2
       local.get $4
       i32.const 1
       i32.add
       i32.eq
       i32.and
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      else
       local.get $8
       i32.const 2
       i32.eq
       if
        local.get $2
        local.get $4
        i32.const 1
        i32.add
        i32.eq
        local.get $3
        local.get $5
        i32.le_s
        i32.and
        local.get $0
        local.get $5
        i32.ge_s
        i32.and
        br_if $folding-inner0
        local.get $1
        i32.const 2359584
        i32.and
        i32.eqz
        local.get $2
        local.get $4
        i32.le_s
        local.get $4
        local.get $9
        i32.le_s
        i32.and
        local.tee $0
        local.get $3
        local.get $5
        i32.const 1
        i32.add
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        local.get $1
        i32.const 2359554
        i32.and
        i32.eqz
        local.get $3
        local.get $5
        local.get $6
        i32.sub
        i32.eq
        local.get $0
        i32.and
        i32.and
        br_if $folding-inner0
        br $folding-inner1
       else
        local.get $8
        i32.const 3
        i32.eq
        if
         local.get $2
         local.get $4
         i32.le_s
         local.get $4
         local.get $9
         i32.le_s
         i32.and
         local.get $3
         local.get $5
         local.get $6
         i32.sub
         i32.eq
         i32.and
         br_if $folding-inner0
         local.get $1
         i32.const 2359560
         i32.and
         i32.eqz
         local.get $0
         local.get $5
         i32.ge_s
         local.tee $0
         local.get $3
         local.get $5
         i32.le_s
         local.tee $3
         local.get $2
         local.get $4
         local.get $6
         i32.sub
         i32.eq
         i32.and
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $1
         i32.const 2359680
         i32.and
         i32.eqz
         local.get $0
         local.get $3
         local.get $2
         local.get $4
         i32.const 1
         i32.add
         i32.eq
         i32.and
         i32.and
         i32.and
         br_if $folding-inner0
         br $folding-inner1
        end
       end
      end
     else
      local.get $2
      local.get $4
      local.get $6
      i32.sub
      i32.eq
      local.get $3
      local.get $5
      i32.le_s
      i32.and
      local.get $0
      local.get $5
      i32.ge_s
      i32.and
      br_if $folding-inner0
      local.get $1
      i32.const 2359584
      i32.and
      i32.eqz
      local.get $2
      local.get $4
      i32.le_s
      local.get $4
      local.get $9
      i32.le_s
      i32.and
      local.tee $0
      local.get $3
      local.get $5
      i32.const 1
      i32.add
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $1
      i32.const 2359554
      i32.and
      i32.eqz
      local.get $3
      local.get $5
      local.get $6
      i32.sub
      i32.eq
      local.get $0
      i32.and
      i32.and
      br_if $folding-inner0
      br $folding-inner1
     end
     br $folding-inner1
    end
    i32.const 0
    return
   end
   i32.const 1
   return
  end
  i32.const 0
 )
 (func $assembly/reach/ReachStrategy/ReachStrategy.reachWallDecor1 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (result i32)
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$3 (result i32)
   i32.const -1
   local.get $0
   i32.load
   local.get $2
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $3
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $1
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$3
   drop
   i32.const -1
   local.get $2
   i32.const 7
   i32.and
   local.get $3
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.tee $1
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$3
   drop
   local.get $0
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.set $0
  block $folding-inner1
   block $folding-inner0
    local.get $6
    i32.const 7
    i32.eq
    local.tee $1
    local.get $6
    i32.const 6
    i32.eq
    i32.or
    if
     local.get $7
     i32.const 2
     i32.add
     i32.const 3
     i32.and
     local.get $7
     local.get $1
     select
     local.tee $1
     if
      local.get $1
      i32.const 1
      i32.eq
      if
       local.get $0
       i32.const 8
       i32.and
       i32.eqz
       local.get $3
       local.get $5
       i32.eq
       local.get $2
       local.get $4
       i32.const 1
       i32.sub
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $0
       i32.const 2
       i32.and
       i32.eqz
       local.get $3
       local.get $5
       i32.const 1
       i32.sub
       i32.eq
       local.get $2
       local.get $4
       i32.eq
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      else
       local.get $1
       i32.const 2
       i32.eq
       if
        local.get $0
        i32.const 8
        i32.and
        i32.eqz
        local.get $3
        local.get $5
        i32.eq
        local.get $2
        local.get $4
        i32.const 1
        i32.sub
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        local.get $0
        i32.const 32
        i32.and
        i32.eqz
        local.get $3
        local.get $5
        i32.const 1
        i32.add
        i32.eq
        local.get $2
        local.get $4
        i32.eq
        i32.and
        i32.and
        br_if $folding-inner0
        br $folding-inner1
       else
        local.get $1
        i32.const 3
        i32.eq
        if
         local.get $0
         i32.const 128
         i32.and
         i32.eqz
         local.get $3
         local.get $5
         i32.eq
         local.get $2
         local.get $4
         i32.const 1
         i32.add
         i32.eq
         i32.and
         i32.and
         if
          br $folding-inner0
         else
          local.get $0
          i32.const 32
          i32.and
          i32.eqz
          local.get $3
          local.get $5
          i32.const 1
          i32.add
          i32.eq
          local.get $2
          local.get $4
          i32.eq
          i32.and
          i32.and
          br_if $folding-inner0
         end
        end
       end
      end
     else
      local.get $0
      i32.const 128
      i32.and
      i32.eqz
      local.get $3
      local.get $5
      i32.eq
      local.get $2
      local.get $4
      i32.const 1
      i32.add
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $0
      i32.const 2
      i32.and
      i32.eqz
      local.get $3
      local.get $5
      i32.const 1
      i32.sub
      i32.eq
      local.get $2
      local.get $4
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      br $folding-inner1
     end
     br $folding-inner1
    else
     local.get $6
     i32.const 8
     i32.eq
     if
      local.get $0
      i32.const 32
      i32.and
      i32.eqz
      local.get $2
      local.get $4
      i32.eq
      local.tee $1
      local.get $3
      local.get $5
      i32.const 1
      i32.add
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $0
      i32.const 2
      i32.and
      i32.eqz
      local.get $1
      local.get $3
      local.get $5
      i32.const 1
      i32.sub
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $0
      i32.const 8
      i32.and
      i32.eqz
      local.get $3
      local.get $5
      i32.eq
      local.tee $1
      local.get $2
      local.get $4
      i32.const 1
      i32.sub
      i32.eq
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $0
      i32.const 128
      i32.and
      i32.eqz
      local.get $2
      local.get $4
      i32.const 1
      i32.add
      i32.eq
      local.get $1
      i32.and
      i32.and
      br_if $folding-inner0
      br $folding-inner1
     end
    end
    br $folding-inner1
   end
   i32.const 1
   return
  end
  i32.const 0
 )
 (func $assembly/reach/ReachStrategy/ReachStrategy.reachWallDecorN (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  (local $9 i32)
  (local $10 i32)
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$4 (result i32)
   i32.const -1
   local.get $0
   i32.load
   local.get $2
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $3
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $1
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$4
   drop
   i32.const -1
   local.get $2
   i32.const 7
   i32.and
   local.get $3
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.tee $1
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$4
   drop
   local.get $0
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.set $9
  local.get $2
  local.get $6
  i32.add
  i32.const 1
  i32.sub
  local.set $0
  local.get $3
  local.get $6
  i32.add
  i32.const 1
  i32.sub
  local.set $1
  block $folding-inner1
   block $folding-inner0
    local.get $7
    i32.const 7
    i32.eq
    local.tee $10
    local.get $7
    i32.const 6
    i32.eq
    i32.or
    if
     local.get $8
     i32.const 2
     i32.add
     i32.const 3
     i32.and
     local.get $8
     local.get $10
     select
     local.tee $7
     if
      local.get $7
      i32.const 1
      i32.eq
      if
       local.get $9
       i32.const 8
       i32.and
       i32.eqz
       local.get $2
       local.get $4
       local.get $6
       i32.sub
       i32.eq
       local.get $3
       local.get $5
       i32.le_s
       i32.and
       local.get $1
       local.get $5
       i32.ge_s
       i32.and
       i32.and
       br_if $folding-inner0
       local.get $9
       i32.const 2
       i32.and
       i32.eqz
       local.get $3
       local.get $5
       local.get $6
       i32.sub
       i32.eq
       local.get $2
       local.get $4
       i32.le_s
       i32.and
       local.get $0
       local.get $4
       i32.ge_s
       i32.and
       i32.and
       br_if $folding-inner0
       br $folding-inner1
      else
       local.get $7
       i32.const 2
       i32.eq
       if
        local.get $9
        i32.const 8
        i32.and
        i32.eqz
        local.get $2
        local.get $4
        local.get $6
        i32.sub
        i32.eq
        local.get $3
        local.get $5
        i32.le_s
        i32.and
        local.get $1
        local.get $5
        i32.ge_s
        i32.and
        i32.and
        br_if $folding-inner0
        local.get $9
        i32.const 32
        i32.and
        i32.eqz
        local.get $3
        local.get $5
        i32.const 1
        i32.add
        i32.eq
        local.get $2
        local.get $4
        i32.le_s
        i32.and
        local.get $0
        local.get $4
        i32.ge_s
        i32.and
        i32.and
        br_if $folding-inner0
        br $folding-inner1
       else
        local.get $7
        i32.const 3
        i32.eq
        if
         local.get $9
         i32.const 128
         i32.and
         i32.eqz
         local.get $2
         local.get $4
         i32.const 1
         i32.add
         i32.eq
         local.get $3
         local.get $5
         i32.le_s
         i32.and
         local.get $1
         local.get $5
         i32.ge_s
         i32.and
         i32.and
         br_if $folding-inner0
         local.get $9
         i32.const 32
         i32.and
         i32.eqz
         local.get $3
         local.get $5
         i32.const 1
         i32.add
         i32.eq
         local.get $2
         local.get $4
         i32.le_s
         i32.and
         local.get $0
         local.get $4
         i32.ge_s
         i32.and
         i32.and
         br_if $folding-inner0
         br $folding-inner1
        end
       end
      end
     else
      local.get $9
      i32.const 128
      i32.and
      i32.eqz
      local.get $2
      local.get $4
      i32.const 1
      i32.add
      i32.eq
      local.get $3
      local.get $5
      i32.le_s
      i32.and
      local.get $1
      local.get $5
      i32.ge_s
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $9
      i32.const 2
      i32.and
      i32.eqz
      local.get $3
      local.get $5
      local.get $6
      i32.sub
      i32.eq
      local.get $2
      local.get $4
      i32.le_s
      i32.and
      local.get $0
      local.get $4
      i32.ge_s
      i32.and
      i32.and
      br_if $folding-inner0
      br $folding-inner1
     end
     br $folding-inner1
    else
     local.get $7
     i32.const 8
     i32.eq
     if
      local.get $9
      i32.const 32
      i32.and
      i32.eqz
      local.get $0
      local.get $4
      i32.ge_s
      local.tee $0
      local.get $2
      local.get $4
      i32.le_s
      local.tee $7
      local.get $3
      local.get $5
      i32.const 1
      i32.add
      i32.eq
      i32.and
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $9
      i32.const 2
      i32.and
      i32.eqz
      local.get $0
      local.get $7
      local.get $3
      local.get $5
      local.get $6
      i32.sub
      i32.eq
      i32.and
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $9
      i32.const 8
      i32.and
      i32.eqz
      local.get $1
      local.get $5
      i32.ge_s
      local.tee $0
      local.get $3
      local.get $5
      i32.le_s
      local.tee $1
      local.get $2
      local.get $4
      local.get $6
      i32.sub
      i32.eq
      i32.and
      i32.and
      i32.and
      br_if $folding-inner0
      local.get $9
      i32.const 128
      i32.and
      i32.eqz
      local.get $0
      local.get $1
      local.get $2
      local.get $4
      i32.const 1
      i32.add
      i32.eq
      i32.and
      i32.and
      i32.and
      br_if $folding-inner0
      br $folding-inner1
     end
    end
    i32.const 0
    return
   end
   i32.const 1
   return
  end
  i32.const 0
 )
 (func $assembly/reach/RectangleBoundaryUtils/RectangleBoundaryUtils.reachRectangleN (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (result i32)
  local.get $3
  local.get $7
  i32.add
  local.set $7
  local.get $5
  local.get $9
  i32.add
  local.set $9
  local.get $10
  i32.const 2
  i32.and
  i32.eqz
  local.get $4
  local.get $8
  i32.add
  local.tee $8
  local.get $2
  i32.eq
  i32.and
  if
   local.get $7
   f64.convert_i32_s
   local.get $9
   f64.convert_i32_s
   f64.min
   i32.trunc_sat_f64_s
   local.set $4
   local.get $3
   f64.convert_i32_s
   local.get $5
   f64.convert_i32_s
   f64.max
   i32.trunc_sat_f64_s
   local.set $2
   loop $for-loop|0
    local.get $2
    local.get $4
    i32.lt_s
    if
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$5 (result i32)
      local.get $8
      i32.const 1
      i32.sub
      local.tee $3
      i32.const 7
      i32.and
      local.get $2
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $5
      i32.const -1
      local.get $0
      i32.load
      local.get $3
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $2
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $3
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$5
      drop
      i32.const -1
      local.get $5
      local.get $3
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$5
      drop
      local.get $3
      local.get $5
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     i32.const 8
     i32.and
     i32.eqz
     if
      i32.const 1
      return
     end
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|0
    end
   end
  else
   local.get $10
   i32.const 8
   i32.and
   i32.eqz
   local.get $2
   local.get $6
   i32.add
   local.tee $6
   local.get $4
   i32.eq
   i32.and
   if
    local.get $7
    f64.convert_i32_s
    local.get $9
    f64.convert_i32_s
    f64.min
    i32.trunc_sat_f64_s
    local.set $6
    local.get $3
    f64.convert_i32_s
    local.get $5
    f64.convert_i32_s
    f64.max
    i32.trunc_sat_f64_s
    local.set $2
    loop $for-loop|1
     local.get $2
     local.get $6
     i32.lt_s
     if
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$6 (result i32)
       i32.const -1
       local.get $0
       i32.load
       local.get $4
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $2
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $3
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$6
       drop
       i32.const -1
       local.get $4
       i32.const 7
       i32.and
       local.get $2
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $5
       local.get $3
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$6
       drop
       local.get $3
       local.get $5
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      i32.const 128
      i32.and
      i32.eqz
      if
       i32.const 1
       return
      end
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|1
     end
    end
   else
    local.get $10
    i32.const 1
    i32.and
    i32.eqz
    local.get $3
    local.get $9
    i32.eq
    i32.and
    if
     local.get $6
     f64.convert_i32_s
     local.get $8
     f64.convert_i32_s
     f64.min
     i32.trunc_sat_f64_s
     local.set $3
     local.get $2
     f64.convert_i32_s
     local.get $4
     f64.convert_i32_s
     f64.max
     i32.trunc_sat_f64_s
     local.set $2
     loop $for-loop|2
      local.get $2
      local.get $3
      i32.lt_s
      if
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$7 (result i32)
        local.get $2
        i32.const 7
        i32.and
        local.get $9
        i32.const 1
        i32.sub
        local.tee $4
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.set $5
        i32.const -1
        local.get $0
        i32.load
        local.get $2
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $4
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $4
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$7
        drop
        i32.const -1
        local.get $5
        local.get $4
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$7
        drop
        local.get $4
        local.get $5
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       i32.const 2
       i32.and
       i32.eqz
       if
        i32.const 1
        return
       end
       local.get $2
       i32.const 1
       i32.add
       local.set $2
       br $for-loop|2
      end
     end
    else
     local.get $10
     i32.const 4
     i32.and
     i32.eqz
     local.get $5
     local.get $7
     i32.eq
     i32.and
     if
      local.get $6
      f64.convert_i32_s
      local.get $8
      f64.convert_i32_s
      f64.min
      i32.trunc_sat_f64_s
      local.set $3
      local.get $2
      f64.convert_i32_s
      local.get $4
      f64.convert_i32_s
      f64.max
      i32.trunc_sat_f64_s
      local.set $2
      loop $for-loop|3
       local.get $2
       local.get $3
       i32.lt_s
       if
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$8 (result i32)
         i32.const -1
         local.get $0
         i32.load
         local.get $2
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $5
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $1
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $4
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$8
         drop
         i32.const -1
         local.get $2
         i32.const 7
         i32.and
         local.get $5
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.tee $6
         local.get $4
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$8
         drop
         local.get $4
         local.get $6
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        i32.const 32
        i32.and
        i32.eqz
        if
         i32.const 1
         return
        end
        local.get $2
        i32.const 1
        i32.add
        local.set $2
        br $for-loop|3
       end
      end
     end
    end
   end
  end
  i32.const 0
 )
 (func $assembly/reach/RectangleBoundaryUtils/RectangleBoundaryUtils.reachRectangle1 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  (local $9 i32)
  (local $10 i32)
  local.get $2
  local.get $4
  i32.const 1
  i32.sub
  i32.eq
  local.get $3
  local.get $5
  i32.ge_s
  i32.and
  local.get $5
  local.get $7
  i32.add
  i32.const 1
  i32.sub
  local.tee $7
  local.get $3
  i32.ge_s
  i32.and
  if (result i32)
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$9 (result i32)
    i32.const -1
    local.get $0
    i32.load
    local.get $2
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $3
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $9
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$9
    drop
    i32.const -1
    local.get $2
    i32.const 7
    i32.and
    local.get $3
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.tee $10
    local.get $9
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$9
    drop
    local.get $9
    local.get $10
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   i32.const 8
   i32.and
  else
   i32.const 1
  end
  local.get $8
  i32.const 8
  i32.and
  i32.or
  i32.eqz
  if
   i32.const 1
   return
  end
  local.get $2
  local.get $4
  local.get $6
  i32.add
  i32.const 1
  i32.sub
  local.tee $6
  i32.const 1
  i32.add
  i32.eq
  local.get $3
  local.get $5
  i32.ge_s
  i32.and
  local.get $3
  local.get $7
  i32.le_s
  i32.and
  if (result i32)
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$10 (result i32)
    i32.const -1
    local.get $0
    i32.load
    local.get $2
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $3
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $9
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$10
    drop
    i32.const -1
    local.get $2
    i32.const 7
    i32.and
    local.get $3
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.tee $10
    local.get $9
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$10
    drop
    local.get $9
    local.get $10
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   i32.const 128
   i32.and
  else
   i32.const 1
  end
  local.get $8
  i32.const 2
  i32.and
  i32.or
  i32.eqz
  if
   i32.const 1
   return
  end
  local.get $3
  i32.const 1
  i32.add
  local.get $5
  i32.eq
  local.get $2
  local.get $4
  i32.ge_s
  i32.and
  local.get $2
  local.get $6
  i32.le_s
  i32.and
  if (result i32)
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$11 (result i32)
    i32.const -1
    local.get $0
    i32.load
    local.get $2
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $3
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $5
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$11
    drop
    i32.const -1
    local.get $2
    i32.const 7
    i32.and
    local.get $3
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.tee $9
    local.get $5
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$11
    drop
    local.get $5
    local.get $9
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   i32.const 2
   i32.and
  else
   i32.const 1
  end
  local.get $8
  i32.const 4
  i32.and
  i32.or
  i32.eqz
  if
   i32.const 1
   return
  end
  local.get $3
  local.get $7
  i32.const 1
  i32.add
  i32.eq
  local.get $2
  local.get $4
  i32.ge_s
  i32.and
  local.get $2
  local.get $6
  i32.le_s
  i32.and
  if (result i32)
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$12 (result i32)
    i32.const -1
    local.get $0
    i32.load
    local.get $2
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $3
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $0
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$12
    drop
    i32.const -1
    local.get $2
    i32.const 7
    i32.and
    local.get $3
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.tee $1
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$12
    drop
    local.get $0
    local.get $1
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   i32.const 32
   i32.and
  else
   i32.const 1
  end
  local.get $8
  i32.const 1
  i32.and
  i32.or
  i32.eqz
 )
 (func $assembly/reach/ReachStrategy/ReachStrategy.reached (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (result i32)
  (local $12 i32)
  local.get $2
  local.get $4
  i32.eq
  block $assembly/reach/ReachStrategy/ReachStrategy.exitStrategy|inlined.0 (result i32)
   i32.const 4
   local.get $10
   i32.const -2
   i32.eq
   br_if $assembly/reach/ReachStrategy/ReachStrategy.exitStrategy|inlined.0
   drop
   i32.const 3
   local.get $10
   i32.const -1
   i32.eq
   br_if $assembly/reach/ReachStrategy/ReachStrategy.exitStrategy|inlined.0
   drop
   i32.const 0
   local.get $10
   i32.const 3
   i32.le_s
   local.get $10
   i32.const 0
   i32.ge_s
   i32.and
   local.get $10
   i32.const 9
   i32.eq
   i32.or
   br_if $assembly/reach/ReachStrategy/ReachStrategy.exitStrategy|inlined.0
   drop
   i32.const 1
   local.get $10
   i32.const 9
   i32.lt_s
   br_if $assembly/reach/ReachStrategy/ReachStrategy.exitStrategy|inlined.0
   drop
   i32.const 2
   local.get $10
   i32.const 11
   i32.le_s
   local.get $10
   i32.const 10
   i32.ge_s
   i32.and
   local.get $10
   i32.const 22
   i32.eq
   i32.or
   br_if $assembly/reach/ReachStrategy/ReachStrategy.exitStrategy|inlined.0
   drop
   i32.const 3
  end
  local.tee $12
  i32.const 4
  i32.ne
  i32.and
  local.get $3
  local.get $5
  i32.eq
  i32.and
  if
   i32.const 1
   return
  end
  block $break|0
   block $case3|0
    block $case2|0
     block $case1|0
      block $case0|0
       local.get $12
       br_table $case0|0 $case1|0 $case2|0 $break|0 $case3|0 $break|0
      end
      block $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWall$93 (result i32)
       i32.const 1
       local.get $8
       i32.const 1
       i32.eq
       local.tee $6
       local.get $2
       local.get $4
       i32.eq
       i32.and
       local.get $3
       local.get $5
       i32.eq
       i32.and
       br_if $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWall$93
       drop
       i32.const 1
       local.get $8
       i32.const 1
       i32.ne
       local.get $2
       local.get $4
       i32.le_s
       i32.and
       local.get $2
       local.get $8
       i32.add
       i32.const 1
       i32.sub
       local.get $4
       i32.ge_s
       i32.and
       local.get $3
       local.get $5
       i32.le_s
       i32.and
       local.get $3
       local.get $8
       i32.add
       i32.const 1
       i32.sub
       local.get $5
       i32.ge_s
       i32.and
       br_if $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWall$93
       drop
       local.get $6
       if
        local.get $0
        local.get $1
        local.get $2
        local.get $3
        local.get $4
        local.get $5
        local.get $10
        local.get $9
        call $assembly/reach/ReachStrategy/ReachStrategy.reachWall1
        br $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWall$93
       end
       local.get $0
       local.get $1
       local.get $2
       local.get $3
       local.get $4
       local.get $5
       local.get $8
       local.get $10
       local.get $9
       call $assembly/reach/ReachStrategy/ReachStrategy.reachWallN
      end
      return
     end
     block $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWallDecor$94 (result i32)
      i32.const 1
      local.get $8
      i32.const 1
      i32.eq
      local.tee $6
      local.get $2
      local.get $4
      i32.eq
      i32.and
      local.get $3
      local.get $5
      i32.eq
      i32.and
      br_if $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWallDecor$94
      drop
      i32.const 1
      local.get $8
      i32.const 1
      i32.ne
      local.get $2
      local.get $4
      i32.le_s
      i32.and
      local.get $2
      local.get $8
      i32.add
      i32.const 1
      i32.sub
      local.get $4
      i32.ge_s
      i32.and
      local.get $3
      local.get $5
      i32.le_s
      i32.and
      local.get $3
      local.get $8
      i32.add
      i32.const 1
      i32.sub
      local.get $5
      i32.ge_s
      i32.and
      br_if $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWallDecor$94
      drop
      local.get $6
      if
       local.get $0
       local.get $1
       local.get $2
       local.get $3
       local.get $4
       local.get $5
       local.get $10
       local.get $9
       call $assembly/reach/ReachStrategy/ReachStrategy.reachWallDecor1
       br $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachWallDecor$94
      end
      local.get $0
      local.get $1
      local.get $2
      local.get $3
      local.get $4
      local.get $5
      local.get $8
      local.get $10
      local.get $9
      call $assembly/reach/ReachStrategy/ReachStrategy.reachWallDecorN
     end
     return
    end
    block $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachRectangle$95 (result i32)
     local.get $7
     local.get $6
     local.get $9
     i32.const 1
     i32.and
     local.tee $10
     select
     local.set $12
     local.get $9
     if
      local.get $11
      local.get $9
      i32.shl
      i32.const 15
      i32.and
      local.get $11
      i32.const 4
      local.get $9
      i32.sub
      i32.shr_s
      i32.or
      local.set $11
     end
     local.get $6
     local.get $7
     local.get $10
     select
     local.set $6
     local.get $2
     local.get $8
     i32.add
     local.get $4
     i32.le_s
     local.get $2
     local.get $4
     local.get $12
     i32.add
     i32.ge_s
     i32.or
     if (result i32)
      i32.const 0
     else
      local.get $5
      local.get $3
      local.get $8
      i32.add
      i32.lt_s
      local.get $3
      local.get $5
      local.get $6
      i32.add
      i32.lt_s
      i32.and
     end
     local.set $7
     local.get $8
     i32.const 1
     i32.gt_s
     if
      local.get $7
      if (result i32)
       i32.const 1
      else
       local.get $0
       local.get $1
       local.get $2
       local.get $3
       local.get $4
       local.get $5
       local.get $8
       local.get $8
       local.get $12
       local.get $6
       local.get $11
       call $assembly/reach/RectangleBoundaryUtils/RectangleBoundaryUtils.reachRectangleN
      end
      br $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachRectangle$95
     end
     local.get $7
     if (result i32)
      i32.const 1
     else
      local.get $0
      local.get $1
      local.get $2
      local.get $3
      local.get $4
      local.get $5
      local.get $12
      local.get $6
      local.get $11
      call $assembly/reach/RectangleBoundaryUtils/RectangleBoundaryUtils.reachRectangle1
     end
    end
    return
   end
   block $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachExclusiveRectangle$96 (result i32)
    local.get $7
    local.get $6
    local.get $9
    i32.const 1
    i32.and
    local.tee $10
    select
    local.set $12
    local.get $9
    if
     local.get $11
     local.get $9
     i32.shl
     i32.const 15
     i32.and
     local.get $11
     i32.const 4
     local.get $9
     i32.sub
     i32.shr_s
     i32.or
     local.set $11
    end
    local.get $6
    local.get $7
    local.get $10
    select
    local.set $6
    local.get $2
    local.get $8
    i32.add
    local.get $4
    i32.le_s
    local.get $2
    local.get $4
    local.get $12
    i32.add
    i32.ge_s
    i32.or
    if (result i32)
     i32.const 0
    else
     local.get $5
     local.get $3
     local.get $8
     i32.add
     i32.lt_s
     local.get $3
     local.get $5
     local.get $6
     i32.add
     i32.lt_s
     i32.and
    end
    local.set $7
    local.get $8
    i32.const 1
    i32.gt_s
    if
     local.get $7
     if (result i32)
      i32.const 0
     else
      local.get $0
      local.get $1
      local.get $2
      local.get $3
      local.get $4
      local.get $5
      local.get $8
      local.get $8
      local.get $12
      local.get $6
      local.get $11
      call $assembly/reach/RectangleBoundaryUtils/RectangleBoundaryUtils.reachRectangleN
     end
     br $__inlined_func$assembly/reach/ReachStrategy/ReachStrategy.reachExclusiveRectangle$96
    end
    local.get $7
    if (result i32)
     i32.const 0
    else
     local.get $0
     local.get $1
     local.get $2
     local.get $3
     local.get $4
     local.get $5
     local.get $12
     local.get $6
     local.get $11
     call $assembly/reach/RectangleBoundaryUtils/RectangleBoundaryUtils.reachRectangle1
    end
   end
   return
  end
  i32.const 0
 )
 (func $assembly/PathFinder/PathFinder#findPath1 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (param $12 i32) (result i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.sub
  local.set $15
  loop $while-continue|0
   local.get $0
   i32.load offset=36
   local.tee $13
   local.get $0
   i32.load offset=40
   i32.ne
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $13
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store offset=28
    local.get $0
    local.get $0
    i32.load offset=24
    local.get $0
    i32.load offset=36
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store offset=32
    local.get $0
    local.get $0
    i32.load offset=36
    i32.const 1
    i32.add
    local.get $0
    i32.load offset=8
    i32.const 1
    i32.sub
    i32.and
    i32.store offset=36
    local.get $0
    i32.load
    local.get $3
    local.get $1
    local.get $0
    i32.load offset=28
    i32.add
    local.get $2
    local.get $0
    i32.load offset=32
    i32.add
    local.get $1
    local.get $4
    i32.add
    local.get $2
    local.get $5
    i32.add
    local.get $6
    local.get $7
    local.get $8
    local.get $9
    local.get $10
    local.get $11
    call $assembly/reach/ReachStrategy/ReachStrategy.reached
    if
     i32.const 1
     return
    end
    local.get $0
    i32.load offset=16
    local.get $0
    i32.load offset=32
    local.tee $16
    local.get $0
    i32.load offset=28
    local.tee $13
    local.get $0
    i32.load offset=4
    local.tee $17
    i32.mul
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.const 1
    i32.add
    local.set $14
    local.get $13
    i32.const 1
    i32.sub
    local.set $18
    local.get $13
    i32.const 0
    i32.gt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $17
     local.get $18
     i32.mul
     local.get $16
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$14
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$13 (result i32)
       local.get $1
       local.get $18
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $16
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$13
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$13
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default
       block $case4
        block $case3
         block $case2
          block $case1
           block $case0
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case0 $case1 $case2 $case3 $case4 $default
           end
           local.get $13
           i32.const 2359560
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$14
          end
          local.get $13
          i32.const 262408
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$14
         end
         local.get $13
         i32.const 2359560
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$14
        end
        local.get $13
        i32.const -2145124088
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$14
       end
       local.get $13
       i32.const 135168
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$14
      end
      unreachable
     end
    end
    local.get $13
    if
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $16
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 2
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $16
    local.get $0
    i32.load offset=32
    local.set $17
    local.get $13
    local.get $15
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$16
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$15 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $17
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$15
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$15
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $13
           i32.const 2359680
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$16
          end
          local.get $13
          i32.const 262528
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$16
         end
         local.get $13
         i32.const 2359680
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$16
        end
        local.get $13
        i32.const -2145123968
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$16
       end
       local.get $13
       i32.const 196608
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$16
      end
      unreachable
     end
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 8
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $17
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $13
    i32.const 1
    i32.sub
    local.set $17
    local.get $13
    i32.const 0
    i32.gt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$18
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$17 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $17
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$17
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$17
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default1
       block $case42
        block $case33
         block $case24
          block $case15
           block $case06
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case06 $case15 $case24 $case33 $case42 $default1
           end
           local.get $13
           i32.const 2359554
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$18
          end
          local.get $13
          i32.const 262402
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$18
         end
         local.get $13
         i32.const 2359554
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$18
        end
        local.get $13
        i32.const -2145124094
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$18
       end
       local.get $13
       i32.const 132096
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$18
      end
      unreachable
     end
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 1
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $17
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $13
    i32.const 1
    i32.add
    local.set $17
    local.get $13
    local.get $15
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$20
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$19 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $17
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$19
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$19
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default2
       block $case43
        block $case34
         block $case25
          block $case16
           block $case07
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case07 $case16 $case25 $case34 $case43 $default2
           end
           local.get $13
           i32.const 2359584
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$20
          end
          local.get $13
          i32.const 262432
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$20
         end
         local.get $13
         i32.const 2359584
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$20
        end
        local.get $13
        i32.const -2145124064
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$20
       end
       local.get $13
       i32.const 147456
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$20
      end
      unreachable
     end
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 4
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $17
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.sub
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.sub
    local.set $18
    local.get $17
    i32.const 0
    i32.gt_s
    local.get $13
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$22
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$21 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$21
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$21
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default3
       block $case44
        block $case35
         block $case26
          block $case17
           block $case08
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case08 $case17 $case26 $case35 $case44 $default3
           end
           local.get $13
           i32.const 2359566
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$22
          end
          local.get $13
          i32.const 262414
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$22
         end
         local.get $13
         i32.const 2359566
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$22
        end
        local.get $13
        i32.const -2145124082
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$22
       end
       local.get $13
       i32.const 138240
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$22
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$24
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$23 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$23
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$23
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default4
       block $case45
        block $case36
         block $case27
          block $case18
           block $case09
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case09 $case18 $case27 $case36 $case45 $default4
           end
           local.get $13
           i32.const 2359560
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$24
          end
          local.get $13
          i32.const 262408
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$24
         end
         local.get $13
         i32.const 2359560
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$24
        end
        local.get $13
        i32.const -2145124088
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$24
       end
       local.get $13
       i32.const 135168
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$24
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$26
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$25 (result i32)
       local.get $0
       i32.load offset=28
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$25
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$25
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default5
       block $case46
        block $case37
         block $case28
          block $case19
           block $case010
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case010 $case19 $case28 $case37 $case46 $default5
           end
           local.get $13
           i32.const 2359554
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$26
          end
          local.get $13
          i32.const 262402
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$26
         end
         local.get $13
         i32.const 2359554
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$26
        end
        local.get $13
        i32.const -2145124094
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$26
       end
       local.get $13
       i32.const 132096
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$26
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 3
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.sub
    local.set $18
    local.get $13
    local.get $15
    i32.lt_s
    local.get $17
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$28
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$27 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$27
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$27
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default6
       block $case47
        block $case38
         block $case29
          block $case110
           block $case011
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case011 $case110 $case29 $case38 $case47 $default6
           end
           local.get $13
           i32.const 2359683
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$28
          end
          local.get $13
          i32.const 262531
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$28
         end
         local.get $13
         i32.const 2359683
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$28
        end
        local.get $13
        i32.const -2145123965
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$28
       end
       local.get $13
       i32.const 198144
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$28
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$30
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$29 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$29
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$29
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default7
       block $case48
        block $case39
         block $case210
          block $case111
           block $case012
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case012 $case111 $case210 $case39 $case48 $default7
           end
           local.get $13
           i32.const 2359680
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$30
          end
          local.get $13
          i32.const 262528
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$30
         end
         local.get $13
         i32.const 2359680
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$30
        end
        local.get $13
        i32.const -2145123968
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$30
       end
       local.get $13
       i32.const 196608
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$30
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$32
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$31 (result i32)
       local.get $0
       i32.load offset=28
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$31
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$31
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default8
       block $case49
        block $case310
         block $case211
          block $case112
           block $case013
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case013 $case112 $case211 $case310 $case49 $default8
           end
           local.get $13
           i32.const 2359554
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$32
          end
          local.get $13
          i32.const 262402
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$32
         end
         local.get $13
         i32.const 2359554
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$32
        end
        local.get $13
        i32.const -2145124094
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$32
       end
       local.get $13
       i32.const 132096
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$32
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 9
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.sub
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.add
    local.set $18
    local.get $15
    local.get $17
    i32.gt_s
    local.get $13
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$34
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$33 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$33
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$33
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default9
       block $case410
        block $case311
         block $case212
          block $case113
           block $case014
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case014 $case113 $case212 $case311 $case410 $default9
           end
           local.get $13
           i32.const 2359608
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$34
          end
          local.get $13
          i32.const 262456
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$34
         end
         local.get $13
         i32.const 2359608
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$34
        end
        local.get $13
        i32.const -2145124040
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$34
       end
       local.get $13
       i32.const 159744
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$34
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$36
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$35 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$35
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$35
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default10
       block $case411
        block $case312
         block $case213
          block $case114
           block $case015
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case015 $case114 $case213 $case312 $case411 $default10
           end
           local.get $13
           i32.const 2359560
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$36
          end
          local.get $13
          i32.const 262408
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$36
         end
         local.get $13
         i32.const 2359560
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$36
        end
        local.get $13
        i32.const -2145124088
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$36
       end
       local.get $13
       i32.const 135168
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$36
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$38
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$37 (result i32)
       local.get $0
       i32.load offset=28
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$37
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$37
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default11
       block $case412
        block $case313
         block $case214
          block $case115
           block $case016
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case016 $case115 $case214 $case313 $case412 $default11
           end
           local.get $13
           i32.const 2359584
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$38
          end
          local.get $13
          i32.const 262432
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$38
         end
         local.get $13
         i32.const 2359584
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$38
        end
        local.get $13
        i32.const -2145124064
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$38
       end
       local.get $13
       i32.const 147456
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$38
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 6
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.add
    local.set $18
    local.get $13
    local.get $15
    i32.lt_s
    local.get $15
    local.get $17
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$40
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$39 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$39
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$39
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default12
       block $case413
        block $case314
         block $case215
          block $case116
           block $case017
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case017 $case116 $case215 $case314 $case413 $default12
           end
           local.get $13
           i32.const 2359776
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$40
          end
          local.get $13
          i32.const 262624
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$40
         end
         local.get $13
         i32.const 2359776
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$40
        end
        local.get $13
        i32.const -2145123872
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$40
       end
       local.get $13
       i32.const 245760
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$40
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$42
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$41 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$41
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$41
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default13
       block $case414
        block $case315
         block $case216
          block $case117
           block $case018
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case018 $case117 $case216 $case315 $case414 $default13
           end
           local.get $13
           i32.const 2359680
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$42
          end
          local.get $13
          i32.const 262528
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$42
         end
         local.get $13
         i32.const 2359680
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$42
        end
        local.get $13
        i32.const -2145123968
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$42
       end
       local.get $13
       i32.const 196608
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$42
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$44
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$43 (result i32)
       local.get $0
       i32.load offset=28
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$43
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$43
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default14
       block $case415
        block $case316
         block $case217
          block $case118
           block $case019
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case019 $case118 $case217 $case316 $case415 $default14
           end
           local.get $13
           i32.const 2359584
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$44
          end
          local.get $13
          i32.const 262432
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$44
         end
         local.get $13
         i32.const 2359584
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$44
        end
        local.get $13
        i32.const -2145124064
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$44
       end
       local.get $13
       i32.const 147456
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$44
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 12
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $assembly/PathFinder/PathFinder#findPath2 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (param $12 i32) (result i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  local.get $0
  i32.load offset=4
  i32.const 2
  i32.sub
  local.set $15
  loop $while-continue|0
   local.get $0
   i32.load offset=36
   local.tee $13
   local.get $0
   i32.load offset=40
   i32.ne
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $13
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store offset=28
    local.get $0
    local.get $0
    i32.load offset=24
    local.get $0
    i32.load offset=36
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store offset=32
    local.get $0
    local.get $0
    i32.load offset=36
    i32.const 1
    i32.add
    local.get $0
    i32.load offset=8
    i32.const 1
    i32.sub
    i32.and
    i32.store offset=36
    local.get $0
    i32.load
    local.get $3
    local.get $1
    local.get $0
    i32.load offset=28
    i32.add
    local.get $2
    local.get $0
    i32.load offset=32
    i32.add
    local.get $1
    local.get $4
    i32.add
    local.get $2
    local.get $5
    i32.add
    local.get $6
    local.get $7
    local.get $8
    local.get $9
    local.get $10
    local.get $11
    call $assembly/reach/ReachStrategy/ReachStrategy.reached
    if
     i32.const 1
     return
    end
    local.get $0
    i32.load offset=16
    local.get $0
    i32.load offset=32
    local.tee $16
    local.get $0
    i32.load offset=28
    local.tee $13
    local.get $0
    i32.load offset=4
    local.tee $17
    i32.mul
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.const 1
    i32.add
    local.set $14
    local.get $13
    i32.const 1
    i32.sub
    local.set $18
    local.get $13
    i32.const 0
    i32.gt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $17
     local.get $18
     i32.mul
     local.get $16
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$46
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$45 (result i32)
       local.get $1
       local.get $18
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $16
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$45
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$45
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default
       block $case4
        block $case3
         block $case2
          block $case1
           block $case0
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case0 $case1 $case2 $case3 $case4 $default
           end
           local.get $13
           i32.const 2359566
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$46
          end
          local.get $13
          i32.const 262414
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$46
         end
         local.get $13
         i32.const 2359566
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$46
        end
        local.get $13
        i32.const -2145124082
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$46
       end
       local.get $13
       i32.const 138240
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$46
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$48
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$47 (result i32)
       local.get $1
       local.get $18
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 1
       i32.add
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$47
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$47
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $13
           i32.const 2359608
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$48
          end
          local.get $13
          i32.const 262456
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$48
         end
         local.get $13
         i32.const 2359608
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$48
        end
        local.get $13
        i32.const -2145124040
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$48
       end
       local.get $13
       i32.const 159744
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$48
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $16
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 2
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $16
    local.get $0
    i32.load offset=32
    local.set $17
    local.get $13
    local.get $15
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$50
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$49 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 2
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $17
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$49
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$49
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default1
       block $case42
        block $case33
         block $case24
          block $case15
           block $case06
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case06 $case15 $case24 $case33 $case42 $default1
           end
           local.get $13
           i32.const 2359683
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$50
          end
          local.get $13
          i32.const 262531
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$50
         end
         local.get $13
         i32.const 2359683
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$50
        end
        local.get $13
        i32.const -2145123965
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$50
       end
       local.get $13
       i32.const 198144
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$50
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$52
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$51 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 2
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 1
       i32.add
       local.get $2
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$51
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$51
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default2
       block $case43
        block $case34
         block $case25
          block $case16
           block $case07
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case07 $case16 $case25 $case34 $case43 $default2
           end
           local.get $13
           i32.const 2359776
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$52
          end
          local.get $13
          i32.const 262624
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$52
         end
         local.get $13
         i32.const 2359776
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$52
        end
        local.get $13
        i32.const -2145123872
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$52
       end
       local.get $13
       i32.const 245760
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$52
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 8
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $17
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $13
    i32.const 1
    i32.sub
    local.set $17
    local.get $13
    i32.const 0
    i32.gt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$54
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$53 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $17
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$53
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$53
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default3
       block $case44
        block $case35
         block $case26
          block $case17
           block $case08
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case08 $case17 $case26 $case35 $case44 $default3
           end
           local.get $13
           i32.const 2359566
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$54
          end
          local.get $13
          i32.const 262414
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$54
         end
         local.get $13
         i32.const 2359566
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$54
        end
        local.get $13
        i32.const -2145124082
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$54
       end
       local.get $13
       i32.const 138240
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$54
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$56
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$55 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 1
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $17
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$55
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$55
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default4
       block $case45
        block $case36
         block $case27
          block $case18
           block $case09
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case09 $case18 $case27 $case36 $case45 $default4
           end
           local.get $13
           i32.const 2359683
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$56
          end
          local.get $13
          i32.const 262531
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$56
         end
         local.get $13
         i32.const 2359683
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$56
        end
        local.get $13
        i32.const -2145123965
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$56
       end
       local.get $13
       i32.const 198144
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$56
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 1
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $17
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $13
    i32.const 1
    i32.add
    local.set $17
    local.get $13
    local.get $15
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$58
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$57 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 2
       i32.add
       local.get $2
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$57
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$57
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default5
       block $case46
        block $case37
         block $case28
          block $case19
           block $case010
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case010 $case19 $case28 $case37 $case46 $default5
           end
           local.get $13
           i32.const 2359608
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$58
          end
          local.get $13
          i32.const 262456
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$58
         end
         local.get $13
         i32.const 2359608
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$58
        end
        local.get $13
        i32.const -2145124040
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$58
       end
       local.get $13
       i32.const 159744
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$58
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$60
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$59 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 1
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 2
       i32.add
       local.get $2
       i32.add
       local.tee $18
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $18
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$59
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$59
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default6
       block $case47
        block $case38
         block $case29
          block $case110
           block $case011
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case011 $case110 $case29 $case38 $case47 $default6
           end
           local.get $13
           i32.const 2359776
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$60
          end
          local.get $13
          i32.const 262624
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$60
         end
         local.get $13
         i32.const 2359776
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$60
        end
        local.get $13
        i32.const -2145123872
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$60
       end
       local.get $13
       i32.const 245760
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$60
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $17
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 4
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $17
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.sub
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.sub
    local.set $18
    local.get $17
    i32.const 0
    i32.gt_s
    local.get $13
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$62
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$61 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$61
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$61
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default7
       block $case48
        block $case39
         block $case210
          block $case111
           block $case012
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case012 $case111 $case210 $case39 $case48 $default7
           end
           local.get $13
           i32.const 2359614
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$62
          end
          local.get $13
          i32.const 262462
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$62
         end
         local.get $13
         i32.const 2359614
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$62
        end
        local.get $13
        i32.const -2145124034
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$62
       end
       local.get $13
       i32.const 162816
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$62
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$64
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$63 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$63
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$63
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default8
       block $case49
        block $case310
         block $case211
          block $case112
           block $case013
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case013 $case112 $case211 $case310 $case49 $default8
           end
           local.get $13
           i32.const 2359566
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$64
          end
          local.get $13
          i32.const 262414
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$64
         end
         local.get $13
         i32.const 2359566
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$64
        end
        local.get $13
        i32.const -2145124082
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$64
       end
       local.get $13
       i32.const 138240
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$64
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$66
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$65 (result i32)
       local.get $0
       i32.load offset=28
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$65
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$65
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default9
       block $case410
        block $case311
         block $case212
          block $case113
           block $case014
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case014 $case113 $case212 $case311 $case410 $default9
           end
           local.get $13
           i32.const 2359695
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$66
          end
          local.get $13
          i32.const 262543
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$66
         end
         local.get $13
         i32.const 2359695
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$66
        end
        local.get $13
        i32.const -2145123953
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$66
       end
       local.get $13
       i32.const 204288
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$66
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 3
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.sub
    local.set $18
    local.get $13
    local.get $15
    i32.lt_s
    local.get $17
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$68
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$67 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$67
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$67
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default10
       block $case411
        block $case312
         block $case213
          block $case114
           block $case015
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case015 $case114 $case213 $case312 $case411 $default10
           end
           local.get $13
           i32.const 2359695
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$68
          end
          local.get $13
          i32.const 262543
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$68
         end
         local.get $13
         i32.const 2359695
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$68
        end
        local.get $13
        i32.const -2145123953
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$68
       end
       local.get $13
       i32.const 204288
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$68
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$70
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$69 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 2
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$69
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$69
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default11
       block $case412
        block $case313
         block $case214
          block $case115
           block $case016
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case016 $case115 $case214 $case313 $case412 $default11
           end
           local.get $13
           i32.const 2359683
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$70
          end
          local.get $13
          i32.const 262531
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$70
         end
         local.get $13
         i32.const 2359683
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$70
        end
        local.get $13
        i32.const -2145123965
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$70
       end
       local.get $13
       i32.const 198144
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$70
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$72
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$71 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 2
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$71
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$71
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default12
       block $case413
        block $case314
         block $case215
          block $case116
           block $case017
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case017 $case116 $case215 $case314 $case413 $default12
           end
           local.get $13
           i32.const 2359779
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$72
          end
          local.get $13
          i32.const 262627
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$72
         end
         local.get $13
         i32.const 2359779
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$72
        end
        local.get $13
        i32.const -2145123869
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$72
       end
       local.get $13
       i32.const 247296
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$72
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 9
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.sub
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.add
    local.set $18
    local.get $15
    local.get $17
    i32.gt_s
    local.get $13
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$74
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$73 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$73
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$73
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default13
       block $case414
        block $case315
         block $case216
          block $case117
           block $case018
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case018 $case117 $case216 $case315 $case414 $default13
           end
           local.get $13
           i32.const 2359614
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$74
          end
          local.get $13
          i32.const 262462
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$74
         end
         local.get $13
         i32.const 2359614
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$74
        end
        local.get $13
        i32.const -2145124034
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$74
       end
       local.get $13
       i32.const 162816
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$74
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$76
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$75 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 2
       i32.add
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$75
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$75
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default14
       block $case415
        block $case316
         block $case217
          block $case118
           block $case019
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case019 $case118 $case217 $case316 $case415 $default14
           end
           local.get $13
           i32.const 2359608
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$76
          end
          local.get $13
          i32.const 262456
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$76
         end
         local.get $13
         i32.const 2359608
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$76
        end
        local.get $13
        i32.const -2145124040
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$76
       end
       local.get $13
       i32.const 159744
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$76
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$78
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$77 (result i32)
       local.get $0
       i32.load offset=28
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 2
       i32.add
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$77
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$77
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default15
       block $case416
        block $case317
         block $case218
          block $case119
           block $case020
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case020 $case119 $case218 $case317 $case416 $default15
           end
           local.get $13
           i32.const 2359800
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$78
          end
          local.get $13
          i32.const 262648
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$78
         end
         local.get $13
         i32.const 2359800
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$78
        end
        local.get $13
        i32.const -2145123848
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$78
       end
       local.get $13
       i32.const 258048
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$78
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 6
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $16
    local.get $0
    i32.load offset=32
    local.tee $17
    i32.const 1
    i32.add
    local.set $18
    local.get $13
    local.get $15
    i32.lt_s
    local.get $15
    local.get $17
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$80
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$79 (result i32)
       local.get $1
       local.get $16
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 2
       i32.add
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$79
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$79
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default16
       block $case417
        block $case318
         block $case219
          block $case120
           block $case021
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case021 $case120 $case219 $case318 $case417 $default16
           end
           local.get $13
           i32.const 2359800
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$80
          end
          local.get $13
          i32.const 262648
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$80
         end
         local.get $13
         i32.const 2359800
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$80
        end
        local.get $13
        i32.const -2145123848
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$80
       end
       local.get $13
       i32.const 258048
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$80
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$82
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$81 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 2
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $0
       i32.load offset=32
       i32.const 2
       i32.add
       local.get $2
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$81
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$81
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default17
       block $case418
        block $case319
         block $case220
          block $case121
           block $case022
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case022 $case121 $case220 $case319 $case418 $default17
           end
           local.get $13
           i32.const 2359776
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$82
          end
          local.get $13
          i32.const 262624
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$82
         end
         local.get $13
         i32.const 2359776
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$82
        end
        local.get $13
        i32.const -2145123872
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$82
       end
       local.get $13
       i32.const 245760
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$82
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$84
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$83 (result i32)
       local.get $0
       i32.load offset=28
       i32.const 2
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $17
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $19
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$83
       drop
       i32.const -1
       local.get $19
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$83
       drop
       local.get $13
       local.get $19
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default18
       block $case419
        block $case320
         block $case221
          block $case122
           block $case023
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case023 $case122 $case221 $case320 $case419 $default18
           end
           local.get $13
           i32.const 2359779
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$84
          end
          local.get $13
          i32.const 262627
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$84
         end
         local.get $13
         i32.const 2359779
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$84
        end
        local.get $13
        i32.const -2145123869
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$84
       end
       local.get $13
       i32.const 247296
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$84
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     local.get $16
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     local.tee $13
     local.get $0
     i32.load offset=12
     i32.add
     i32.const 12
     i32.store
     local.get $13
     local.get $0
     i32.load offset=16
     i32.add
     local.get $14
     i32.store
     local.get $0
     i32.load offset=20
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $16
     i32.store
     local.get $0
     i32.load offset=24
     local.get $0
     i32.load offset=40
     i32.const 2
     i32.shl
     i32.add
     local.get $18
     i32.store
     local.get $0
     local.get $0
     i32.load offset=40
     i32.const 1
     i32.add
     local.get $0
     i32.load offset=8
     i32.const 1
     i32.sub
     i32.and
     i32.store offset=40
    end
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $assembly/PathFinder/PathFinder#findPathN (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (param $12 i32) (result i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  local.get $0
  i32.load offset=4
  local.get $8
  i32.sub
  local.set $17
  loop $while-continue|0
   local.get $0
   i32.load offset=36
   local.tee $13
   local.get $0
   i32.load offset=40
   i32.ne
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $13
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store offset=28
    local.get $0
    local.get $0
    i32.load offset=24
    local.get $0
    i32.load offset=36
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store offset=32
    local.get $0
    local.get $0
    i32.load offset=36
    i32.const 1
    i32.add
    local.get $0
    i32.load offset=8
    i32.const 1
    i32.sub
    i32.and
    i32.store offset=36
    local.get $0
    i32.load
    local.get $3
    local.get $1
    local.get $0
    i32.load offset=28
    i32.add
    local.get $2
    local.get $0
    i32.load offset=32
    i32.add
    local.get $1
    local.get $4
    i32.add
    local.get $2
    local.get $5
    i32.add
    local.get $6
    local.get $7
    local.get $8
    local.get $9
    local.get $10
    local.get $11
    call $assembly/reach/ReachStrategy/ReachStrategy.reached
    if
     i32.const 1
     return
    end
    local.get $0
    i32.load offset=16
    local.get $0
    i32.load offset=32
    local.tee $18
    local.get $0
    i32.load offset=28
    local.tee $13
    local.get $0
    i32.load offset=4
    local.tee $14
    i32.mul
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.const 1
    i32.add
    local.set $16
    local.get $13
    i32.const 1
    i32.sub
    local.set $19
    local.get $13
    i32.const 0
    i32.gt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $14
     local.get $19
     i32.mul
     local.get $18
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$86
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$85 (result i32)
       local.get $1
       local.get $19
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $18
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$85
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$85
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default
       block $case4
        block $case3
         block $case2
          block $case1
           block $case0
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case0 $case1 $case2 $case3 $case4 $default
           end
           local.get $13
           i32.const 2359566
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$86
          end
          local.get $13
          i32.const 262414
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$86
         end
         local.get $13
         i32.const 2359566
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$86
        end
        local.get $13
        i32.const -2145124082
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$86
       end
       local.get $13
       i32.const 138240
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$86
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$88
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$87 (result i32)
       local.get $1
       local.get $19
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $8
       local.get $0
       i32.load offset=32
       i32.add
       i32.const 1
       i32.sub
       local.get $2
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$87
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$87
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $13
           i32.const 2359608
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$88
          end
          local.get $13
          i32.const 262456
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$88
         end
         local.get $13
         i32.const 2359608
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$88
        end
        local.get $13
        i32.const -2145124040
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$88
       end
       local.get $13
       i32.const 159744
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$88
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|1
      local.get $14
      local.get $8
      i32.const 1
      i32.sub
      i32.lt_s
      if
       block $for-break1
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$89 (result i32)
         local.get $1
         local.get $19
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $14
         local.get $0
         i32.load offset=32
         i32.add
         local.get $2
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$89
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$89
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$90
         block $default1
          block $case42
           block $case33
            block $case24
             block $case15
              block $case06
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case06 $case15 $case24 $case33 $case42 $default1
              end
              local.get $13
              i32.const 2359614
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$90
             end
             local.get $13
             i32.const 262462
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$90
            end
            local.get $13
            i32.const 2359614
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$90
           end
           local.get $13
           i32.const -2145124034
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$90
          end
          local.get $13
          i32.const 162816
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$90
         end
         unreachable
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break1
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|1
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $19
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $18
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 2
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $18
    local.get $0
    i32.load offset=32
    local.set $19
    local.get $13
    local.get $17
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $19
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$92
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$91 (result i32)
       local.get $8
       local.get $0
       i32.load offset=28
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $19
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$91
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$91
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default2
       block $case43
        block $case34
         block $case25
          block $case16
           block $case07
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case07 $case16 $case25 $case34 $case43 $default2
           end
           local.get $13
           i32.const 2359683
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$92
          end
          local.get $13
          i32.const 262531
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$92
         end
         local.get $13
         i32.const 2359683
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$92
        end
        local.get $13
        i32.const -2145123965
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$92
       end
       local.get $13
       i32.const 198144
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$92
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$94
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$93 (result i32)
       local.get $8
       local.get $0
       i32.load offset=28
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $8
       local.get $0
       i32.load offset=32
       i32.add
       i32.const 1
       i32.sub
       local.get $2
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$93
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$93
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default3
       block $case44
        block $case35
         block $case26
          block $case17
           block $case08
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case08 $case17 $case26 $case35 $case44 $default3
           end
           local.get $13
           i32.const 2359776
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$94
          end
          local.get $13
          i32.const 262624
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$94
         end
         local.get $13
         i32.const 2359776
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$94
        end
        local.get $13
        i32.const -2145123872
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$94
       end
       local.get $13
       i32.const 245760
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$94
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|2
      local.get $14
      local.get $8
      i32.const 1
      i32.sub
      i32.lt_s
      if
       block $for-break2
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$95 (result i32)
         local.get $8
         local.get $0
         i32.load offset=28
         i32.add
         local.get $1
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $14
         local.get $0
         i32.load offset=32
         i32.add
         local.get $2
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$95
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$95
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$96
         block $default4
          block $case45
           block $case36
            block $case27
             block $case18
              block $case09
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case09 $case18 $case27 $case36 $case45 $default4
              end
              local.get $13
              i32.const 2359779
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$96
             end
             local.get $13
             i32.const 262627
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$96
            end
            local.get $13
            i32.const 2359779
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$96
           end
           local.get $13
           i32.const -2145123869
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$96
          end
          local.get $13
          i32.const 247296
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$96
         end
         unreachable
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break2
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|2
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $18
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $19
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 8
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    local.get $0
    i32.load offset=28
    local.set $18
    local.get $0
    i32.load offset=32
    local.tee $13
    i32.const 1
    i32.sub
    local.set $19
    local.get $13
    i32.const 0
    i32.gt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $19
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$98
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$97 (result i32)
       local.get $1
       local.get $18
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $19
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$97
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$97
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default5
       block $case46
        block $case37
         block $case28
          block $case19
           block $case010
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case010 $case19 $case28 $case37 $case46 $default5
           end
           local.get $13
           i32.const 2359566
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$98
          end
          local.get $13
          i32.const 262414
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$98
         end
         local.get $13
         i32.const 2359566
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$98
        end
        local.get $13
        i32.const -2145124082
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$98
       end
       local.get $13
       i32.const 138240
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$98
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$100
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$99 (result i32)
       local.get $8
       local.get $0
       i32.load offset=28
       i32.add
       i32.const 1
       i32.sub
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $19
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$99
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$99
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default6
       block $case47
        block $case38
         block $case29
          block $case110
           block $case011
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case011 $case110 $case29 $case38 $case47 $default6
           end
           local.get $13
           i32.const 2359683
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$100
          end
          local.get $13
          i32.const 262531
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$100
         end
         local.get $13
         i32.const 2359683
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$100
        end
        local.get $13
        i32.const -2145123965
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$100
       end
       local.get $13
       i32.const 198144
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$100
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|3
      local.get $14
      local.get $8
      i32.const 1
      i32.sub
      i32.lt_s
      if
       block $for-break3
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$101 (result i32)
         local.get $14
         local.get $0
         i32.load offset=28
         i32.add
         local.get $1
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $2
         local.get $19
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$101
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$101
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$102
         block $default7
          block $case48
           block $case39
            block $case210
             block $case111
              block $case012
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case012 $case111 $case210 $case39 $case48 $default7
              end
              local.get $13
              i32.const 2359695
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$102
             end
             local.get $13
             i32.const 262543
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$102
            end
            local.get $13
            i32.const 2359695
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$102
           end
           local.get $13
           i32.const -2145123953
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$102
          end
          local.get $13
          i32.const 204288
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$102
         end
         unreachable
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break3
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|3
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $18
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $19
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 1
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    local.get $0
    i32.load offset=28
    local.set $18
    local.get $0
    i32.load offset=32
    local.tee $13
    i32.const 1
    i32.add
    local.set $19
    local.get $13
    local.get $17
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $19
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$104
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$103 (result i32)
       local.get $1
       local.get $18
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $8
       local.get $0
       i32.load offset=32
       i32.add
       local.get $2
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$103
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$103
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default8
       block $case49
        block $case310
         block $case211
          block $case112
           block $case013
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case013 $case112 $case211 $case310 $case49 $default8
           end
           local.get $13
           i32.const 2359608
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$104
          end
          local.get $13
          i32.const 262456
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$104
         end
         local.get $13
         i32.const 2359608
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$104
        end
        local.get $13
        i32.const -2145124040
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$104
       end
       local.get $13
       i32.const 159744
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$104
      end
      unreachable
     end
    end
    local.get $13
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$106
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$105 (result i32)
       local.get $8
       local.get $0
       i32.load offset=28
       i32.add
       i32.const 1
       i32.sub
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $8
       local.get $0
       i32.load offset=32
       i32.add
       local.get $2
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$105
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$105
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default9
       block $case410
        block $case311
         block $case212
          block $case113
           block $case014
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case014 $case113 $case212 $case311 $case410 $default9
           end
           local.get $13
           i32.const 2359776
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$106
          end
          local.get $13
          i32.const 262624
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$106
         end
         local.get $13
         i32.const 2359776
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$106
        end
        local.get $13
        i32.const -2145123872
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$106
       end
       local.get $13
       i32.const 245760
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$106
      end
      unreachable
     end
    else
     i32.const 0
     local.set $13
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|4
      local.get $14
      local.get $8
      i32.const 1
      i32.sub
      i32.lt_s
      if
       block $for-break4
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$107 (result i32)
         local.get $14
         local.get $18
         i32.add
         local.get $1
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $8
         local.get $0
         i32.load offset=32
         i32.add
         local.get $2
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$107
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$107
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$108
         block $default10
          block $case411
           block $case312
            block $case213
             block $case114
              block $case015
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case015 $case114 $case213 $case312 $case411 $default10
              end
              local.get $13
              i32.const 2359800
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$108
             end
             local.get $13
             i32.const 262648
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$108
            end
            local.get $13
            i32.const 2359800
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$108
           end
           local.get $13
           i32.const -2145123848
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$108
          end
          local.get $13
          i32.const 258048
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$108
         end
         unreachable
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break4
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|4
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $18
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $19
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 4
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.sub
    local.set $18
    local.get $0
    i32.load offset=32
    local.tee $14
    i32.const 1
    i32.sub
    local.set $19
    local.get $14
    i32.const 0
    i32.gt_s
    local.get $13
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $19
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$110
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$109 (result i32)
       local.get $1
       local.get $18
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $19
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$109
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$109
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default11
       block $case412
        block $case313
         block $case214
          block $case115
           block $case016
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case016 $case115 $case214 $case313 $case412 $default11
           end
           local.get $13
           i32.const 2359566
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$110
          end
          local.get $13
          i32.const 262414
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$110
         end
         local.get $13
         i32.const 2359566
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$110
        end
        local.get $13
        i32.const -2145124082
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$110
       end
       local.get $13
       i32.const 138240
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$110
      end
      unreachable
     end
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|5
      local.get $8
      local.get $14
      i32.gt_s
      if
       block $for-break5
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$111 (result i32)
         local.get $1
         local.get $18
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $14
         local.get $0
         i32.load offset=32
         i32.add
         i32.const 1
         i32.sub
         local.get $2
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$111
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$111
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$112
         block $default12
          block $case413
           block $case314
            block $case215
             block $case116
              block $case017
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case017 $case116 $case215 $case314 $case413 $default12
              end
              local.get $13
              i32.const 2359614
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$112
             end
             local.get $13
             i32.const 262462
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$112
            end
            local.get $13
            i32.const 2359614
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$112
           end
           local.get $13
           i32.const -2145124034
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$112
          end
          local.get $13
          i32.const 162816
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$112
         end
         unreachable
        end
        local.get $13
        if
         block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$114
          block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$113 (result i32)
           local.get $14
           local.get $0
           i32.load offset=28
           i32.add
           i32.const 1
           i32.sub
           local.get $1
           i32.add
           local.tee $13
           i32.const 7
           i32.and
           local.get $2
           local.get $19
           i32.add
           local.tee $20
           i32.const 7
           i32.and
           i32.const 3
           i32.shl
           i32.or
           local.set $21
           i32.const -1
           local.get $0
           i32.load
           i32.load
           local.get $13
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           local.get $20
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           i32.const 11
           i32.shl
           i32.or
           local.get $3
           i32.const 3
           i32.and
           i32.const 22
           i32.shl
           i32.or
           i32.const 2
           i32.shl
           i32.add
           i32.load
           local.tee $13
           i32.eqz
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$113
           drop
           i32.const -1
           local.get $21
           local.get $13
           i32.const 20
           i32.sub
           i32.load offset=16
           i32.const 2
           i32.shr_u
           i32.ge_s
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$113
           drop
           local.get $13
           local.get $21
           i32.const 2
           i32.shl
           i32.add
           i32.load
          end
          local.set $13
          block $default13
           block $case414
            block $case315
             block $case216
              block $case117
               block $case018
                local.get $12
                i32.const 8
                i32.sub
                i32.load
                i32.const 6
                i32.sub
                br_table $case018 $case117 $case216 $case315 $case414 $default13
               end
               local.get $13
               i32.const 2359695
               i32.and
               i32.eqz
               local.set $13
               br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$114
              end
              local.get $13
              i32.const 262543
              i32.and
              i32.eqz
              local.get $13
              i32.const 2097152
              i32.and
              i32.const 0
              i32.ne
              i32.and
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$114
             end
             local.get $13
             i32.const 2359695
             i32.and
             i32.eqz
             local.get $13
             i32.const -2147483648
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$114
            end
            local.get $13
            i32.const -2145123953
            i32.and
            i32.eqz
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$114
           end
           local.get $13
           i32.const 204288
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$114
          end
          unreachable
         end
        else
         i32.const 0
         local.set $13
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break5
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|5
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $18
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $19
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 3
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $18
    local.get $0
    i32.load offset=32
    local.tee $14
    i32.const 1
    i32.sub
    local.set $19
    local.get $13
    local.get $17
    i32.lt_s
    local.get $14
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $19
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$116
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$115 (result i32)
       local.get $8
       local.get $0
       i32.load offset=28
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $2
       local.get $19
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$115
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$115
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default14
       block $case415
        block $case316
         block $case217
          block $case118
           block $case019
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case019 $case118 $case217 $case316 $case415 $default14
           end
           local.get $13
           i32.const 2359683
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$116
          end
          local.get $13
          i32.const 262531
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$116
         end
         local.get $13
         i32.const 2359683
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$116
        end
        local.get $13
        i32.const -2145123965
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$116
       end
       local.get $13
       i32.const 198144
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$116
      end
      unreachable
     end
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|6
      local.get $8
      local.get $14
      i32.gt_s
      if
       block $for-break6
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$117 (result i32)
         local.get $8
         local.get $0
         i32.load offset=28
         i32.add
         local.get $1
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $14
         local.get $0
         i32.load offset=32
         i32.add
         i32.const 1
         i32.sub
         local.get $2
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$117
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$117
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$118
         block $default15
          block $case416
           block $case317
            block $case218
             block $case119
              block $case020
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case020 $case119 $case218 $case317 $case416 $default15
              end
              local.get $13
              i32.const 2359779
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$118
             end
             local.get $13
             i32.const 262627
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$118
            end
            local.get $13
            i32.const 2359779
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$118
           end
           local.get $13
           i32.const -2145123869
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$118
          end
          local.get $13
          i32.const 247296
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$118
         end
         unreachable
        end
        local.get $13
        if
         block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$120
          block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$119 (result i32)
           local.get $14
           local.get $0
           i32.load offset=28
           i32.add
           local.get $1
           i32.add
           local.tee $13
           i32.const 7
           i32.and
           local.get $2
           local.get $19
           i32.add
           local.tee $20
           i32.const 7
           i32.and
           i32.const 3
           i32.shl
           i32.or
           local.set $21
           i32.const -1
           local.get $0
           i32.load
           i32.load
           local.get $13
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           local.get $20
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           i32.const 11
           i32.shl
           i32.or
           local.get $3
           i32.const 3
           i32.and
           i32.const 22
           i32.shl
           i32.or
           i32.const 2
           i32.shl
           i32.add
           i32.load
           local.tee $13
           i32.eqz
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$119
           drop
           i32.const -1
           local.get $21
           local.get $13
           i32.const 20
           i32.sub
           i32.load offset=16
           i32.const 2
           i32.shr_u
           i32.ge_s
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$119
           drop
           local.get $13
           local.get $21
           i32.const 2
           i32.shl
           i32.add
           i32.load
          end
          local.set $13
          block $default16
           block $case417
            block $case318
             block $case219
              block $case120
               block $case021
                local.get $12
                i32.const 8
                i32.sub
                i32.load
                i32.const 6
                i32.sub
                br_table $case021 $case120 $case219 $case318 $case417 $default16
               end
               local.get $13
               i32.const 2359695
               i32.and
               i32.eqz
               local.set $13
               br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$120
              end
              local.get $13
              i32.const 262543
              i32.and
              i32.eqz
              local.get $13
              i32.const 2097152
              i32.and
              i32.const 0
              i32.ne
              i32.and
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$120
             end
             local.get $13
             i32.const 2359695
             i32.and
             i32.eqz
             local.get $13
             i32.const -2147483648
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$120
            end
            local.get $13
            i32.const -2145123953
            i32.and
            i32.eqz
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$120
           end
           local.get $13
           i32.const 204288
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$120
          end
          unreachable
         end
        else
         i32.const 0
         local.set $13
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break6
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|6
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $18
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $19
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 9
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.sub
    local.set $18
    local.get $0
    i32.load offset=32
    local.tee $14
    i32.const 1
    i32.add
    local.set $19
    local.get $14
    local.get $17
    i32.lt_s
    local.get $13
    i32.const 0
    i32.gt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $19
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$122
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$121 (result i32)
       local.get $1
       local.get $18
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $8
       local.get $0
       i32.load offset=32
       i32.add
       local.get $2
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$121
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$121
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default17
       block $case418
        block $case319
         block $case220
          block $case121
           block $case022
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case022 $case121 $case220 $case319 $case418 $default17
           end
           local.get $13
           i32.const 2359608
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$122
          end
          local.get $13
          i32.const 262456
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$122
         end
         local.get $13
         i32.const 2359608
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$122
        end
        local.get $13
        i32.const -2145124040
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$122
       end
       local.get $13
       i32.const 159744
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$122
      end
      unreachable
     end
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|7
      local.get $8
      local.get $14
      i32.gt_s
      if
       block $for-break7
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$123 (result i32)
         local.get $1
         local.get $18
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $14
         local.get $0
         i32.load offset=32
         i32.add
         local.get $2
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$123
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$123
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$124
         block $default18
          block $case419
           block $case320
            block $case221
             block $case122
              block $case023
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case023 $case122 $case221 $case320 $case419 $default18
              end
              local.get $13
              i32.const 2359614
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$124
             end
             local.get $13
             i32.const 262462
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$124
            end
            local.get $13
            i32.const 2359614
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$124
           end
           local.get $13
           i32.const -2145124034
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$124
          end
          local.get $13
          i32.const 162816
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$124
         end
         unreachable
        end
        local.get $13
        if
         block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$126
          block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$125 (result i32)
           local.get $14
           local.get $0
           i32.load offset=28
           i32.add
           i32.const 1
           i32.sub
           local.get $1
           i32.add
           local.tee $13
           i32.const 7
           i32.and
           local.get $8
           local.get $0
           i32.load offset=32
           i32.add
           local.get $2
           i32.add
           local.tee $20
           i32.const 7
           i32.and
           i32.const 3
           i32.shl
           i32.or
           local.set $21
           i32.const -1
           local.get $0
           i32.load
           i32.load
           local.get $13
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           local.get $20
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           i32.const 11
           i32.shl
           i32.or
           local.get $3
           i32.const 3
           i32.and
           i32.const 22
           i32.shl
           i32.or
           i32.const 2
           i32.shl
           i32.add
           i32.load
           local.tee $13
           i32.eqz
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$125
           drop
           i32.const -1
           local.get $21
           local.get $13
           i32.const 20
           i32.sub
           i32.load offset=16
           i32.const 2
           i32.shr_u
           i32.ge_s
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$125
           drop
           local.get $13
           local.get $21
           i32.const 2
           i32.shl
           i32.add
           i32.load
          end
          local.set $13
          block $default19
           block $case420
            block $case321
             block $case222
              block $case123
               block $case024
                local.get $12
                i32.const 8
                i32.sub
                i32.load
                i32.const 6
                i32.sub
                br_table $case024 $case123 $case222 $case321 $case420 $default19
               end
               local.get $13
               i32.const 2359800
               i32.and
               i32.eqz
               local.set $13
               br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$126
              end
              local.get $13
              i32.const 262648
              i32.and
              i32.eqz
              local.get $13
              i32.const 2097152
              i32.and
              i32.const 0
              i32.ne
              i32.and
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$126
             end
             local.get $13
             i32.const 2359800
             i32.and
             i32.eqz
             local.get $13
             i32.const -2147483648
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$126
            end
            local.get $13
            i32.const -2145123848
            i32.and
            i32.eqz
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$126
           end
           local.get $13
           i32.const 258048
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$126
          end
          unreachable
         end
        else
         i32.const 0
         local.set $13
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break7
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|7
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $18
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $19
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 6
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    local.get $0
    i32.load offset=28
    local.tee $13
    i32.const 1
    i32.add
    local.set $18
    local.get $0
    i32.load offset=32
    local.tee $14
    i32.const 1
    i32.add
    local.set $19
    local.get $14
    local.get $17
    i32.lt_s
    local.get $13
    local.get $17
    i32.lt_s
    i32.and
    if (result i32)
     local.get $0
     i32.load offset=12
     local.get $18
     local.get $0
     i32.load offset=4
     i32.mul
     local.get $19
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
    else
     i32.const 1
    end
    if
     i32.const 0
     local.set $13
    else
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$128
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$127 (result i32)
       local.get $8
       local.get $0
       i32.load offset=28
       i32.add
       local.get $1
       i32.add
       local.tee $13
       i32.const 7
       i32.and
       local.get $8
       local.get $0
       i32.load offset=32
       i32.add
       local.get $2
       i32.add
       local.tee $14
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $15
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $13
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $14
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $3
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $13
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$127
       drop
       i32.const -1
       local.get $15
       local.get $13
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$127
       drop
       local.get $13
       local.get $15
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $13
      block $default20
       block $case421
        block $case322
         block $case223
          block $case124
           block $case025
            local.get $12
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case025 $case124 $case223 $case322 $case421 $default20
           end
           local.get $13
           i32.const 2359776
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$128
          end
          local.get $13
          i32.const 262624
          i32.and
          i32.eqz
          local.get $13
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$128
         end
         local.get $13
         i32.const 2359776
         i32.and
         i32.eqz
         local.get $13
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $13
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$128
        end
        local.get $13
        i32.const -2145123872
        i32.and
        i32.eqz
        local.set $13
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$128
       end
       local.get $13
       i32.const 245760
       i32.and
       i32.eqz
       local.set $13
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$128
      end
      unreachable
     end
    end
    local.get $13
    if
     i32.const 0
     local.set $15
     i32.const 1
     local.set $14
     loop $for-loop|8
      local.get $8
      local.get $14
      i32.gt_s
      if
       block $for-break8
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$129 (result i32)
         local.get $14
         local.get $0
         i32.load offset=28
         i32.add
         local.get $1
         i32.add
         local.tee $13
         i32.const 7
         i32.and
         local.get $8
         local.get $0
         i32.load offset=32
         i32.add
         local.get $2
         i32.add
         local.tee $20
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $21
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $13
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $20
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $3
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $13
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$129
         drop
         i32.const -1
         local.get $21
         local.get $13
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$129
         drop
         local.get $13
         local.get $21
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $13
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$130
         block $default21
          block $case422
           block $case323
            block $case224
             block $case125
              block $case026
               local.get $12
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case026 $case125 $case224 $case323 $case422 $default21
              end
              local.get $13
              i32.const 2359800
              i32.and
              i32.eqz
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$130
             end
             local.get $13
             i32.const 262648
             i32.and
             i32.eqz
             local.get $13
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$130
            end
            local.get $13
            i32.const 2359800
            i32.and
            i32.eqz
            local.get $13
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$130
           end
           local.get $13
           i32.const -2145123848
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$130
          end
          local.get $13
          i32.const 258048
          i32.and
          i32.eqz
          local.set $13
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$130
         end
         unreachable
        end
        local.get $13
        if
         block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$132
          block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$131 (result i32)
           local.get $8
           local.get $0
           i32.load offset=28
           i32.add
           local.get $1
           i32.add
           local.tee $13
           i32.const 7
           i32.and
           local.get $14
           local.get $0
           i32.load offset=32
           i32.add
           local.get $2
           i32.add
           local.tee $20
           i32.const 7
           i32.and
           i32.const 3
           i32.shl
           i32.or
           local.set $21
           i32.const -1
           local.get $0
           i32.load
           i32.load
           local.get $13
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           local.get $20
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           i32.const 11
           i32.shl
           i32.or
           local.get $3
           i32.const 3
           i32.and
           i32.const 22
           i32.shl
           i32.or
           i32.const 2
           i32.shl
           i32.add
           i32.load
           local.tee $13
           i32.eqz
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$131
           drop
           i32.const -1
           local.get $21
           local.get $13
           i32.const 20
           i32.sub
           i32.load offset=16
           i32.const 2
           i32.shr_u
           i32.ge_s
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$131
           drop
           local.get $13
           local.get $21
           i32.const 2
           i32.shl
           i32.add
           i32.load
          end
          local.set $13
          block $default22
           block $case423
            block $case324
             block $case225
              block $case126
               block $case027
                local.get $12
                i32.const 8
                i32.sub
                i32.load
                i32.const 6
                i32.sub
                br_table $case027 $case126 $case225 $case324 $case423 $default22
               end
               local.get $13
               i32.const 2359779
               i32.and
               i32.eqz
               local.set $13
               br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$132
              end
              local.get $13
              i32.const 262627
              i32.and
              i32.eqz
              local.get $13
              i32.const 2097152
              i32.and
              i32.const 0
              i32.ne
              i32.and
              local.set $13
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$132
             end
             local.get $13
             i32.const 2359779
             i32.and
             i32.eqz
             local.get $13
             i32.const -2147483648
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $13
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$132
            end
            local.get $13
            i32.const -2145123869
            i32.and
            i32.eqz
            local.set $13
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$132
           end
           local.get $13
           i32.const 247296
           i32.and
           i32.eqz
           local.set $13
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$132
          end
          unreachable
         end
        else
         i32.const 0
         local.set $13
        end
        local.get $13
        i32.eqz
        if
         i32.const 1
         local.set $15
         br $for-break8
        end
        local.get $14
        i32.const 1
        i32.add
        local.set $14
        br $for-loop|8
       end
      end
     end
     local.get $15
     i32.eqz
     if
      local.get $18
      local.get $0
      i32.load offset=4
      i32.mul
      local.get $19
      i32.add
      i32.const 2
      i32.shl
      local.tee $13
      local.get $0
      i32.load offset=12
      i32.add
      i32.const 12
      i32.store
      local.get $13
      local.get $0
      i32.load offset=16
      i32.add
      local.get $16
      i32.store
      local.get $0
      i32.load offset=20
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $18
      i32.store
      local.get $0
      i32.load offset=24
      local.get $0
      i32.load offset=40
      i32.const 2
      i32.shl
      i32.add
      local.get $19
      i32.store
      local.get $0
      local.get $0
      i32.load offset=40
      i32.const 1
      i32.add
      local.get $0
      i32.load offset=8
      i32.const 1
      i32.sub
      i32.and
      i32.store offset=40
     end
    end
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/rt/__newArray (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 0
  i32.const 1
  call $~lib/rt/tcms/__new
  local.set $1
  local.get $0
  if
   local.get $1
   local.get $0
   i32.const 0
   memory.copy
  end
  i32.const 16
  i32.const 18
  call $~lib/rt/tcms/__new
  local.tee $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
 )
 (func $~lib/rt/tlsf/moveBlock (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $2
  call $~lib/rt/tlsf/allocateBlock
  local.tee $2
  i32.const 4
  i32.add
  local.get $1
  i32.const 4
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  memory.copy
  local.get $1
  i32.const 4764
  i32.ge_u
  if
   local.get $1
   local.get $1
   i32.load
   i32.const 1
   i32.or
   i32.store
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/insertBlock
  end
  local.get $2
 )
 (func $~lib/rt/tcms/__renew (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i32.const 20
  i32.sub
  local.set $2
  local.get $0
  i32.const 4764
  i32.lt_u
  if
   local.get $1
   local.get $2
   i32.load offset=12
   call $~lib/rt/tcms/__new
   local.tee $3
   local.get $0
   local.get $1
   local.get $2
   i32.load offset=16
   local.tee $0
   local.get $0
   local.get $1
   i32.gt_u
   select
   memory.copy
   local.get $3
   return
  end
  local.get $1
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1168
   i32.const 1232
   i32.const 143
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/tcms/total
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
  i32.sub
  global.set $~lib/rt/tcms/total
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  local.get $1
  i32.const 16
  i32.add
  local.set $6
  local.get $0
  i32.const 16
  i32.sub
  local.tee $2
  i32.const 4764
  i32.lt_u
  if
   local.get $2
   i32.const 4
   i32.sub
   local.set $0
   local.get $2
   i32.const 15
   i32.and
   i32.const 1
   local.get $2
   select
   if (result i32)
    i32.const 1
   else
    local.get $0
    i32.load
    i32.const 1
    i32.and
   end
   drop
   global.get $~lib/rt/tlsf/ROOT
   local.get $0
   local.get $6
   call $~lib/rt/tlsf/moveBlock
   local.set $0
  else
   block $__inlined_func$~lib/rt/tlsf/reallocateBlock$1018
    local.get $2
    i32.const 4
    i32.sub
    local.set $0
    local.get $2
    i32.const 15
    i32.and
    i32.const 1
    local.get $2
    select
    if (result i32)
     i32.const 1
    else
     local.get $0
     i32.load
     i32.const 1
     i32.and
    end
    drop
    global.get $~lib/rt/tlsf/ROOT
    local.set $3
    local.get $6
    call $~lib/rt/tlsf/prepareSize
    local.tee $4
    local.get $0
    i32.load
    local.tee $7
    i32.const -4
    i32.and
    local.tee $5
    i32.le_u
    if
     local.get $3
     local.get $0
     local.get $4
     call $~lib/rt/tlsf/prepareBlock
     br $__inlined_func$~lib/rt/tlsf/reallocateBlock$1018
    end
    local.get $0
    i32.const 4
    i32.add
    local.get $0
    i32.load
    i32.const -4
    i32.and
    i32.add
    local.tee $2
    i32.load
    local.tee $8
    i32.const 1
    i32.and
    if
     local.get $5
     i32.const 4
     i32.add
     local.get $8
     i32.const -4
     i32.and
     i32.add
     local.tee $5
     local.get $4
     i32.ge_u
     if
      local.get $3
      local.get $2
      call $~lib/rt/tlsf/removeBlock
      local.get $0
      local.get $7
      i32.const 3
      i32.and
      local.get $5
      i32.or
      i32.store
      local.get $3
      local.get $0
      local.get $4
      call $~lib/rt/tlsf/prepareBlock
      br $__inlined_func$~lib/rt/tlsf/reallocateBlock$1018
     end
    end
    local.get $3
    local.get $0
    local.get $6
    call $~lib/rt/tlsf/moveBlock
    local.set $0
   end
  end
  local.get $0
  i32.const 20
  i32.add
  local.tee $0
  i32.const 20
  i32.sub
  local.tee $2
  local.get $1
  i32.store offset=16
  local.get $2
  i32.load offset=4
  i32.const -4
  i32.and
  local.get $2
  i32.store offset=8
  local.get $2
  i32.load offset=8
  local.tee $1
  local.get $2
  local.get $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  global.get $~lib/rt/tcms/total
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
  i32.add
  global.set $~lib/rt/tcms/total
  local.get $0
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $2
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 268435455
   i32.gt_u
   if
    i32.const 1056
    i32.const 4256
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load
   local.tee $3
   i32.const 1073741820
   local.get $2
   i32.const 1
   i32.shl
   local.tee $4
   local.get $4
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $4
   i32.const 8
   local.get $1
   local.get $1
   i32.const 8
   i32.le_u
   select
   i32.const 2
   i32.shl
   local.tee $1
   local.get $1
   local.get $4
   i32.lt_u
   select
   local.tee $1
   call $~lib/rt/tcms/__renew
   local.tee $4
   local.get $2
   i32.add
   i32.const 0
   local.get $1
   local.get $2
   i32.sub
   memory.fill
   local.get $3
   local.get $4
   i32.ne
   if
    local.get $0
    local.get $4
    i32.store
    local.get $0
    local.get $4
    i32.store offset=4
   end
   local.get $0
   local.get $1
   i32.store offset=8
  end
 )
 (func $assembly/PathFinder/PathFinder#findPath (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (param $12 i32) (param $13 i32) (param $14 i32) (result i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  local.get $2
  i32.const 32767
  i32.le_s
  local.get $2
  i32.const 0
  i32.ge_s
  i32.and
  local.get $3
  i32.const 0
  i32.ge_s
  i32.and
  local.get $3
  i32.const 32767
  i32.le_s
  i32.and
  i32.eqz
  if
   local.get $2
   call $~lib/util/number/itoa32
   local.set $0
   local.get $3
   call $~lib/util/number/itoa32
   local.set $1
   i32.const 3668
   local.get $0
   i32.store
   i32.const 3676
   local.get $1
   i32.store
   i32.const 3664
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3712
   i32.const 59
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 32767
  i32.le_s
  local.get $4
  i32.const 0
  i32.ge_s
  i32.and
  local.get $5
  i32.const 0
  i32.ge_s
  i32.and
  local.get $5
  i32.const 32767
  i32.le_s
  i32.and
  i32.eqz
  if
   local.get $4
   call $~lib/util/number/itoa32
   local.set $0
   local.get $5
   call $~lib/util/number/itoa32
   local.set $1
   i32.const 3940
   local.get $0
   i32.store
   i32.const 3948
   local.get $1
   i32.store
   i32.const 3936
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3712
   i32.const 62
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 3
  i32.le_s
  local.get $1
  i32.const 0
  i32.ge_s
  i32.and
  i32.eqz
  if
   i32.const 4148
   local.get $1
   call $~lib/util/number/itoa32
   i32.store
   i32.const 4144
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3712
   i32.const 65
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=12
  local.set $16
  i32.const 1
  global.set $~argumentsLength
  local.get $16
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  local.tee $17
  if
   local.get $16
   i32.const 0
   local.get $17
   i32.const 2
   i32.shl
   memory.fill
  end
  local.get $0
  i32.load offset=16
  local.set $16
  i32.const 1
  global.set $~argumentsLength
  local.get $16
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  local.set $17
  loop $for-loop|04
   local.get $15
   local.get $17
   i32.lt_s
   if
    local.get $16
    local.get $15
    i32.const 2
    i32.shl
    i32.add
    i32.const 99999999
    i32.store
    local.get $15
    i32.const 1
    i32.add
    local.set $15
    br $for-loop|04
   end
  end
  local.get $0
  i32.const 0
  i32.store offset=36
  local.get $0
  i32.const 0
  i32.store offset=40
  local.get $2
  local.get $2
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.const 2
  i32.div_s
  local.tee $15
  i32.sub
  local.tee $16
  i32.sub
  local.set $17
  local.get $3
  local.get $3
  local.get $15
  i32.sub
  local.tee $15
  i32.sub
  local.set $18
  local.get $4
  local.get $16
  i32.sub
  local.set $3
  local.get $5
  local.get $15
  i32.sub
  local.set $4
  local.get $2
  local.get $17
  i32.mul
  local.get $18
  i32.add
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load offset=12
  i32.add
  i32.const 99
  i32.store
  local.get $2
  local.get $0
  i32.load offset=16
  i32.add
  i32.const 0
  i32.store
  local.get $0
  i32.load offset=20
  local.get $0
  i32.load offset=40
  i32.const 2
  i32.shl
  i32.add
  local.get $17
  i32.store
  local.get $0
  i32.load offset=24
  local.get $0
  i32.load offset=40
  i32.const 2
  i32.shl
  i32.add
  local.get $18
  i32.store
  local.get $0
  local.get $0
  i32.load offset=40
  i32.const 1
  i32.add
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.sub
  i32.and
  i32.store offset=40
  block $break|0 (result i32)
   block $case2|0
    block $case1|0
     local.get $6
     i32.const 1
     i32.ne
     if
      local.get $6
      i32.const 2
      i32.eq
      br_if $case1|0
      br $case2|0
     end
     local.get $0
     local.get $16
     local.get $15
     local.get $1
     local.get $3
     local.get $4
     local.get $7
     local.get $8
     local.get $6
     local.get $9
     local.get $10
     local.get $12
     local.get $14
     call $assembly/PathFinder/PathFinder#findPath1
     br $break|0
    end
    local.get $0
    local.get $16
    local.get $15
    local.get $1
    local.get $3
    local.get $4
    local.get $7
    local.get $8
    local.get $6
    local.get $9
    local.get $10
    local.get $12
    local.get $14
    call $assembly/PathFinder/PathFinder#findPath2
    br $break|0
   end
   local.get $0
   local.get $16
   local.get $15
   local.get $1
   local.get $3
   local.get $4
   local.get $7
   local.get $8
   local.get $6
   local.get $9
   local.get $10
   local.get $12
   local.get $14
   call $assembly/PathFinder/PathFinder#findPathN
  end
  i32.eqz
  if
   local.get $11
   i32.eqz
   if
    global.get $assembly/PathFinder/PathFinder.EMPTY
    return
   end
   local.get $8
   local.get $7
   local.get $9
   i32.const 1
   i32.and
   local.tee $2
   select
   local.set $5
   local.get $7
   local.get $8
   local.get $2
   select
   local.set $6
   i32.const 1000
   local.set $2
   i32.const 100
   local.set $9
   local.get $3
   i32.const 10
   i32.sub
   local.set $7
   loop $for-loop|00
    local.get $7
    local.get $3
    i32.const 10
    i32.add
    i32.le_s
    if
     local.get $4
     i32.const 10
     i32.sub
     local.set $8
     loop $for-loop|1
      local.get $8
      local.get $4
      i32.const 10
      i32.add
      i32.le_s
      if
       local.get $7
       i32.const 0
       i32.ge_s
       if (result i32)
        local.get $7
        local.get $0
        i32.load offset=4
        i32.lt_s
       else
        i32.const 0
       end
       if (result i32)
        local.get $8
        i32.const 0
        i32.ge_s
        if (result i32)
         local.get $8
         local.get $0
         i32.load offset=4
         i32.lt_s
        else
         i32.const 0
        end
       else
        i32.const 0
       end
       if (result i32)
        local.get $0
        i32.load offset=16
        local.get $7
        local.get $0
        i32.load offset=4
        i32.mul
        local.get $8
        i32.add
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.const 100
        i32.ge_s
       else
        i32.const 1
       end
       i32.eqz
       if
        local.get $3
        local.get $7
        i32.gt_s
        if (result i32)
         local.get $3
         local.get $7
         i32.sub
        else
         local.get $7
         local.get $3
         local.get $5
         i32.add
         i32.const 1
         i32.sub
         local.tee $10
         i32.sub
         i32.const 0
         local.get $7
         local.get $10
         i32.gt_s
         select
        end
        local.tee $10
        local.get $10
        i32.mul
        local.get $4
        local.get $8
        i32.gt_s
        if (result i32)
         local.get $4
         local.get $8
         i32.sub
        else
         local.get $8
         local.get $4
         local.get $6
         i32.add
         i32.const 1
         i32.sub
         local.tee $10
         i32.sub
         i32.const 0
         local.get $8
         local.get $10
         i32.gt_s
         select
        end
        local.tee $10
        local.get $10
        i32.mul
        i32.add
        local.tee $10
        local.get $2
        i32.lt_s
        if (result i32)
         i32.const 1
        else
         local.get $2
         local.get $10
         i32.eq
         if (result i32)
          local.get $9
          local.get $0
          i32.load offset=16
          local.get $7
          local.get $0
          i32.load offset=4
          i32.mul
          local.get $8
          i32.add
          i32.const 2
          i32.shl
          i32.add
          i32.load
          i32.gt_s
         else
          i32.const 0
         end
        end
        if
         local.get $0
         local.get $7
         i32.store offset=28
         local.get $0
         local.get $8
         i32.store offset=32
         local.get $0
         i32.load offset=16
         local.get $7
         local.get $0
         i32.load offset=4
         i32.mul
         local.get $8
         i32.add
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.set $9
         local.get $10
         local.set $2
        end
       end
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $for-loop|1
      end
     end
     local.get $7
     i32.const 1
     i32.add
     local.set $7
     br $for-loop|00
    end
   end
   local.get $2
   i32.const 1000
   i32.eq
   if
    global.get $assembly/PathFinder/PathFinder.EMPTY
    return
   end
  end
  i32.const 4176
  call $~lib/rt/__newArray
  local.set $2
  local.get $0
  i32.load offset=12
  local.get $0
  i32.load offset=32
  local.get $0
  i32.load offset=4
  local.get $0
  i32.load offset=28
  i32.mul
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $4
  i32.const -1
  local.set $3
  i32.const 0
  local.set $5
  loop $for-loop|11
   local.get $5
   local.get $0
   i32.load offset=12
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.lt_s
   if
    local.get $17
    local.get $0
    i32.load offset=28
    i32.eq
    if (result i32)
     local.get $18
     local.get $0
     i32.load offset=32
     i32.eq
    else
     i32.const 0
    end
    i32.eqz
    if
     local.get $3
     local.get $4
     i32.ne
     if
      local.get $4
      local.set $3
      local.get $2
      i32.load offset=12
      local.tee $4
      local.get $13
      i32.ge_s
      if
       local.get $4
       i32.const 0
       i32.le_s
       if
        i32.const 4208
        i32.const 4256
        i32.const 271
        i32.const 18
        call $~lib/builtins/abort
        unreachable
       end
       local.get $2
       i32.load offset=4
       local.get $4
       i32.const 1
       i32.sub
       local.tee $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
       drop
       local.get $2
       local.get $4
       i32.store offset=12
      end
      local.get $15
      local.get $0
      i32.load offset=32
      i32.add
      i32.const 16383
      i32.and
      local.get $16
      local.get $0
      i32.load offset=28
      i32.add
      i32.const 16383
      i32.and
      i32.const 14
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 28
      i32.shl
      i32.or
      local.set $4
      local.get $2
      local.get $2
      i32.load offset=12
      i32.const 1
      i32.add
      local.tee $6
      call $~lib/array/ensureCapacity
      local.get $2
      i32.load offset=4
      local.tee $7
      i32.const 4
      i32.add
      local.get $7
      local.get $6
      i32.const 1
      i32.sub
      i32.const 2
      i32.shl
      memory.copy
      local.get $7
      local.get $4
      i32.store
      local.get $2
      local.get $6
      i32.store offset=12
     end
     local.get $3
     i32.const 2
     i32.and
     if
      local.get $0
      local.get $0
      i32.load offset=28
      i32.const 1
      i32.add
      i32.store offset=28
     else
      local.get $3
      i32.const 8
      i32.and
      if
       local.get $0
       local.get $0
       i32.load offset=28
       i32.const 1
       i32.sub
       i32.store offset=28
      end
     end
     local.get $3
     i32.const 1
     i32.and
     if
      local.get $0
      local.get $0
      i32.load offset=32
      i32.const 1
      i32.add
      i32.store offset=32
     else
      local.get $3
      i32.const 4
      i32.and
      if
       local.get $0
       local.get $0
       i32.load offset=32
       i32.const 1
       i32.sub
       i32.store offset=32
      end
     end
     local.get $0
     i32.load offset=12
     local.get $0
     i32.load offset=32
     local.get $0
     i32.load offset=4
     local.get $0
     i32.load offset=28
     i32.mul
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.set $4
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|11
    end
   end
  end
  local.get $2
  i32.load offset=12
  call $~lib/staticarray/StaticArray<i32>#constructor
  local.set $1
  i32.const 0
  local.set $0
  loop $for-loop|2
   local.get $0
   local.get $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    i32.const 2
    i32.shl
    local.tee $3
    local.get $1
    i32.add
    local.get $2
    i32.load offset=4
    local.get $3
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|2
   end
  end
  local.get $1
 )
 (func $assembly/index/findPath@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (param $12 i32) (param $13 i32) (result i32)
  block $9of9
   block $8of9
    block $7of9
     block $6of9
      block $5of9
       block $4of9
        block $3of9
         block $2of9
          block $1of9
           block $0of9
            block $outOfRange
             global.get $~argumentsLength
             i32.const 5
             i32.sub
             br_table $0of9 $1of9 $2of9 $3of9 $4of9 $5of9 $6of9 $7of9 $8of9 $9of9 $outOfRange
            end
            unreachable
           end
           i32.const 1
           local.set $5
          end
          i32.const 1
          local.set $6
         end
         i32.const 1
         local.set $7
        end
        i32.const 0
        local.set $8
       end
       i32.const -1
       local.set $9
      end
      i32.const 1
      local.set $10
     end
     i32.const 0
     local.set $11
    end
    i32.const 25
    local.set $12
   end
   i32.const 0
   local.set $13
  end
  local.get $13
  i32.const 4
  i32.le_s
  local.get $13
  i32.const 0
  i32.ge_s
  i32.and
  i32.eqz
  if
   i32.const 1572
   local.get $13
   call $~lib/util/number/itoa32
   i32.store
   i32.const 1568
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3408
   i32.const 51
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  global.get $assembly/index/pathfinder
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  local.get $9
  local.get $10
  local.get $11
  local.get $12
  local.get $13
  if (result i32)
   local.get $13
   i32.const 1
   i32.eq
   if (result i32)
    global.get $assembly/collision/CollisionStrategies/CollisionStrategies.BLOCKED
   else
    local.get $13
    i32.const 2
    i32.eq
    if (result i32)
     global.get $assembly/collision/CollisionStrategies/CollisionStrategies.INDOORS
    else
     global.get $assembly/collision/CollisionStrategies/CollisionStrategies.OUTDOORS
     global.get $assembly/collision/CollisionStrategies/CollisionStrategies.LINE_OF_SIGHT
     local.get $13
     i32.const 3
     i32.eq
     select
    end
   end
  else
   global.get $assembly/collision/CollisionStrategies/CollisionStrategies.NORMAL
  end
  call $assembly/PathFinder/PathFinder#findPath
 )
 (func $assembly/collision/CollisionFlagMap/CollisionFlagMap#allocateIfAbsent (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  i32.load
  local.get $1
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  local.get $2
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  i32.const 11
  i32.shl
  i32.or
  local.get $3
  i32.const 3
  i32.and
  i32.const 22
  i32.shl
  i32.or
  local.tee $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $2
  if
   local.get $2
   return
  end
  i32.const 64
  call $~lib/staticarray/StaticArray<i32>#constructor
  local.set $2
  local.get $0
  i32.load
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
  local.get $2
 )
 (func $assembly/collision/CollisionFlagMap/CollisionFlagMap#set (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $0
  i32.load
  local.get $1
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  local.get $2
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  i32.const 11
  i32.shl
  i32.or
  local.get $3
  i32.const 3
  i32.and
  i32.const 22
  i32.shl
  i32.or
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $5
  if (result i32)
   local.get $5
  else
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   call $assembly/collision/CollisionFlagMap/CollisionFlagMap#allocateIfAbsent
  end
  local.get $1
  i32.const 7
  i32.and
  local.get $2
  i32.const 7
  i32.and
  i32.const 3
  i32.shl
  i32.or
  i32.const 2
  i32.shl
  i32.add
  local.get $4
  i32.store
 )
 (func $assembly/collision/CollisionFlagMap/CollisionFlagMap#add (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 7
  i32.and
  local.get $2
  i32.const 7
  i32.and
  i32.const 3
  i32.shl
  i32.or
  local.set $5
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $0
  i32.load
  local.get $1
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  local.get $2
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  i32.const 11
  i32.shl
  i32.or
  local.get $3
  i32.const 3
  i32.and
  i32.const 22
  i32.shl
  i32.or
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  if (result i32)
   local.get $5
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.lt_s
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   local.get $5
   i32.const 2
   i32.shl
   i32.add
   i32.load
  else
   i32.const 0
  end
  local.get $4
  i32.or
  call $assembly/collision/CollisionFlagMap/CollisionFlagMap#set
 )
 (func $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 7
  i32.and
  local.get $2
  i32.const 7
  i32.and
  i32.const 3
  i32.shl
  i32.or
  local.set $5
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $0
  i32.load
  local.get $1
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  local.get $2
  i32.const 3
  i32.shr_s
  i32.const 2047
  i32.and
  i32.const 11
  i32.shl
  i32.or
  local.get $3
  i32.const 3
  i32.and
  i32.const 22
  i32.shl
  i32.or
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  if (result i32)
   local.get $5
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.lt_s
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   local.get $5
   i32.const 2
   i32.shl
   i32.add
   i32.load
  else
   i32.const 0
  end
  local.get $4
  i32.const -1
  i32.xor
  i32.and
  call $assembly/collision/CollisionFlagMap/CollisionFlagMap#set
 )
 (func $assembly/index/changeFloor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $3
  if
   global.get $assembly/index/flags
   local.get $0
   local.get $1
   local.get $2
   i32.const 2097152
   call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
  else
   global.get $assembly/index/flags
   local.get $0
   local.get $1
   local.get $2
   i32.const 2097152
   call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
  end
 )
 (func $assembly/index/changeLoc (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32)
  (local $8 i32)
  (local $9 i32)
  i32.const 131328
  i32.const 256
  local.get $5
  select
  local.tee $5
  i32.const 1073741824
  i32.or
  local.get $5
  local.get $6
  select
  local.set $8
  i32.const 0
  local.set $5
  loop $for-loop|0
   local.get $5
   local.get $3
   local.get $4
   i32.mul
   i32.lt_s
   if
    local.get $0
    local.get $5
    local.get $3
    i32.rem_s
    i32.add
    local.set $9
    local.get $1
    local.get $5
    local.get $3
    i32.div_s
    i32.add
    local.set $6
    local.get $7
    if
     global.get $assembly/index/flags
     local.get $9
     local.get $6
     local.get $2
     local.get $8
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    else
     global.get $assembly/index/flags
     local.get $9
     local.get $6
     local.get $2
     local.get $8
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/changeNpc (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  loop $for-loop|0
   local.get $5
   local.get $3
   local.get $3
   i32.mul
   i32.lt_s
   if
    local.get $0
    local.get $5
    local.get $3
    i32.rem_s
    i32.add
    local.set $6
    local.get $1
    local.get $5
    local.get $3
    i32.div_s
    i32.add
    local.set $7
    local.get $4
    if
     global.get $assembly/index/flags
     local.get $6
     local.get $7
     local.get $2
     i32.const 524288
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    else
     global.get $assembly/index/flags
     local.get $6
     local.get $7
     local.get $2
     i32.const 524288
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/changePlayer (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  loop $for-loop|0
   local.get $5
   local.get $3
   local.get $3
   i32.mul
   i32.lt_s
   if
    local.get $0
    local.get $5
    local.get $3
    i32.rem_s
    i32.add
    local.set $6
    local.get $1
    local.get $5
    local.get $3
    i32.div_s
    i32.add
    local.set $7
    local.get $4
    if
     global.get $assembly/index/flags
     local.get $6
     local.get $7
     local.get $2
     i32.const 1048576
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    else
     global.get $assembly/index/flags
     local.get $6
     local.get $7
     local.get $2
     i32.const 1048576
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/changeRoof (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $3
  if
   global.get $assembly/index/flags
   local.get $0
   local.get $1
   local.get $2
   i32.const -2147483648
   call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
  else
   global.get $assembly/index/flags
   local.get $0
   local.get $1
   local.get $2
   i32.const -2147483648
   call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
  end
 )
 (func $assembly/index/changeWallStraight (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  i32.const 536870912
  i32.const 65536
  i32.const 128
  local.get $4
  select
  local.get $5
  select
  local.set $7
  i32.const 33554432
  i32.const 4096
  i32.const 8
  local.get $4
  select
  local.get $5
  select
  local.set $8
  local.get $3
  if
   i32.const 8388608
   i32.const 1024
   i32.const 2
   local.get $4
   select
   local.get $5
   select
   local.set $9
   i32.const 134217728
   i32.const 16384
   i32.const 32
   local.get $4
   select
   local.get $5
   select
   local.set $10
   local.get $3
   i32.const 1
   i32.eq
   if
    local.get $6
    if
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     local.get $2
     local.get $9
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     i32.const 1
     i32.add
     local.get $2
     local.get $10
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    else
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     local.get $2
     local.get $9
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     i32.const 1
     i32.add
     local.get $2
     local.get $10
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    end
   else
    local.get $3
    i32.const 2
    i32.eq
    if
     local.get $6
     if
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      local.get $2
      local.get $8
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
      global.get $assembly/index/flags
      local.get $0
      i32.const 1
      i32.add
      local.get $1
      local.get $2
      local.get $7
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
     else
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      local.get $2
      local.get $8
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
      global.get $assembly/index/flags
      local.get $0
      i32.const 1
      i32.add
      local.get $1
      local.get $2
      local.get $7
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
     end
    else
     local.get $3
     i32.const 3
     i32.eq
     if
      local.get $6
      if
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       local.get $2
       local.get $10
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       i32.const 1
       i32.sub
       local.get $2
       local.get $9
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
      else
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       local.get $2
       local.get $10
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       i32.const 1
       i32.sub
       local.get $2
       local.get $9
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
      end
     end
    end
   end
  else
   local.get $6
   if
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    local.get $2
    local.get $7
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    global.get $assembly/index/flags
    local.get $0
    i32.const 1
    i32.sub
    local.get $1
    local.get $2
    local.get $8
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
   else
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    local.get $2
    local.get $7
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    global.get $assembly/index/flags
    local.get $0
    i32.const 1
    i32.sub
    local.get $1
    local.get $2
    local.get $8
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
   end
  end
  local.get $5
  if
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   local.get $4
   i32.const 0
   local.get $6
   call $assembly/index/changeWallStraight
   return
  end
  local.get $4
  if
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   i32.const 0
   i32.const 0
   local.get $6
   call $assembly/index/changeWallStraight
  end
 )
 (func $assembly/index/changeWallCorner (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  i32.const 4194304
  i32.const 512
  i32.const 1
  local.get $4
  select
  local.get $5
  select
  local.set $7
  i32.const 67108864
  i32.const 8192
  i32.const 16
  local.get $4
  select
  local.get $5
  select
  local.set $8
  local.get $3
  if
   i32.const 16777216
   i32.const 2048
   i32.const 4
   local.get $4
   select
   local.get $5
   select
   local.set $9
   i32.const 268435456
   i32.const 32768
   i32.const 64
   local.get $4
   select
   local.get $5
   select
   local.set $10
   local.get $3
   i32.const 1
   i32.eq
   if
    local.get $6
    if
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     local.get $2
     local.get $9
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
     global.get $assembly/index/flags
     local.get $0
     i32.const 1
     i32.add
     local.get $1
     i32.const 1
     i32.add
     local.get $2
     local.get $10
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    else
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     local.get $2
     local.get $9
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
     global.get $assembly/index/flags
     local.get $0
     i32.const 1
     i32.add
     local.get $1
     i32.const 1
     i32.add
     local.get $2
     local.get $10
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    end
   else
    local.get $3
    i32.const 2
    i32.eq
    if
     local.get $6
     if
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      local.get $2
      local.get $8
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
      global.get $assembly/index/flags
      local.get $0
      i32.const 1
      i32.add
      local.get $1
      i32.const 1
      i32.sub
      local.get $2
      local.get $7
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
     else
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      local.get $2
      local.get $8
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
      global.get $assembly/index/flags
      local.get $0
      i32.const 1
      i32.add
      local.get $1
      i32.const 1
      i32.sub
      local.get $2
      local.get $7
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
     end
    else
     local.get $3
     i32.const 3
     i32.eq
     if
      local.get $6
      if
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       local.get $2
       local.get $10
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
       global.get $assembly/index/flags
       local.get $0
       i32.const 1
       i32.sub
       local.get $1
       i32.const 1
       i32.sub
       local.get $2
       local.get $9
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
      else
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       local.get $2
       local.get $10
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
       global.get $assembly/index/flags
       local.get $0
       i32.const 1
       i32.sub
       local.get $1
       i32.const 1
       i32.sub
       local.get $2
       local.get $9
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
      end
     end
    end
   end
  else
   local.get $6
   if
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    local.get $2
    local.get $7
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    global.get $assembly/index/flags
    local.get $0
    i32.const 1
    i32.sub
    local.get $1
    i32.const 1
    i32.add
    local.get $2
    local.get $8
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
   else
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    local.get $2
    local.get $7
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    global.get $assembly/index/flags
    local.get $0
    i32.const 1
    i32.sub
    local.get $1
    i32.const 1
    i32.add
    local.get $2
    local.get $8
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
   end
  end
  local.get $5
  if
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   local.get $4
   i32.const 0
   local.get $6
   call $assembly/index/changeWallCorner
   return
  end
  local.get $4
  if
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   i32.const 0
   i32.const 0
   local.get $6
   call $assembly/index/changeWallCorner
  end
 )
 (func $assembly/index/changeWallL (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  i32.const 536870912
  i32.const 65536
  i32.const 128
  local.get $4
  select
  local.get $5
  select
  local.set $7
  i32.const 33554432
  i32.const 4096
  i32.const 8
  local.get $4
  select
  local.get $5
  select
  local.set $8
  i32.const 8388608
  i32.const 1024
  i32.const 2
  local.get $4
  select
  local.get $5
  select
  local.set $9
  i32.const 134217728
  i32.const 16384
  i32.const 32
  local.get $4
  select
  local.get $5
  select
  local.set $10
  local.get $3
  if
   local.get $3
   i32.const 1
   i32.eq
   if
    local.get $6
    if
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     local.get $2
     local.get $8
     local.get $9
     i32.or
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     i32.const 1
     i32.add
     local.get $2
     local.get $10
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
     global.get $assembly/index/flags
     local.get $0
     i32.const 1
     i32.add
     local.get $1
     local.get $2
     local.get $7
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    else
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     local.get $2
     local.get $8
     local.get $9
     i32.or
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
     global.get $assembly/index/flags
     local.get $0
     local.get $1
     i32.const 1
     i32.add
     local.get $2
     local.get $10
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
     global.get $assembly/index/flags
     local.get $0
     i32.const 1
     i32.add
     local.get $1
     local.get $2
     local.get $7
     call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    end
   else
    local.get $3
    i32.const 2
    i32.eq
    if
     local.get $6
     if
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      local.get $2
      local.get $8
      local.get $10
      i32.or
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
      global.get $assembly/index/flags
      local.get $0
      i32.const 1
      i32.add
      local.get $1
      local.get $2
      local.get $7
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      i32.const 1
      i32.sub
      local.get $2
      local.get $9
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
     else
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      local.get $2
      local.get $8
      local.get $10
      i32.or
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
      global.get $assembly/index/flags
      local.get $0
      i32.const 1
      i32.add
      local.get $1
      local.get $2
      local.get $7
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
      global.get $assembly/index/flags
      local.get $0
      local.get $1
      i32.const 1
      i32.sub
      local.get $2
      local.get $9
      call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
     end
    else
     local.get $3
     i32.const 3
     i32.eq
     if
      local.get $6
      if
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       local.get $2
       local.get $7
       local.get $10
       i32.or
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       i32.const 1
       i32.sub
       local.get $2
       local.get $9
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
       global.get $assembly/index/flags
       local.get $0
       i32.const 1
       i32.sub
       local.get $1
       local.get $2
       local.get $8
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
      else
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       local.get $2
       local.get $7
       local.get $10
       i32.or
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
       global.get $assembly/index/flags
       local.get $0
       local.get $1
       i32.const 1
       i32.sub
       local.get $2
       local.get $9
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
       global.get $assembly/index/flags
       local.get $0
       i32.const 1
       i32.sub
       local.get $1
       local.get $2
       local.get $8
       call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
      end
     end
    end
   end
  else
   local.get $6
   if
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    local.get $2
    local.get $7
    local.get $9
    i32.or
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    global.get $assembly/index/flags
    local.get $0
    i32.const 1
    i32.sub
    local.get $1
    local.get $2
    local.get $8
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    i32.const 1
    i32.add
    local.get $2
    local.get $10
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#add
   else
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    local.get $2
    local.get $7
    local.get $9
    i32.or
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    global.get $assembly/index/flags
    local.get $0
    i32.const 1
    i32.sub
    local.get $1
    local.get $2
    local.get $8
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
    global.get $assembly/index/flags
    local.get $0
    local.get $1
    i32.const 1
    i32.add
    local.get $2
    local.get $10
    call $assembly/collision/CollisionFlagMap/CollisionFlagMap#remove
   end
  end
  local.get $5
  if
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   local.get $4
   i32.const 0
   local.get $6
   call $assembly/index/changeWallL
   return
  end
  local.get $4
  if
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   i32.const 0
   i32.const 0
   local.get $6
   call $assembly/index/changeWallL
  end
 )
 (func $assembly/index/changeWall (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32)
  local.get $4
  if
   local.get $4
   i32.const 3
   i32.eq
   local.get $4
   i32.const 1
   i32.eq
   i32.or
   if
    local.get $0
    local.get $1
    local.get $2
    local.get $3
    local.get $5
    local.get $6
    local.get $7
    call $assembly/index/changeWallCorner
   else
    local.get $4
    i32.const 2
    i32.eq
    if
     local.get $0
     local.get $1
     local.get $2
     local.get $3
     local.get $5
     local.get $6
     local.get $7
     call $assembly/index/changeWallL
    end
   end
  else
   local.get $0
   local.get $1
   local.get $2
   local.get $3
   local.get $5
   local.get $6
   local.get $7
   call $assembly/index/changeWallStraight
  end
 )
 (func $assembly/index/allocateIfAbsent (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $assembly/index/flags
  local.get $0
  local.get $1
  local.get $2
  call $assembly/collision/CollisionFlagMap/CollisionFlagMap#allocateIfAbsent
 )
 (func $assembly/index/isFlagged (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $3
  call $~lib/util/number/itoa32
  call $~lib/bindings/dom/console.log
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$133 (result i32)
   i32.const -1
   global.get $assembly/index/flags
   i32.load
   local.get $0
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $1
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $2
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $2
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$133
   drop
   i32.const -1
   local.get $0
   i32.const 7
   i32.and
   local.get $1
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.tee $0
   local.get $2
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$133
   drop
   local.get $2
   local.get $0
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.get $3
  i32.and
  i32.const 0
  i32.ne
 )
 (func $assembly/StepValidator/StepValidator#isBlockedSouthWest (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  block $case2|0
   block $case1|0
    local.get $4
    i32.const 1
    i32.ne
    if
     local.get $4
     i32.const 2
     i32.eq
     br_if $case1|0
     br $case2|0
    end
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$134 (result i32)
     local.get $2
     i32.const 1
     i32.sub
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     i32.const 1
     i32.sub
     local.tee $4
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $8
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $4
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $4
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$134
     drop
     i32.const -1
     local.get $8
     local.get $4
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$134
     drop
     local.get $4
     local.get $8
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $4
    local.get $5
    i32.const 2359566
    i32.or
    local.set $8
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$135
     block $default
      block $case4
       block $case3
        block $case2
         block $case1
          block $case0
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case0 $case1 $case2 $case3 $case4 $default
          end
          local.get $4
          local.get $8
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$135
         end
         local.get $8
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$135
        end
        local.get $4
        local.get $8
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$135
       end
       local.get $4
       local.get $8
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$135
      end
      local.get $8
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $8
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$135
     end
     unreachable
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$137
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$136 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $7
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $4
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$136
       drop
       i32.const -1
       local.get $7
       i32.const 7
       i32.and
       local.get $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $7
       local.get $4
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$136
       drop
       local.get $4
       local.get $7
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $4
      local.get $5
      i32.const 2359560
      i32.or
      local.set $7
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $4
           local.get $7
           i32.and
           i32.eqz
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$137
          end
          local.get $7
          i32.const -2097153
          i32.and
          local.get $4
          i32.and
          i32.eqz
          local.get $4
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$137
         end
         local.get $4
         local.get $7
         i32.and
         i32.eqz
         local.get $4
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$137
        end
        local.get $4
        local.get $7
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$137
       end
       local.get $7
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $7
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $4
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$137
      end
      unreachable
     end
    else
     i32.const 0
     local.set $4
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$139
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$138 (result i32)
       local.get $2
       i32.const 7
       i32.and
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $4
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $2
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $0
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$138
       drop
       i32.const -1
       local.get $4
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$138
       drop
       local.get $0
       local.get $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $0
      local.get $5
      i32.const 2359554
      i32.or
      local.set $1
      block $default1
       block $case42
        block $case33
         block $case24
          block $case15
           block $case06
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case06 $case15 $case24 $case33 $case42 $default1
           end
           local.get $0
           local.get $1
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$139
          end
          local.get $1
          i32.const -2097153
          i32.and
          local.get $0
          i32.and
          i32.eqz
          local.get $0
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$139
         end
         local.get $0
         local.get $1
         i32.and
         i32.eqz
         local.get $0
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$139
        end
        local.get $0
        local.get $1
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$139
       end
       local.get $1
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $1
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $0
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$139
      end
      unreachable
     end
    else
     i32.const 0
     local.set $0
    end
    local.get $0
    i32.eqz
    return
   end
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$140 (result i32)
    local.get $2
    i32.const 1
    i32.sub
    local.tee $7
    i32.const 7
    i32.and
    local.get $3
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.set $4
    i32.const -1
    local.get $0
    i32.load
    i32.load
    local.get $7
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $3
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $8
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$140
    drop
    i32.const -1
    local.get $4
    local.get $8
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$140
    drop
    local.get $8
    local.get $4
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   local.set $4
   local.get $5
   i32.const 2359614
   i32.or
   local.set $8
   block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$141
    block $default2
     block $case43
      block $case34
       block $case25
        block $case16
         block $case07
          local.get $6
          i32.const 8
          i32.sub
          i32.load
          i32.const 6
          i32.sub
          br_table $case07 $case16 $case25 $case34 $case43 $default2
         end
         local.get $4
         local.get $8
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$141
        end
        local.get $8
        i32.const -2097153
        i32.and
        local.get $4
        i32.and
        i32.eqz
        local.get $4
        i32.const 2097152
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$141
       end
       local.get $4
       local.get $8
       i32.and
       i32.eqz
       local.get $4
       i32.const -2147483648
       i32.and
       i32.const 0
       i32.ne
       i32.and
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$141
      end
      local.get $4
      local.get $8
      i32.const -2147483648
      i32.or
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$141
     end
     local.get $8
     i32.const 511
     i32.and
     i32.const 9
     i32.shl
     local.get $8
     i32.const 2143289344
     i32.and
     i32.const 13
     i32.shr_u
     i32.or
     local.get $4
     i32.and
     i32.eqz
     local.set $4
     br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$141
    end
    unreachable
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$143
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$142 (result i32)
      local.get $7
      i32.const 7
      i32.and
      local.get $3
      i32.const 1
      i32.sub
      local.tee $4
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $8
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $4
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $4
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$142
      drop
      i32.const -1
      local.get $8
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$142
      drop
      local.get $4
      local.get $8
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $4
     local.get $5
     i32.const 2359566
     i32.or
     local.set $7
     block $default3
      block $case44
       block $case35
        block $case26
         block $case17
          block $case08
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case08 $case17 $case26 $case35 $case44 $default3
          end
          local.get $4
          local.get $7
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$143
         end
         local.get $7
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$143
        end
        local.get $4
        local.get $7
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$143
       end
       local.get $4
       local.get $7
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$143
      end
      local.get $7
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $7
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$143
     end
     unreachable
    end
   else
    i32.const 0
    local.set $4
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$145
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$144 (result i32)
      local.get $2
      i32.const 7
      i32.and
      local.get $3
      i32.const 1
      i32.sub
      local.tee $3
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $4
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $2
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $3
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $0
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$144
      drop
      i32.const -1
      local.get $4
      local.get $0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$144
      drop
      local.get $0
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $0
     local.get $5
     i32.const 2359695
     i32.or
     local.set $1
     block $default4
      block $case45
       block $case36
        block $case27
         block $case18
          block $case09
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case09 $case18 $case27 $case36 $case45 $default4
          end
          local.get $0
          local.get $1
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$145
         end
         local.get $1
         i32.const -2097153
         i32.and
         local.get $0
         i32.and
         i32.eqz
         local.get $0
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$145
        end
        local.get $0
        local.get $1
        i32.and
        i32.eqz
        local.get $0
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$145
       end
       local.get $0
       local.get $1
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$145
      end
      local.get $1
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $1
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $0
      i32.and
      i32.eqz
      local.set $0
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$145
     end
     unreachable
    end
   else
    i32.const 0
    local.set $0
   end
   local.get $0
   i32.eqz
   return
  end
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$146 (result i32)
   local.get $2
   i32.const 1
   i32.sub
   local.tee $7
   i32.const 7
   i32.and
   local.get $3
   i32.const 1
   i32.sub
   local.tee $8
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.set $9
   i32.const -1
   local.get $0
   i32.load
   i32.load
   local.get $7
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $8
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $1
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $7
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$146
   drop
   i32.const -1
   local.get $9
   local.get $7
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$146
   drop
   local.get $7
   local.get $9
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.set $7
  local.get $5
  i32.const 2359566
  i32.or
  local.set $8
  block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$147
   block $default5
    block $case46
     block $case37
      block $case28
       block $case19
        block $case010
         local.get $6
         i32.const 8
         i32.sub
         i32.load
         i32.const 6
         i32.sub
         br_table $case010 $case19 $case28 $case37 $case46 $default5
        end
        local.get $7
        local.get $8
        i32.and
        i32.eqz
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$147
       end
       local.get $8
       i32.const -2097153
       i32.and
       local.get $7
       i32.and
       i32.eqz
       local.get $7
       i32.const 2097152
       i32.and
       i32.const 0
       i32.ne
       i32.and
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$147
      end
      local.get $7
      local.get $8
      i32.and
      i32.eqz
      local.get $7
      i32.const -2147483648
      i32.and
      i32.const 0
      i32.ne
      i32.and
      local.set $7
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$147
     end
     local.get $7
     local.get $8
     i32.const -2147483648
     i32.or
     i32.and
     i32.eqz
     local.set $7
     br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$147
    end
    local.get $8
    i32.const 511
    i32.and
    i32.const 9
    i32.shl
    local.get $8
    i32.const 2143289344
    i32.and
    i32.const 13
    i32.shr_u
    i32.or
    local.get $7
    i32.and
    i32.eqz
    local.set $7
    br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$147
   end
   unreachable
  end
  local.get $7
  i32.eqz
  if
   i32.const 1
   return
  end
  i32.const 1
  local.set $8
  loop $for-loop|1
   local.get $4
   local.get $8
   i32.gt_s
   if
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$148 (result i32)
     local.get $2
     i32.const 1
     i32.sub
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     local.get $8
     i32.add
     i32.const 1
     i32.sub
     local.tee $9
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $10
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $9
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $7
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$148
     drop
     i32.const -1
     local.get $10
     local.get $7
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$148
     drop
     local.get $7
     local.get $10
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $7
    local.get $5
    i32.const 2359614
    i32.or
    local.set $9
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$149
     block $default6
      block $case47
       block $case38
        block $case29
         block $case110
          block $case011
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case011 $case110 $case29 $case38 $case47 $default6
          end
          local.get $7
          local.get $9
          i32.and
          i32.eqz
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$149
         end
         local.get $9
         i32.const -2097153
         i32.and
         local.get $7
         i32.and
         i32.eqz
         local.get $7
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$149
        end
        local.get $7
        local.get $9
        i32.and
        i32.eqz
        local.get $7
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$149
       end
       local.get $7
       local.get $9
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$149
      end
      local.get $9
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $9
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $7
      i32.and
      i32.eqz
      local.set $7
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$149
     end
     unreachable
    end
    local.get $7
    if
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$150 (result i32)
      local.get $2
      local.get $8
      i32.add
      i32.const 1
      i32.sub
      local.tee $7
      i32.const 7
      i32.and
      local.get $3
      i32.const 1
      i32.sub
      local.tee $9
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $10
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $9
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $7
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$150
      drop
      i32.const -1
      local.get $10
      local.get $7
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$150
      drop
      local.get $7
      local.get $10
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $7
     local.get $5
     i32.const 2359695
     i32.or
     local.set $9
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$151
      block $default7
       block $case48
        block $case39
         block $case210
          block $case111
           block $case012
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case012 $case111 $case210 $case39 $case48 $default7
           end
           local.get $7
           local.get $9
           i32.and
           i32.eqz
           local.set $7
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$151
          end
          local.get $9
          i32.const -2097153
          i32.and
          local.get $7
          i32.and
          i32.eqz
          local.get $7
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$151
         end
         local.get $7
         local.get $9
         i32.and
         i32.eqz
         local.get $7
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$151
        end
        local.get $7
        local.get $9
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$151
       end
       local.get $9
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $9
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $7
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$151
      end
      unreachable
     end
     local.get $7
     i32.eqz
     if
      i32.const 1
      return
     end
    else
     i32.const 1
     return
    end
    local.get $8
    i32.const 1
    i32.add
    local.set $8
    br $for-loop|1
   end
  end
  i32.const 0
 )
 (func $assembly/StepValidator/StepValidator#isBlockedNorthWest (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  block $case2|0
   block $case1|0
    local.get $4
    i32.const 1
    i32.ne
    if
     local.get $4
     i32.const 2
     i32.eq
     br_if $case1|0
     br $case2|0
    end
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$152 (result i32)
     local.get $2
     i32.const 1
     i32.sub
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     i32.const 1
     i32.add
     local.tee $4
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $8
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $4
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $4
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$152
     drop
     i32.const -1
     local.get $8
     local.get $4
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$152
     drop
     local.get $4
     local.get $8
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $4
    local.get $5
    i32.const 2359608
    i32.or
    local.set $8
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$153
     block $default
      block $case4
       block $case3
        block $case2
         block $case1
          block $case0
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case0 $case1 $case2 $case3 $case4 $default
          end
          local.get $4
          local.get $8
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$153
         end
         local.get $8
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$153
        end
        local.get $4
        local.get $8
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$153
       end
       local.get $4
       local.get $8
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$153
      end
      local.get $8
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $8
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$153
     end
     unreachable
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$155
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$154 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $7
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $4
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$154
       drop
       i32.const -1
       local.get $7
       i32.const 7
       i32.and
       local.get $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $7
       local.get $4
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$154
       drop
       local.get $4
       local.get $7
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $4
      local.get $5
      i32.const 2359560
      i32.or
      local.set $7
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $4
           local.get $7
           i32.and
           i32.eqz
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$155
          end
          local.get $7
          i32.const -2097153
          i32.and
          local.get $4
          i32.and
          i32.eqz
          local.get $4
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$155
         end
         local.get $4
         local.get $7
         i32.and
         i32.eqz
         local.get $4
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$155
        end
        local.get $4
        local.get $7
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$155
       end
       local.get $7
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $7
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $4
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$155
      end
      unreachable
     end
    else
     i32.const 0
     local.set $4
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$157
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$156 (result i32)
       local.get $2
       i32.const 7
       i32.and
       local.get $3
       i32.const 1
       i32.add
       local.tee $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $4
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $2
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $0
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$156
       drop
       i32.const -1
       local.get $4
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$156
       drop
       local.get $0
       local.get $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $0
      local.get $5
      i32.const 2359584
      i32.or
      local.set $1
      block $default1
       block $case42
        block $case33
         block $case24
          block $case15
           block $case06
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case06 $case15 $case24 $case33 $case42 $default1
           end
           local.get $0
           local.get $1
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$157
          end
          local.get $1
          i32.const -2097153
          i32.and
          local.get $0
          i32.and
          i32.eqz
          local.get $0
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$157
         end
         local.get $0
         local.get $1
         i32.and
         i32.eqz
         local.get $0
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$157
        end
        local.get $0
        local.get $1
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$157
       end
       local.get $1
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $1
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $0
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$157
      end
      unreachable
     end
    else
     i32.const 0
     local.set $0
    end
    local.get $0
    i32.eqz
    return
   end
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$158 (result i32)
    local.get $2
    i32.const 1
    i32.sub
    local.tee $7
    i32.const 7
    i32.and
    local.get $3
    i32.const 1
    i32.add
    local.tee $4
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.set $8
    i32.const -1
    local.get $0
    i32.load
    i32.load
    local.get $7
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $4
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $4
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$158
    drop
    i32.const -1
    local.get $8
    local.get $4
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$158
    drop
    local.get $4
    local.get $8
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   local.set $4
   local.get $5
   i32.const 2359614
   i32.or
   local.set $8
   block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$159
    block $default2
     block $case43
      block $case34
       block $case25
        block $case16
         block $case07
          local.get $6
          i32.const 8
          i32.sub
          i32.load
          i32.const 6
          i32.sub
          br_table $case07 $case16 $case25 $case34 $case43 $default2
         end
         local.get $4
         local.get $8
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$159
        end
        local.get $8
        i32.const -2097153
        i32.and
        local.get $4
        i32.and
        i32.eqz
        local.get $4
        i32.const 2097152
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$159
       end
       local.get $4
       local.get $8
       i32.and
       i32.eqz
       local.get $4
       i32.const -2147483648
       i32.and
       i32.const 0
       i32.ne
       i32.and
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$159
      end
      local.get $4
      local.get $8
      i32.const -2147483648
      i32.or
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$159
     end
     local.get $8
     i32.const 511
     i32.and
     i32.const 9
     i32.shl
     local.get $8
     i32.const 2143289344
     i32.and
     i32.const 13
     i32.shr_u
     i32.or
     local.get $4
     i32.and
     i32.eqz
     local.set $4
     br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$159
    end
    unreachable
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$161
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$160 (result i32)
      local.get $7
      i32.const 7
      i32.and
      local.get $3
      i32.const 2
      i32.add
      local.tee $4
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $8
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $4
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $4
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$160
      drop
      i32.const -1
      local.get $8
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$160
      drop
      local.get $4
      local.get $8
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $4
     local.get $5
     i32.const 2359608
     i32.or
     local.set $7
     block $default3
      block $case44
       block $case35
        block $case26
         block $case17
          block $case08
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case08 $case17 $case26 $case35 $case44 $default3
          end
          local.get $4
          local.get $7
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$161
         end
         local.get $7
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$161
        end
        local.get $4
        local.get $7
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$161
       end
       local.get $4
       local.get $7
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$161
      end
      local.get $7
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $7
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$161
     end
     unreachable
    end
   else
    i32.const 0
    local.set $4
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$163
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$162 (result i32)
      local.get $2
      i32.const 7
      i32.and
      local.get $3
      i32.const 2
      i32.add
      local.tee $3
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $4
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $2
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $3
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $0
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$162
      drop
      i32.const -1
      local.get $4
      local.get $0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$162
      drop
      local.get $0
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $0
     local.get $5
     i32.const 2359800
     i32.or
     local.set $1
     block $default4
      block $case45
       block $case36
        block $case27
         block $case18
          block $case09
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case09 $case18 $case27 $case36 $case45 $default4
          end
          local.get $0
          local.get $1
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$163
         end
         local.get $1
         i32.const -2097153
         i32.and
         local.get $0
         i32.and
         i32.eqz
         local.get $0
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$163
        end
        local.get $0
        local.get $1
        i32.and
        i32.eqz
        local.get $0
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$163
       end
       local.get $0
       local.get $1
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$163
      end
      local.get $1
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $1
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $0
      i32.and
      i32.eqz
      local.set $0
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$163
     end
     unreachable
    end
   else
    i32.const 0
    local.set $0
   end
   local.get $0
   i32.eqz
   return
  end
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$164 (result i32)
   local.get $2
   i32.const 1
   i32.sub
   local.tee $7
   i32.const 7
   i32.and
   local.get $3
   local.get $4
   i32.add
   local.tee $8
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.set $9
   i32.const -1
   local.get $0
   i32.load
   i32.load
   local.get $7
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $8
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $1
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $7
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$164
   drop
   i32.const -1
   local.get $9
   local.get $7
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$164
   drop
   local.get $7
   local.get $9
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.set $7
  local.get $5
  i32.const 2359608
  i32.or
  local.set $8
  block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$165
   block $default5
    block $case46
     block $case37
      block $case28
       block $case19
        block $case010
         local.get $6
         i32.const 8
         i32.sub
         i32.load
         i32.const 6
         i32.sub
         br_table $case010 $case19 $case28 $case37 $case46 $default5
        end
        local.get $7
        local.get $8
        i32.and
        i32.eqz
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$165
       end
       local.get $8
       i32.const -2097153
       i32.and
       local.get $7
       i32.and
       i32.eqz
       local.get $7
       i32.const 2097152
       i32.and
       i32.const 0
       i32.ne
       i32.and
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$165
      end
      local.get $7
      local.get $8
      i32.and
      i32.eqz
      local.get $7
      i32.const -2147483648
      i32.and
      i32.const 0
      i32.ne
      i32.and
      local.set $7
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$165
     end
     local.get $7
     local.get $8
     i32.const -2147483648
     i32.or
     i32.and
     i32.eqz
     local.set $7
     br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$165
    end
    local.get $8
    i32.const 511
    i32.and
    i32.const 9
    i32.shl
    local.get $8
    i32.const 2143289344
    i32.and
    i32.const 13
    i32.shr_u
    i32.or
    local.get $7
    i32.and
    i32.eqz
    local.set $7
    br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$165
   end
   unreachable
  end
  local.get $7
  i32.eqz
  if
   i32.const 1
   return
  end
  i32.const 1
  local.set $8
  loop $for-loop|1
   local.get $4
   local.get $8
   i32.gt_s
   if
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$166 (result i32)
     local.get $2
     i32.const 1
     i32.sub
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     local.get $8
     i32.add
     local.tee $9
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $10
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $9
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $7
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$166
     drop
     i32.const -1
     local.get $10
     local.get $7
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$166
     drop
     local.get $7
     local.get $10
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $7
    local.get $5
    i32.const 2359614
    i32.or
    local.set $9
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$167
     block $default6
      block $case47
       block $case38
        block $case29
         block $case110
          block $case011
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case011 $case110 $case29 $case38 $case47 $default6
          end
          local.get $7
          local.get $9
          i32.and
          i32.eqz
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$167
         end
         local.get $9
         i32.const -2097153
         i32.and
         local.get $7
         i32.and
         i32.eqz
         local.get $7
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$167
        end
        local.get $7
        local.get $9
        i32.and
        i32.eqz
        local.get $7
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$167
       end
       local.get $7
       local.get $9
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$167
      end
      local.get $9
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $9
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $7
      i32.and
      i32.eqz
      local.set $7
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$167
     end
     unreachable
    end
    local.get $7
    if
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$168 (result i32)
      local.get $2
      local.get $8
      i32.add
      i32.const 1
      i32.sub
      local.tee $7
      i32.const 7
      i32.and
      local.get $3
      local.get $4
      i32.add
      local.tee $9
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $10
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $9
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $7
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$168
      drop
      i32.const -1
      local.get $10
      local.get $7
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$168
      drop
      local.get $7
      local.get $10
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $7
     local.get $5
     i32.const 2359800
     i32.or
     local.set $9
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$169
      block $default7
       block $case48
        block $case39
         block $case210
          block $case111
           block $case012
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case012 $case111 $case210 $case39 $case48 $default7
           end
           local.get $7
           local.get $9
           i32.and
           i32.eqz
           local.set $7
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$169
          end
          local.get $9
          i32.const -2097153
          i32.and
          local.get $7
          i32.and
          i32.eqz
          local.get $7
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$169
         end
         local.get $7
         local.get $9
         i32.and
         i32.eqz
         local.get $7
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$169
        end
        local.get $7
        local.get $9
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$169
       end
       local.get $9
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $9
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $7
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$169
      end
      unreachable
     end
     local.get $7
     i32.eqz
     if
      i32.const 1
      return
     end
    else
     i32.const 1
     return
    end
    local.get $8
    i32.const 1
    i32.add
    local.set $8
    br $for-loop|1
   end
  end
  i32.const 0
 )
 (func $assembly/StepValidator/StepValidator#isBlockedSouthEast (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  block $case2|0
   block $case1|0
    local.get $4
    i32.const 1
    i32.ne
    if
     local.get $4
     i32.const 2
     i32.eq
     br_if $case1|0
     br $case2|0
    end
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$170 (result i32)
     local.get $2
     i32.const 1
     i32.add
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     i32.const 1
     i32.sub
     local.tee $4
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $8
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $4
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $4
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$170
     drop
     i32.const -1
     local.get $8
     local.get $4
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$170
     drop
     local.get $4
     local.get $8
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $4
    local.get $5
    i32.const 2359683
    i32.or
    local.set $8
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$171
     block $default
      block $case4
       block $case3
        block $case2
         block $case1
          block $case0
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case0 $case1 $case2 $case3 $case4 $default
          end
          local.get $4
          local.get $8
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$171
         end
         local.get $8
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$171
        end
        local.get $4
        local.get $8
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$171
       end
       local.get $4
       local.get $8
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$171
      end
      local.get $8
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $8
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$171
     end
     unreachable
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$173
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$172 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $7
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $4
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$172
       drop
       i32.const -1
       local.get $7
       i32.const 7
       i32.and
       local.get $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $7
       local.get $4
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$172
       drop
       local.get $4
       local.get $7
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $4
      local.get $5
      i32.const 2359680
      i32.or
      local.set $7
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $4
           local.get $7
           i32.and
           i32.eqz
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$173
          end
          local.get $7
          i32.const -2097153
          i32.and
          local.get $4
          i32.and
          i32.eqz
          local.get $4
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$173
         end
         local.get $4
         local.get $7
         i32.and
         i32.eqz
         local.get $4
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$173
        end
        local.get $4
        local.get $7
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$173
       end
       local.get $7
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $7
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $4
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$173
      end
      unreachable
     end
    else
     i32.const 0
     local.set $4
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$175
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$174 (result i32)
       local.get $2
       i32.const 7
       i32.and
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $4
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $2
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $0
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$174
       drop
       i32.const -1
       local.get $4
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$174
       drop
       local.get $0
       local.get $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $0
      local.get $5
      i32.const 2359554
      i32.or
      local.set $1
      block $default1
       block $case42
        block $case33
         block $case24
          block $case15
           block $case06
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case06 $case15 $case24 $case33 $case42 $default1
           end
           local.get $0
           local.get $1
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$175
          end
          local.get $1
          i32.const -2097153
          i32.and
          local.get $0
          i32.and
          i32.eqz
          local.get $0
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$175
         end
         local.get $0
         local.get $1
         i32.and
         i32.eqz
         local.get $0
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$175
        end
        local.get $0
        local.get $1
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$175
       end
       local.get $1
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $1
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $0
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$175
      end
      unreachable
     end
    else
     i32.const 0
     local.set $0
    end
    local.get $0
    i32.eqz
    return
   end
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$176 (result i32)
    local.get $2
    i32.const 1
    i32.add
    local.tee $4
    i32.const 7
    i32.and
    local.get $3
    i32.const 1
    i32.sub
    local.tee $7
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.set $8
    i32.const -1
    local.get $0
    i32.load
    i32.load
    local.get $4
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $7
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $4
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$176
    drop
    i32.const -1
    local.get $8
    local.get $4
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$176
    drop
    local.get $4
    local.get $8
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   local.set $4
   local.get $5
   i32.const 2359695
   i32.or
   local.set $8
   block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$177
    block $default2
     block $case43
      block $case34
       block $case25
        block $case16
         block $case07
          local.get $6
          i32.const 8
          i32.sub
          i32.load
          i32.const 6
          i32.sub
          br_table $case07 $case16 $case25 $case34 $case43 $default2
         end
         local.get $4
         local.get $8
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$177
        end
        local.get $8
        i32.const -2097153
        i32.and
        local.get $4
        i32.and
        i32.eqz
        local.get $4
        i32.const 2097152
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$177
       end
       local.get $4
       local.get $8
       i32.and
       i32.eqz
       local.get $4
       i32.const -2147483648
       i32.and
       i32.const 0
       i32.ne
       i32.and
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$177
      end
      local.get $4
      local.get $8
      i32.const -2147483648
      i32.or
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$177
     end
     local.get $8
     i32.const 511
     i32.and
     i32.const 9
     i32.shl
     local.get $8
     i32.const 2143289344
     i32.and
     i32.const 13
     i32.shr_u
     i32.or
     local.get $4
     i32.and
     i32.eqz
     local.set $4
     br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$177
    end
    unreachable
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$179
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$178 (result i32)
      local.get $2
      i32.const 2
      i32.add
      local.tee $4
      i32.const 7
      i32.and
      local.get $7
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $8
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $4
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $4
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$178
      drop
      i32.const -1
      local.get $8
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$178
      drop
      local.get $4
      local.get $8
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $4
     local.get $5
     i32.const 2359683
     i32.or
     local.set $7
     block $default3
      block $case44
       block $case35
        block $case26
         block $case17
          block $case08
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case08 $case17 $case26 $case35 $case44 $default3
          end
          local.get $4
          local.get $7
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$179
         end
         local.get $7
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$179
        end
        local.get $4
        local.get $7
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$179
       end
       local.get $4
       local.get $7
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$179
      end
      local.get $7
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $7
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$179
     end
     unreachable
    end
   else
    i32.const 0
    local.set $4
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$181
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$180 (result i32)
      local.get $2
      i32.const 2
      i32.add
      local.tee $2
      i32.const 7
      i32.and
      local.get $3
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $4
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $2
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $3
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $0
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$180
      drop
      i32.const -1
      local.get $4
      local.get $0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$180
      drop
      local.get $0
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $0
     local.get $5
     i32.const 2359779
     i32.or
     local.set $1
     block $default4
      block $case45
       block $case36
        block $case27
         block $case18
          block $case09
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case09 $case18 $case27 $case36 $case45 $default4
          end
          local.get $0
          local.get $1
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$181
         end
         local.get $1
         i32.const -2097153
         i32.and
         local.get $0
         i32.and
         i32.eqz
         local.get $0
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$181
        end
        local.get $0
        local.get $1
        i32.and
        i32.eqz
        local.get $0
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$181
       end
       local.get $0
       local.get $1
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$181
      end
      local.get $1
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $1
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $0
      i32.and
      i32.eqz
      local.set $0
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$181
     end
     unreachable
    end
   else
    i32.const 0
    local.set $0
   end
   local.get $0
   i32.eqz
   return
  end
  i32.const 1
  local.set $8
  loop $for-loop|1
   local.get $4
   local.get $8
   i32.gt_s
   if
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$182 (result i32)
     local.get $2
     local.get $4
     i32.add
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     local.get $8
     i32.add
     i32.const 1
     i32.sub
     local.tee $9
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $10
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $9
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $7
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$182
     drop
     i32.const -1
     local.get $10
     local.get $7
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$182
     drop
     local.get $7
     local.get $10
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $7
    local.get $5
    i32.const 2359779
    i32.or
    local.set $9
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$183
     block $default5
      block $case46
       block $case37
        block $case28
         block $case19
          block $case010
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case010 $case19 $case28 $case37 $case46 $default5
          end
          local.get $7
          local.get $9
          i32.and
          i32.eqz
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$183
         end
         local.get $9
         i32.const -2097153
         i32.and
         local.get $7
         i32.and
         i32.eqz
         local.get $7
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$183
        end
        local.get $7
        local.get $9
        i32.and
        i32.eqz
        local.get $7
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$183
       end
       local.get $7
       local.get $9
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$183
      end
      local.get $9
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $9
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $7
      i32.and
      i32.eqz
      local.set $7
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$183
     end
     unreachable
    end
    local.get $7
    if
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$184 (result i32)
      local.get $2
      local.get $8
      i32.add
      local.tee $7
      i32.const 7
      i32.and
      local.get $3
      i32.const 1
      i32.sub
      local.tee $9
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $10
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $9
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $7
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$184
      drop
      i32.const -1
      local.get $10
      local.get $7
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$184
      drop
      local.get $7
      local.get $10
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $7
     local.get $5
     i32.const 2359695
     i32.or
     local.set $9
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$185
      block $default6
       block $case47
        block $case38
         block $case29
          block $case110
           block $case011
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case011 $case110 $case29 $case38 $case47 $default6
           end
           local.get $7
           local.get $9
           i32.and
           i32.eqz
           local.set $7
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$185
          end
          local.get $9
          i32.const -2097153
          i32.and
          local.get $7
          i32.and
          i32.eqz
          local.get $7
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$185
         end
         local.get $7
         local.get $9
         i32.and
         i32.eqz
         local.get $7
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$185
        end
        local.get $7
        local.get $9
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$185
       end
       local.get $9
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $9
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $7
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$185
      end
      unreachable
     end
     local.get $7
     i32.eqz
     if
      i32.const 1
      return
     end
    else
     i32.const 1
     return
    end
    local.get $8
    i32.const 1
    i32.add
    local.set $8
    br $for-loop|1
   end
  end
  i32.const 0
 )
 (func $assembly/StepValidator/StepValidator#isBlockedNorthEast (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  block $case2|0
   block $case1|0
    local.get $4
    i32.const 1
    i32.ne
    if
     local.get $4
     i32.const 2
     i32.eq
     br_if $case1|0
     br $case2|0
    end
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$186 (result i32)
     local.get $2
     i32.const 1
     i32.add
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     i32.const 1
     i32.add
     local.tee $4
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $8
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $4
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $4
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$186
     drop
     i32.const -1
     local.get $8
     local.get $4
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$186
     drop
     local.get $4
     local.get $8
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $4
    local.get $5
    i32.const 2359776
    i32.or
    local.set $8
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$187
     block $default
      block $case4
       block $case3
        block $case2
         block $case1
          block $case0
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case0 $case1 $case2 $case3 $case4 $default
          end
          local.get $4
          local.get $8
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$187
         end
         local.get $8
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$187
        end
        local.get $4
        local.get $8
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$187
       end
       local.get $4
       local.get $8
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$187
      end
      local.get $8
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $8
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$187
     end
     unreachable
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$189
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$188 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $7
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $4
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$188
       drop
       i32.const -1
       local.get $7
       i32.const 7
       i32.and
       local.get $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $7
       local.get $4
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$188
       drop
       local.get $4
       local.get $7
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $4
      local.get $5
      i32.const 2359680
      i32.or
      local.set $7
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $4
           local.get $7
           i32.and
           i32.eqz
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$189
          end
          local.get $7
          i32.const -2097153
          i32.and
          local.get $4
          i32.and
          i32.eqz
          local.get $4
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$189
         end
         local.get $4
         local.get $7
         i32.and
         i32.eqz
         local.get $4
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$189
        end
        local.get $4
        local.get $7
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$189
       end
       local.get $7
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $7
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $4
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$189
      end
      unreachable
     end
    else
     i32.const 0
     local.set $4
    end
    local.get $4
    if
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$191
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$190 (result i32)
       local.get $2
       i32.const 7
       i32.and
       local.get $3
       i32.const 1
       i32.add
       local.tee $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $4
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $2
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $0
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$190
       drop
       i32.const -1
       local.get $4
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$190
       drop
       local.get $0
       local.get $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $0
      local.get $5
      i32.const 2359584
      i32.or
      local.set $1
      block $default1
       block $case42
        block $case33
         block $case24
          block $case15
           block $case06
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case06 $case15 $case24 $case33 $case42 $default1
           end
           local.get $0
           local.get $1
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$191
          end
          local.get $1
          i32.const -2097153
          i32.and
          local.get $0
          i32.and
          i32.eqz
          local.get $0
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$191
         end
         local.get $0
         local.get $1
         i32.and
         i32.eqz
         local.get $0
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$191
        end
        local.get $0
        local.get $1
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$191
       end
       local.get $1
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $1
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $0
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$191
      end
      unreachable
     end
    else
     i32.const 0
     local.set $0
    end
    local.get $0
    i32.eqz
    return
   end
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$192 (result i32)
    local.get $2
    i32.const 1
    i32.add
    local.tee $4
    i32.const 7
    i32.and
    local.get $3
    i32.const 2
    i32.add
    local.tee $7
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.set $8
    i32.const -1
    local.get $0
    i32.load
    i32.load
    local.get $4
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $7
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $4
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$192
    drop
    i32.const -1
    local.get $8
    local.get $4
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$192
    drop
    local.get $4
    local.get $8
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   local.set $4
   local.get $5
   i32.const 2359800
   i32.or
   local.set $8
   block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$193
    block $default2
     block $case43
      block $case34
       block $case25
        block $case16
         block $case07
          local.get $6
          i32.const 8
          i32.sub
          i32.load
          i32.const 6
          i32.sub
          br_table $case07 $case16 $case25 $case34 $case43 $default2
         end
         local.get $4
         local.get $8
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$193
        end
        local.get $8
        i32.const -2097153
        i32.and
        local.get $4
        i32.and
        i32.eqz
        local.get $4
        i32.const 2097152
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$193
       end
       local.get $4
       local.get $8
       i32.and
       i32.eqz
       local.get $4
       i32.const -2147483648
       i32.and
       i32.const 0
       i32.ne
       i32.and
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$193
      end
      local.get $4
      local.get $8
      i32.const -2147483648
      i32.or
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$193
     end
     local.get $8
     i32.const 511
     i32.and
     i32.const 9
     i32.shl
     local.get $8
     i32.const 2143289344
     i32.and
     i32.const 13
     i32.shr_u
     i32.or
     local.get $4
     i32.and
     i32.eqz
     local.set $4
     br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$193
    end
    unreachable
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$195
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$194 (result i32)
      local.get $2
      i32.const 2
      i32.add
      local.tee $4
      i32.const 7
      i32.and
      local.get $7
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $8
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $4
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $4
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$194
      drop
      i32.const -1
      local.get $8
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$194
      drop
      local.get $4
      local.get $8
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $4
     local.get $5
     i32.const 2359776
     i32.or
     local.set $7
     block $default3
      block $case44
       block $case35
        block $case26
         block $case17
          block $case08
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case08 $case17 $case26 $case35 $case44 $default3
          end
          local.get $4
          local.get $7
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$195
         end
         local.get $7
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$195
        end
        local.get $4
        local.get $7
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$195
       end
       local.get $4
       local.get $7
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$195
      end
      local.get $7
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $7
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$195
     end
     unreachable
    end
   else
    i32.const 0
    local.set $4
   end
   local.get $4
   if
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$197
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$196 (result i32)
      local.get $2
      i32.const 2
      i32.add
      local.tee $2
      i32.const 7
      i32.and
      local.get $3
      i32.const 1
      i32.add
      local.tee $3
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $4
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $2
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $3
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $0
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$196
      drop
      i32.const -1
      local.get $4
      local.get $0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$196
      drop
      local.get $0
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $0
     local.get $5
     i32.const 2359779
     i32.or
     local.set $1
     block $default4
      block $case45
       block $case36
        block $case27
         block $case18
          block $case09
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case09 $case18 $case27 $case36 $case45 $default4
          end
          local.get $0
          local.get $1
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$197
         end
         local.get $1
         i32.const -2097153
         i32.and
         local.get $0
         i32.and
         i32.eqz
         local.get $0
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$197
        end
        local.get $0
        local.get $1
        i32.and
        i32.eqz
        local.get $0
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$197
       end
       local.get $0
       local.get $1
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $0
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$197
      end
      local.get $1
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $1
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $0
      i32.and
      i32.eqz
      local.set $0
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$197
     end
     unreachable
    end
   else
    i32.const 0
    local.set $0
   end
   local.get $0
   i32.eqz
   return
  end
  block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$198 (result i32)
   local.get $2
   local.get $4
   i32.add
   local.tee $7
   i32.const 7
   i32.and
   local.get $3
   local.get $4
   i32.add
   local.tee $8
   i32.const 7
   i32.and
   i32.const 3
   i32.shl
   i32.or
   local.set $9
   i32.const -1
   local.get $0
   i32.load
   i32.load
   local.get $7
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   local.get $8
   i32.const 3
   i32.shr_s
   i32.const 2047
   i32.and
   i32.const 11
   i32.shl
   i32.or
   local.get $1
   i32.const 3
   i32.and
   i32.const 22
   i32.shl
   i32.or
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $7
   i32.eqz
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$198
   drop
   i32.const -1
   local.get $9
   local.get $7
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.ge_s
   br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$198
   drop
   local.get $7
   local.get $9
   i32.const 2
   i32.shl
   i32.add
   i32.load
  end
  local.set $7
  local.get $5
  i32.const 2359776
  i32.or
  local.set $8
  block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$199
   block $default5
    block $case46
     block $case37
      block $case28
       block $case19
        block $case010
         local.get $6
         i32.const 8
         i32.sub
         i32.load
         i32.const 6
         i32.sub
         br_table $case010 $case19 $case28 $case37 $case46 $default5
        end
        local.get $7
        local.get $8
        i32.and
        i32.eqz
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$199
       end
       local.get $8
       i32.const -2097153
       i32.and
       local.get $7
       i32.and
       i32.eqz
       local.get $7
       i32.const 2097152
       i32.and
       i32.const 0
       i32.ne
       i32.and
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$199
      end
      local.get $7
      local.get $8
      i32.and
      i32.eqz
      local.get $7
      i32.const -2147483648
      i32.and
      i32.const 0
      i32.ne
      i32.and
      local.set $7
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$199
     end
     local.get $7
     local.get $8
     i32.const -2147483648
     i32.or
     i32.and
     i32.eqz
     local.set $7
     br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$199
    end
    local.get $8
    i32.const 511
    i32.and
    i32.const 9
    i32.shl
    local.get $8
    i32.const 2143289344
    i32.and
    i32.const 13
    i32.shr_u
    i32.or
    local.get $7
    i32.and
    i32.eqz
    local.set $7
    br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$199
   end
   unreachable
  end
  local.get $7
  i32.eqz
  if
   i32.const 1
   return
  end
  i32.const 1
  local.set $8
  loop $for-loop|1
   local.get $4
   local.get $8
   i32.gt_s
   if
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$200 (result i32)
     local.get $2
     local.get $8
     i32.add
     local.tee $7
     i32.const 7
     i32.and
     local.get $3
     local.get $4
     i32.add
     local.tee $9
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $10
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $7
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $9
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $7
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$200
     drop
     i32.const -1
     local.get $10
     local.get $7
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$200
     drop
     local.get $7
     local.get $10
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $7
    local.get $5
    i32.const 2359800
    i32.or
    local.set $9
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$201
     block $default6
      block $case47
       block $case38
        block $case29
         block $case110
          block $case011
           local.get $6
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case011 $case110 $case29 $case38 $case47 $default6
          end
          local.get $7
          local.get $9
          i32.and
          i32.eqz
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$201
         end
         local.get $9
         i32.const -2097153
         i32.and
         local.get $7
         i32.and
         i32.eqz
         local.get $7
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$201
        end
        local.get $7
        local.get $9
        i32.and
        i32.eqz
        local.get $7
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$201
       end
       local.get $7
       local.get $9
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$201
      end
      local.get $9
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $9
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $7
      i32.and
      i32.eqz
      local.set $7
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$201
     end
     unreachable
    end
    local.get $7
    if
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$202 (result i32)
      local.get $2
      local.get $4
      i32.add
      local.tee $7
      i32.const 7
      i32.and
      local.get $3
      local.get $8
      i32.add
      local.tee $9
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $10
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $7
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $9
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $7
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$202
      drop
      i32.const -1
      local.get $10
      local.get $7
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$202
      drop
      local.get $7
      local.get $10
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $7
     local.get $5
     i32.const 2359779
     i32.or
     local.set $9
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$203
      block $default7
       block $case48
        block $case39
         block $case210
          block $case111
           block $case012
            local.get $6
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case012 $case111 $case210 $case39 $case48 $default7
           end
           local.get $7
           local.get $9
           i32.and
           i32.eqz
           local.set $7
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$203
          end
          local.get $9
          i32.const -2097153
          i32.and
          local.get $7
          i32.and
          i32.eqz
          local.get $7
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $7
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$203
         end
         local.get $7
         local.get $9
         i32.and
         i32.eqz
         local.get $7
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $7
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$203
        end
        local.get $7
        local.get $9
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $7
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$203
       end
       local.get $9
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $9
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $7
       i32.and
       i32.eqz
       local.set $7
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$203
      end
      unreachable
     end
     local.get $7
     i32.eqz
     if
      i32.const 1
      return
     end
    else
     i32.const 1
     return
    end
    local.get $8
    i32.const 1
    i32.add
    local.set $8
    br $for-loop|1
   end
  end
  i32.const 0
 )
 (func $assembly/StepValidator/StepValidator#canTravel (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  (local $9 i32)
  (local $10 i32)
  local.get $4
  i32.eqz
  local.get $5
  i32.const -1
  i32.eq
  i32.and
  if
   block $__inlined_func$assembly/StepValidator/StepValidator#isBlockedSouth$1038
    block $case2|0
     block $case1|0
      local.get $6
      i32.const 1
      i32.ne
      if
       local.get $6
       i32.const 2
       i32.eq
       br_if $case1|0
       br $case2|0
      end
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$204 (result i32)
       local.get $2
       i32.const 7
       i32.and
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $4
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $2
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $0
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$204
       drop
       i32.const -1
       local.get $4
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$204
       drop
       local.get $0
       local.get $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $0
      local.get $7
      i32.const 2359554
      i32.or
      local.set $1
      block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$205
       block $default
        block $case4
         block $case3
          block $case2
           block $case1
            block $case0
             local.get $8
             i32.const 8
             i32.sub
             i32.load
             i32.const 6
             i32.sub
             br_table $case0 $case1 $case2 $case3 $case4 $default
            end
            local.get $0
            local.get $1
            i32.and
            i32.eqz
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$205
           end
           local.get $1
           i32.const -2097153
           i32.and
           local.get $0
           i32.and
           i32.eqz
           local.get $0
           i32.const 2097152
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$205
          end
          local.get $0
          local.get $1
          i32.and
          i32.eqz
          local.get $0
          i32.const -2147483648
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$205
         end
         local.get $0
         local.get $1
         i32.const -2147483648
         i32.or
         i32.and
         i32.eqz
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$205
        end
        local.get $1
        i32.const 511
        i32.and
        i32.const 9
        i32.shl
        local.get $1
        i32.const 2143289344
        i32.and
        i32.const 13
        i32.shr_u
        i32.or
        local.get $0
        i32.and
        i32.eqz
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$205
       end
       unreachable
      end
      local.get $0
      i32.eqz
      local.set $5
      br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedSouth$1038
     end
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$206 (result i32)
      local.get $2
      i32.const 7
      i32.and
      local.get $3
      i32.const 1
      i32.sub
      local.tee $4
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $3
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $2
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $4
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $5
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$206
      drop
      i32.const -1
      local.get $3
      local.get $5
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$206
      drop
      local.get $5
      local.get $3
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $3
     local.get $7
     i32.const 2359566
     i32.or
     local.set $5
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$207
      block $default0
       block $case41
        block $case32
         block $case23
          block $case14
           block $case05
            local.get $8
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case05 $case14 $case23 $case32 $case41 $default0
           end
           local.get $3
           local.get $5
           i32.and
           i32.eqz
           local.set $3
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$207
          end
          local.get $5
          i32.const -2097153
          i32.and
          local.get $3
          i32.and
          i32.eqz
          local.get $3
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $3
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$207
         end
         local.get $3
         local.get $5
         i32.and
         i32.eqz
         local.get $3
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $3
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$207
        end
        local.get $3
        local.get $5
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $3
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$207
       end
       local.get $5
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $5
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $3
       i32.and
       i32.eqz
       local.set $3
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$207
      end
      unreachable
     end
     local.get $3
     if
      block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$209
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$208 (result i32)
        local.get $2
        i32.const 1
        i32.add
        local.tee $2
        i32.const 7
        i32.and
        local.get $4
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.set $3
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $2
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $4
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $0
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$208
        drop
        i32.const -1
        local.get $3
        local.get $0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$208
        drop
        local.get $0
        local.get $3
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.set $0
       local.get $7
       i32.const 2359683
       i32.or
       local.set $1
       block $default1
        block $case42
         block $case33
          block $case24
           block $case15
            block $case06
             local.get $8
             i32.const 8
             i32.sub
             i32.load
             i32.const 6
             i32.sub
             br_table $case06 $case15 $case24 $case33 $case42 $default1
            end
            local.get $0
            local.get $1
            i32.and
            i32.eqz
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$209
           end
           local.get $1
           i32.const -2097153
           i32.and
           local.get $0
           i32.and
           i32.eqz
           local.get $0
           i32.const 2097152
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$209
          end
          local.get $0
          local.get $1
          i32.and
          i32.eqz
          local.get $0
          i32.const -2147483648
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$209
         end
         local.get $0
         local.get $1
         i32.const -2147483648
         i32.or
         i32.and
         i32.eqz
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$209
        end
        local.get $1
        i32.const 511
        i32.and
        i32.const 9
        i32.shl
        local.get $1
        i32.const 2143289344
        i32.and
        i32.const 13
        i32.shr_u
        i32.or
        local.get $0
        i32.and
        i32.eqz
        local.set $0
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$209
       end
       unreachable
      end
     else
      i32.const 0
      local.set $0
     end
     local.get $0
     i32.eqz
     local.set $5
     br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedSouth$1038
    end
    i32.const 1
    local.set $5
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$210 (result i32)
     local.get $2
     i32.const 7
     i32.and
     local.get $3
     i32.const 1
     i32.sub
     local.tee $9
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $4
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $2
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $9
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $10
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$210
     drop
     i32.const -1
     local.get $4
     local.get $10
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$210
     drop
     local.get $10
     local.get $4
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $4
    local.get $7
    i32.const 2359566
    i32.or
    local.set $10
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$211
     block $default2
      block $case43
       block $case34
        block $case25
         block $case16
          block $case07
           local.get $8
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case07 $case16 $case25 $case34 $case43 $default2
          end
          local.get $4
          local.get $10
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$211
         end
         local.get $10
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$211
        end
        local.get $4
        local.get $10
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$211
       end
       local.get $4
       local.get $10
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$211
      end
      local.get $10
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $10
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$211
     end
     unreachable
    end
    local.get $4
    i32.eqz
    br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedSouth$1038
    block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$212 (result i32)
     local.get $2
     local.get $6
     i32.add
     i32.const 1
     i32.sub
     local.tee $4
     i32.const 7
     i32.and
     local.get $9
     i32.const 7
     i32.and
     i32.const 3
     i32.shl
     i32.or
     local.set $10
     i32.const -1
     local.get $0
     i32.load
     i32.load
     local.get $4
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     local.get $9
     i32.const 3
     i32.shr_s
     i32.const 2047
     i32.and
     i32.const 11
     i32.shl
     i32.or
     local.get $1
     i32.const 3
     i32.and
     i32.const 22
     i32.shl
     i32.or
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $4
     i32.eqz
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$212
     drop
     i32.const -1
     local.get $10
     local.get $4
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 2
     i32.shr_u
     i32.ge_s
     br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$212
     drop
     local.get $4
     local.get $10
     i32.const 2
     i32.shl
     i32.add
     i32.load
    end
    local.set $4
    local.get $7
    i32.const 2359683
    i32.or
    local.set $9
    block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$213
     block $default3
      block $case44
       block $case35
        block $case26
         block $case17
          block $case08
           local.get $8
           i32.const 8
           i32.sub
           i32.load
           i32.const 6
           i32.sub
           br_table $case08 $case17 $case26 $case35 $case44 $default3
          end
          local.get $4
          local.get $9
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$213
         end
         local.get $9
         i32.const -2097153
         i32.and
         local.get $4
         i32.and
         i32.eqz
         local.get $4
         i32.const 2097152
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$213
        end
        local.get $4
        local.get $9
        i32.and
        i32.eqz
        local.get $4
        i32.const -2147483648
        i32.and
        i32.const 0
        i32.ne
        i32.and
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$213
       end
       local.get $4
       local.get $9
       i32.const -2147483648
       i32.or
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$213
      end
      local.get $9
      i32.const 511
      i32.and
      i32.const 9
      i32.shl
      local.get $9
      i32.const 2143289344
      i32.and
      i32.const 13
      i32.shr_u
      i32.or
      local.get $4
      i32.and
      i32.eqz
      local.set $4
      br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$213
     end
     unreachable
    end
    local.get $4
    i32.eqz
    br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedSouth$1038
    local.get $2
    i32.const 1
    i32.add
    local.set $4
    loop $for-loop|1
     local.get $4
     local.get $2
     local.get $6
     i32.add
     i32.const 1
     i32.sub
     i32.lt_s
     if
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$214 (result i32)
       local.get $4
       i32.const 7
       i32.and
       local.get $3
       i32.const 1
       i32.sub
       local.tee $9
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $10
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $4
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $9
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $9
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$214
       drop
       i32.const -1
       local.get $10
       local.get $9
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$214
       drop
       local.get $9
       local.get $10
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $9
      local.get $7
      i32.const 2359695
      i32.or
      local.set $10
      block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$215
       block $default4
        block $case45
         block $case36
          block $case27
           block $case18
            block $case09
             local.get $8
             i32.const 8
             i32.sub
             i32.load
             i32.const 6
             i32.sub
             br_table $case09 $case18 $case27 $case36 $case45 $default4
            end
            local.get $9
            local.get $10
            i32.and
            i32.eqz
            local.set $9
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$215
           end
           local.get $10
           i32.const -2097153
           i32.and
           local.get $9
           i32.and
           i32.eqz
           local.get $9
           i32.const 2097152
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $9
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$215
          end
          local.get $9
          local.get $10
          i32.and
          i32.eqz
          local.get $9
          i32.const -2147483648
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $9
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$215
         end
         local.get $9
         local.get $10
         i32.const -2147483648
         i32.or
         i32.and
         i32.eqz
         local.set $9
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$215
        end
        local.get $10
        i32.const 511
        i32.and
        i32.const 9
        i32.shl
        local.get $10
        i32.const 2143289344
        i32.and
        i32.const 13
        i32.shr_u
        i32.or
        local.get $9
        i32.and
        i32.eqz
        local.set $9
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$215
       end
       unreachable
      end
      local.get $9
      i32.eqz
      br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedSouth$1038
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $for-loop|1
     end
    end
    i32.const 0
    local.set $5
   end
  else
   local.get $4
   i32.eqz
   local.get $5
   i32.const 1
   i32.eq
   i32.and
   if
    block $__inlined_func$assembly/StepValidator/StepValidator#isBlockedNorth$1039
     block $case2|01
      block $case1|02
       local.get $6
       i32.const 1
       i32.ne
       if
        local.get $6
        i32.const 2
        i32.eq
        br_if $case1|02
        br $case2|01
       end
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$216 (result i32)
        local.get $2
        i32.const 7
        i32.and
        local.get $3
        i32.const 1
        i32.add
        local.tee $3
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.set $4
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $2
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $3
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $0
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$216
        drop
        i32.const -1
        local.get $4
        local.get $0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$216
        drop
        local.get $0
        local.get $4
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.set $0
       local.get $7
       i32.const 2359584
       i32.or
       local.set $1
       block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$217
        block $default5
         block $case46
          block $case37
           block $case28
            block $case19
             block $case010
              local.get $8
              i32.const 8
              i32.sub
              i32.load
              i32.const 6
              i32.sub
              br_table $case010 $case19 $case28 $case37 $case46 $default5
             end
             local.get $0
             local.get $1
             i32.and
             i32.eqz
             local.set $0
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$217
            end
            local.get $1
            i32.const -2097153
            i32.and
            local.get $0
            i32.and
            i32.eqz
            local.get $0
            i32.const 2097152
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$217
           end
           local.get $0
           local.get $1
           i32.and
           i32.eqz
           local.get $0
           i32.const -2147483648
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$217
          end
          local.get $0
          local.get $1
          i32.const -2147483648
          i32.or
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$217
         end
         local.get $1
         i32.const 511
         i32.and
         i32.const 9
         i32.shl
         local.get $1
         i32.const 2143289344
         i32.and
         i32.const 13
         i32.shr_u
         i32.or
         local.get $0
         i32.and
         i32.eqz
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$217
        end
        unreachable
       end
       local.get $0
       i32.eqz
       local.set $5
       br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedNorth$1039
      end
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$218 (result i32)
       local.get $2
       i32.const 7
       i32.and
       local.get $3
       i32.const 2
       i32.add
       local.tee $4
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $3
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $2
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $4
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $5
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$218
       drop
       i32.const -1
       local.get $3
       local.get $5
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$218
       drop
       local.get $5
       local.get $3
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $3
      local.get $7
      i32.const 2359608
      i32.or
      local.set $5
      block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$219
       block $default6
        block $case47
         block $case38
          block $case29
           block $case110
            block $case011
             local.get $8
             i32.const 8
             i32.sub
             i32.load
             i32.const 6
             i32.sub
             br_table $case011 $case110 $case29 $case38 $case47 $default6
            end
            local.get $3
            local.get $5
            i32.and
            i32.eqz
            local.set $3
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$219
           end
           local.get $5
           i32.const -2097153
           i32.and
           local.get $3
           i32.and
           i32.eqz
           local.get $3
           i32.const 2097152
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $3
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$219
          end
          local.get $3
          local.get $5
          i32.and
          i32.eqz
          local.get $3
          i32.const -2147483648
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $3
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$219
         end
         local.get $3
         local.get $5
         i32.const -2147483648
         i32.or
         i32.and
         i32.eqz
         local.set $3
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$219
        end
        local.get $5
        i32.const 511
        i32.and
        i32.const 9
        i32.shl
        local.get $5
        i32.const 2143289344
        i32.and
        i32.const 13
        i32.shr_u
        i32.or
        local.get $3
        i32.and
        i32.eqz
        local.set $3
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$219
       end
       unreachable
      end
      local.get $3
      if
       block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$221
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$220 (result i32)
         local.get $2
         i32.const 1
         i32.add
         local.tee $2
         i32.const 7
         i32.and
         local.get $4
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $3
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $2
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $4
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $1
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $0
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$220
         drop
         i32.const -1
         local.get $3
         local.get $0
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$220
         drop
         local.get $0
         local.get $3
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $0
        local.get $7
        i32.const 2359776
        i32.or
        local.set $1
        block $default7
         block $case48
          block $case39
           block $case210
            block $case111
             block $case012
              local.get $8
              i32.const 8
              i32.sub
              i32.load
              i32.const 6
              i32.sub
              br_table $case012 $case111 $case210 $case39 $case48 $default7
             end
             local.get $0
             local.get $1
             i32.and
             i32.eqz
             local.set $0
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$221
            end
            local.get $1
            i32.const -2097153
            i32.and
            local.get $0
            i32.and
            i32.eqz
            local.get $0
            i32.const 2097152
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$221
           end
           local.get $0
           local.get $1
           i32.and
           i32.eqz
           local.get $0
           i32.const -2147483648
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$221
          end
          local.get $0
          local.get $1
          i32.const -2147483648
          i32.or
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$221
         end
         local.get $1
         i32.const 511
         i32.and
         i32.const 9
         i32.shl
         local.get $1
         i32.const 2143289344
         i32.and
         i32.const 13
         i32.shr_u
         i32.or
         local.get $0
         i32.and
         i32.eqz
         local.set $0
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$221
        end
        unreachable
       end
      else
       i32.const 0
       local.set $0
      end
      local.get $0
      i32.eqz
      local.set $5
      br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedNorth$1039
     end
     i32.const 1
     local.set $5
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$222 (result i32)
      local.get $2
      i32.const 7
      i32.and
      local.get $3
      local.get $6
      i32.add
      local.tee $9
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $4
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $2
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $9
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $10
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$222
      drop
      i32.const -1
      local.get $4
      local.get $10
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$222
      drop
      local.get $10
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $4
     local.get $7
     i32.const 2359608
     i32.or
     local.set $10
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$223
      block $default8
       block $case49
        block $case310
         block $case211
          block $case112
           block $case013
            local.get $8
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case013 $case112 $case211 $case310 $case49 $default8
           end
           local.get $4
           local.get $10
           i32.and
           i32.eqz
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$223
          end
          local.get $10
          i32.const -2097153
          i32.and
          local.get $4
          i32.and
          i32.eqz
          local.get $4
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$223
         end
         local.get $4
         local.get $10
         i32.and
         i32.eqz
         local.get $4
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$223
        end
        local.get $4
        local.get $10
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$223
       end
       local.get $10
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $10
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $4
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$223
      end
      unreachable
     end
     local.get $4
     i32.eqz
     br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedNorth$1039
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$224 (result i32)
      local.get $2
      local.get $6
      i32.add
      i32.const 1
      i32.sub
      local.tee $4
      i32.const 7
      i32.and
      local.get $9
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.set $10
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $4
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $9
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $4
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$224
      drop
      i32.const -1
      local.get $10
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$224
      drop
      local.get $4
      local.get $10
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     local.set $4
     local.get $7
     i32.const 2359776
     i32.or
     local.set $9
     block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$225
      block $default9
       block $case410
        block $case311
         block $case212
          block $case113
           block $case014
            local.get $8
            i32.const 8
            i32.sub
            i32.load
            i32.const 6
            i32.sub
            br_table $case014 $case113 $case212 $case311 $case410 $default9
           end
           local.get $4
           local.get $9
           i32.and
           i32.eqz
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$225
          end
          local.get $9
          i32.const -2097153
          i32.and
          local.get $4
          i32.and
          i32.eqz
          local.get $4
          i32.const 2097152
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$225
         end
         local.get $4
         local.get $9
         i32.and
         i32.eqz
         local.get $4
         i32.const -2147483648
         i32.and
         i32.const 0
         i32.ne
         i32.and
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$225
        end
        local.get $4
        local.get $9
        i32.const -2147483648
        i32.or
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$225
       end
       local.get $9
       i32.const 511
       i32.and
       i32.const 9
       i32.shl
       local.get $9
       i32.const 2143289344
       i32.and
       i32.const 13
       i32.shr_u
       i32.or
       local.get $4
       i32.and
       i32.eqz
       local.set $4
       br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$225
      end
      unreachable
     end
     local.get $4
     i32.eqz
     br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedNorth$1039
     local.get $2
     i32.const 1
     i32.add
     local.set $4
     loop $for-loop|14
      local.get $4
      local.get $2
      local.get $6
      i32.add
      i32.const 1
      i32.sub
      i32.lt_s
      if
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$226 (result i32)
        local.get $4
        i32.const 7
        i32.and
        local.get $3
        local.get $6
        i32.add
        local.tee $9
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.set $10
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $4
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $9
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $9
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$226
        drop
        i32.const -1
        local.get $10
        local.get $9
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$226
        drop
        local.get $9
        local.get $10
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.set $9
       local.get $7
       i32.const 2359800
       i32.or
       local.set $10
       block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$227
        block $default10
         block $case411
          block $case312
           block $case213
            block $case114
             block $case015
              local.get $8
              i32.const 8
              i32.sub
              i32.load
              i32.const 6
              i32.sub
              br_table $case015 $case114 $case213 $case312 $case411 $default10
             end
             local.get $9
             local.get $10
             i32.and
             i32.eqz
             local.set $9
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$227
            end
            local.get $10
            i32.const -2097153
            i32.and
            local.get $9
            i32.and
            i32.eqz
            local.get $9
            i32.const 2097152
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $9
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$227
           end
           local.get $9
           local.get $10
           i32.and
           i32.eqz
           local.get $9
           i32.const -2147483648
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $9
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$227
          end
          local.get $9
          local.get $10
          i32.const -2147483648
          i32.or
          i32.and
          i32.eqz
          local.set $9
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$227
         end
         local.get $10
         i32.const 511
         i32.and
         i32.const 9
         i32.shl
         local.get $10
         i32.const 2143289344
         i32.and
         i32.const 13
         i32.shr_u
         i32.or
         local.get $9
         i32.and
         i32.eqz
         local.set $9
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$227
        end
        unreachable
       end
       local.get $9
       i32.eqz
       br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedNorth$1039
       local.get $4
       i32.const 1
       i32.add
       local.set $4
       br $for-loop|14
      end
     end
     i32.const 0
     local.set $5
    end
   else
    local.get $5
    i32.eqz
    local.get $4
    i32.const -1
    i32.eq
    i32.and
    if
     block $__inlined_func$assembly/StepValidator/StepValidator#isBlockedWest$1040
      block $case2|02
       block $case1|03
        local.get $6
        i32.const 1
        i32.ne
        if
         local.get $6
         i32.const 2
         i32.eq
         br_if $case1|03
         br $case2|02
        end
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$228 (result i32)
         local.get $2
         i32.const 1
         i32.sub
         local.tee $2
         i32.const 7
         i32.and
         local.get $3
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $4
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $2
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $3
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $1
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $0
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$228
         drop
         i32.const -1
         local.get $4
         local.get $0
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$228
         drop
         local.get $0
         local.get $4
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $0
        local.get $7
        i32.const 2359560
        i32.or
        local.set $1
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$229
         block $default11
          block $case412
           block $case313
            block $case214
             block $case115
              block $case016
               local.get $8
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case016 $case115 $case214 $case313 $case412 $default11
              end
              local.get $0
              local.get $1
              i32.and
              i32.eqz
              local.set $0
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$229
             end
             local.get $1
             i32.const -2097153
             i32.and
             local.get $0
             i32.and
             i32.eqz
             local.get $0
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $0
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$229
            end
            local.get $0
            local.get $1
            i32.and
            i32.eqz
            local.get $0
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$229
           end
           local.get $0
           local.get $1
           i32.const -2147483648
           i32.or
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$229
          end
          local.get $1
          i32.const 511
          i32.and
          i32.const 9
          i32.shl
          local.get $1
          i32.const 2143289344
          i32.and
          i32.const 13
          i32.shr_u
          i32.or
          local.get $0
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$229
         end
         unreachable
        end
        local.get $0
        i32.eqz
        local.set $5
        br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedWest$1040
       end
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$230 (result i32)
        local.get $2
        i32.const 1
        i32.sub
        local.tee $4
        i32.const 7
        i32.and
        local.get $3
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.set $2
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $4
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $3
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $5
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$230
        drop
        i32.const -1
        local.get $2
        local.get $5
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$230
        drop
        local.get $5
        local.get $2
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.set $2
       local.get $7
       i32.const 2359566
       i32.or
       local.set $5
       block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$231
        block $default12
         block $case413
          block $case314
           block $case215
            block $case116
             block $case017
              local.get $8
              i32.const 8
              i32.sub
              i32.load
              i32.const 6
              i32.sub
              br_table $case017 $case116 $case215 $case314 $case413 $default12
             end
             local.get $2
             local.get $5
             i32.and
             i32.eqz
             local.set $2
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$231
            end
            local.get $5
            i32.const -2097153
            i32.and
            local.get $2
            i32.and
            i32.eqz
            local.get $2
            i32.const 2097152
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $2
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$231
           end
           local.get $2
           local.get $5
           i32.and
           i32.eqz
           local.get $2
           i32.const -2147483648
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $2
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$231
          end
          local.get $2
          local.get $5
          i32.const -2147483648
          i32.or
          i32.and
          i32.eqz
          local.set $2
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$231
         end
         local.get $5
         i32.const 511
         i32.and
         i32.const 9
         i32.shl
         local.get $5
         i32.const 2143289344
         i32.and
         i32.const 13
         i32.shr_u
         i32.or
         local.get $2
         i32.and
         i32.eqz
         local.set $2
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$231
        end
        unreachable
       end
       local.get $2
       if
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$233
         block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$232 (result i32)
          local.get $4
          i32.const 7
          i32.and
          local.get $3
          i32.const 1
          i32.add
          local.tee $2
          i32.const 7
          i32.and
          i32.const 3
          i32.shl
          i32.or
          local.set $3
          i32.const -1
          local.get $0
          i32.load
          i32.load
          local.get $4
          i32.const 3
          i32.shr_s
          i32.const 2047
          i32.and
          local.get $2
          i32.const 3
          i32.shr_s
          i32.const 2047
          i32.and
          i32.const 11
          i32.shl
          i32.or
          local.get $1
          i32.const 3
          i32.and
          i32.const 22
          i32.shl
          i32.or
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee $0
          i32.eqz
          br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$232
          drop
          i32.const -1
          local.get $3
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 2
          i32.shr_u
          i32.ge_s
          br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$232
          drop
          local.get $0
          local.get $3
          i32.const 2
          i32.shl
          i32.add
          i32.load
         end
         local.set $0
         local.get $7
         i32.const 2359608
         i32.or
         local.set $1
         block $default13
          block $case414
           block $case315
            block $case216
             block $case117
              block $case018
               local.get $8
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case018 $case117 $case216 $case315 $case414 $default13
              end
              local.get $0
              local.get $1
              i32.and
              i32.eqz
              local.set $0
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$233
             end
             local.get $1
             i32.const -2097153
             i32.and
             local.get $0
             i32.and
             i32.eqz
             local.get $0
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $0
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$233
            end
            local.get $0
            local.get $1
            i32.and
            i32.eqz
            local.get $0
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$233
           end
           local.get $0
           local.get $1
           i32.const -2147483648
           i32.or
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$233
          end
          local.get $1
          i32.const 511
          i32.and
          i32.const 9
          i32.shl
          local.get $1
          i32.const 2143289344
          i32.and
          i32.const 13
          i32.shr_u
          i32.or
          local.get $0
          i32.and
          i32.eqz
          local.set $0
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$233
         end
         unreachable
        end
       else
        i32.const 0
        local.set $0
       end
       local.get $0
       i32.eqz
       local.set $5
       br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedWest$1040
      end
      i32.const 1
      local.set $5
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$234 (result i32)
       local.get $2
       i32.const 1
       i32.sub
       local.tee $9
       i32.const 7
       i32.and
       local.get $3
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $4
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $9
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $3
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $10
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$234
       drop
       i32.const -1
       local.get $4
       local.get $10
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$234
       drop
       local.get $10
       local.get $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $4
      local.get $7
      i32.const 2359566
      i32.or
      local.set $10
      block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$235
       block $default14
        block $case415
         block $case316
          block $case217
           block $case118
            block $case019
             local.get $8
             i32.const 8
             i32.sub
             i32.load
             i32.const 6
             i32.sub
             br_table $case019 $case118 $case217 $case316 $case415 $default14
            end
            local.get $4
            local.get $10
            i32.and
            i32.eqz
            local.set $4
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$235
           end
           local.get $10
           i32.const -2097153
           i32.and
           local.get $4
           i32.and
           i32.eqz
           local.get $4
           i32.const 2097152
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$235
          end
          local.get $4
          local.get $10
          i32.and
          i32.eqz
          local.get $4
          i32.const -2147483648
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$235
         end
         local.get $4
         local.get $10
         i32.const -2147483648
         i32.or
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$235
        end
        local.get $10
        i32.const 511
        i32.and
        i32.const 9
        i32.shl
        local.get $10
        i32.const 2143289344
        i32.and
        i32.const 13
        i32.shr_u
        i32.or
        local.get $4
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$235
       end
       unreachable
      end
      local.get $4
      i32.eqz
      br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedWest$1040
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$236 (result i32)
       local.get $9
       i32.const 7
       i32.and
       local.get $3
       local.get $6
       i32.add
       i32.const 1
       i32.sub
       local.tee $4
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.set $10
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $9
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $4
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $4
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$236
       drop
       i32.const -1
       local.get $10
       local.get $4
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$236
       drop
       local.get $4
       local.get $10
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.set $4
      local.get $7
      i32.const 2359608
      i32.or
      local.set $9
      block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$237
       block $default15
        block $case416
         block $case317
          block $case218
           block $case119
            block $case020
             local.get $8
             i32.const 8
             i32.sub
             i32.load
             i32.const 6
             i32.sub
             br_table $case020 $case119 $case218 $case317 $case416 $default15
            end
            local.get $4
            local.get $9
            i32.and
            i32.eqz
            local.set $4
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$237
           end
           local.get $9
           i32.const -2097153
           i32.and
           local.get $4
           i32.and
           i32.eqz
           local.get $4
           i32.const 2097152
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$237
          end
          local.get $4
          local.get $9
          i32.and
          i32.eqz
          local.get $4
          i32.const -2147483648
          i32.and
          i32.const 0
          i32.ne
          i32.and
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$237
         end
         local.get $4
         local.get $9
         i32.const -2147483648
         i32.or
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$237
        end
        local.get $9
        i32.const 511
        i32.and
        i32.const 9
        i32.shl
        local.get $9
        i32.const 2143289344
        i32.and
        i32.const 13
        i32.shr_u
        i32.or
        local.get $4
        i32.and
        i32.eqz
        local.set $4
        br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$237
       end
       unreachable
      end
      local.get $4
      i32.eqz
      br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedWest$1040
      local.get $3
      i32.const 1
      i32.add
      local.set $4
      loop $for-loop|15
       local.get $4
       local.get $3
       local.get $6
       i32.add
       i32.const 1
       i32.sub
       i32.lt_s
       if
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$238 (result i32)
         local.get $2
         i32.const 1
         i32.sub
         local.tee $9
         i32.const 7
         i32.and
         local.get $4
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $10
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $9
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $4
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $1
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $9
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$238
         drop
         i32.const -1
         local.get $10
         local.get $9
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$238
         drop
         local.get $9
         local.get $10
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $9
        local.get $7
        i32.const 2359614
        i32.or
        local.set $10
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$239
         block $default16
          block $case417
           block $case318
            block $case219
             block $case120
              block $case021
               local.get $8
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case021 $case120 $case219 $case318 $case417 $default16
              end
              local.get $9
              local.get $10
              i32.and
              i32.eqz
              local.set $9
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$239
             end
             local.get $10
             i32.const -2097153
             i32.and
             local.get $9
             i32.and
             i32.eqz
             local.get $9
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $9
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$239
            end
            local.get $9
            local.get $10
            i32.and
            i32.eqz
            local.get $9
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $9
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$239
           end
           local.get $9
           local.get $10
           i32.const -2147483648
           i32.or
           i32.and
           i32.eqz
           local.set $9
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$239
          end
          local.get $10
          i32.const 511
          i32.and
          i32.const 9
          i32.shl
          local.get $10
          i32.const 2143289344
          i32.and
          i32.const 13
          i32.shr_u
          i32.or
          local.get $9
          i32.and
          i32.eqz
          local.set $9
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$239
         end
         unreachable
        end
        local.get $9
        i32.eqz
        br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedWest$1040
        local.get $4
        i32.const 1
        i32.add
        local.set $4
        br $for-loop|15
       end
      end
      i32.const 0
      local.set $5
     end
    else
     local.get $5
     i32.eqz
     local.get $4
     i32.const 1
     i32.eq
     i32.and
     if
      block $__inlined_func$assembly/StepValidator/StepValidator#isBlockedEast$1041
       block $case2|03
        block $case1|04
         local.get $6
         i32.const 1
         i32.ne
         if
          local.get $6
          i32.const 2
          i32.eq
          br_if $case1|04
          br $case2|03
         end
         block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$240 (result i32)
          local.get $2
          i32.const 1
          i32.add
          local.tee $2
          i32.const 7
          i32.and
          local.get $3
          i32.const 7
          i32.and
          i32.const 3
          i32.shl
          i32.or
          local.set $4
          i32.const -1
          local.get $0
          i32.load
          i32.load
          local.get $2
          i32.const 3
          i32.shr_s
          i32.const 2047
          i32.and
          local.get $3
          i32.const 3
          i32.shr_s
          i32.const 2047
          i32.and
          i32.const 11
          i32.shl
          i32.or
          local.get $1
          i32.const 3
          i32.and
          i32.const 22
          i32.shl
          i32.or
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee $0
          i32.eqz
          br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$240
          drop
          i32.const -1
          local.get $4
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 2
          i32.shr_u
          i32.ge_s
          br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$240
          drop
          local.get $0
          local.get $4
          i32.const 2
          i32.shl
          i32.add
          i32.load
         end
         local.set $0
         local.get $7
         i32.const 2359680
         i32.or
         local.set $1
         block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$241
          block $default17
           block $case418
            block $case319
             block $case220
              block $case121
               block $case022
                local.get $8
                i32.const 8
                i32.sub
                i32.load
                i32.const 6
                i32.sub
                br_table $case022 $case121 $case220 $case319 $case418 $default17
               end
               local.get $0
               local.get $1
               i32.and
               i32.eqz
               local.set $0
               br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$241
              end
              local.get $1
              i32.const -2097153
              i32.and
              local.get $0
              i32.and
              i32.eqz
              local.get $0
              i32.const 2097152
              i32.and
              i32.const 0
              i32.ne
              i32.and
              local.set $0
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$241
             end
             local.get $0
             local.get $1
             i32.and
             i32.eqz
             local.get $0
             i32.const -2147483648
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $0
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$241
            end
            local.get $0
            local.get $1
            i32.const -2147483648
            i32.or
            i32.and
            i32.eqz
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$241
           end
           local.get $1
           i32.const 511
           i32.and
           i32.const 9
           i32.shl
           local.get $1
           i32.const 2143289344
           i32.and
           i32.const 13
           i32.shr_u
           i32.or
           local.get $0
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$241
          end
          unreachable
         end
         local.get $0
         i32.eqz
         local.set $5
         br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedEast$1041
        end
        block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$242 (result i32)
         local.get $2
         i32.const 2
         i32.add
         local.tee $4
         i32.const 7
         i32.and
         local.get $3
         i32.const 7
         i32.and
         i32.const 3
         i32.shl
         i32.or
         local.set $2
         i32.const -1
         local.get $0
         i32.load
         i32.load
         local.get $4
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         local.get $3
         i32.const 3
         i32.shr_s
         i32.const 2047
         i32.and
         i32.const 11
         i32.shl
         i32.or
         local.get $1
         i32.const 3
         i32.and
         i32.const 22
         i32.shl
         i32.or
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.tee $5
         i32.eqz
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$242
         drop
         i32.const -1
         local.get $2
         local.get $5
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 2
         i32.shr_u
         i32.ge_s
         br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$242
         drop
         local.get $5
         local.get $2
         i32.const 2
         i32.shl
         i32.add
         i32.load
        end
        local.set $2
        local.get $7
        i32.const 2359683
        i32.or
        local.set $5
        block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$243
         block $default18
          block $case419
           block $case320
            block $case221
             block $case122
              block $case023
               local.get $8
               i32.const 8
               i32.sub
               i32.load
               i32.const 6
               i32.sub
               br_table $case023 $case122 $case221 $case320 $case419 $default18
              end
              local.get $2
              local.get $5
              i32.and
              i32.eqz
              local.set $2
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$243
             end
             local.get $5
             i32.const -2097153
             i32.and
             local.get $2
             i32.and
             i32.eqz
             local.get $2
             i32.const 2097152
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $2
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$243
            end
            local.get $2
            local.get $5
            i32.and
            i32.eqz
            local.get $2
            i32.const -2147483648
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $2
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$243
           end
           local.get $2
           local.get $5
           i32.const -2147483648
           i32.or
           i32.and
           i32.eqz
           local.set $2
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$243
          end
          local.get $5
          i32.const 511
          i32.and
          i32.const 9
          i32.shl
          local.get $5
          i32.const 2143289344
          i32.and
          i32.const 13
          i32.shr_u
          i32.or
          local.get $2
          i32.and
          i32.eqz
          local.set $2
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$243
         end
         unreachable
        end
        local.get $2
        if
         block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$245
          block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$244 (result i32)
           local.get $4
           i32.const 7
           i32.and
           local.get $3
           i32.const 1
           i32.add
           local.tee $2
           i32.const 7
           i32.and
           i32.const 3
           i32.shl
           i32.or
           local.set $3
           i32.const -1
           local.get $0
           i32.load
           i32.load
           local.get $4
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           local.get $2
           i32.const 3
           i32.shr_s
           i32.const 2047
           i32.and
           i32.const 11
           i32.shl
           i32.or
           local.get $1
           i32.const 3
           i32.and
           i32.const 22
           i32.shl
           i32.or
           i32.const 2
           i32.shl
           i32.add
           i32.load
           local.tee $0
           i32.eqz
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$244
           drop
           i32.const -1
           local.get $3
           local.get $0
           i32.const 20
           i32.sub
           i32.load offset=16
           i32.const 2
           i32.shr_u
           i32.ge_s
           br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$244
           drop
           local.get $0
           local.get $3
           i32.const 2
           i32.shl
           i32.add
           i32.load
          end
          local.set $0
          local.get $7
          i32.const 2359776
          i32.or
          local.set $1
          block $default19
           block $case420
            block $case321
             block $case222
              block $case123
               block $case024
                local.get $8
                i32.const 8
                i32.sub
                i32.load
                i32.const 6
                i32.sub
                br_table $case024 $case123 $case222 $case321 $case420 $default19
               end
               local.get $0
               local.get $1
               i32.and
               i32.eqz
               local.set $0
               br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$245
              end
              local.get $1
              i32.const -2097153
              i32.and
              local.get $0
              i32.and
              i32.eqz
              local.get $0
              i32.const 2097152
              i32.and
              i32.const 0
              i32.ne
              i32.and
              local.set $0
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$245
             end
             local.get $0
             local.get $1
             i32.and
             i32.eqz
             local.get $0
             i32.const -2147483648
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $0
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$245
            end
            local.get $0
            local.get $1
            i32.const -2147483648
            i32.or
            i32.and
            i32.eqz
            local.set $0
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$245
           end
           local.get $1
           i32.const 511
           i32.and
           i32.const 9
           i32.shl
           local.get $1
           i32.const 2143289344
           i32.and
           i32.const 13
           i32.shr_u
           i32.or
           local.get $0
           i32.and
           i32.eqz
           local.set $0
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$245
          end
          unreachable
         end
        else
         i32.const 0
         local.set $0
        end
        local.get $0
        i32.eqz
        local.set $5
        br $__inlined_func$assembly/StepValidator/StepValidator#isBlockedEast$1041
       end
       i32.const 1
       local.set $5
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$246 (result i32)
        local.get $2
        local.get $6
        i32.add
        local.tee $9
        i32.const 7
        i32.and
        local.get $3
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.set $4
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $9
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $3
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $10
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$246
        drop
        i32.const -1
        local.get $4
        local.get $10
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$246
        drop
        local.get $10
        local.get $4
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.set $4
       local.get $7
       i32.const 2359683
       i32.or
       local.set $10
       block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$247
        block $default20
         block $case421
          block $case322
           block $case223
            block $case124
             block $case025
              local.get $8
              i32.const 8
              i32.sub
              i32.load
              i32.const 6
              i32.sub
              br_table $case025 $case124 $case223 $case322 $case421 $default20
             end
             local.get $4
             local.get $10
             i32.and
             i32.eqz
             local.set $4
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$247
            end
            local.get $10
            i32.const -2097153
            i32.and
            local.get $4
            i32.and
            i32.eqz
            local.get $4
            i32.const 2097152
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $4
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$247
           end
           local.get $4
           local.get $10
           i32.and
           i32.eqz
           local.get $4
           i32.const -2147483648
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$247
          end
          local.get $4
          local.get $10
          i32.const -2147483648
          i32.or
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$247
         end
         local.get $10
         i32.const 511
         i32.and
         i32.const 9
         i32.shl
         local.get $10
         i32.const 2143289344
         i32.and
         i32.const 13
         i32.shr_u
         i32.or
         local.get $4
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$247
        end
        unreachable
       end
       local.get $4
       i32.eqz
       br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedEast$1041
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$248 (result i32)
        local.get $9
        i32.const 7
        i32.and
        local.get $3
        local.get $6
        i32.add
        i32.const 1
        i32.sub
        local.tee $4
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.set $10
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $9
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $4
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $4
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$248
        drop
        i32.const -1
        local.get $10
        local.get $4
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$248
        drop
        local.get $4
        local.get $10
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.set $4
       local.get $7
       i32.const 2359776
       i32.or
       local.set $9
       block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$249
        block $default21
         block $case422
          block $case323
           block $case224
            block $case125
             block $case026
              local.get $8
              i32.const 8
              i32.sub
              i32.load
              i32.const 6
              i32.sub
              br_table $case026 $case125 $case224 $case323 $case422 $default21
             end
             local.get $4
             local.get $9
             i32.and
             i32.eqz
             local.set $4
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$249
            end
            local.get $9
            i32.const -2097153
            i32.and
            local.get $4
            i32.and
            i32.eqz
            local.get $4
            i32.const 2097152
            i32.and
            i32.const 0
            i32.ne
            i32.and
            local.set $4
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$249
           end
           local.get $4
           local.get $9
           i32.and
           i32.eqz
           local.get $4
           i32.const -2147483648
           i32.and
           i32.const 0
           i32.ne
           i32.and
           local.set $4
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$249
          end
          local.get $4
          local.get $9
          i32.const -2147483648
          i32.or
          i32.and
          i32.eqz
          local.set $4
          br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$249
         end
         local.get $9
         i32.const 511
         i32.and
         i32.const 9
         i32.shl
         local.get $9
         i32.const 2143289344
         i32.and
         i32.const 13
         i32.shr_u
         i32.or
         local.get $4
         i32.and
         i32.eqz
         local.set $4
         br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$249
        end
        unreachable
       end
       local.get $4
       i32.eqz
       br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedEast$1041
       local.get $3
       i32.const 1
       i32.add
       local.set $4
       loop $for-loop|16
        local.get $4
        local.get $3
        local.get $6
        i32.add
        i32.const 1
        i32.sub
        i32.lt_s
        if
         block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$250 (result i32)
          local.get $2
          local.get $6
          i32.add
          local.tee $9
          i32.const 7
          i32.and
          local.get $4
          i32.const 7
          i32.and
          i32.const 3
          i32.shl
          i32.or
          local.set $10
          i32.const -1
          local.get $0
          i32.load
          i32.load
          local.get $9
          i32.const 3
          i32.shr_s
          i32.const 2047
          i32.and
          local.get $4
          i32.const 3
          i32.shr_s
          i32.const 2047
          i32.and
          i32.const 11
          i32.shl
          i32.or
          local.get $1
          i32.const 3
          i32.and
          i32.const 22
          i32.shl
          i32.or
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee $9
          i32.eqz
          br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$250
          drop
          i32.const -1
          local.get $10
          local.get $9
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 2
          i32.shr_u
          i32.ge_s
          br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$250
          drop
          local.get $9
          local.get $10
          i32.const 2
          i32.shl
          i32.add
          i32.load
         end
         local.set $9
         local.get $7
         i32.const 2359779
         i32.or
         local.set $10
         block $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$251
          block $default22
           block $case423
            block $case324
             block $case225
              block $case126
               block $case027
                local.get $8
                i32.const 8
                i32.sub
                i32.load
                i32.const 6
                i32.sub
                br_table $case027 $case126 $case225 $case324 $case423 $default22
               end
               local.get $9
               local.get $10
               i32.and
               i32.eqz
               local.set $9
               br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$251
              end
              local.get $10
              i32.const -2097153
              i32.and
              local.get $9
              i32.and
              i32.eqz
              local.get $9
              i32.const 2097152
              i32.and
              i32.const 0
              i32.ne
              i32.and
              local.set $9
              br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$251
             end
             local.get $9
             local.get $10
             i32.and
             i32.eqz
             local.get $9
             i32.const -2147483648
             i32.and
             i32.const 0
             i32.ne
             i32.and
             local.set $9
             br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$251
            end
            local.get $9
            local.get $10
            i32.const -2147483648
            i32.or
            i32.and
            i32.eqz
            local.set $9
            br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$251
           end
           local.get $10
           i32.const 511
           i32.and
           i32.const 9
           i32.shl
           local.get $10
           i32.const 2143289344
           i32.and
           i32.const 13
           i32.shr_u
           i32.or
           local.get $9
           i32.and
           i32.eqz
           local.set $9
           br $__inlined_func$assembly/collision/CollisionStrategy/CollisionStrategy#canMove@override$251
          end
          unreachable
         end
         local.get $9
         i32.eqz
         br_if $__inlined_func$assembly/StepValidator/StepValidator#isBlockedEast$1041
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         br $for-loop|16
        end
       end
       i32.const 0
       local.set $5
      end
     else
      local.get $4
      local.get $5
      i32.and
      i32.const -1
      i32.eq
      if (result i32)
       local.get $0
       local.get $1
       local.get $2
       local.get $3
       local.get $6
       local.get $7
       local.get $8
       call $assembly/StepValidator/StepValidator#isBlockedSouthWest
      else
       local.get $5
       i32.const 1
       i32.eq
       local.get $4
       i32.const -1
       i32.eq
       i32.and
       if (result i32)
        local.get $0
        local.get $1
        local.get $2
        local.get $3
        local.get $6
        local.get $7
        local.get $8
        call $assembly/StepValidator/StepValidator#isBlockedNorthWest
       else
        local.get $5
        i32.const -1
        i32.eq
        local.get $4
        i32.const 1
        i32.eq
        i32.and
        if (result i32)
         local.get $0
         local.get $1
         local.get $2
         local.get $3
         local.get $6
         local.get $7
         local.get $8
         call $assembly/StepValidator/StepValidator#isBlockedSouthEast
        else
         local.get $5
         i32.const 1
         i32.eq
         local.get $4
         i32.const 1
         i32.eq
         i32.and
         if (result i32)
          local.get $0
          local.get $1
          local.get $2
          local.get $3
          local.get $6
          local.get $7
          local.get $8
          call $assembly/StepValidator/StepValidator#isBlockedNorthEast
         else
          local.get $4
          call $~lib/util/number/itoa32
          local.set $0
          local.get $5
          call $~lib/util/number/itoa32
          local.set $1
          i32.const 4628
          local.get $0
          i32.store
          i32.const 4636
          local.get $1
          i32.store
          i32.const 4624
          call $~lib/staticarray/StaticArray<~lib/string/String>#join
          i32.const 4672
          i32.const 31
          i32.const 13
          call $~lib/builtins/abort
          unreachable
         end
        end
       end
      end
      local.set $5
     end
    end
   end
  end
  local.get $5
  i32.eqz
 )
 (func $assembly/index/canTravel@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 7
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   local.set $7
  end
  local.get $7
  i32.const 4
  i32.le_s
  local.get $7
  i32.const 0
  i32.ge_s
  i32.and
  i32.eqz
  if
   i32.const 4452
   local.get $7
   call $~lib/util/number/itoa32
   i32.store
   i32.const 4448
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3408
   i32.const 314
   i32.const 9
   call $~lib/builtins/abort
   unreachable
  end
  global.get $assembly/index/stepValidator
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  if (result i32)
   local.get $7
   i32.const 1
   i32.eq
   if (result i32)
    global.get $assembly/collision/CollisionStrategies/CollisionStrategies.BLOCKED
   else
    local.get $7
    i32.const 2
    i32.eq
    if (result i32)
     global.get $assembly/collision/CollisionStrategies/CollisionStrategies.INDOORS
    else
     global.get $assembly/collision/CollisionStrategies/CollisionStrategies.OUTDOORS
     global.get $assembly/collision/CollisionStrategies/CollisionStrategies.LINE_OF_SIGHT
     local.get $7
     i32.const 3
     i32.eq
     select
    end
   end
  else
   global.get $assembly/collision/CollisionStrategies/CollisionStrategies.NORMAL
  end
  call $assembly/StepValidator/StepValidator#canTravel
 )
 (func $assembly/LineValidator/LineValidator#rayCast (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (param $12 i32) (param $13 i32) (param $14 i32) (param $15 i32) (result i32)
  (local $16 i32)
  (local $17 i32)
  local.get $2
  local.set $16
  block $assembly/Line/Line.coordinate|inlined.0
   local.get $2
   local.get $4
   i32.ge_s
   br_if $assembly/Line/Line.coordinate|inlined.0
   local.get $2
   local.get $6
   i32.add
   i32.const 1
   i32.sub
   local.tee $16
   local.get $4
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.0
   local.get $4
   local.set $16
  end
  local.get $16
  local.set $17
  local.get $3
  local.set $16
  block $assembly/Line/Line.coordinate|inlined.1
   local.get $3
   local.get $5
   i32.ge_s
   br_if $assembly/Line/Line.coordinate|inlined.1
   local.get $3
   local.get $6
   i32.add
   i32.const 1
   i32.sub
   local.tee $16
   local.get $5
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.1
   local.get $5
   local.set $16
  end
  local.get $16
  local.set $6
  local.get $15
  if (result i32)
   local.get $13
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$252 (result i32)
    i32.const -1
    local.get $0
    i32.load
    i32.load
    local.get $17
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $6
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $13
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$252
    drop
    i32.const -1
    local.get $17
    i32.const 7
    i32.and
    local.get $6
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.tee $16
    local.get $13
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$252
    drop
    local.get $13
    local.get $16
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   i32.and
  else
   i32.const 0
  end
  if
   i32.const 0
   return
  end
  block $assembly/Line/Line.coordinate|inlined.2
   local.get $2
   local.get $4
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.2
   local.get $4
   local.get $7
   i32.add
   i32.const 1
   i32.sub
   local.tee $4
   local.get $2
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.2
   local.get $2
   local.set $4
  end
  block $assembly/Line/Line.coordinate|inlined.3
   local.get $3
   local.get $5
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.3
   local.get $5
   local.get $8
   i32.add
   i32.const 1
   i32.sub
   local.tee $5
   local.get $3
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.3
   local.get $3
   local.set $5
  end
  local.get $5
  local.get $6
  i32.eq
  local.get $4
  local.get $17
  i32.eq
  i32.and
  if
   i32.const 1
   return
  end
  local.get $4
  local.get $17
  i32.sub
  local.tee $2
  f64.convert_i32_s
  f64.abs
  i32.trunc_sat_f64_s
  local.set $3
  local.get $5
  local.get $6
  i32.sub
  local.tee $7
  f64.convert_i32_s
  f64.abs
  i32.trunc_sat_f64_s
  local.set $8
  local.get $9
  local.get $10
  local.get $2
  i32.const 0
  i32.ge_s
  local.tee $13
  select
  local.set $10
  local.get $11
  local.get $12
  local.get $7
  i32.const 0
  i32.ge_s
  local.tee $11
  select
  local.set $9
  local.get $3
  local.get $8
  i32.gt_s
  if
   i32.const 1
   i32.const -1
   local.get $13
   select
   local.set $2
   global.get $assembly/Line/Line.HALF_TILE
   local.get $6
   i32.const 16
   i32.shl
   i32.add
   i32.const 0
   i32.const -1
   local.get $11
   select
   i32.add
   local.set $6
   local.get $7
   i32.const 16
   i32.shl
   local.get $3
   i32.div_s
   local.set $3
   loop $while-continue|0
    local.get $4
    local.get $17
    i32.ne
    if
     local.get $10
     local.get $14
     i32.const -1
     i32.xor
     i32.and
     local.get $10
     local.get $6
     i32.const 16
     i32.shr_u
     local.tee $7
     local.get $5
     i32.eq
     i32.const 0
     local.get $2
     local.get $17
     i32.add
     local.tee $17
     local.get $4
     i32.eq
     i32.const 0
     local.get $15
     select
     select
     select
     local.tee $10
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$253 (result i32)
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $17
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      local.get $7
      i32.const 3
      i32.shr_u
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $8
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$253
      drop
      i32.const -1
      local.get $17
      i32.const 7
      i32.and
      local.get $7
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.tee $11
      local.get $8
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$253
      drop
      local.get $8
      local.get $11
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     i32.and
     if
      i32.const 0
      return
     end
     local.get $9
     local.get $14
     i32.const -1
     i32.xor
     i32.and
     local.get $9
     local.get $3
     local.get $6
     i32.add
     local.tee $6
     i32.const 16
     i32.shr_u
     local.tee $8
     local.get $5
     i32.eq
     i32.const 0
     local.get $4
     local.get $17
     i32.eq
     i32.const 0
     local.get $15
     select
     select
     select
     local.set $9
     local.get $7
     local.get $8
     i32.ne
     if (result i32)
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$254 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $17
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $8
       i32.const 3
       i32.shr_u
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $7
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$254
       drop
       i32.const -1
       local.get $17
       i32.const 7
       i32.and
       local.get $8
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $8
       local.get $7
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$254
       drop
       local.get $7
       local.get $8
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.get $9
      i32.and
     else
      i32.const 0
     end
     if
      i32.const 0
      return
     end
     br $while-continue|0
    end
   end
  else
   i32.const 1
   i32.const -1
   local.get $11
   select
   local.set $3
   global.get $assembly/Line/Line.HALF_TILE
   local.get $17
   i32.const 16
   i32.shl
   i32.add
   i32.const 0
   i32.const -1
   local.get $13
   select
   i32.add
   local.set $7
   local.get $2
   i32.const 16
   i32.shl
   local.get $8
   i32.div_s
   local.set $2
   loop $while-continue|1
    local.get $5
    local.get $6
    i32.ne
    if
     local.get $9
     local.get $14
     i32.const -1
     i32.xor
     i32.and
     local.get $9
     local.get $3
     local.get $6
     i32.add
     local.tee $6
     local.get $5
     i32.eq
     i32.const 0
     local.get $7
     i32.const 16
     i32.shr_u
     local.tee $8
     local.get $4
     i32.eq
     i32.const 0
     local.get $15
     select
     select
     select
     local.tee $9
     block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$255 (result i32)
      i32.const -1
      local.get $0
      i32.load
      i32.load
      local.get $8
      i32.const 3
      i32.shr_u
      i32.const 2047
      i32.and
      local.get $6
      i32.const 3
      i32.shr_s
      i32.const 2047
      i32.and
      i32.const 11
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 22
      i32.shl
      i32.or
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $11
      i32.eqz
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$255
      drop
      i32.const -1
      local.get $8
      i32.const 7
      i32.and
      local.get $6
      i32.const 7
      i32.and
      i32.const 3
      i32.shl
      i32.or
      local.tee $12
      local.get $11
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 2
      i32.shr_u
      i32.ge_s
      br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$255
      drop
      local.get $11
      local.get $12
      i32.const 2
      i32.shl
      i32.add
      i32.load
     end
     i32.and
     if
      i32.const 0
      return
     end
     local.get $10
     local.get $14
     i32.const -1
     i32.xor
     i32.and
     local.get $10
     local.get $5
     local.get $6
     i32.eq
     i32.const 0
     local.get $2
     local.get $7
     i32.add
     local.tee $7
     i32.const 16
     i32.shr_u
     local.tee $11
     local.get $4
     i32.eq
     i32.const 0
     local.get $15
     select
     select
     select
     local.set $10
     local.get $8
     local.get $11
     i32.ne
     if (result i32)
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$256 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $11
       i32.const 3
       i32.shr_u
       i32.const 2047
       i32.and
       local.get $6
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $8
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$256
       drop
       i32.const -1
       local.get $11
       i32.const 7
       i32.and
       local.get $6
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $11
       local.get $8
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$256
       drop
       local.get $8
       local.get $11
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.get $10
      i32.and
     else
      i32.const 0
     end
     if
      i32.const 0
      return
     end
     br $while-continue|1
    end
   end
  end
  i32.const 1
 )
 (func $assembly/index/hasLineOfSight@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  block $4of4
   block $3of4
    block $2of4
     block $1of4
      block $0of4
       block $outOfRange
        global.get $~argumentsLength
        i32.const 5
        i32.sub
        br_table $0of4 $1of4 $2of4 $3of4 $4of4 $outOfRange
       end
       unreachable
      end
      i32.const 1
      local.set $5
     end
     i32.const 0
     local.set $6
    end
    i32.const 0
    local.set $7
   end
   i32.const 0
   local.set $8
  end
  global.get $assembly/index/lineValidator
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  i32.const 196608
  i32.or
  local.get $8
  i32.const 135168
  i32.or
  local.get $8
  i32.const 147456
  i32.or
  local.get $8
  i32.const 132096
  i32.or
  local.get $8
  i32.const 256
  i32.or
  local.get $8
  i32.const 131072
  i32.or
  i32.const 1
  call $assembly/LineValidator/LineValidator#rayCast
 )
 (func $assembly/index/hasLineOfWalk@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  block $4of4
   block $3of4
    block $2of4
     block $1of4
      block $0of4
       block $outOfRange
        global.get $~argumentsLength
        i32.const 5
        i32.sub
        br_table $0of4 $1of4 $2of4 $3of4 $4of4 $outOfRange
       end
       unreachable
      end
      i32.const 1
      local.set $5
     end
     i32.const 0
     local.set $6
    end
    i32.const 0
    local.set $7
   end
   i32.const 0
   local.set $8
  end
  global.get $assembly/index/lineValidator
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  i32.const 2359680
  i32.or
  local.get $8
  i32.const 2359560
  i32.or
  local.get $8
  i32.const 2359584
  i32.or
  local.get $8
  i32.const 2359554
  i32.or
  local.get $8
  i32.const 256
  i32.or
  local.get $8
  i32.const 131072
  i32.or
  i32.const 0
  call $assembly/LineValidator/LineValidator#rayCast
 )
 (func $~lib/array/Array<i32>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  call $~lib/array/ensureCapacity
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
 )
 (func $assembly/LinePathFinder/LinePathFinder#rayCast (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (param $11 i32) (param $12 i32) (param $13 i32) (param $14 i32) (result i32)
  (local $15 i32)
  (local $16 i32)
  local.get $2
  local.set $15
  block $assembly/Line/Line.coordinate|inlined.4
   local.get $2
   local.get $4
   i32.ge_s
   br_if $assembly/Line/Line.coordinate|inlined.4
   local.get $2
   local.get $6
   i32.add
   i32.const 1
   i32.sub
   local.tee $15
   local.get $4
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.4
   local.get $4
   local.set $15
  end
  local.get $15
  local.set $16
  local.get $3
  local.set $15
  block $assembly/Line/Line.coordinate|inlined.5
   local.get $3
   local.get $5
   i32.ge_s
   br_if $assembly/Line/Line.coordinate|inlined.5
   local.get $3
   local.get $6
   i32.add
   i32.const 1
   i32.sub
   local.tee $15
   local.get $5
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.5
   local.get $5
   local.set $15
  end
  local.get $15
  local.set $6
  local.get $14
  if (result i32)
   local.get $13
   block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$257 (result i32)
    i32.const -1
    local.get $0
    i32.load
    i32.load
    local.get $16
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    local.get $6
    i32.const 3
    i32.shr_s
    i32.const 2047
    i32.and
    i32.const 11
    i32.shl
    i32.or
    local.get $1
    i32.const 3
    i32.and
    i32.const 22
    i32.shl
    i32.or
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $13
    i32.eqz
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$257
    drop
    i32.const -1
    local.get $16
    i32.const 7
    i32.and
    local.get $6
    i32.const 7
    i32.and
    i32.const 3
    i32.shl
    i32.or
    local.tee $15
    local.get $13
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    i32.ge_s
    br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$257
    drop
    local.get $13
    local.get $15
    i32.const 2
    i32.shl
    i32.add
    i32.load
   end
   i32.and
  else
   i32.const 0
  end
  if
   global.get $assembly/LinePathFinder/LinePathFinder.EMPTY
   return
  end
  block $assembly/Line/Line.coordinate|inlined.6
   local.get $2
   local.get $4
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.6
   local.get $4
   local.get $7
   i32.add
   i32.const 1
   i32.sub
   local.tee $4
   local.get $2
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.6
   local.get $2
   local.set $4
  end
  block $assembly/Line/Line.coordinate|inlined.7
   local.get $3
   local.get $5
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.7
   local.get $5
   local.get $8
   i32.add
   i32.const 1
   i32.sub
   local.tee $5
   local.get $3
   i32.le_s
   br_if $assembly/Line/Line.coordinate|inlined.7
   local.get $3
   local.set $5
  end
  local.get $5
  local.tee $2
  local.get $6
  i32.eq
  local.get $4
  local.get $16
  i32.eq
  i32.and
  if
   global.get $assembly/LinePathFinder/LinePathFinder.EMPTY
   return
  end
  local.get $4
  local.get $16
  i32.sub
  local.tee $3
  f64.convert_i32_s
  f64.abs
  i32.trunc_sat_f64_s
  local.set $7
  local.get $2
  local.get $6
  i32.sub
  local.tee $8
  f64.convert_i32_s
  f64.abs
  i32.trunc_sat_f64_s
  local.set $5
  local.get $9
  local.get $10
  local.get $3
  i32.const 0
  i32.ge_s
  local.tee $13
  select
  local.set $10
  local.get $11
  local.get $12
  local.get $8
  i32.const 0
  i32.ge_s
  local.tee $11
  select
  local.set $9
  i32.const 4752
  call $~lib/rt/__newArray
  local.set $12
  block $folding-inner0
   local.get $5
   local.get $7
   i32.lt_s
   if
    i32.const 1
    i32.const -1
    local.get $13
    select
    local.set $3
    global.get $assembly/Line/Line.HALF_TILE
    local.get $6
    i32.const 16
    i32.shl
    i32.add
    i32.const 0
    i32.const -1
    local.get $11
    select
    i32.add
    local.set $5
    local.get $8
    i32.const 16
    i32.shl
    local.get $7
    i32.div_s
    local.set $6
    loop $while-continue|0
     local.get $4
     local.get $16
     i32.ne
     if
      local.get $5
      i32.const 16
      i32.shr_u
      local.tee $7
      local.get $2
      i32.eq
      i32.const 0
      local.get $3
      local.get $16
      i32.add
      local.tee $16
      local.get $4
      i32.eq
      i32.const 0
      local.get $14
      select
      select
      if
       local.get $10
       i32.const -131073
       i32.and
       local.get $10
       i32.const -1048577
       i32.and
       i32.or
       local.set $10
      end
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$258 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $16
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       local.get $7
       i32.const 3
       i32.shr_u
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $8
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$258
       drop
       i32.const -1
       local.get $16
       i32.const 7
       i32.and
       local.get $7
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $11
       local.get $8
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$258
       drop
       local.get $8
       local.get $11
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.get $10
      i32.and
      br_if $folding-inner0
      local.get $12
      local.get $16
      i32.const 16383
      i32.and
      local.get $7
      i32.const 16383
      i32.and
      i32.const 14
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 28
      i32.shl
      i32.or
      call $~lib/array/Array<i32>#push
      local.get $5
      local.get $6
      i32.add
      local.tee $5
      i32.const 16
      i32.shr_u
      local.tee $8
      local.get $7
      i32.ne
      if
       local.get $2
       local.get $8
       i32.eq
       i32.const 0
       local.get $4
       local.get $16
       i32.eq
       i32.const 0
       local.get $14
       select
       select
       if
        local.get $9
        i32.const -131073
        i32.and
        local.get $9
        i32.const -1048577
        i32.and
        i32.or
        local.set $9
       end
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$259 (result i32)
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $16
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        local.get $8
        i32.const 3
        i32.shr_u
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $7
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$259
        drop
        i32.const -1
        local.get $16
        i32.const 7
        i32.and
        local.get $8
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.tee $11
        local.get $7
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$259
        drop
        local.get $7
        local.get $11
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.get $9
       i32.and
       br_if $folding-inner0
       local.get $12
       local.get $16
       i32.const 16383
       i32.and
       local.get $8
       i32.const 16383
       i32.and
       i32.const 14
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 28
       i32.shl
       i32.or
       call $~lib/array/Array<i32>#push
      end
      br $while-continue|0
     end
    end
   else
    i32.const 1
    i32.const -1
    local.get $11
    select
    local.set $8
    global.get $assembly/Line/Line.HALF_TILE
    local.get $16
    i32.const 16
    i32.shl
    i32.add
    i32.const 0
    i32.const -1
    local.get $13
    select
    i32.add
    local.set $7
    local.get $3
    i32.const 16
    i32.shl
    local.get $5
    i32.div_s
    local.set $3
    loop $while-continue|3
     local.get $2
     local.get $6
     i32.ne
     if
      local.get $2
      local.get $6
      local.get $8
      i32.add
      local.tee $6
      i32.eq
      i32.const 0
      local.get $7
      i32.const 16
      i32.shr_u
      local.tee $5
      local.get $4
      i32.eq
      i32.const 0
      local.get $14
      select
      select
      if
       local.get $9
       i32.const -131073
       i32.and
       local.get $9
       i32.const -1048577
       i32.and
       i32.or
       local.set $9
      end
      block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$260 (result i32)
       i32.const -1
       local.get $0
       i32.load
       i32.load
       local.get $5
       i32.const 3
       i32.shr_u
       i32.const 2047
       i32.and
       local.get $6
       i32.const 3
       i32.shr_s
       i32.const 2047
       i32.and
       i32.const 11
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 22
       i32.shl
       i32.or
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.tee $11
       i32.eqz
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$260
       drop
       i32.const -1
       local.get $5
       i32.const 7
       i32.and
       local.get $6
       i32.const 7
       i32.and
       i32.const 3
       i32.shl
       i32.or
       local.tee $13
       local.get $11
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 2
       i32.shr_u
       i32.ge_s
       br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$260
       drop
       local.get $11
       local.get $13
       i32.const 2
       i32.shl
       i32.add
       i32.load
      end
      local.get $9
      i32.and
      br_if $folding-inner0
      local.get $12
      local.get $5
      i32.const 16383
      i32.and
      local.get $6
      i32.const 16383
      i32.and
      i32.const 14
      i32.shl
      i32.or
      local.get $1
      i32.const 3
      i32.and
      i32.const 28
      i32.shl
      i32.or
      call $~lib/array/Array<i32>#push
      local.get $3
      local.get $7
      i32.add
      local.tee $7
      i32.const 16
      i32.shr_u
      local.tee $11
      local.get $5
      i32.ne
      if
       local.get $2
       local.get $6
       i32.eq
       i32.const 0
       local.get $4
       local.get $11
       i32.eq
       i32.const 0
       local.get $14
       select
       select
       if
        local.get $10
        i32.const -131073
        i32.and
        local.get $10
        i32.const -1048577
        i32.and
        i32.or
        local.set $10
       end
       block $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$261 (result i32)
        i32.const -1
        local.get $0
        i32.load
        i32.load
        local.get $11
        i32.const 3
        i32.shr_u
        i32.const 2047
        i32.and
        local.get $6
        i32.const 3
        i32.shr_s
        i32.const 2047
        i32.and
        i32.const 11
        i32.shl
        i32.or
        local.get $1
        i32.const 3
        i32.and
        i32.const 22
        i32.shl
        i32.or
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee $5
        i32.eqz
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$261
        drop
        i32.const -1
        local.get $11
        i32.const 7
        i32.and
        local.get $6
        i32.const 7
        i32.and
        i32.const 3
        i32.shl
        i32.or
        local.tee $13
        local.get $5
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 2
        i32.shr_u
        i32.ge_s
        br_if $__inlined_func$assembly/collision/CollisionFlagMap/CollisionFlagMap#get$261
        drop
        local.get $5
        local.get $13
        i32.const 2
        i32.shl
        i32.add
        i32.load
       end
       local.get $10
       i32.and
       br_if $folding-inner0
       local.get $12
       local.get $11
       i32.const 16383
       i32.and
       local.get $6
       i32.const 16383
       i32.and
       i32.const 14
       i32.shl
       i32.or
       local.get $1
       i32.const 3
       i32.and
       i32.const 28
       i32.shl
       i32.or
       call $~lib/array/Array<i32>#push
      end
      br $while-continue|3
     end
    end
   end
   local.get $12
   i32.load offset=12
   call $~lib/staticarray/StaticArray<i32>#constructor
   local.set $0
   i32.const 0
   local.set $1
   loop $for-loop|6
    local.get $1
    local.get $12
    i32.load offset=12
    i32.lt_s
    if
     local.get $1
     i32.const 2
     i32.shl
     local.tee $2
     local.get $0
     i32.add
     local.get $12
     i32.load offset=4
     local.get $2
     i32.add
     i32.load
     i32.store
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|6
    end
   end
   local.get $0
   return
  end
  local.get $12
  i32.load offset=12
  call $~lib/staticarray/StaticArray<i32>#constructor
  local.set $0
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $12
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    i32.const 2
    i32.shl
    local.tee $2
    local.get $0
    i32.add
    local.get $12
    i32.load offset=4
    local.get $2
    i32.add
    i32.load
    i32.store
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $0
 )
 (func $assembly/index/lineOfSight@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  block $4of4
   block $3of4
    block $2of4
     block $1of4
      block $0of4
       block $outOfRange
        global.get $~argumentsLength
        i32.const 5
        i32.sub
        br_table $0of4 $1of4 $2of4 $3of4 $4of4 $outOfRange
       end
       unreachable
      end
      i32.const 1
      local.set $5
     end
     i32.const 0
     local.set $6
    end
    i32.const 0
    local.set $7
   end
   i32.const 0
   local.set $8
  end
  global.get $assembly/index/linePathFinder
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  i32.const 196608
  i32.or
  local.get $8
  i32.const 135168
  i32.or
  local.get $8
  i32.const 147456
  i32.or
  local.get $8
  i32.const 132096
  i32.or
  local.get $8
  i32.const 256
  i32.or
  i32.const 1
  call $assembly/LinePathFinder/LinePathFinder#rayCast
 )
 (func $assembly/index/lineOfWalk@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  block $4of4
   block $3of4
    block $2of4
     block $1of4
      block $0of4
       block $outOfRange
        global.get $~argumentsLength
        i32.const 5
        i32.sub
        br_table $0of4 $1of4 $2of4 $3of4 $4of4 $outOfRange
       end
       unreachable
      end
      i32.const 1
      local.set $5
     end
     i32.const 0
     local.set $6
    end
    i32.const 0
    local.set $7
   end
   i32.const 0
   local.set $8
  end
  global.get $assembly/index/linePathFinder
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  i32.const 2359680
  i32.or
  local.get $8
  i32.const 2359560
  i32.or
  local.get $8
  i32.const 2359584
  i32.or
  local.get $8
  i32.const 2359554
  i32.or
  local.get $8
  i32.const 256
  i32.or
  i32.const 0
  call $assembly/LinePathFinder/LinePathFinder#rayCast
 )
 (func $assembly/index/reached@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (result i32)
  block $3of3
   block $2of3
    block $1of3
     block $0of3
      block $outOfRange
       global.get $~argumentsLength
       i32.const 8
       i32.sub
       br_table $0of3 $1of3 $2of3 $3of3 $outOfRange
      end
      unreachable
     end
     i32.const 0
     local.set $8
    end
    i32.const -1
    local.set $9
   end
   i32.const 0
   local.set $10
  end
  global.get $assembly/index/flags
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  local.get $9
  local.get $10
  call $assembly/reach/ReachStrategy/ReachStrategy.reached
 )
 (func $~setArgumentsLength (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $~start
  call $start:assembly/index
 )
)
