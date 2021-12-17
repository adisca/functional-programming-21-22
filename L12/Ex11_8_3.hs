module Ex11_8_3 where


main :: IO ()
main = do
    putStrLn "Please enter your weight:"
    line <- getLine
    let weight = (read line :: Integer)
    putStrLn "Please enter your height:"
    line <- getLine
    let height = (read line :: Double)
    let bmi = (fromIntegral weight) / (height * height)
    putStrLn ("Your BMI is: " ++ show bmi)
