-- CA341 Assignment --
-- Luke Whelan: 20463814 --
-- Cian Sullivan: 20412726 --

-- Defining the Binary Tree type constructer --
data Btree t = Empty | Node Int (Btree t)(Btree t)
                 deriving (Eq, Ord, Show)

-- Creating a sample tree.
myTree = Node 5 Empty Empty

-- Define Leaf Node --
leaf x = Node x Empty Empty

-- Adds an integer x into a binary tree T to give a binary tree R --
insert :: Int -> Btree t -> Btree t
insert a Empty = leaf a
insert x (Node a left right)   
    | x < a  = Node a (insert x left) right  
    | otherwise  = Node a left (insert x right)

-- A function which makes a tree.
makeTree :: [Int] -> Btree t
makeTree [] = Empty
makeTree [x] = leaf x
makeTree (x:xs) = insert x (makeTree xs)

-- A function which lists the nodes of the binary tree using pre order traversal.
pre_order :: Btree a -> [Int]
pre_order Empty = []
pre_order (Node x left right) = [x] ++ pre_order left ++ pre_order right

-- A function which lists the nodes of the binary tree using in order traversal.
in_order :: Btree a -> [Int]
in_order Empty = []
inorder (Node x left right) = inorder left ++ [x] ++ inorder right

-- A function which lists the nodes of the binary tree using post order traversal.
post_order :: Btree a -> [Int]
post_order Empty = []
post_order (Node x left right) = pre_order left ++ pre_order right ++ [x]

-- A function which returns true if n is contained in the binary tree.
search :: Int -> Btree t -> Bool
search n Empty = False
search n (Node x left right)
    | x == n = True
    | n < x = search n left
    | otherwise = search n right