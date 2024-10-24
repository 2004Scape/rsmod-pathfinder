use criterion::*;
use criterion::measurement::WallTime;

use rsmod::rsmod::collision::collision::CollisionFlagMap;
use rsmod::rsmod::collision_flag::CollisionFlag;

fn bench_add(c: &mut Criterion) {
    let mut group: BenchmarkGroup<WallTime> = c.benchmark_group("collision");

    // Define the throughput in operations (you can use 1 if it's per operation)
    group.throughput(Throughput::Elements(1)); // Measure as ops/second

    let collision: CollisionFlagMap = CollisionFlagMap::new();

    group.bench_function("add", move |b| {
        b.iter_batched(
            || collision.clone(),
            |mut collision| unsafe {
                collision.add(3222, 3222, 0, CollisionFlag::WALK_BLOCKED as u32);
            },
            BatchSize::SmallInput,
        )
    });

    group.finish();
}

fn bench_get(c: &mut Criterion) {
    let mut group: BenchmarkGroup<WallTime> = c.benchmark_group("collision");

    // Define the throughput in operations (you can use 1 if it's per operation)
    group.throughput(Throughput::Elements(1)); // Measure as ops/second

    let collision: CollisionFlagMap = CollisionFlagMap::new();

    group.bench_function("get", move |b| {
        b.iter_batched(
            || collision.clone(),
            |collision| unsafe {
                collision.get(3222, 3222, 0);
            },
            BatchSize::SmallInput,
        )
    });

    group.finish();
}

criterion_group!(benches, bench_add, bench_get);

criterion_main!(benches);
