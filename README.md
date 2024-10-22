# rsmod-pathfinder

A breadth-first search pathfinder.
(The fastest in all the land)

Ported from Kotlin: https://github.com/rsmod/rsmod/tree/main/engine/pathfinder

----

## Installing (Consuming)

https://www.npmjs.com/package/@2004scape/rsmod-pathfinder

```shell
npm i @2004scape/rsmod-pathfinder
```

----

## Publishing Notes

```shell
wasm-pack build --target nodejs --out-dir dist --out-name rsmod-pathfinder # Builds the wasm bundle.
~/IdeaProjects/wabt/bin/wasm2wat  dist/rsmod-pathfinder_bg.wasm -o src/rsmod.wat # Generates the wat file.
# update cargo.toml version
# commit and push to main
npm publish --access public # Publishes the version of this to npm.
```

----

## Benchmarks

I have created `main.js` and `main.rs` for synthetic examples of performance.
They load in a full reconstruction of the Lumbridge mapsquare (64x64) tiles
with full clipping flags set. Then in a loop it runs through 100k pathfinder
requests to a destination +10 tiles North with a single access point to the destination.

--

AMD Ryzen 9 3900X 12-Core Processor 3.80 GHz

### Native:

Ran in Release mode on Windows x64 OS.

```
100k paths took: 359.2177ms; time per call: 3.592µs
100k paths took: 358.0528ms; time per call: 3.58µs
100k paths took: 358.13ms; time per call: 3.581µs
100k paths took: 356.6783ms; time per call: 3.566µs
100k paths took: 358.0193ms; time per call: 3.58µs
100k paths took: 382.3694ms; time per call: 3.823µs
100k paths took: 361.9929ms; time per call: 3.619µs
100k paths took: 360.0507ms; time per call: 3.6µs
100k paths took: 357.8894ms; time per call: 3.578µs
100k paths took: 356.8262ms; time per call: 3.568µs
```

### WebAssembly:

Ran in Release mode on Windows x64 OS with NodeJS.

This typically takes about 850ms on average in a real world scenario tested
on a server also using TypeScript.

```
100k paths took: 758ms; time per call: 7.58µs
100k paths took: 757ms; time per call: 7.57µs
100k paths took: 762ms; time per call: 7.62µs
100k paths took: 749ms; time per call: 7.49µs
100k paths took: 741ms; time per call: 7.41µs
100k paths took: 748ms; time per call: 7.48µs
100k paths took: 737ms; time per call: 7.37µs
100k paths took: 745ms; time per call: 7.45µs
100k paths took: 737ms; time per call: 7.37µs
```

--

`cargo bench`

```
pathfinder/find_path    time:   [6.8195 µs 7.1890 µs 7.4884 µs]
                        thrpt:  [133.54 Kelem/s 139.10 Kelem/s 146.64 Kelem/s]

```

----