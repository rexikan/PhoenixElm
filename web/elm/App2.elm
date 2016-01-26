import Signal
import Html exposing (Html, p, div, button, h1, text)
import Html.Events exposing (onClick)

main : Signal Html
main =
  Signal.map (view actions.address) model


-- Model

type alias Model =
  Int


initialModel: Int
initialModel =
  0


model: Signal Model
model =
  Signal.foldp update initialModel mergedSignals


mergedSignals: Signal Action
mergedSignals =
  Signal.mergeMany
    [ actions.signal
    , setModelAction
    ]

-- Action

type Action =
  Inc | Dec | SetModel Model

actions: Signal.Mailbox Action
actions =
  Signal.mailbox Inc


-- Incoming port

port setModel : Signal Model
setModelAction: Signal Action
setModelAction =
  Signal.map SetModel setModel


-- Outgoing port

port sendAction : Signal String
port sendAction = Signal.map toString actions.signal


-- Update

update: Action -> Model -> Model
update action model =
  case action of
    Inc -> model + 1
    Dec -> model - 1
    SetModel newModel -> newModel


-- View

view: Signal.Address Action -> Model -> Html
view actionAddress model =
  div []
    [ h1 [] [(model |> toString |> text)]
    , p []
      [ button [ onClick actionAddress Dec ] [ text "-" ]
      , button [ onClick actionAddress Inc ] [ text "+" ]
      ]
    ]
