% on(X,Y) means that block X is directly on top of block Y.
%% on(b1,b2).   
%% on(b3,b4).   
%% on(b4,b5).   
%% on(b5,b6).

%% % just left(X,Y) means that blocks X and Y are on the table
%% % and that X is immediately to the left of Y.
%% just_left(b2,b6).   
%% just_left(b6,b7).

%my world 
on(a1, a2).
on(a2, a3).
on(a3, a4).
on(c1, c2).
on(c3, c4).
just_left(a4, a5).
just_left(a5, c2).
just_left(c1, c3).
just_left(c2, c4).

% above(X,Y) means that block X is somewhere above block Y 
% in the pile where Y occurs.
above(X,Y) :- 
	on(X,Y).

above(X,Y) :- 
	on(X,Z), 
	above(Z,Y).

% left(X,Y) means that block X is somewhere to the left 
% of block Y but perhaps higher or lower than Y.
left(X,Y) :- 
	just_left(X,Y).

left(X,Y) :- 
	just_left(X,Z), 
	left(Z,Y).

left(X,Y) :- 
	on(X,Z), 
	left(Z,Y).     % leftmost is on something.

left(X,Y) :- 
	on(Y,Z), 
	left(X,Z).     % rightmost is on something.

% right(X,Y) is the opposite of left(X,Y).
right(Y,X) :- 
	aleft(X,Y).
