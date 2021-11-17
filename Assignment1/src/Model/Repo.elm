module Model.Repo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode as De


type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }


view : Repo -> Html msg
view repo =
    div [class "repo"]
    [
        repo.name   |> text >> List.singleton
                    |> h3 [class "repo-name"]

        , case repo.description of
            Just desc ->
                desc    |> text >> List.singleton
                        |> div [class "repo-description"]

            Nothing ->
                [] |> div [class "repo-description"]

        , repo.url  |> text >> List.singleton
                    |> a [href repo.url] >> List.singleton
                    |> div [class "repo-url"]

        , repo.pushedAt |> text >> List.singleton
                        |> div [class "repo-pushedAt"]

        , repo.stars    |> String.fromInt >> text >> List.singleton
                        |> div [class "repo-stars"]
    ]


sortByStars : List Repo -> List Repo
sortByStars repos =
    repos |> List.sortBy .stars >> List.reverse


{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html\_url -> url
  - pushed\_at -> pushedAt
  - stargazers\_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
    De.map5 Repo
        (De.field "name" De.string)
        (De.field "description" (De.maybe De.string))
        (De.field "html_url" De.string)
        (De.field "pushed_at" De.string)
        (De.field "stargazers_count" De.int)
