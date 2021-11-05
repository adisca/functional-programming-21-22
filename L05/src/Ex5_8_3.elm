module Ex5_8_3 exposing (..)

type alias UserDetails =
    { firstName: String
    , lastName: String
    , phoneNumber: Maybe String
    }
type alias User = {id: String, email: String, details: UserDetails}

usersWithPhoneNumbers : List User -> List String
usersWithPhoneNumbers l =
    let
        usersWithPhoneNumbersHelper : List String -> List User -> List String
        usersWithPhoneNumbersHelper acc lH =
            case lH of
                [] -> List.reverse acc
                x::xs ->
                    let
                        det = x.details
                    in
                        case det.phoneNumber of
                            Just _ -> xs |> usersWithPhoneNumbersHelper (x.email :: acc)
                            Nothing -> xs |> usersWithPhoneNumbersHelper acc
    in
        l |> usersWithPhoneNumbersHelper []
