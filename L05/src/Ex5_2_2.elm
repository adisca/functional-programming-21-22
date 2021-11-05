module Ex5_2_2 exposing (..)
import List exposing (foldl, map)

all : (a -> Bool) -> List a -> Bool
all pred l =
    l
    |> map pred
    |> foldl (\a b -> a && b) True

any : (a -> Bool) -> List a -> Bool
any pred l =
    l
    |> map pred
    |> foldl (\a b -> a || b) False
