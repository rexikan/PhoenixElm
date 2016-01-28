# ElmBase

A simple test of running [Elm](http://elm-lang.org/) embedded in [Phoenix](http://www.phoenixframework.org/), talking over [ports](http://elm-lang.org/guide/interop) and [channels](http://www.phoenixframework.org/docs/channels) to the server. When the user clicks on the `+` or `-` buttons, the command is sent to the server, and the model is updated and updated state is sent back. While waiting on the response of the action, Elm also makes a local update.

Look at the JavaScript console and the web socket to see the behind-the-scene action.

Inspired by:

  * https://github.com/CultivateHQ/seat_saver/wiki
  * https://github.com/justinwoo/elm-simple-ports-example/blob/master/src/elm/App.elm
  * https://yobriefca.se/blog/2015/08/02/deconstructing-your-first-elm-app/


To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
