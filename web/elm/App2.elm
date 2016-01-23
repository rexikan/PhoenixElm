import Signal
import Html exposing (Html, text, li, ul)
import Html.Events exposing (onClick)

main : Signal Html
main =
  Signal.map (view actions.address sendModelMailbox.address) model

-- Model

type alias Model =
  Int


initialModel: Int
initialModel =
  0


model: Signal Model
model =
  Signal.foldp update initialModel actions.signal


-- Action

type Action =
  Inc | SetModel Model


actions: Signal.Mailbox Action
actions =
  Signal.mailbox Inc


-- Incoming port

port setModel : Signal Model
setModelAction: Signal Action
setModelAction =
  Signal.map SetModel setModel


-- Outgoing port

sendModelMailbox: Signal.Mailbox Model
sendModelMailbox =
  Signal.mailbox 0


port sendModel : Signal Model
port sendModel =
  sendModelMailbox.signal


-- Update

update: Action -> Model -> Model
update action model =
  case action of
    Inc -> model + 1
    SetModel newModel -> newModel


-- View

view: Signal.Address Action -> Signal.Address Model -> Model -> Html
view actionAddress sendModelMailbox model =
  ul []
  [ li [ onClick actionAddress Inc ] [text "inc"]
  , li [ onClick sendModelMailbox model ] [text "send"]
  , li [] [(model |> toString |> text)]
  ]
