module Ex8_14_1 where

sudan :: Int -> Int -> Int -> Int
sudan n x y =
    if n == 0 then
        x + y
    else
        if n > 0 && y == 0 then
            x
        else
            sudan (n - 1) (sudan n x (y - 1)) (y + (sudan n x (y - 1)))
