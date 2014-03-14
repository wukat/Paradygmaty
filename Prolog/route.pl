p(a,b). %połączenie
p(b,c).
p(b,d).
p(a,d).

route(A,B) :-
	p(A,B).

route(A,B) :-
    p(A,X),
    route(X,B),
    write(A),
    write('->'),
    write(X), 
    nl,
    write(X),
    write('->'),
    write(B).