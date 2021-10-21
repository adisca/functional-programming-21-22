module Ex4_6_1 exposing (..)

enumerate : List a -> List (Int, a)
enumerate l =
    let
        enumerateHelper list i =
            case list of
                [] -> []
                x::xs -> (i, x) :: enumerateHelper xs (i + 1)
    in
        enumerateHelper l 0