module Ex2_3_2and3 exposing (..)

type alias Address = {street: String, number: Int, city: String, country: String}

formatAddress: Address -> String
formatAddress addr = addr.street ++ " " ++ (String.fromInt addr.number) ++ ", " ++ addr.city ++ ", " ++ addr.country

-- Would have been nice to tell us how to convert between types