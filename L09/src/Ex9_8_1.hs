module Ex9_8_1 where

cycl :: [a] -> [a]
cycl l = l ++ (cycl l)
