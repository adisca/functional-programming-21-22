
module CoinFlipTests exposing (..)

import CoinFlip
import Expect exposing (Expectation)
import Test exposing (..)
import Fuzz
import Test.Html.Query as Q
import Test.Html.Selector as S
import Html.Attributes as Attr

initialViewTest : Test
initialViewTest =
    test "Initial text of CoinFlip" <|
        \_ ->
            CoinFlip.view CoinFlip.initModel
                |> Q.fromHtml
                |> Q.findAll [ S.text "Press the flip button to get started" ]
                |> Q.count (Expect.atLeast 1)

