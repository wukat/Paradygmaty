% author Wojciech Kasperek
cyfra(0).
cyfra(1).
cyfra(2).
cyfra(3).
cyfra(4).
cyfra(5).
cyfra(6).
cyfra(7).
cyfra(8).
cyfra(9).

przeniesienie(0). %define carry options
przeniesienie(1).

% adds two numbers A and B, Cyfra is sum mod 10, 0/1 is carry from previous adding, PrzenDalej is carry to next
dodajPrzenies(A, B, Cyfra, 0, PrzenDalej) :-
	cyfra(A),
	cyfra(B),
 	Cyfra is (A + B) mod 10,
 	Cyfra \= A,
 	Cyfra \= B,
	A \= B,
 	PrzenDalej is (A + B) // 10.

dodajPrzenies(A, B, Cyfra, 1, PrzenDalej) :-
	cyfra(A),
	cyfra(B),
 	Cyfra is (A + B + 1) mod 10,
 	Cyfra \= A,
 	Cyfra \= B,
 	A \= B,
 	PrzenDalej is (A + B + 1) // 10.

%   S E N D 
% + M O R E
% - - - - -
% M O N E Y
sendMoney(S, E, N, D, M, O, R, Y) :-
	przeniesienie(M),
	M > 0, 	% it's based on knowledge from basic analysis of problem
	dodajPrzenies(S, M, O, Carry3, M),
	dodajPrzenies(E, O, N, Carry2, Carry3),
	S \= E, S \= N, M \= N, M \= E, 
	dodajPrzenies(N, R, E, Carry1, Carry2),
	S \= R, 
	dodajPrzenies(D, E, Y, 0, Carry1),
	S \= D, S \= Y,
	M \= R, M \= D, M \= Y,
	O \= R, O \= D, O \= Y,
	N \= D, N \= Y,
	R \= D, R \= Y,
	put("\n"),
	print([' ', S, E, N, D]),
	put("\n"),
	print(['+', M, O, R, E]),
	put("\n"),
	print([M, O, N, E, Y]).

solve :-
	sendMoney(_,_,_,_,_,_,_,_).