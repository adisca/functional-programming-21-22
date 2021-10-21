module Ex3_4_2 exposing (..)

-- b1 = 4131
-- b2 = 4132

countFromTo : Int -> Int -> List Int
countFromTo from to =
    if from >= to
    then []
    else from :: (countFromTo (from + 1) to)

--countFromTo : Int -> Int -> List Int
--countFromTo from to =
--    let
--        reverse : List a -> List a
--        reverse l =
--            let
--                reverseHelper : List a -> List a -> List a
--                reverseHelper lHelper acc =
--                    case lHelper of
--                        [] -> acc
--                        x::xs -> reverseHelper xs (x::acc)
--            in
--                reverseHelper l []
--
--        countFromToHelper fromH toH acc =
--                if fromH >= toH
--                then reverse acc
--                else (countFromToHelper (fromH + 1) toH (fromH :: acc))
--    in
--        countFromToHelper from to []
