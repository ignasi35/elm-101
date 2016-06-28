An Intro To Elm (exercises)
======================

For fast feedback (still working on autoreload wihut state loss) use:

```(bash)
 $ elm-reactor
```


## Example index.html with JS

`./index.html` is a sample of intergating ELM inot other pieces of HTML.

This example is still not automated to re-gen `main.js`on every save action. You will have to manually compile main.js:

```
elm make src/Main.elm --output=gen/main.js
```