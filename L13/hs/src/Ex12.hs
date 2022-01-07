module Ex12 where
import qualified Simple as P

-- makes it easier in the console
runParser = P.runParser

char :: Char -> P.Parser Char
char c = P.satisfies (\x -> x == c)

digit :: P.Parser Char
digit = P.satisfies (\x -> elem x ['0'..'9'])

-- don't try string' "", I don't know how to make a success/failure only parser without inner, it works otherwise
string' :: String -> P.Parser String
--strinh' "" = parserSuccess
string' (c:cs) =
    if cs == "" then
        P.pMap (\x -> [x]) (char c)
    else
        P.pMap (\(x, y) -> x:y) (P.andThen (char c) (string' cs))

number :: P.Parser Int
number = P.pMap read (P.some digit)

pThen1 :: P.Parser a -> P.Parser b -> P.Parser b
pThen1 pa pb = P.Parser inner where
  inner "" = P.Error "End of input"
  inner input = 
    case P.runParser pa input of
      P.Success a rest -> 
        case P.runParser pb rest of
          P.Success b remaining -> P.Success b remaining
          P.Error err -> P.Error err
      P.Error err -> P.Error err

pThen2 :: P.Parser a -> P.Parser b -> P.Parser b
pThen2 pa pb = P.pMap (\(x, y) -> y) (P.andThen pa pb)
