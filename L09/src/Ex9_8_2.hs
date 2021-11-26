module Ex9_8_2 where

series :: [[Int]]
series = seriesH 1 where
        seriesH x = [x,(x - 1)..1] : seriesH (x + 1)    
