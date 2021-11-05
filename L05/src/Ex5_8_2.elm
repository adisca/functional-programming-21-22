module Ex5_8_2 exposing (..)
import Theme exposing (ThemeConfig(..))

type alias AccountConfiguration =
    { preferredTheme: ThemeConfig
    , subscribedToNewsletter: Bool
    , twoFactorAuthOn: Bool
    }

changePreferenceToDarkTheme : List AccountConfiguration -> List AccountConfiguration
changePreferenceToDarkTheme l =
    let
        changePreferenceToDarkThemeHelper : List AccountConfiguration -> List AccountConfiguration ->
                                        List AccountConfiguration
        changePreferenceToDarkThemeHelper acc lH =
            case lH of
                [] -> List.reverse acc
                x::xs -> xs |> changePreferenceToDarkThemeHelper ({x | preferredTheme = Dark} :: acc)
    in
        l |> changePreferenceToDarkThemeHelper []
