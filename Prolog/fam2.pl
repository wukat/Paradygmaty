rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).
rodzic(kasia,eliza).

kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).

mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).

ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

brat(X,Y) :-
	mezczyzna(X),
	rodzic(Z,X),
	rodzic(Z,Y),
	X \= Y.

siostra(X,Y) :-
	kobieta(X),
	rodzic(Z,X),
	rodzic(Z,Y),
	X \= Y.

babcia(X,Y) :-
	matka(X,Z),
	rodzic(Z,Y).

dziadek(X,Y) :-
	ojciec(X,Z),
	rodzic(Z,Y).

przodek(X,Y) :-
	rodzic(X,Y).

przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

%potomek(X,Y) :-
	%rodzic(Y,X).

%potomek(X,Z) :-
	%rodzic(Z,Y),
	%potomek(X,Y).

potomek(X,Y) :-
	przodek(Y,X).

krewny(X,Y) :-
	przodek(Z,Y),
	przodek(Z,X),
	X \= Y.

