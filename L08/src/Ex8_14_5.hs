module Ex8_14_5 where

countVowels :: String -> Int
countVowels s =
    let
        countVowelsHelper l i =
            let
                listFind list toFind =
                    case list of
                        [] -> False
                        x:xs -> if toFind == x then True else listFind xs toFind
            in
                case l of
                    [] -> i
                    x:xs -> if listFind ['a', 'e', 'i', 'o', 'u'] x
                        then countVowelsHelper xs (i + 1)
                        else countVowelsHelper xs i

    in
        countVowelsHelper s 0

