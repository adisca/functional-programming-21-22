module Ex5_2_1 exposing (..)

applyTwice f x = (f >> f) x

inc x = x + 1
triple x = x * 3

-- applyTwice (inc >> triple) x == triple (inc (triple (inc x)))
--
-- applyTwice (inc >> triple) 1 = triple (inc (triple (inc 1))) = triple (inc (triple 2)) =
-- = triple (inc 6) = triple 7 = 21
