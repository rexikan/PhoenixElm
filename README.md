# PhoenixElm

A proof of concept embedding [Elm](http://elm-lang.org/) in [Elixir](http://elixir-lang.org/) [Phoenix](http://www.phoenixframework.org/), communicating over a [channel](http://www.phoenixframework.org/docs/channels).

Look at the JavaScript console, and inspect the web socket, to see the behind-the-scene action. The interesting bits of code are found at:

  * [web/elm/App2.elm](https://github.com/rexikan/PhoenixElm/blob/master/web/elm/App2.elm)
  * [web/static/js/app.js](https://github.com/rexikan/PhoenixElm/blob/master/web/static/js/app.js)
  * [web/channels/counter_channel.ex](https://github.com/rexikan/PhoenixElm/blob/master/web/channels/counter_channel.ex)

Inspired by:

  * https://github.com/CultivateHQ/seat_saver/wiki
  * https://github.com/justinwoo/elm-simple-ports-example/blob/master/src/elm/App.elm
  * https://yobriefca.se/blog/2015/08/02/deconstructing-your-first-elm-app/
  * http://www.fullyforged.com/2016/01/21/phoenix-and-elm-tracking-the-connection-status.html


To start the app:

  1. Install dependencies with `mix deps.get`
  2. Install more dependencies with `npm install`
  3. Finish up pulling dependencies with `cd web/elm/` and `elm make`
  4. Start Phoenix endpoint from project root with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

(This worked when I first did it, but it doesn't right now. Seems like some dependency got updated and broke the chain. Will not investigate more right now.)
