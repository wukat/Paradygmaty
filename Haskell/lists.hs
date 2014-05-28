-- author wukat --
-- head, lebgth, take, map, ++, last, elem --

headMy (first : _) = first

lengthMy [] = 0
lengthMy (first : others) = 1 + length(others)

-- type mismatch in takeMy ??
takeMy _ [] = []
takeMy n _ | n < 1 = []
takeMy i (first : others) = first : takeMy (i - 1) others

mapMy _ [] = []
mapMy x (first : others) = x first : mapMy x others

(+++) [] x = x
(+++) (el : []) x = el : x
(+++) (first : others)  x = (first : (others +++ x))

lastMy [el] = el
lastMy (first : others) = lastMy others

elemMy x [] = False
elemMy x (first : others) | x == first = True
                          | otherwise = elemMy x others


sumL list = foldr (+) 0 list
productL list = foldr (*) 1 list
reverseL list = foldr (\x -> (++ [x])) [] list
andL list = foldr (&&) True list
orL list = foldr (||) False list
headL list = foldl (\x -> \y -> x) (head list) []
lastL list = foldl (\x -> \y -> x) (last list) []

headL' (first : _) = foldr (\x -> \y -> x) (first) []
headL'' (first : _) = foldr (\x -> \y -> (id x)) (first) []

