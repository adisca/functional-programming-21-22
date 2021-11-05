module ExTests exposing (..)

import Ex5_8_1
import Ex5_8_2
import Ex5_8_3
import Ex5_8_4
import Ex5_8_5
import Exercises exposing (..)
import Theme
import Expect exposing (Expectation)
import Test exposing (..)
import Fuzz


suite : Test
suite =
  describe "All ex modules"
    [
      describe "Ex5_8_1.countVowels"
        [ test "Test 1:0 vowels" <|
           \_ -> Expect.equal 0 (Ex5_8_1.countVowels "BnLts")
        , test "Test 2: vowels upper and lower case" <|
           \_ -> Expect.equal 5 (Ex5_8_1.countVowels "AcoopIzye")
        ]
    , describe "Ex5_8_3.usersWithPhoneNumbers"
      [ test "First example" <|
          \_ ->
            let
              user1 = makeUser "john00" "johndoe@gmail.com" "John" "Doe" (Just "0123456789")
              user2 = makeUser "jane12" "jane12@yahoo.com" "Jane" "Doe" Nothing
              user3 = makeUser "jacob14" "jacobh@yahoo.com" "Jacob" "Hunt" (Just "345870481")
            in
              Expect.equal [user1.email, user3.email] <| Ex5_8_3.usersWithPhoneNumbers [user1, user2, user3]
      , test "Test 2" <|
          \_ ->
            let
              user1 = makeUser "john00" "johndoe@gmail.com" "John" "Doe" (Just "0123456789")
              user2 = makeUser "jane12" "jane12@yahoo.com" "Jane" "Doe" Nothing
              user3 = makeUser "jacob14" "jacobh@yahoo.com" "Jacob" "Hunt" (Just "345870481")
              user4 = makeUser "jacob14" "jacobh@yahoo.com" "Jacob" "Hunt" (Just "55")
              user5 = makeUser "jacob14" "jacobh@yahoo.com" "Jacob" "Hunt" Nothing
            in
              Expect.equal [user1.email, user3.email, user4.email] <|
                    Ex5_8_3.usersWithPhoneNumbers [user1, user2, user3, user4, user5]
      ]
    , describe "Ex5_8_2.changePreferenceToDarkTheme"
      [ test "First example" <|
          \_ ->
            let
              config1 = AccountConfiguration Theme.Light True False
              config1Dark = AccountConfiguration Theme.Dark True False
              config2 = AccountConfiguration Theme.Dark False False
              config3 = AccountConfiguration Theme.Dark False True
            in
              Expect.equal [config1Dark, config2, config3] <| Ex5_8_2.changePreferenceToDarkTheme [config1, config2, config3]
      , test "Test 2: do nothing" <|
          \_ ->
            let
              config1 = AccountConfiguration Theme.Dark False False
              config2 = AccountConfiguration Theme.Dark False True
            in
              Expect.equal [config1, config2] <| Ex5_8_2.changePreferenceToDarkTheme [config1, config2]
      , test "Test 3: change all" <|
          \_ ->
            let
              config1 = AccountConfiguration Theme.Light False False
              config2 = AccountConfiguration Theme.Light False True
              config3 = AccountConfiguration Theme.Light True True
              config1Dark = AccountConfiguration Theme.Dark False False
              config2Dark = AccountConfiguration Theme.Dark False True
              config3Dark = AccountConfiguration Theme.Dark True True
            in
              Expect.equal [config1Dark, config2Dark, config3Dark] <|
                            Ex5_8_2.changePreferenceToDarkTheme [config1, config2, config3]
      ]
    , describe "Ex5_8_4.chunks"
      [
        test "Test 1" <|
            \_ ->
              let
                  list = [1, 2, 3, 4, 5, 6]
                  chunks_nb = 2
                  result = [[1, 2], [3, 4], [5, 6]]
              in
                    Expect.equal result <| Ex5_8_4.chunks chunks_nb list
        , test "Test 2" <|
            \_ ->
              let
                  list = [1, 2, 3, 4]
                  chunks_nb = 3
                  result = [[1, 2, 3], [4]]
              in
                    Expect.equal result <| Ex5_8_4.chunks chunks_nb list
        , test "Test 3: empty list" <|
            \_ ->
              let
                  list = []
                  chunks_nb = 2
                  result = []
              in
                    Expect.equal result <| Ex5_8_4.chunks chunks_nb list
        , test "Test 4" <|
            \_ ->
              let
                  list = [1, 2, 1, 3, 4, 1, 5]
                  chunks_nb = 1
                  result = [[1], [2], [1], [3], [4], [1], [5]]
              in
                    Expect.equal result <| Ex5_8_4.chunks chunks_nb list
        , test "Test 5: nb of chunks 0" <|
            \_ ->
              let
                  list = [3, 2, 1]
                  chunks_nb = 0
                  result = []
              in
                    Expect.equal result <| Ex5_8_4.chunks chunks_nb list
      ]
    , describe "Ex_5_8_5.splitLast"
      [
        test "Test 1" <|
            \_ ->
            let
                list = [1, 2, 3]
                result = Just ([1, 2], 3)
            in
                Expect.equal result <| Ex5_8_5.splitLast list
        , test "Test 2" <|
            \_ ->
            let
                list = [1]
                result = Just ([], 1)
            in
                Expect.equal result <| Ex5_8_5.splitLast list
        , test "Test 3" <|
            \_ ->
            let
                list = []
                result = Nothing
            in
                Expect.equal result <| Ex5_8_5.splitLast list
        , fuzz (Fuzz.list Fuzz.int) "List.length should always be positive" <|
              -- This anonymous function will be run 100 times, each time with a
              -- randomly-generated fuzzList value.
              \fuzzList ->
                  let
                      verifySplitLast : List a -> Maybe (List a, a) -> Expectation
                      verifySplitLast expected result =
                          case result of
                              Just a -> ((Tuple.first a) ++ [Tuple.second a]) |> Expect.equal expected
                              Nothing -> Expect.equal 0 <| List.length expected
                  in
                      fuzzList
                          |> Ex5_8_5.splitLast
                          |> verifySplitLast fuzzList
      ]
    ]
