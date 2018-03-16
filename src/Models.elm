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
            [ "THE", "AND", "A"
             , "TO", "SAID", "IN"
             , "HE", "I", "OF"
             , "IT", "WAS", "YOU"
             , "THEY", "ON", "SHE"
             , "IS", "FOR", "AT"
             , "HIS", "BUT", "THAT"
             , "WITH", "ALL", "AN"
             , "SO", "WE", "CAN"
             , "ARE", "UP", "HAD"
             , "MY", "HER", "WHAT"
             , "THERE", "OUT", "THIS"
             , "HAVE", "WENT", "BE"
             , "LIKE", "SOME", "NOT"
             , "THEN", "WERE", "GO"
             , "LITTLE", "AS", "NO"
             , "SAW", "MAKE", "MUM"
             , "ONE", "THEM", "DO"
             , "ME", "DOWN", "DAD"
             , "BIG", "WHEN", "ITS"
             , "SEE", "LOOKED", "VERY"
             , "LOOK", "DONT", "COME"
             , "WILL", "INTO", "BACK"
             , "FROM", "CHILDREN", "HIM"
             , "MR", "OFF", "ASKED"
             , "GET", "JUST", "NOW"
             , "CAME", "OH", "ABOUT"
             , "GOT", "THEIR", "PEOPLE"
             , "YOUR", "PUT", "COULD"
             , "HOUSE", "OLD", "TOO"
             , "BY", "DAY", "MADE"
             , "TIME", "IM", "IF"
             , "HELP", "MRS", "CALLED"
             ]

        letters =
            String.split "" (Maybe.withDefault "" (LE.getAt 0 words))
    in
        { words = words
        , currentWord = 0
        , currentLetters = letters
        , currentLetter = 0
        , completedWords = []
        }
