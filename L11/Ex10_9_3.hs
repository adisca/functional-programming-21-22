module Ex_10_9_2 where


data Tree a = Nil | Node (Tree a) a (Tree a)

class Container c where
    hasElem :: (Eq a) => c a -> a -> Bool
    nrElems :: c a -> Int

instance Container Tree where
    hasElem Nil _ = False
    hasElem (Node l v r) e =
        (v == e) || ((hasElem l e) || (hasElem r e))

    nrElems Nil = 0
    nrElems (Node l v r) = nrElems l + nrElems r + 1

-- instance Container Maybe where
--     hasElem (Just x) e = x == e
--     hasElem _ _ = False

--     nrElems (Just _) = 1
--     nrElems _ = 0

