import Data.Char
import Control.Monad

getPoint letter
    | letter2 `Prelude.elem` "AEINORSWZ" = 1
    | letter2 `Prelude.elem` "CDKLMPTY"  = 2
    | letter2 `Prelude.elem` "BGHJŁU"    = 3
    | letter2 `Prelude.elem` "ĄĘFÓŚŻ"    = 5
    | letter2 `Prelude.elem` "Ć"         = 6
    | letter2 `Prelude.elem` "Ń"         = 7
    | letter2 `Prelude.elem` "Ź"         = 9
    | otherwise                          = 0
    where letter2 = toUpper letter

getPointsForWord word = Prelude.foldr (+) 0 $ Prelude.map getPoint word


main = forever $ do
  contents <- readFile "slowa-utf8.txt"
  let wlist = lines contents
  input <- getLine
  if ((Prelude.map toLower input) `elemSpecial` wlist)
  then print $ getPointsForWord input
  else print "Wrong word"

elemSpecial [] _ = False
elemSpecial _ [] = False
elemSpecial word (first : list)
    | word == first              = True
    | head word < head first     = False
    | otherwise = elemSpecial word list
