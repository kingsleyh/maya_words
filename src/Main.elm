module Main exposing (main)

import Html
import Messages exposing (..)
import Models exposing (..)
import Update exposing (..)
import Views.View exposing (..)
import Keyboard

main : Program Never Model Msg
main =
    Html.program
        { init = ( newModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

subscriptions : Model -> Sub Msg
subscriptions model =
  Keyboard.downs KeyboardMsg
