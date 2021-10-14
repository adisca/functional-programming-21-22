module Ex2_8_1and2and3 exposing (..)

type Die = One | Two | Three | Four | Five | Six

type alias DicePair = {die1 : Die, die2 : Die}
--type DicePair = DicePair Die Die

luckyRoll : DicePair -> String

-- For alias
luckyRoll dp =
        case (dp.die1, dp.die2) of
            (Six, Six) -> "Very lucky"
            (Six, _) -> "Lucky"
            (_, Six) -> "Lucky"
            (_, _) -> "Meh"

-- For type def
--luckyRoll dp =
--        case dp of
--            (DicePair Six Six) -> "Very lucky"
--            (DicePair Six _) -> "Lucky"
--            (DicePair _ Six) -> "Lucky"
--            (DicePair _ _) -> "Meh"