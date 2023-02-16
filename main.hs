import Data.List ( intercalate )
import Data.Char ( toLower, toUpper )

lowercase :: [Char] -> [Char]
lowercase s = [ toLower c | c <- s ]

uppercase :: [Char] -> [Char]
uppercase s = [ toUpper c | c <- s ]

substring :: Int -> Int -> [Char] -> [Char]
substring start end text = take (end - start) (drop start text)

join :: [a] -> [[a]] -> [a]
join = intercalate


casePascalMap :: [Char] -> [Char]
casePascalMap v | null v    = ""
                | otherwise = uppercase (substring 0 1 v) ++ lowercase (substring 1 (length v) v)

casePascal :: [Char] -> [Char]
casePascal s = join "" (map casePascalMap (words s))


caseSnakeMap :: [Char] -> [Char]
caseSnakeMap = lowercase

caseSnake :: [Char] -> [Char]
caseSnake s = join "-" (map caseSnakeMap (words s))


caseCamelMap :: [Char] -> [Char]
caseCamelMap v | null v    = ""
               | otherwise = lowercase (substring 0 1 v) ++ uppercase (substring 1 (length v) v)

caseCamel :: [Char] -> [Char]
caseCamel s = do
    let r = join "" (map casePascalMap (words s))
    lowercase (substring 0 1 r) ++ substring 1 (length r) r


main = do
    input <- getLine

    putStrLn (casePascal input)
    putStrLn (caseSnake  input)
    putStrLn (caseCamel  input)

    return ()
