module Ex3_5_1 exposing (..)

safeDiv : Int -> Int -> Maybe Int
safeDiv a b = if b == 0 then Nothing else Just (floor (toFloat a / toFloat b))
