module Ex3_5_2 exposing (..)

-- made it tail recursive from the start

lenTail : List a -> Int
lenTail l =
    let
        lenHelper list cnt =
            case list of
                [] -> cnt
                _::xs -> lenHelper xs (cnt + 1)
    in
        lenHelper l 0
