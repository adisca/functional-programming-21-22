module Ex11_8_2 where


passwords len = sequenceA (replicate len (['0'..'9'] ++ ['a'..'z'] ++ ['A'..'Z']))

-- ['0'..'9'] ++ ['a'..'z'] ++ ['A'..'Z']
