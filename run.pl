% CA341 Assignment 2
% Luke Whelan: 20463814
% Cian Sullivan: 20412726
% Binary Tree Implemented making refrence from David Sinclairs CA208 course notes

binaryTree(X, Left, Right).

% Insert Predicate
insert(X, nil, binaryTree(X, nil, nil)). % base case if tree is empty insert it as node
insert(X, binaryTree(Node, Left, Right), binaryTree(Node, NLeft, Right)) :- % insert left if x less than or equal to node
	X =< Node, insert(X, Left, NLeft).
insert(X, binaryTree(Node, Left, Right), binaryTree(Node, Left, NRight)) :- % otherwise insert right
	insert(X, Right, NRight).

% Search Predicate
search(X, binaryTree(X, Left, Right)).
search(X, binaryTree(Node, Left, Right)) :- 
	X =< Node, search(X, Left).

search(X, binaryTree(Node, Left, Right)) :-
	search(X, Right).

% Inorder Predicate
inorder(binaryTree(_,Left,_), X) :- 
	inorder(Left,X).
inorder(binaryTree(X,_,_), X).
inorder(binaryTree(_,_,Right), X) :- 
	inorder(Right,X).

% Preorder Predicate
preorder(binaryTree(X, _, _), X).
preorder(binaryTree(_, Left, _), X) :-
	preorder(Left, X).
preorder(binaryTree(_, _, Right), X) :-
	preorder(Right, X).

% Postorder Predicate
postorder(binaryTree(_, Left, _), X) :-
	postorder(Left, X).
postorder(binaryTree(_, _, Right), X) :-
	postorder(Right, X).
postorder(binaryTree(X, _, _), X).
