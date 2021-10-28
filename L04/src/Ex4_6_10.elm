module Ex4_6_10 exposing (..)
import List exposing (foldl, length, reverse)

enumerate : List a -> List (Int, a)
enumerate l = reverse (foldl (\a b -> (length b, a) :: b) [] l)
-- reverse is not really needed, just to make it prettier
