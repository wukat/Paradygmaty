porownaj(Lista) :-
    [_,_,C,D|_] = Lista,
    C = D,
    write('Tak').

porownaj(Lista) :-
    [_,_,C,D|_] = Lista,
    C \= D,
    write('Nie').

zamien(Lista, X) :-
	[A, B, C, D|Reszta] = Lista,
	append([A,B,D,C], Reszta, X).

nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.

a2b([],[]).
a2b([a|Ta],[b|Tb]) :- 
   a2b(Ta,Tb).

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).

nalezy1(X,L) :-
	sklej(_,[X|_],L).

ostatni1(Element,Lista) :- %z uzyciem sklej
	sklej(_,[Element], Lista).

ostatni(Element, [Element]).
ostatni(Element, Lista) :- %bez sklej
	[_|Reszta] = Lista,
	ostatni(Element,Reszta).