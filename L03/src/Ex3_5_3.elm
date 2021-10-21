module Ex3_5_3 exposing (..)

last : List a -> Maybe a
last l =
    case l of
        [] -> Nothing
        x::xs -> if xs == [] then Just x else last xs
