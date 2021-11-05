module Ex5_8_1 exposing (..)

countVowels : String -> Int
countVowels s =
    let
        countVowelsHelper i l =
            let
                listFind list toFind =
                    case list of
                        [] -> False
                        x::xs -> if toFind == x then True else listFind xs toFind
            in
                case l of
                    [] -> i
                    x::xs -> if x |> listFind ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
                        then countVowelsHelper (i + 1) xs
                        else countVowelsHelper i xs
    in
        s
        |> String.toList >> countVowelsHelper 0
