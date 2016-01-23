import Signal
import Html exposing (Html, text, li, ul)
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

-- Action

type Action =
  Inc | SetModel Model

mergedSignals: Signal Action
mergedSignals =
  Signal.mergeMany
    [ actions.signal
    , setModelAction
    ]

actions: Signal.Mailbox Action
actions =
  Signal.mailbox Inc

port setModel : Signal Model
setModelAction: Signal Action
setModelAction =
  Signal.map SetModel setModel

-- Update

update: Action -> Model -> Model
update action model =
  case action of
    Inc -> model + 1
    SetModel newModel -> newModel

-- View

view: Signal.Address Action -> Model -> Html
view address model =
  ul []
  [ li [ onClick address Inc ] [text "inc"]
  , li [] [(model |> toString |> text)]
  ]
