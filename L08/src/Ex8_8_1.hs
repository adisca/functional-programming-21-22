module Ex8_8_1 where

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n - 1)

-- fact 10000 takes longer on printing than calculating
-- fact 100000 takes about the same for calculating and printing
