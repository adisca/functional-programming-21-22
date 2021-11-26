module Ex9_5_1 where

twos :: [Integer]
twos = 2:twos
-- [2,2..]

rep :: t -> [t]
rep e = e:(rep e)
-- [e,e..] -- where e is given on call

fibs :: [Integer]
fibs = 0:1:(zipWith (+) fibs (tail fibs))
-- fibonacci sequence in a list, starting from 0; infinite length

count :: [Integer]
count = 1:(map (+1) count)
-- [1..]

powsOf2 :: [Integer]
powsOf2 = 2:(map (*2) powsOf2)
-- sequence of the powers of 2 in a list, starting from 2; infinite length

oneList :: [[Integer]]
oneList = [1]:(map (1:) oneList)
-- [[1],[1,1],[1,1,1],[1,1,1,1]...]

primes :: [Integer]
primes = sieve [2..] where
    sieve (x:xs) = x:sieve [ y | y <- xs, mod y x /= 0]
-- sequence of the prime numbers in a list, starting from 2; infinite length
