module Ex3_5_4 exposing (..)

indexList : Int -> List a -> Maybe a
indexList i l =
    case l of
        [] -> Nothing
        x::xs -> if i == 0 then Just x else indexList (i - 1) xs
