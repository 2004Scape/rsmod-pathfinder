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

- All tests below were done on the same machine with the same hardware.

### Rust (Native):

Ran in Release mode on Windows x64 OS.

```
100k paths took: 312.3261ms; time per call: 3.123µs
100k paths took: 313.0271ms; time per call: 3.13µs
100k paths took: 310.554ms; time per call: 3.105µs
100k paths took: 312.095ms; time per call: 3.12µs
100k paths took: 312.5054ms; time per call: 3.125µs
100k paths took: 315.6638ms; time per call: 3.156µs
```

### Rust (WebAssembly):

Ran in Release mode on Windows x64 OS with NodeJS.

This typically takes about 850ms on average in a real world scenario tested
on a server also using TypeScript.

```
100k paths took: 711ms; time per call: 7.11µs
100k paths took: 709ms; time per call: 7.09µs
100k paths took: 707ms; time per call: 7.07µs
100k paths took: 714ms; time per call: 7.14µs
100k paths took: 707ms; time per call: 7.07µs
100k paths took: 715ms; time per call: 7.15µs
100k paths took: 712ms; time per call: 7.12µs
```

### AssemblyScript (WebAssembly):

```
100k paths took: 1534ms; time per call: 15.34µs
100k paths took: 1540ms; time per call: 15.40µs
100k paths took: 1544ms; time per call: 15.44µs
100k paths took: 1519ms; time per call: 15.19µs
100k paths took: 1533ms; time per call: 15.33µs
100k paths took: 1522ms; time per call: 15.22µs
100k paths took: 1527ms; time per call: 15.27µs
```

### TypeScript:

```
100k paths took: 3858ms; time per call: 38.58µs
100k paths took: 3855ms; time per call: 38.55µs
100k paths took: 3828ms; time per call: 38.28µs
100k paths took: 3820ms; time per call: 38.20µs
100k paths took: 3833ms; time per call: 38.33µs
100k paths took: 3852ms; time per call: 38.52µs
100k paths took: 3844ms; time per call: 38.44µs
```

--

`cargo bench`

```
pathfinder/find_path    time:   [6.8195 µs 7.1890 µs 7.4884 µs]
                        thrpt:  [133.54 Kelem/s 139.10 Kelem/s 146.64 Kelem/s]

```

----