module Ex4_6_4 exposing (..)


partition : comparable -> List comparable -> (List comparable, List comparable)
partition pivot l =
    let
        partitionHelper piv list result =
            case list of
                [] -> result
                x::xs -> if (x < piv)
                    then partitionHelper piv xs (x :: Tuple.first result, Tuple.second result)
                    else partitionHelper piv xs (Tuple.first result, x :: Tuple.second result)
    in
        partitionHelper pivot l ([],[])
