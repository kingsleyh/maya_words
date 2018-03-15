module Models exposing (..)

import List.Extra as LE


type alias Model =
    { words : List String
    , currentWord : Int
    , currentLetters : List String
    , currentLetter : Int
    , completedWords : List String
    }


newModel : Model
newModel =
    let
        words =
            [ "RUN", "WALK", "SING", "SIT", "STAND", "EAT", "LOVE", "RACE", "OF", "THE" ]

        letters =
            String.split "" (Maybe.withDefault "" (LE.getAt 0 words))
    in
        { words = words
        , currentWord = 0
        , currentLetters = letters
        , currentLetter = 0
        , completedWords = []
        }
