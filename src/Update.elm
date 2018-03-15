module Update exposing (..)

import Char
import Messages exposing (Msg(..))
import Models exposing (Model)
import List.Extra as LE
import List as List


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        KeyboardMsg keycode ->
            let
                key =
                    String.fromChar (Char.fromCode keycode)

                currentLetter =
                    Maybe.withDefault "" (LE.getAt model.currentLetter model.currentLetters)

                letter =
                    if key == currentLetter then
                        model.currentLetter + 1
                    else
                        model.currentLetter
            in
                case letter == ((List.length model.currentLetters)) of
                    True ->
                        let
                            word =
                                model.currentWord + 1

                            completedWord =
                                (Maybe.withDefault "" (LE.getAt model.currentWord model.words))

                            currentWord =
                                (Maybe.withDefault "" (LE.getAt word model.words))

                            letters =
                                String.split "" currentWord
                        in
                            ( { model | currentWord = word, currentLetter = 0, currentLetters = letters, completedWords = (model.completedWords ++ [ completedWord ]) }, Cmd.none )

                    _ ->
                        ( { model | currentLetter = letter }, Cmd.none )
