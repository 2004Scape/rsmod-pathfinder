use std::fs;
use std::thread::sleep;
use std::time::{Duration, Instant};

use serde_json;

use rsmod::rsmod::{CollisionStrategies, Normal, PathFinder};
use rsmod::rsmod::collision::collision::CollisionFlagMap;

fn main() {
    let mut collision = CollisionFlagMap::new();

    let lumbridge: Vec<Vec<i32>> =
        serde_json::from_str(&fs::read_to_string("lumbridge.json").expect("")).expect("");

    // apply the flags to the mapsquare area.
    for x in 3200..3264 {
        for z in 3200..3264 {
            unsafe {
                collision.set(
                    x,
                    z,
                    0,
                    lumbridge[((z & 0x3f) | ((x & 0x3f) << 6) | ((0 & 0x3) << 12)) as usize]
                        [((x & 0x7) | ((z & 0x7) << 3)) as usize] as u32,
                );
            }
        }
    }

    let mut pathfinder = PathFinder::new();

    loop {
        let start: Instant = Instant::now();
        for _ in 0..100_000 {
            unsafe {
                pathfinder.find_path(
                    &collision,
                    0,
                    3232,
                    3205,
                    3232,
                    3205 + 10,
                    1,
                    1,
                    1,
                    0,
                    -1,
                    true,
                    0,
                    25,
                    &CollisionStrategies::Normal(Normal),
                );
            }
        }
        let end: Duration = Instant::now() - start;
        println!(
            "100k paths took: {:?}; time per call: {:?}",
            end,
            end / 100_000
        );
        sleep(Duration::from_millis(600));
    }
}
