module App where

import Html exposing (..)
import Html.Events exposing (onClick)
import StartApp
import Effects exposing (Effects, Never)
import Mouse

app: StartApp.App Model
app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = [setModelSignalAction]
    }


main : Signal Html
main =
  app.html


-- MODEL

type alias Model = Int

init : (Model, Effects Action)
init = (0, Effects.none)


-- SIGNALS

-- JavaScript interface.
port setModel : Signal Model
-- Convert port to StartApp input type.
setModelSignalAction: Signal Action
setModelSignalAction =  Signal.map SetModel setModel

port putMouseX : Signal Int
port putMouseX = Mouse.x

-- UPDATE

type Action = Increment | Decrement | SetModel Model

update: Action -> Model -> (Model, Effects Action)
update action model =
  let
    model = case action of
      Increment -> model + 1
      Decrement -> model - 1
      SetModel model -> model
  in
    (model, Effects.none)


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick address Increment ] [ text "+" ]
    ]
