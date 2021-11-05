module Ex5_5_1 exposing (..)

map2: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
map2 f x y =
    case x of
        Just a ->
            case y of
                Just b -> Just (f a b)
                Nothing -> Nothing
        Nothing -> Nothing
