module Ex2_2_1 exposing (..)

-- Fixed the typo in "lstName"
fullTitle person = (if person.idDr then "Dr. " else "") ++ person.firstName ++ " " ++ person.lastName

-- fullTitle { firstName = "Haskell",
--    idDr = True,
--    lastName = "Curry" }