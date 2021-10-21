module Ex3_4_1 exposing (..)

len : List a -> Int
len l =
    let
        lenHelper list cnt =
            case list of
                [] -> cnt
                _::xs -> lenHelper xs (cnt + 1)
    in
        lenHelper l 0
