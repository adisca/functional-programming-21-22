
module Countries exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Dec


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }

type alias Country =
    { name : String
    , area : Float
    , region : String
    , population : Int
    }


decodeCountry : Dec.Decoder Country
decodeCountry =
    Dec.map4 Country
        (Dec.at  ["name", "common"] Dec.string)
        (Dec.field "area" Dec.float)
        (Dec.field "region" Dec.string)
        (Dec.field "population" Dec.int)

type Model
    = Initial
    | RequestSent
    | Success (List Country) Bool
    | Error Http.Error

init : () -> ( Model, Cmd Msg )
init _ =
    ( Initial
    , Cmd.none
    )


type Msg
    = GetCountries
    | GotCountries (Result Http.Error (List Country))
    | Order (List Country) Bool

getCountries : Cmd Msg
getCountries = Http.get
    { url = "https://restcountries.com/v3.1/all"
    , expect = Http.expectJson GotCountries (Dec.list decodeCountry)
    }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetCountries ->
            ( RequestSent
            , getCountries
            )

        GotCountries (Ok countries) ->
            ( Success countries False
            , Cmd.none
            )

        GotCountries (Err err) ->
            ( Error err
            , Cmd.none
            )

        Order countries sorted ->
            (
             Success countries sorted
             , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



view : Model -> Html Msg
view model =
    case model of
        Initial ->
            viewInitial

        RequestSent ->
            div [] [ text "Loading..." ]

        Success countries sorted ->
            viewSuccess countries sorted

        Error err ->
            viewError err

viewInitial : Html Msg
viewInitial =
    div []
        [ button [ onClick GetCountries ] [ text "Get countries" ]
        ]

viewCountry : Country -> Html msg
viewCountry {name, area, region, population} =
    div [style "border" "solid 1px", style "margin" "2px"]
        [ p [] [text <| "Name:" ++ name]
        , p [] [text <| "Area: " ++ String.fromFloat area]
        , p [] [text <| "Population: " ++ String.fromInt population]
        , p [] [text <| "Density: " ++ String.fromFloat ((toFloat population) / area)]
        ]

viewSuccess : List Country -> Bool -> Html Msg
viewSuccess countries sorted =
    let
        chooseSort =
            if sorted == False
            then List.reverse (List.sortBy .area countries)
            else List.sortBy .area countries
    in
    div [] [
    div []
        [ input [ type_ "checkbox", onCheck (Order countries), checked sorted ] []
        , text (if sorted == True then "Increasing Order" else "Decreasing Order")
        ]
    , div [] ((h2 [] [ text "ok" ])::List.map viewCountry chooseSort )]

httpErrorToString : Http.Error -> String
httpErrorToString err =
    case err of
        Http.BadUrl _ ->
            "Bad Url"

        Http.Timeout ->
            "Timeout"

        Http.NetworkError ->
            "Network Error"

        Http.BadStatus status ->
            "Bad Status: " ++ String.fromInt status

        Http.BadBody _ ->
            "Bad Body"


viewError : Http.Error -> Html msg
viewError err =
    div [] [ h2 [] [ text "Rip" ], p [] [ text <| httpErrorToString err ] ]


    

