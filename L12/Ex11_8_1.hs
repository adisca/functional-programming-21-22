module Ex11_8_1 where

data Tree a = Nil | Node (Tree a) a (Tree a)

instance Functor Tree where
    fmap _ Nil = Nil
    fmap f (Node l v r) = Node (fmap f l) (f v) (fmap f r)

instance Show (Tree Integer) where
    show Nil = "Nil"
    show (Node l v r) = "(Node " ++ (show l) ++ " " ++ (show v) ++ " " ++ (show r) ++ ")"
