# PhoenixElm

A proof of concept embedding [Elm](http://elm-lang.org/) in [Elixir](http://elixir-lang.org/) [Phoenix](http://www.phoenixframework.org/), communicating over [channel](http://www.phoenixframework.org/docs/channels).

Look at the JavaScript console and the web socket to see the behind-the-scene action.

Inspired by:

  * https://github.com/CultivateHQ/seat_saver/wiki
  * https://github.com/justinwoo/elm-simple-ports-example/blob/master/src/elm/App.elm
  * https://yobriefca.se/blog/2015/08/02/deconstructing-your-first-elm-app/


To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Install more dependencies with `npm install`
  3. Finish up pulling dependencies with `cd web/elm/` and `elm make`
  4. Start Phoenix endpoint from project root with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
