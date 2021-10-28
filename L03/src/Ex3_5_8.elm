module Ex3_5_8 exposing (..)
import Shape exposing (Shape, InvalidShapeError, safeAreaEnum)

-- to test in repl you might need to also import Shape exposing (..)

totalArea : List Shape -> Result (Int, InvalidShapeError) Float
totalArea l =
    let
        totalAreaHelper : List Shape -> Float -> Int -> Result (Int, InvalidShapeError) Float
        totalAreaHelper lH sum i =
            case lH of
                [] -> Ok sum
                x::xs ->
                    case safeAreaEnum x of
                        Ok value -> totalAreaHelper xs (sum + value) (i  + 1)
                        Err error -> Err (i, error)
    in
        totalAreaHelper l 0 0