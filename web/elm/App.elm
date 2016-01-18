module App where

import Html exposing (..)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp


main : Signal Html
main =
  StartApp.start { model = model, view = view, update = update }


-- MODEL

type alias Model = Int

model: Model
model = 0


-- UPDATE

type Action = Increment | Decrement

update: Action -> Model -> Model
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick address Increment ] [ text "+" ]
    ]
