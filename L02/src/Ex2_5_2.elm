module Ex2_5_2 exposing (..)

numberToMedal : Int -> String
numberToMedal n =
    case n of
        _ -> "Better luck next time"
        1 -> "Gold"
        2 -> "Silved"
        3 -> "Broze"

-- Error, "redundant pattern", the cases are taken in order, so if one case also covers another case,
-- the first case will take priority and the second will never trigger