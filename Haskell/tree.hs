data T a = Empty | Node a (T a) (T a)
           deriving (Show)

insert el Empty = Node el Empty Empty
insert el tree@(Node val left right)
               | val == el = tree
               | val > el = insert el left
               | val < el = insert el right

--empty tree = tree == Node Empty Empty Empty
