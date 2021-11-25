module Ex8_14_4 where

average :: [Int] -> Float
average l =
    let
        averageHelper :: Int -> [Int] -> Float
        averageHelper acc [] = fromIntegral acc / fromIntegral (length l)
        averageHelper acc (x:xs) = averageHelper (acc + x) xs
    in
        averageHelper 0 l