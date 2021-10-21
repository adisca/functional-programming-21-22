module Ex3_5_8 exposing (..)
import Shape exposing (Shape, safeArea)

-- to test in repl you might need to also import Shape exposing (..)

cmpShapes : Shape -> Shape -> Result String Order
cmpShapes sh1 sh2 =
    case safeArea sh1 of
        Ok x ->
            case safeArea sh2 of
                Ok y -> Ok (compare x y)
                Err str -> Err ("Invalid input for right shape: " ++ str)
        Err str -> Err ("Invalid input for left shape: " ++ str)