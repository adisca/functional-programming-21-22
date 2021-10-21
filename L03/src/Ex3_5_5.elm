module Ex3_5_5 exposing (..)

fibs : Int -> Int -> List Int
fibs start end =
    let
        reverse : List a -> List a
        reverse l =
            let
                reverseHelper : List a -> List a -> List a
                reverseHelper lHelper acc =
                    case lHelper of
                        [] -> acc
                        x::xs -> reverseHelper xs (x::acc)
            in
                reverseHelper l []

        fibsHelper : Int -> Int -> Int -> Int -> List Int -> List Int
        fibsHelper a b i j acc =
            if j <= 0 then reverse acc
            else if i <= 0 then fibsHelper b (a + b) i (j - 1) (b :: acc)
            else fibsHelper b (a + b) (i - 1) (j - 1) acc
    in
        fibsHelper 0 1 start end []
