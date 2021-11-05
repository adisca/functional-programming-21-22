module Ex5_8_5 exposing (..)

splitLast : List a -> Maybe (List a, a)
splitLast l =
    let
        splitLastHelper : List a -> a -> List a -> Maybe (List a, a)
        splitLastHelper acc last lH =
            case lH of
                [] -> Just (List.reverse acc, last)
                x::xs -> xs |> splitLastHelper (last :: acc) x
    in
        case l of
            [] -> Nothing
            x::xs -> xs |> splitLastHelper [] x
