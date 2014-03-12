delta(A, B, C, Wynik) :-
	Wynik is B*B - 4*A*C.

kwadrat(A, B, C, Wynik) :-
	delta(A,B,C,Delta),
	rozwiaz(A,B,Delta,Wynik,X).

rozwiaz(A,B,0,Wynik,0) :-
	Wynik is -B / (2*A).

rozwiaz(A,B,Delta,Wynik,0) :-
	Delta > 0,
	Wynik is (-B - sqrt(Delta)) / (2*A).

rozwiaz(A,B,Delta,Wynik,1) :-
	Delta > 0,
	Wynik is (B - sqrt(Delta)) / (2*A).
