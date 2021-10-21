module Ex4_6_7 exposing (..)
import List exposing (foldl, map)

all : (a -> Bool) -> List a -> Bool
all pred l = foldl (\a b -> a && b) True (map (\x -> pred x) l)

any : (a -> Bool) -> List a -> Bool
any pred l = foldl (\a b -> a || b) False (map (\x -> pred x) l)
