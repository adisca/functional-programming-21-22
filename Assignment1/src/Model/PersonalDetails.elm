module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href, id)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div []
    [
        details.name    |> text >> List.singleton
                        |> h1 [id "name"]

        , details.intro |> text >> List.singleton
                        |> em [id "intro"]

        , details.contacts  |> List.map (\x -> (x.name ++ ": " ++ x.detail) |> text >> List.singleton
                                                                            |> div [class "contact-detail"]
                                        )
                            |> div []

        , details.socials   |> List.map (\x -> (x.name ++ ": " ++ x.detail) |> text >> List.singleton
                                                                            |> a [class "social-link", href x.detail]
                                        )
                            |> div []
    ]

