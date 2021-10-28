module Ex4_6_8 exposing (..)
import List exposing (reverse)

chunks: Int -> List a -> List (List a)
chunks n l =
    let
        chunksHelper : Int -> List a -> List a -> List (List a) -> List (List a)
        chunksHelper nLeft lH newSmallList result =
            case lH of
                [] ->
                    case newSmallList of
                    [] -> result
                    x::xs -> (reverse newSmallList) :: result
                x::xs ->
                    if nLeft > 0
                    then chunksHelper (nLeft - 1) xs (x :: newSmallList) result
                    else chunksHelper n lH [] ((reverse newSmallList) :: result)
    in
        if n > 0 then reverse (chunksHelper n l [] []) else []
