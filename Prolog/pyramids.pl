% solving pyramids

% upper one is a sum or difference of two below

% %%%%%%%%%%%%%% FIRST %%%%%%%%%%%%%%
%
%      2 		%blue - in all blue rows no repetitions
%     X X 		%blue
%    X X X		%pink - in every pink row at least one repitition
%   5 X X 4		%pink
%  X X 8 X X 	%pink
% X 1 X X 6 X	%blue
% 
% INVOCATION: pyramidSmall([2], [A, B], [C, D, E], [5, F, G, 4], [H, I, 8, J, K], [L, 1, M, N, 6, O]).


% %%%%%%%%%%%%%% SECOND %%%%%%%%%%%%%%
%
%         X				% all yellow, no limits
%        X X
%       X 2 X
%      7 X X 2
%     X X X X X
%    X 5 X X 2 X
%   5 X X 5 X X 1
%  X X 8 X X 6 X X
% 8 X X X 5 X X X 7 	%blue
%
% INVOCATION: pyramidBig([A], [B, C], [D, 2, E], [7, F, G, 2], [H, I, J, K, L], [M, 5, N, O, 2, P], [5, R, S, 5, T, U, 1],
%	[W, Y, 8, Z, Aa, 6, Ab, Ac], [8, Ad, Ae, Af, 5, Ag, Ah, Ai, 7]).

digit(1).
digit(2).
digit(3).
digit(4).
digit(5).
digit(6).
digit(7).
digit(8).
digit(9).

up(X, Y, Up) :-
	Up is X + Y,
	Up < 10;
	Up is X - Y,
	Up > 0;
	Up is Y - X,
	Up > 0.

set2RowsLowerBlue([],[_]).
set2RowsLowerBlue([U|Upper], [L|Lower]) :-
	[L1|_] = Lower,
	digit(L),
	digit(L1),
	up(L, L1, U),
	set2RowsLowerBlue(Upper, Lower),
	blueRow([L|Lower]).

set2Rows([],[_]).
set2Rows([U|Upper], [L|Lower]) :-
	[L1|_] = Lower,
	digit(L),
	digit(L1),
	up(L, L1, U),
	set2Rows(Upper, Lower).

splaszcz([Y|L], X) :- %flattern
	splaszcz(Y, Z),
	splaszcz(L, W),
	sklej(Z, W, X). %glue from list.pl
splaszcz([],[]).
splaszcz(Y, [Y]) :-
	\+ [_|_] = Y,
	Y \= [].

blueRow(Row) :-
	list_to_set(Row, Row).

pinkRow(Row) :-
	\+ list_to_set(Row, Row).

% from the top
% first argument - list length 1, second - 2, and so on
pyramidSmall(A, B, C, D, E, F) :-
	set2RowsLowerBlue(A,B),
	set2RowsLowerBlue(E,F),
	pinkRow(E),
	set2Rows(D,E),
	pinkRow(D),
	set2Rows(B,C),
	pinkRow(C),
	set2Rows(C,D),
	write(A),
	put("\n"),
	write(B),
	put("\n"),
	write(C),
	put("\n"),
	write(D),
	put("\n"),
	write(E),
	put("\n"),
	write(F), 
	put("\n"),
	fail.

pyramidBig(A, B, C, D, E, F, G, H, I) :-
	set2RowsLowerBlue(H, I),
	set2Rows(G,H),
	set2Rows(F,G),
	set2Rows(E,F),
	set2Rows(D,E),
	set2Rows(C,D),
	set2Rows(B,C),
	set2Rows(A,B),
	write(A),
	put("\n"),
	write(B),
	put("\n"),
	write(C),
	put("\n"),
	write(D),
	put("\n"),
	write(E),
	put("\n"),
	write(F),
	put("\n"),
	write(G),
	put("\n"),
	write(H),
	put("\n"),
	write(I),
	put("\n"), 
	fail.

