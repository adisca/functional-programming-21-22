module Ex4_6_5 exposing (..)
import List exposing (filter, reverse)

countriesWithCapital : List (String, String) -> (String -> Bool) -> List String
countriesWithCapital l pred =
    let
        extractCountries : List (String, String) -> List String -> List String
        extractCountries list acc =
            case list of
                [] -> reverse acc
                (x, _)::xs -> extractCountries xs (x :: acc)
    in
        extractCountries (filter (\(_, y) -> pred y) l) []
