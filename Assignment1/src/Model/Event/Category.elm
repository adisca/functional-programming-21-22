module Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected, eventCategories, isEventCategorySelected, set, view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (checked, class, style, type_)
import Html.Events exposing (onCheck)


type EventCategory
    = Academic
    | Work
    | Project
    | Award


eventCategories =
    [ Academic, Work, Project, Award ]


{-| Type used to represent the state of the selected event categories
-}
type SelectedEventCategories
    = SelectedEventCategories (List EventCategory)


{-| Returns an instance of `SelectedEventCategories` with all categories selected

    isEventCategorySelected Academic allSelected --> True

-}
allSelected : SelectedEventCategories
allSelected =
    SelectedEventCategories eventCategories


{-| Given a the current state and a `category` it returns whether the `category` is selected.

    isEventCategorySelected Academic allSelected --> True

-}
isEventCategorySelected : EventCategory -> SelectedEventCategories -> Bool
isEventCategorySelected category current =
    case current of
        SelectedEventCategories sel ->
            sel |> List.any (\x -> x == category)


{-| Given an `category`, a boolean `value` and the current state, it sets the given `category` in `current` to `value`.

    allSelected |> set Academic False |> isEventCategorySelected Academic --> False

    allSelected |> set Academic False |> isEventCategorySelected Work --> True

-}
set : EventCategory -> Bool -> SelectedEventCategories -> SelectedEventCategories
set category value current =
    let
        (SelectedEventCategories list) = current

        removeCategory : List EventCategory -> List EventCategory -> List EventCategory
        removeCategory acc l =
            case l of
                [] -> acc
                x::xs ->
                        if x /= category then
                            xs |> removeCategory (x :: acc)
                        else
                            xs |> removeCategory acc
    in
        if value == True then
            if isEventCategorySelected category current == True then
                current
            else
                list ++ [category] |> SelectedEventCategories
        else
            list |> removeCategory [] >> SelectedEventCategories



checkbox : String -> Bool -> EventCategory -> Html ( EventCategory, Bool )
checkbox name state category =
    div [ style "display" "inline", class "category-checkbox" ]
        [ input [ type_ "checkbox", onCheck (\c -> ( category, c )), checked state ] []
        , text name
        ]


view : SelectedEventCategories -> Html ( EventCategory, Bool )
view model =
    div [class "category"]
    [
        Academic |> checkbox "Academic" (isEventCategorySelected Academic model)
        , Work |> checkbox "Work" (isEventCategorySelected Work model)
        , Project |> checkbox "Project" (isEventCategorySelected Project model)
        , Award |> checkbox "Award" (isEventCategorySelected Award model)
    ]
