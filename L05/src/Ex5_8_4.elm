module Ex5_8_4 exposing (..)

chunks: Int -> List a -> List (List a)
chunks n l =
    let
        chunksHelper : Int -> List a -> List a -> List (List a) -> List (List a)
        chunksHelper nLeft lH newSmallList result =
            case lH of
                [] ->
                    case newSmallList of
                    [] -> result
                    x::xs -> (List.reverse newSmallList) :: result
                x::xs ->
                    if nLeft > 0
                    then chunksHelper (nLeft - 1) xs (x :: newSmallList) result
                    else chunksHelper n lH [] ((List.reverse newSmallList) :: result)
    in
        if n > 0 then List.reverse (chunksHelper n l [] []) else []
