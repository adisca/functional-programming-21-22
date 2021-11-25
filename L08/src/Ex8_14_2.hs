module Ex8_14_2 where

infixl 4 !&

x !& y = if x == y && y == True then False else True
