import Data.List
import Data.Maybe
import Data.Char

encode1 i a | elem a alphabet && fromJust ((elemIndex a alphabet)) + i + 1 == 0 = last alphabet
            | elem a alphabet = last $ take (mod (fromJust ((elemIndex a alphabet)) + i + 1) (length alphabet)) alphabet
            | otherwise = a
            where alphabet = ['a'..'z']++['A'..'Z']

encode i list = map (encode1 i) list
decode i list = map (encode1 (-i)) list

tryToBreak (-1) wordsLower wlist = -1
tryToBreak i wordsLower wlist | elem False (map (`elem` wlist) (map (decode i) wordsLower)) = tryToBreak (i - 1) wordsLower wlist
                              | otherwise = i

breakCesar coded = do
    contents <- readFile "slowa-utf8.txt"
    let alphabet = ['a'..'z']++['A'..'Z']
    let wlist = lines contents
    let wordsLower = map (map toLower) (words coded)
    if (tryToBreak ((length alphabet) - 1) wordsLower wlist) == -1
    then print "Failed to break"
    else print ( "Succeed! Text: " ++ (decode (tryToBreak ((length alphabet) - 1) wordsLower wlist) coded))
