% using list.pl

% drops 3 last elements of firt argument -> works only when first argument given
% uses sklej(A, B, C) -> C is glued A and B
drop3last(L, L1) :-
	sklej(L1, [_,_,_], L).

%drops 3 first elements of first argument, uses sklej
drop3first(L, L1) :-
	sklej([_,_,_], L1, L).

drop3firstDif(L, L1) :-
	sklej_roznicowo([_,_,_|L1] - L1, L1, L).

%drops 3 first and 3 last elements of first argument, uses sklej
drop3firstAnd3last(L, L2) :-
	sklej([_,_,_], L1, L),
	sklej(L2, [_,_,_], L1).

%chceks if number of elements is odd
nieparzysta([_|L]) :-
   parzysta(L).

%checks if number of elements is even
parzysta([]).
parzysta([_|L]) :-
	nieparzysta(L).

%checks if list is a palindrom
%using odwroc2 (reverse)
palindrom(L) :-
    odwroc2(L, L1),
    L = L1.

%without odwroc2
palindrom2([]).
palindrom2([_]).
palindrom2([X|L]) :-
    sklej(Y1, [X], L),
    palindrom2(Y1),
    !.

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

%checks if second is a subset of L
podzbior(_, []).
podzbior(L,[Y|Z]) :-
    usun(Y, L, L1), %usun removes Y from L, gives L1
    podzbior(L1,Z).

%divides list L to two, same length (+-1)
podziel(L,L1,L2) :-
	podzbior(L, L1),
	podzbior(L, L2),
	sklej(L1, L2, Z),
	permutacja2(L, Z), %permutation
	dlugosc(L1, X), %counts length of list (X is a result)
	dlugosc(L2, Y),
	X - Y < 2,
	Y - X < 2.
	
%makes list like [a,b,c] from [[a], b, [[c]]] (example)
splaszcz([],[]).
splaszcz(Y, [Y]) :-
\+ [_|_] = Y, % Y is not a list
Y \= [].
splaszcz([Y|L], X) :-
	splaszcz(Y, Z),
	splaszcz(L, W),
	sklej(Z, W, X).

% function change given value for numbers of given denominations
% first argument is amount, second change
%moneta(1). %coin 1
%moneta(2).
%moneta(5).
%moneta(0.5).
%moneta(0.2).
%moneta(0.1).
%moneta(0.05).
%moneta(0.02).
%moneta(0.01).
%no idea how to make it
%rozmien(Kwota, Wymiana) :-
%	Kwota > 0,
%	FiveB is floor(Kwota/5),
%	Wymiana = [FiveB].






	



