module Ex2_5_1 exposing (..)

numberToMedal : Int -> String
numberToMedal n =
    case n of
        1 -> "Gold"
        2 -> "Silved"
        3 -> "Broze"

-- Error, "missing patterns", we need the wildcard or to cover all possible values.
-- It is similar to the necessity of an else in all ifs
