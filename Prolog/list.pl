porownaj(List) :-
    [A,B,C,D|Rest] = List,
    C = D,
    write('Tak').

porownaj(List) :-
    [A,B,C,D|Rest] = List,
    C \= D,
    write('Nie').

zamien(List, X) :-
	[A, B, C, D|Rest] = List,
	append([A,B,D,C], Rest, X).
