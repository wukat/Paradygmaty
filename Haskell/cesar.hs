import Data.List
import Data.Maybe

encode1 i a | elem a alphabet = last (take (mod (fromJust ((elemIndex a alphabet)) + i + 1) (length alphabet)) alphabet)
            | otherwise = a
            where alphabet = ['a'..'z']++['A'..'Z']



encode i list = map (encode1 i) list

decode1 i a | elem a alphabet = last (take (mod (fromJust ((elemIndex a alphabet)) - i + 1) (length alphabet)) alphabet)
            | otherwise = a
            where alphabet = ['a'..'z']++['A'..'Z']

decode i list = map (decode1 i) list
