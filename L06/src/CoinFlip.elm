
module CoinFlip exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import Random

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

type CoinSide
  = Heads
  | Tails

type alias Model =
  { currentFlip : List CoinSide
  , flips: List CoinSide
  , headsNb: Int
  , tailsNb: Int
  }

initModel : Model
initModel = Model [] [] 0 0

init : () -> (Model, Cmd Msg)
init _ =
  ( initModel
  , Random.generate AddFlip (Random.list 1 coinFlip)
  )

type Msg
  = Flip Int
  | AddFlip (List CoinSide)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let
      incrementIfHeads : List CoinSide -> Int -> Int
      incrementIfHeads sides prevNb =
          case sides of
              [] -> prevNb
              x::xs -> case x of
                        Heads -> incrementIfHeads xs (prevNb + 1)
                        _ -> incrementIfHeads xs prevNb

      incrementIfTails : List CoinSide -> Int -> Int
      incrementIfTails sides prevNb =
          case sides of
              [] -> prevNb
              x::xs -> case x of
                        Tails -> incrementIfTails xs (prevNb + 1)
                        _ -> incrementIfTails xs prevNb
  in
  case msg of
    Flip nb ->
      ( model
      , Random.generate AddFlip (Random.list nb coinFlip)
      )

    AddFlip coins ->
      ( Model coins (coins ++ model.flips) (incrementIfHeads coins model.headsNb)
                (incrementIfTails coins model.tailsNb)
      , Cmd.none
      )

coinFlip : Random.Generator CoinSide
coinFlip =
  Random.uniform Heads
    [ Tails ]

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model =
  let
    currentFlip = 
      model.currentFlip
    flips = 
      model.flips 
      |> coinsToString
      |> text

    countHeads : List CoinSide -> Int
    countHeads l =
        let
            countHeadsHelper : Int -> List CoinSide -> Int
            countHeadsHelper acc lH =
                case lH of
                    [] -> acc
                    x::xs -> case x of
                                Heads -> countHeadsHelper (acc + 1) xs
                                _ -> countHeadsHelper acc xs
        in
            countHeadsHelper 0 l

    countTails : List CoinSide -> Int
    countTails l =
        let
            countTailsHelper : Int -> List CoinSide -> Int
            countTailsHelper acc lH =
                case lH of
                    [] -> acc
                    x::xs -> case x of
                                Tails -> countTailsHelper (acc + 1) xs
                                _ -> countTailsHelper acc xs
        in
            countTailsHelper 0 l
  in
    div []
      [ button [ onClick (Flip 1) ] [ text "Flip" ]
      , button [ onClick (Flip 10) ] [ text "Flip 10" ]
      , button [ onClick (Flip 100) ] [ text "Flip 100" ]
      , viewCoins currentFlip
      , div [] [flips]
      , div [] [text ("Heads: " ++ String.fromInt model.headsNb)]
      , div [] [text ("Tails: " ++ String.fromInt model.tailsNb)]
      , div [] [text ("Heads: " ++ String.fromInt (countHeads model.flips))]
      , div [] [text ("Tails: " ++ String.fromInt (countTails model.flips))]
      ]

coinsToString : List CoinSide -> String
coinsToString coins =
    let
        coinsToStringHelper : List CoinSide -> String -> String
        coinsToStringHelper coinsH acc =
            case coinsH of
                [] -> acc
                x::xs -> case x of
                            Heads -> coinsToStringHelper xs ("h " ++ acc)
                            Tails -> coinsToStringHelper xs ("t " ++ acc)
    in
        coinsToStringHelper coins ""

viewCoins : List CoinSide -> Html Msg
viewCoins coins =
  let
    name = coinsToString coins
  in
    div [ style "font-size" "4em" ] [ text name ]

