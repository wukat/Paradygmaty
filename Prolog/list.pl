trzeci([A,B,C|Reszta],C).
czwarty([A,B,C,D|Reszta],D).

porownaj34(X) :-
    trzeci(X,Trzeci),
    czwarty(X,Czwarty),
    Czwarty = Trzeci,
    write('Tak').

porownaj34(X) :-
    trzeci(X,Trzeci),
    czwarty(X,Czwarty),
    Czwarty \= Trzeci,
    write('Nie').


