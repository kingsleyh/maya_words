module Views.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (height, src, style)
import Messages exposing (Msg)
import Models exposing (Model)
import List.Extra as LE


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Learning - High Frequency Words" ]
        , div [] [ text "type each letter to complete the word - then say the word out loud" ]

        --          , div [] [ showCurrentWord model ]
        , div [] [ showCurrentWordImage model ]
        , renderCompletedTable model
        ]


renderCompletedTable : Model -> Html Msg
renderCompletedTable model =
    let
        _ =
            Debug.log "c " model.completedWords

        groups =
            LE.groupsOf 3 model.completedWords
    in
        table []
            [ tbody [] (List.map renderCompleted groups)
            ]


renderCompleted : List String -> Html Msg
renderCompleted words =
    tr [] (List.map renderWord words)


renderWord : String -> Html Msg
renderWord word =
    let
        letters =
            String.split "" word
    in
        td [ style [("padding-right","50px")] ] (List.map renderLetter letters)


renderLetter : String -> Html Msg
renderLetter letter =
    img [ src ("images/" ++ (String.toLower letter) ++ ".png"), height 100 ] []


showCurrentWordImage : Model -> Html Msg
showCurrentWordImage model =
    case LE.getAt model.currentWord model.words of
        Just word ->
            div [] (List.map (showLetterImage model.currentLetter) (List.indexedMap (,) model.currentLetters))

        _ ->
            img [ src ("images/the_end.jpg"), height 400 ] []


showLetterImage : Int -> ( Int, String ) -> Html Msg
showLetterImage current ( index, letter ) =
    if current == index + 1 then
        img [ src ("images/" ++ (String.toLower letter) ++ ".png"), height 400 ] []
    else if current > index then
        img [ src ("images/" ++ (String.toLower letter) ++ ".png"), height 400 ] []
    else
        img [ style [ ( "filter", "grayscale(100%)" ) ], src ("images/" ++ (String.toLower letter) ++ ".png"), height 400 ] []



--showCurrentWord : Model -> Html Msg
--showCurrentWord model =
--   case LE.getAt model.currentWord model.words of
--     Just word ->
--      div [] ( List.map (showLetter model.currentLetter) (List.indexedMap (,) model.currentLetters))
--     _ ->
--      div [] [ text "You've reached the end!"]
--
--showLetter : Int -> (Int, String) -> Html Msg
--showLetter current (index, letter) =
--  if current == index + 1 then
--    span [ style [("color","green")]] [ text letter ]
--  else if current > index then
--    span [ style [("color","green")]] [ text letter ]
--  else
--    span [  ] [ text letter ]
