module Main exposing (..)

import Array exposing (Array)
import Browser
import Html exposing (Html, button, div, h1, h2, h3, img, table, td, text, tr)
import Html.Attributes exposing (class, height, id, src, style)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    { board : Board
    , turn : PlayerTurn
    , playerOneScore : Int
    , playerTwoScore : Int
    , previousBoard : Board
    }


type alias Board =
    Array.Array Piece


type Piece
    = None
    | Rocket1
    | Jet1
    | Rocket2
    | Jet2
    | Explosion


type PlayerTurn
    = One
    | Two


init : ( Model, Cmd Msg )
init =
    ( { board =
            Array.fromList
                [ Jet1
                , None
                , None
                , None
                , None
                , Rocket1
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , Rocket2
                , None
                , None
                , None
                , None
                , Jet2
                ]
      , turn = One
      , playerOneScore = 2
      , playerTwoScore = 2
      , previousBoard =
            Array.fromList
                [ Jet1
                , None
                , None
                , None
                , None
                , Rocket1
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , None
                , Rocket2
                , None
                , None
                , None
                , None
                , Jet2
                ]
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp
    | NextPlayer
    | TogglePiece Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NextPlayer ->
            ( { model
                | playerOneScore = updateScores One model
                , playerTwoScore = updateScores Two model
                , turn =
                    if model.turn == One then
                        Two

                    else
                        One
                , previousBoard = model.board
              }
            , Cmd.none
            )

        TogglePiece location ->
            let
                piece =
                    getPiece location model

                oldPiece =
                    getOldPiece location model

                newPiece =
                    togglePiece piece oldPiece model.turn

                newBoard =
                    Array.set location newPiece model.board
            in
            ( { model | board = newBoard }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


getPiece location model =
    let
        piece =
            Array.get location model.board
    in
    case piece of
        Just p ->
            p

        Nothing ->
            None


getOldPiece location model =
    let
        piece =
            Array.get location model.previousBoard
    in
    case piece of
        Just p ->
            p

        Nothing ->
            None


pieceString : Piece -> String
pieceString piece =
    case piece of
        Jet1 ->
            "🛩️"

        Rocket1 ->
            "🚀"

        Jet2 ->
            "🛸"

        Rocket2 ->
            "☄️"

        Explosion ->
            "💥"

        _ ->
            "☁️"


togglePiece : Piece -> Piece -> PlayerTurn -> Piece
togglePiece piece oldPiece player =
    case player of
        One ->
            case piece of
                None ->
                    Jet1

                Jet2 ->
                    Explosion

                Rocket2 ->
                    Explosion

                Explosion ->
                    oldPiece

                _ ->
                    oldPiece

        Two ->
            case piece of
                None ->
                    Jet2

                Jet2 ->
                    Explosion

                Explosion ->
                    oldPiece

                _ ->
                    piece


turnString : PlayerTurn -> String
turnString turn =
    case turn of
        One ->
            "Player 1"

        Two ->
            "Player 2"


updateScores player model =
    let
        playerOnePieces =
            Array.filter isPlayerOnePiece model.board

        playerTwoPieces =
            Array.filter isPlayerTwoPiece model.board
    in
    case player of
        One ->
            Array.length playerOnePieces

        Two ->
            Array.length playerTwoPieces


isPlayerOnePiece : Piece -> Bool
isPlayerOnePiece piece =
    isPlayersPiece piece One


isPlayerTwoPiece : Piece -> Bool
isPlayerTwoPiece piece =
    isPlayersPiece piece Two


isPlayersPiece : Piece -> PlayerTurn -> Bool
isPlayersPiece piece player =
    case player of
        One ->
            case piece of
                Jet1 ->
                    True

                Rocket1 ->
                    True

                _ ->
                    False

        Two ->
            case piece of
                Jet2 ->
                    True

                Rocket2 ->
                    True

                _ ->
                    False



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "AirWar33" ]
        , h3 [] [ text "Player 1 - Player 2" ]
        , h3 [] [ text (String.fromInt model.playerOneScore ++ " - " ++ String.fromInt model.playerTwoScore) ]
        , table [ class "board" ]
            [ tr []
                [ td [ id "0", onClick (TogglePiece 0) ] [ text (pieceString (getPiece 0 model)) ]
                , td [ id "1", onClick (TogglePiece 1) ] [ text (pieceString (getPiece 1 model)) ]
                , td [ id "2", onClick (TogglePiece 2) ] [ text (pieceString (getPiece 2 model)) ]
                , td [ id "3", onClick (TogglePiece 3) ] [ text (pieceString (getPiece 3 model)) ]
                , td [ id "4", onClick (TogglePiece 4) ] [ text (pieceString (getPiece 4 model)) ]
                , td [ id "5", onClick (TogglePiece 5) ] [ text (pieceString (getPiece 5 model)) ]
                ]
            , tr []
                [ td [ id "6", onClick (TogglePiece 6) ] [ text (pieceString (getPiece 6 model)) ]
                , td [ id "7", onClick (TogglePiece 7) ] [ text (pieceString (getPiece 7 model)) ]
                , td [ id "8", onClick (TogglePiece 8) ] [ text (pieceString (getPiece 8 model)) ]
                , td [ id "9", onClick (TogglePiece 9) ] [ text (pieceString (getPiece 9 model)) ]
                , td [ id "10", onClick (TogglePiece 10) ] [ text (pieceString (getPiece 10 model)) ]
                , td [ id "11", onClick (TogglePiece 11) ] [ text (pieceString (getPiece 11 model)) ]
                ]
            , tr []
                [ td [ id "12", onClick (TogglePiece 12) ] [ text (pieceString (getPiece 12 model)) ]
                , td [ id "13", onClick (TogglePiece 13) ] [ text (pieceString (getPiece 13 model)) ]
                , td [ id "14", onClick (TogglePiece 14) ] [ text (pieceString (getPiece 14 model)) ]
                , td [ id "15", onClick (TogglePiece 15) ] [ text (pieceString (getPiece 15 model)) ]
                , td [ id "16", onClick (TogglePiece 16) ] [ text (pieceString (getPiece 16 model)) ]
                , td [ id "17", onClick (TogglePiece 17) ] [ text (pieceString (getPiece 17 model)) ]
                ]
            , tr []
                [ td [ id "18", onClick (TogglePiece 18) ] [ text (pieceString (getPiece 18 model)) ]
                , td [ id "19", onClick (TogglePiece 19) ] [ text (pieceString (getPiece 19 model)) ]
                , td [ id "20", onClick (TogglePiece 20) ] [ text (pieceString (getPiece 20 model)) ]
                , td [ id "21", onClick (TogglePiece 21) ] [ text (pieceString (getPiece 21 model)) ]
                , td [ id "22", onClick (TogglePiece 22) ] [ text (pieceString (getPiece 22 model)) ]
                , td [ id "23", onClick (TogglePiece 23) ] [ text (pieceString (getPiece 23 model)) ]
                ]
            , tr []
                [ td [ id "24", onClick (TogglePiece 24) ] [ text (pieceString (getPiece 24 model)) ]
                , td [ id "25", onClick (TogglePiece 25) ] [ text (pieceString (getPiece 25 model)) ]
                , td [ id "26", onClick (TogglePiece 26) ] [ text (pieceString (getPiece 26 model)) ]
                , td [ id "27", onClick (TogglePiece 27) ] [ text (pieceString (getPiece 27 model)) ]
                , td [ id "28", onClick (TogglePiece 28) ] [ text (pieceString (getPiece 28 model)) ]
                , td [ id "29", onClick (TogglePiece 29) ] [ text (pieceString (getPiece 29 model)) ]
                ]
            , tr []
                [ td [ id "30", onClick (TogglePiece 30) ] [ text (pieceString (getPiece 30 model)) ]
                , td [ id "31", onClick (TogglePiece 31) ] [ text (pieceString (getPiece 31 model)) ]
                , td [ id "32", onClick (TogglePiece 32) ] [ text (pieceString (getPiece 32 model)) ]
                , td [ id "33", onClick (TogglePiece 33) ] [ text (pieceString (getPiece 33 model)) ]
                , td [ id "34", onClick (TogglePiece 34) ] [ text (pieceString (getPiece 34 model)) ]
                , td [ id "35", onClick (TogglePiece 35) ] [ text (pieceString (getPiece 35 model)) ]
                ]
            ]
        , h2 [] [ text (turnString model.turn ++ "'s turn.") ]
        , button [ onClick NextPlayer ] [ text "Next Player" ]
        ]
