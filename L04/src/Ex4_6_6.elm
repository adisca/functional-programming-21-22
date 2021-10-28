module Ex4_6_6 exposing (..)
import List exposing (reverse, map)

filterMap : (a -> Maybe b) -> List a -> List b
filterMap pred l =
    let
        filterMapHelper : List (Maybe b) -> List b -> List b
        filterMapHelper list acc =
            case list of
                [] -> reverse acc
                x::xs -> case x of
                    Just b -> filterMapHelper xs (b :: acc)
                    Nothing -> filterMapHelper xs acc
    in
        filterMapHelper (map pred l) []
