module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, h2, img, table, td, text, tr)
import Html.Attributes exposing (height, id, src, style)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    { board : Board
    , turn : PlayerTurn
    }


type alias Board =
    { a1 : Piece
    , a2 : Piece
    , a3 : Piece
    , a4 : Piece
    , a5 : Piece
    , a6 : Piece
    , b1 : Piece
    , b2 : Piece
    , b3 : Piece
    , b4 : Piece
    , b5 : Piece
    , b6 : Piece
    , c1 : Piece
    , c2 : Piece
    , c3 : Piece
    , c4 : Piece
    , c5 : Piece
    , c6 : Piece
    , d1 : Piece
    , d2 : Piece
    , d3 : Piece
    , d4 : Piece
    , d5 : Piece
    , d6 : Piece
    , e1 : Piece
    , e2 : Piece
    , e3 : Piece
    , e4 : Piece
    , e5 : Piece
    , e6 : Piece
    , f1 : Piece
    , f2 : Piece
    , f3 : Piece
    , f4 : Piece
    , f5 : Piece
    , f6 : Piece
    }


type Piece
    = None
    | Rocket1
    | Jet1
    | Rocket2
    | Jet2


type PlayerTurn
    = One
    | Two


init : ( Model, Cmd Msg )
init =
    ( { board =
            { a1 = Rocket1
            , a2 = None
            , a3 = None
            , a4 = None
            , a5 = None
            , a6 = Jet1
            , b1 = None
            , b2 = None
            , b3 = None
            , b4 = None
            , b5 = None
            , b6 = None
            , c1 = None
            , c2 = None
            , c3 = None
            , c4 = None
            , c5 = None
            , c6 = None
            , d1 = None
            , d2 = None
            , d3 = None
            , d4 = None
            , d5 = None
            , d6 = None
            , e1 = None
            , e2 = None
            , e3 = None
            , e4 = None
            , e5 = None
            , e6 = None
            , f1 = Jet2
            , f2 = None
            , f3 = None
            , f4 = None
            , f5 = None
            , f6 = Rocket2
            }
      , turn = One
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp
    | NextPlayer


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NextPlayer ->
            ( { model
                | turn =
                    if model.turn == One then
                        Two

                    else
                        One
              }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "AirWar33" ]
        , table []
            [ tr []
                [ td [ id "a1" ]
                    [ text (pieceString model.board.a1)
                    ]
                , td [ id "a2" ]
                    [ text (pieceString model.board.a2)
                    ]
                , td [ id "a3" ]
                    [ text (pieceString model.board.a3)
                    ]
                , td [ id "a4" ]
                    [ text (pieceString model.board.a4)
                    ]
                , td [ id "a5" ]
                    [ text (pieceString model.board.a5)
                    ]
                , td [ id "a6" ]
                    [ text (pieceString model.board.a6)
                    ]
                ]
            , tr []
                [ td [ id "b1" ]
                    [ text (pieceString model.board.b1)
                    ]
                , td [ id "b2" ]
                    [ text (pieceString model.board.b2)
                    ]
                , td [ id "b3" ]
                    [ text (pieceString model.board.b3)
                    ]
                , td [ id "b4" ]
                    [ text (pieceString model.board.b4)
                    ]
                , td [ id "b5" ]
                    [ text (pieceString model.board.b5)
                    ]
                , td [ id "b6" ]
                    [ text (pieceString model.board.b6)
                    ]
                ]
            , tr []
                [ td [ id "c1" ]
                    [ text (pieceString model.board.c1)
                    ]
                , td [ id "c2" ]
                    [ text (pieceString model.board.c2)
                    ]
                , td [ id "c3" ]
                    [ text (pieceString model.board.c3)
                    ]
                , td [ id "c4" ]
                    [ text (pieceString model.board.c4)
                    ]
                , td [ id "c5" ]
                    [ text (pieceString model.board.c5)
                    ]
                , td [ id "c6" ]
                    [ text (pieceString model.board.c6)
                    ]
                ]
            , tr []
                [ td [ id "d1" ]
                    [ text (pieceString model.board.d1)
                    ]
                , td [ id "d2" ]
                    [ text (pieceString model.board.d2)
                    ]
                , td [ id "d3" ]
                    [ text (pieceString model.board.d3)
                    ]
                , td [ id "d4" ]
                    [ text (pieceString model.board.d4)
                    ]
                , td [ id "d5" ]
                    [ text (pieceString model.board.d5)
                    ]
                , td [ id "d6" ]
                    [ text (pieceString model.board.d6)
                    ]
                ]
            , tr []
                [ td [ id "e1" ]
                    [ text (pieceString model.board.e1)
                    ]
                , td [ id "e2" ]
                    [ text (pieceString model.board.e2)
                    ]
                , td [ id "e3" ]
                    [ text (pieceString model.board.e3)
                    ]
                , td [ id "e4" ]
                    [ text (pieceString model.board.e4)
                    ]
                , td [ id "e5" ]
                    [ text (pieceString model.board.e5)
                    ]
                , td [ id "e6" ]
                    [ text (pieceString model.board.e6)
                    ]
                ]
            , tr []
                [ td [ id "f1" ]
                    [ text (pieceString model.board.f1)
                    ]
                , td [ id "f2" ]
                    [ text (pieceString model.board.f2)
                    ]
                , td [ id "f3" ]
                    [ text (pieceString model.board.f3)
                    ]
                , td [ id "f4" ]
                    [ text (pieceString model.board.f4)
                    ]
                , td [ id "f5" ]
                    [ text (pieceString model.board.f5)
                    ]
                , td [ id "f6" ]
                    [ text (pieceString model.board.f6)
                    ]
                ]
            ]
        , h2 [] [ text (turnString model.turn ++ "'s turn.") ]
        , button [ onClick NextPlayer ] [ text "Next Player" ]
        ]


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

        _ ->
            "☁️"


turnString : PlayerTurn -> String
turnString turn =
    case turn of
        One ->
            "Player 1"

        Two ->
            "Player 2"



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
