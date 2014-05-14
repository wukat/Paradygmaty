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

{-
let tree = Node 'a' Empty Empty
let tree2 = insert 'd' tree
let tree3 = insert  'e' tree2
let tree4 = insert  'b' tree3

let tree = Node 2 Empty Empty
let tree2 = insert 3 tree
let tree3 = insert  7 tree2
let tree4 = insert  4 tree3
-}
