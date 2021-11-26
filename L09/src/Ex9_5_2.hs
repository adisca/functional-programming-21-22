module Ex9_5_2 where

-- take 3 fct

-- fibs = 0:1:(zipWith (+) fibs (tail fibs))
-- 0:1:(zipWith (+) (0:1:(zipWith (+) fibs (tail fibs))) (tail (0:1:(zipWith (+) fibs (tail fibs)))))
-- 0:1:(zipWith (+) [0,1] (tail [0, 1]))
-- 0:1:(zipWith (+) [0,1] [1])
-- 0:1:[1]
-- [0, 1, 1]

-- powsOf2 = 2:(map (*2) powsOf2)
-- 2:(map (*2) (2:(map (*2) (2:(map (*2) powsOf2)))))
-- 2:(map (*2) (2:(map (*2) [2])))
-- 2:(map (*2) (2:[4]))
-- 2:(map (*2) [2, 4])
-- 2:[4, 8]
-- [2, 4, 8]

-- primes = sieve [2..] where
--     sieve (x:xs) = x:sieve [ y | y <- xs, mod y x /= 0]
-- 2:sieve [3, 5]
-- 2:3:sieve [5]
-- 2:3:5
-- [2, 3, 5]
