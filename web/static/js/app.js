// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

// Set up our Elm App

let elmDiv = document.querySelector('#elm-container')
let elmApp = Elm.embed(Elm.Main, elmDiv, { setModel: 0 })


// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("counters:counter", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on('set_model', data => {
  console.log('got set_model with:', data)
  elmApp.ports.setModel.send(data.model)
})

elmApp.ports.sendModel.subscribe(function (x) {
  console.log('sendModel with:', x)
  channel.push("send_model", {model: x})
})
// let elmDiv = document.querySelector('#elm-container')
// let elmApp = Elm.embed(Elm.App, elmDiv, { setModel: 0 })
// elmApp.ports.setModel.send(10)
//
//
// elmApp.ports.putMouseX.subscribe(putMouseX);
//
// function putMouseX(x) {
//     console.log(x);
// }
