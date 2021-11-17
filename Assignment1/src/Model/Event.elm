module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
    let
        compareByInterval : Event -> Event -> Order
        compareByInterval a b = Interval.compare a.interval b.interval
    in
        events  |> List.sortWith compareByInterval


view : Event -> Html Never
view event =
    let
        maybeUnwrapString : Maybe String -> String
        maybeUnwrapString x =
            case x of
                Just str -> str
                Nothing -> ""
    in
        div ([class "event"] ++ if event.important == True
                                    then [class "event-important"]
                                    else []
            )
        [
            event.title |> text >> List.singleton
                        |> h1 [class "event-title"]

            , event.interval    |> Interval.view >> List.singleton
                                |> div [class "event-interval"]

            , event.description |> map never >> List.singleton
                                |> div [class "event-description"]

            , event.category    |> categoryView >> List.singleton
                                |> div [class "event-category"]

            , event.url |> maybeUnwrapString >> text >> List.singleton
                        |> a [class "event-url", href << maybeUnwrapString <| event.url]

            , event.tags    |> List.map (\x -> x ++ " " |> text >> List.singleton
                                                        |> em [class "event-tag"]
                                        )
                            |> div [class "event-tags"]
        ]