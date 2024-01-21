# rsmod-pathfinder
A breadth-first search path finder.

Ported from Kotlin: https://github.com/rsmod/rsmod/tree/master/game/pathfinder

## Installing (Consuming)
https://www.npmjs.com/package/@2004scape/rsmod-pathfinder

```shell
npm i @2004scape/rsmod-pathfinder
```

## Publishing (Local Development)
https://github.com/wclr/yalc

```shell
npm run build # Builds the js bundle and type definitions.
yalc publish --push # Publishes to the local repo and pushes to all projects it has been added to.
yalc add rsmod-pathfinder # Adds the published library to your project. 
```

## First Time Cloning  (Local Development)
```shell
npm run prepare
```

If you are on a Mac:
```shell
chmod ug+x .husky/*
chmod ug+x .git/hooks/*
```