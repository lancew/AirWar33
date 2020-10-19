module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, h2, img, table, td, text, tr)
import Html.Attributes exposing (class, height, id, src, style)
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
    | Explosion


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
    | TogglePiece String


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

        TogglePiece location ->
            let
                boardBefore =
                    model.board
            in
            case location of
                "a1" ->
                    ( { model | board = { boardBefore | a1 = togglePiece boardBefore.a1 } }, Cmd.none )

                "a2" ->
                    ( { model | board = { boardBefore | a2 = togglePiece boardBefore.a2 } }, Cmd.none )

                "a3" ->
                    ( { model | board = { boardBefore | a3 = togglePiece boardBefore.a3 } }, Cmd.none )

                "a4" ->
                    ( { model | board = { boardBefore | a4 = togglePiece boardBefore.a4 } }, Cmd.none )

                "a5" ->
                    ( { model | board = { boardBefore | a5 = togglePiece boardBefore.a5 } }, Cmd.none )

                "a6" ->
                    ( { model | board = { boardBefore | a6 = togglePiece boardBefore.a6 } }, Cmd.none )

                "b1" ->
                    ( { model | board = { boardBefore | b1 = togglePiece boardBefore.b1 } }, Cmd.none )

                "b2" ->
                    ( { model | board = { boardBefore | b2 = togglePiece boardBefore.b2 } }, Cmd.none )

                "b3" ->
                    ( { model | board = { boardBefore | b3 = togglePiece boardBefore.b3 } }, Cmd.none )

                "b4" ->
                    ( { model | board = { boardBefore | b4 = togglePiece boardBefore.b4 } }, Cmd.none )

                "b5" ->
                    ( { model | board = { boardBefore | b5 = togglePiece boardBefore.b5 } }, Cmd.none )

                "b6" ->
                    ( { model | board = { boardBefore | b6 = togglePiece boardBefore.b6 } }, Cmd.none )

                "c1" ->
                    ( { model | board = { boardBefore | c1 = togglePiece boardBefore.c1 } }, Cmd.none )

                "c2" ->
                    ( { model | board = { boardBefore | c2 = togglePiece boardBefore.c2 } }, Cmd.none )

                "c3" ->
                    ( { model | board = { boardBefore | c3 = togglePiece boardBefore.c3 } }, Cmd.none )

                "c4" ->
                    ( { model | board = { boardBefore | c4 = togglePiece boardBefore.c4 } }, Cmd.none )

                "c5" ->
                    ( { model | board = { boardBefore | c5 = togglePiece boardBefore.c5 } }, Cmd.none )

                "c6" ->
                    ( { model | board = { boardBefore | c6 = togglePiece boardBefore.c6 } }, Cmd.none )

                "d1" ->
                    ( { model | board = { boardBefore | d1 = togglePiece boardBefore.d1 } }, Cmd.none )

                "d2" ->
                    ( { model | board = { boardBefore | d2 = togglePiece boardBefore.d2 } }, Cmd.none )

                "d3" ->
                    ( { model | board = { boardBefore | d3 = togglePiece boardBefore.d3 } }, Cmd.none )

                "d4" ->
                    ( { model | board = { boardBefore | d4 = togglePiece boardBefore.d4 } }, Cmd.none )

                "d5" ->
                    ( { model | board = { boardBefore | d5 = togglePiece boardBefore.d5 } }, Cmd.none )

                "d6" ->
                    ( { model | board = { boardBefore | d6 = togglePiece boardBefore.d6 } }, Cmd.none )

                "e1" ->
                    ( { model | board = { boardBefore | e1 = togglePiece boardBefore.e1 } }, Cmd.none )

                "e2" ->
                    ( { model | board = { boardBefore | e2 = togglePiece boardBefore.e2 } }, Cmd.none )

                "e3" ->
                    ( { model | board = { boardBefore | e3 = togglePiece boardBefore.e3 } }, Cmd.none )

                "e4" ->
                    ( { model | board = { boardBefore | e4 = togglePiece boardBefore.e4 } }, Cmd.none )

                "e5" ->
                    ( { model | board = { boardBefore | e5 = togglePiece boardBefore.e5 } }, Cmd.none )

                "e6" ->
                    ( { model | board = { boardBefore | e6 = togglePiece boardBefore.e6 } }, Cmd.none )

                "f1" ->
                    ( { model | board = { boardBefore | f1 = togglePiece boardBefore.f1 } }, Cmd.none )

                "f2" ->
                    ( { model | board = { boardBefore | f2 = togglePiece boardBefore.f2 } }, Cmd.none )

                "f3" ->
                    ( { model | board = { boardBefore | f3 = togglePiece boardBefore.f3 } }, Cmd.none )

                "f4" ->
                    ( { model | board = { boardBefore | f4 = togglePiece boardBefore.f4 } }, Cmd.none )

                "f5" ->
                    ( { model | board = { boardBefore | f5 = togglePiece boardBefore.f5 } }, Cmd.none )

                "f6" ->
                    ( { model | board = { boardBefore | f6 = togglePiece boardBefore.f6 } }, Cmd.none )

                _ ->
                    ( { model | board = { boardBefore | f3 = Rocket1 } }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


pieceString : Piece -> String
pieceString piece =
    case piece of
        Jet1 ->
            "🛩️"

        Rocket1 ->
            "🚀"

        Jet2 ->
            "\u{1F6F8}"

        Rocket2 ->
            "☄️"

        Explosion ->
            "💥"

        _ ->
            "☁️"


togglePiece : Piece -> Piece
togglePiece piece =
    case piece of
        None ->
            Jet1

        Jet1 ->
            Rocket1

        Rocket1 ->
            Jet2

        Jet2 ->
            Rocket2

        Rocket2 ->
            Explosion

        Explosion ->
            None


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



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "AirWar33" ]
        , table [ class "board" ]
            [ tr []
                [ td [ id "a1", onClick (TogglePiece "a1") ]
                    [ text (pieceString model.board.a1)
                    ]
                , td [ id "a2", onClick (TogglePiece "a2") ]
                    [ text (pieceString model.board.a2)
                    ]
                , td [ id "a3", onClick (TogglePiece "a3") ]
                    [ text (pieceString model.board.a3)
                    ]
                , td [ id "a4", onClick (TogglePiece "a4") ]
                    [ text (pieceString model.board.a4)
                    ]
                , td [ id "a5", onClick (TogglePiece "a5") ]
                    [ text (pieceString model.board.a5)
                    ]
                , td [ id "a6", onClick (TogglePiece "a6") ]
                    [ text (pieceString model.board.a6)
                    ]
                ]
            , tr []
                [ td [ id "b1", onClick (TogglePiece "b1") ]
                    [ text (pieceString model.board.b1)
                    ]
                , td [ id "b2", onClick (TogglePiece "b2") ]
                    [ text (pieceString model.board.b2)
                    ]
                , td [ id "b3", onClick (TogglePiece "b3") ]
                    [ text (pieceString model.board.b3)
                    ]
                , td [ id "b4", onClick (TogglePiece "b4") ]
                    [ text (pieceString model.board.b4)
                    ]
                , td [ id "b5", onClick (TogglePiece "b5") ]
                    [ text (pieceString model.board.b5)
                    ]
                , td [ id "b6", onClick (TogglePiece "b6") ]
                    [ text (pieceString model.board.b6)
                    ]
                ]
            , tr []
                [ td [ id "c1", onClick (TogglePiece "c1") ]
                    [ text (pieceString model.board.c1)
                    ]
                , td [ id "c2", onClick (TogglePiece "c2") ]
                    [ text (pieceString model.board.c2)
                    ]
                , td [ id "c3", onClick (TogglePiece "c3") ]
                    [ text (pieceString model.board.c3)
                    ]
                , td [ id "c4", onClick (TogglePiece "c4") ]
                    [ text (pieceString model.board.c4)
                    ]
                , td [ id "c5", onClick (TogglePiece "c5") ]
                    [ text (pieceString model.board.c5)
                    ]
                , td [ id "c6", onClick (TogglePiece "c6") ]
                    [ text (pieceString model.board.c6)
                    ]
                ]
            , tr []
                [ td [ id "d1", onClick (TogglePiece "d1") ]
                    [ text (pieceString model.board.d1)
                    ]
                , td [ id "d2", onClick (TogglePiece "d2") ]
                    [ text (pieceString model.board.d2)
                    ]
                , td [ id "d3", onClick (TogglePiece "d3") ]
                    [ text (pieceString model.board.d3)
                    ]
                , td [ id "d4", onClick (TogglePiece "d4") ]
                    [ text (pieceString model.board.d4)
                    ]
                , td [ id "d5", onClick (TogglePiece "d5") ]
                    [ text (pieceString model.board.d5)
                    ]
                , td [ id "d6", onClick (TogglePiece "d6") ]
                    [ text (pieceString model.board.d6)
                    ]
                ]
            , tr []
                [ td [ id "e1", onClick (TogglePiece "e1") ]
                    [ text (pieceString model.board.e1)
                    ]
                , td [ id "e2", onClick (TogglePiece "e2") ]
                    [ text (pieceString model.board.e2)
                    ]
                , td [ id "e3", onClick (TogglePiece "e3") ]
                    [ text (pieceString model.board.e3)
                    ]
                , td [ id "e4", onClick (TogglePiece "e4") ]
                    [ text (pieceString model.board.e4)
                    ]
                , td [ id "e5", onClick (TogglePiece "e5") ]
                    [ text (pieceString model.board.e5)
                    ]
                , td [ id "e6", onClick (TogglePiece "e6") ]
                    [ text (pieceString model.board.e6)
                    ]
                ]
            , tr []
                [ td [ id "f1", onClick (TogglePiece "f1") ]
                    [ text (pieceString model.board.f1)
                    ]
                , td [ id "f2", onClick (TogglePiece "f2") ]
                    [ text (pieceString model.board.f2)
                    ]
                , td [ id "f3", onClick (TogglePiece "f3") ]
                    [ text (pieceString model.board.f3)
                    ]
                , td [ id "f4", onClick (TogglePiece "f4") ]
                    [ text (pieceString model.board.f4)
                    ]
                , td [ id "f5", onClick (TogglePiece "f5") ]
                    [ text (pieceString model.board.f5)
                    ]
                , td [ id "f6", onClick (TogglePiece "f6") ]
                    [ text (pieceString model.board.f6)
                    ]
                ]
            ]
        , h2 [] [ text (turnString model.turn ++ "'s turn.") ]
        , button [ onClick NextPlayer ] [ text "Next Player" ]
        ]
