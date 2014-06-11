import Data.Char
import Data.Set
import Control.Monad

getPoint letter
    | letter2 `elem` "AEINORSWZ" = 1
    | letter2 `elem` "CDKLMPTY" = 2
    | letter2 `elem` "BGHJŁU" = 3
    | letter2 `elem` "ĄĘFÓŚŻ" = 5
    | letter2 `elem` "Ć" = 6
    | letter2 `elem` "Ń" = 7
    | letter2 `elem` "Ź" = 9
    | otherwise = 0
    where letter2 = toUpper letter

getPointsForWord word = Prelude.foldr (+) 0 $ Prelude.map getPoint word


main = forever $ do
  contents <- readFile "slowa-utf8.txt"
  let wlist =  fromList $ lines contents
  input <- getLine
  if (member (Prelude.map toLower input) wlist)
  then print $ getPointsForWord input
  else print "Wrong word"




