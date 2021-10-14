module Ex2_3_1 exposing (..)

type alias User = {firstName: String, lastName: String}

fullName : User -> String
fullName person = person.firstName ++ " " ++ person.lastName

--fullName User "Haskell" "Curry"       -- Generated a "too many args" error, asked for missing commas/parentheses
--fullName (User "Haskell" "Curry")     -- This is the proper way
