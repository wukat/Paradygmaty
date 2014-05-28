data T a = Empty | Node a (T a) (T a)
           deriving (Eq)

instance Show a => Show (T a) where
                show Empty = "Empty"
                show (Node val Empty Empty) = "Node " ++ show val ++ " Empty Empty"
                show (Node val left Empty) = "Node " ++ show val ++ " (" ++ show left ++ ") Empty"
                show (Node val Empty right) = "Node " ++ show val ++ " Empty (" ++ show right ++ ")"
                show (Node val left right) = "Node " ++ show val ++ " (" ++ show left ++ ") (" ++ show right ++ ")"

data STree a = SEmpty | SLeaf a | SBranch a (STree a) (STree a)
          deriving (Show)

convert Empty = SEmpty
convert (Node val Empty Empty) = SLeaf val
convert (Node val left right) = SBranch val (convert left) (convert right)

convB SEmpty = Empty
convB (SLeaf val) = Node val Empty Empty
convB (SBranch val left right) = Node val (convB left) (convB right)

insert el Empty = Node el Empty Empty
insert el tree@(Node val left right)
               | val == el = tree
               | val > el = Node val (insert el left) right
               | val < el = Node val left (insert el right)

empty tree = tree == Empty

search el Empty = False
search el tree@(Node val left right)
               | val == el = True
               | val > el = search el left
               | val < el = search el right

isBinary :: T a -> Bool
isBinary _ = True

isBalanced Empty = True
isBalanced tree@(Node val Empty right@(Node valR leftR rightR))
                | (leftR /= Empty || rightR /= Empty) = False
isBalanced tree@(Node val left@(Node valL leftL rightL) Empty)
                | (leftL /= Empty || rightL /= Empty) = False
isBalanced tree@(Node val left right) = isBalanced left && isBalanced right

vlr Empty = []
vlr tree@(Node val left right) = [val] ++ vlr left ++ vlr right

lvr Empty = []
lvr tree@(Node val left right) = lvr left ++ [val] ++ lvr right

lrv Empty = []
lrv tree@(Node val left right) = lrv left ++ lrv right ++ [val]

vrl Empty = []
vrl tree@(Node val left right) = [val] ++ vrl right ++ vrl left

rvl Empty = []
rvl tree@(Node val left right) = rvl right ++ [val] ++ rvl left

rlv Empty = []
rlv tree@(Node val left right) = rlv right ++ rlv left ++ [val]

toString Empty = []
toString tree@(Node val left right) = (show val) ++ "(" ++ (toString left) ++ [','] ++ (toString right) ++ ")"

leaves Empty = []
leaves tree@(Node val Empty Empty) = [val]
leaves tree@(Node val left right) = leaves left ++ leaves right

nnodes Empty = 0
nnodes tree@(Node val left right) = nnodes left + nnodes right + 1

nsum Empty = 0
nsum tree@(Node val left right) = nsum left + nsum right + val

tmap op Empty = Empty
tmap op tree@(Node val left right) = Node (op val) (tmap op left) (tmap op right)

remove el Empty = Empty
remove el tree@(Node val Empty Empty)   | el == val = Empty
remove el tree@(Node val left Empty)    | el == val = left
remove el tree@(Node val Empty right)   | el == val = right
remove el tree@(Node val left right)    | el == val = Node (succVal right) left (remove (succVal right) right)
                                        | el > val = Node val left (remove el right)
                                        | otherwise = Node val (remove el left) right

succVal tree@(Node val Empty right) = val
succVal tree@(Node val left right) = succVal left

valueOf tree@(Node val _ _) = val

dumpDOT tree = "digraph G {\n" ++ dumpDOT2 tree ++ "}"
dumpDOT2 tree@(Node val left right) | left /= Empty && right /= Empty = (show val) ++ "->" ++ (show (valueOf left)) ++ "\n"
                                    ++ (show val) ++ "->" ++ (show (valueOf right)) ++ "\n" ++ (dumpDOT2 left) ++ (dumpDOT2 right)
                                    | left /= Empty && right == Empty = (show val) ++ "->" ++ (show (valueOf left)) ++ "\n" ++ (dumpDOT2 left)
                                    | right /= Empty && left == Empty = (show val) ++ "->" ++ (show (valueOf right)) ++ "\n" ++ (dumpDOT2 right)
                                    | otherwise = []

fromList list = foldr insert Empty $ reverse list

getLevel level Empty = []
getLevel 0 tree@(Node val _ _) = [val]
getLevel level tree@(Node _ left right) | level > 0 = getLevel (level - 1) left ++ getLevel (level - 1) right

makeLayout Empty = Empty
makeLayout tree = fst (makeLayout2 tree 0 0)
makeLayout2 tree@(Node val Empty Empty) count level  = ((Node ((count, level), val) Empty Empty), count)
makeLayout2 tree@(Node val left Empty) count level   = (Node ((count2 + 1, level), val) (fst (makeLayout2 left count (level + 1))) Empty, count2)
                                                     where count2 = snd (makeLayout2 left count (level + 1))
makeLayout2 tree@(Node val Empty right) count level  = (Node ((count, level), val) Empty (fst (makeLayout2 right (count + 1) (level + 1))), count)
makeLayout2 tree@(Node val left right) count level   = (Node ((count2 + 1, level), val)
                                                     (fst (makeLayout2 left count (level + 1)))
                                                     (fst (makeLayout2 right (count2 + 2) (level + 1))), count2)
                                                     where count2 = snd (makeLayout2 left count (level + 1))

enumerateLevel Empty = Empty
enumerateLevel tree = enumerateLevel2 tree 0
enumerateLevel2 Empty _ = Empty
enumerateLevel2 tree@(Node val left right) level = Node (val, level) (enumerateLevel2 left (level + 1)) (enumerateLevel2 right (level + 1))


