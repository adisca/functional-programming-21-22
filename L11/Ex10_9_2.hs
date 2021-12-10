module Ex_10_9_2 where


class YesNo a where
    yesno :: a -> Bool
instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False