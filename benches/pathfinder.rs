use std::fs;

use criterion::*;
use criterion::measurement::WallTime;

use rsmod::rsmod::{CollisionStrategies, Normal, PathFinder};
use rsmod::rsmod::collision::collision::CollisionFlagMap;

fn bench_pathfinder(c: &mut Criterion) {
    let mut group: BenchmarkGroup<WallTime> = c.benchmark_group("pathfinder");

    // Define the throughput in operations (you can use 1 if it's per operation)
    group.throughput(Throughput::Elements(1)); // Measure as ops/second

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

    let pathfinder: PathFinder = PathFinder::new();

    group.bench_function("find_path", move |b| {
        b.iter_batched(
            || pathfinder.clone(),
            |mut pathfinder| unsafe {
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
            },
            BatchSize::SmallInput,
        )
    });

    group.finish();
}

criterion_group!(benches, bench_pathfinder);

criterion_main!(benches);
