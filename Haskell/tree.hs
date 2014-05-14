data T a = Empty | Node a (T a) (T a)
           deriving (Show, Eq)

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
toString tree@(Node val left right) = [val] ++ "(" ++ (toString left) ++ [','] ++ (toString right) ++ ")"

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

{-
let tree = Node 'a' Empty Empty
let tree2 = insert 'd' tree
let tree3 = insert  'e' tree2
let tree4 = insert  'b' tree3

let tree = Node 2 Empty Empty
let tree2 = insert 3 tree
let tree3 = insert  7 tree2
let tree4 = insert  4 tree3

let tree = Node 8 Empty Empty
let tree1 = insert 10 tree
let tree2 = insert 14 tree1
let tree3 = insert 13 tree2
let tree4 = insert 3 tree3
let tree5 = insert 6 tree4
let tree6 = insert 7 tree5
let tree7 = insert 4 tree6
let tree8 = insert 1 tree7

-}
