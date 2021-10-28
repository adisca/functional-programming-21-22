module Ex4_6_11 exposing (..)
import List exposing (reverse)

collect : List (Result err ok) -> Result err (List ok)
collect l =
    let
        collectHelper : List (Result err ok) -> List ok -> Result err (List ok)
        collectHelper lH acc =
            case lH of
                [] -> Ok (reverse acc)
                x::xs -> case x of
                            Ok val -> collectHelper xs (val :: acc)
                            Err e -> Err e
    in
        collectHelper l []
