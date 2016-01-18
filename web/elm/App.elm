module App where

import Html exposing (..)
import Html.Events exposing (onClick)
import StartApp
import Effects exposing (Effects, Never)

app: StartApp.App Model
app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = []
    }


main : Signal Html
main =
  app.html


-- MODEL

type alias Model = Int

init : (Model, Effects Action)
init = (0, Effects.none)


-- UPDATE

type Action = Increment | Decrement

update: Action -> Model -> (Model, Effects Action)
update action model =
  let
    model = case action of
      Increment -> model + 1
      Decrement -> model - 1
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
