% using list.pl

% drops 3 last elements of firt argument
% uses sklej(A, B, C) -> C is glued A and B
drop3last([_, _, _], []).
drop3last([X|L], L1) :-
	truncate3last(L, Y),
	sklej([X], Y, L1).

%drops 3 first elements of first argument, uses sklej
drop3first([A, B, C|Rest], L1) :-
	sklej([A, B, C], L1, [A, B, C|Rest]).

%drops 3 first and 3 last elements of first argument, uses sklej
drop3firstAnd3last([_|L], L2) :-
    sklej(Y, [_], L),
    [_|Y1] = Y,
    sklej(Y2, [_], Y1),
    [_|Y3] = Y2,
    sklej(L2, [_], Y3).

%chceks if number of elements is odd
nieparzysta([_]).
nieparzysta([_, _|L]) :-
   nieparzysta(L).

%checks if number of elements is even
parzysta(L) :-
	\+ nieparzysta(L).

%checks if list is a palindrom
%using odwroc2 (reverse)
palindrom(L) :-
    odwroc2(L, L1),
    L = L1.

%without odwroc2
palindrom2([]).
palindrom2([_]).
palindrom2([X|L]) :-
    sklej(Y1, [Z], L),
    X = Z,
    palindrom2(Y1).

%shifts L1 in that way L1 = [1 2 3], L2 = [3 1 2]
przesun([X|L1], L2) :-
    sklej(L1, [X], L2).

%translates numbers (0-9) to words
znaczy(0,zero).   %znaczy = means
znaczy(1,jeden).
znaczy(2,dwa).    
znaczy(3,trzy).
znaczy(4,cztery). 
znaczy(5,piec).
znaczy(6,szesc).  
znaczy(7,siedem).
znaczy(8,osiem).  
znaczy(9,dziewiec).
przeloz([], []).
przeloz([Y|L],[Z|X]) :-
	znaczy(Y, Z),
	przeloz(L, X).



