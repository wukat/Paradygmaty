% author Wojciech Kasperek
przeniesienie(0). %define carry options
przeniesienie(1).

% adds two numbers A and B, Cyfra is sum mod 10, 0/1 is carry from previous adding, PrzenDalej is carry to next
dodajPrzenies(A, B, Cyfra, 0, PrzenDalej) :-
 	Cyfra is (A + B) mod 10,
 	PrzenDalej is (A + B) // 10.

dodajPrzenies(A, B, Cyfra, 1, PrzenDalej) :-
	Cyfra is (A + B + 1) mod 10,
 	PrzenDalej is (A + B + 1) // 10.

%   S E N D 
% + M O R E
% - - - - -
% M O N E Y
sendMoney(S, E, N, D, M, O, R, Y) :-
	L = [0,1,2,3,4,5,6,7,8,9],
	przeniesienie(M),
	M > 0, 	% it's based on knowledge from basic analysis of problem
	select(S, L, L1),
	select(M, L1, L2),
	dodajPrzenies(S, M, O, Carry3, M),
	select(O, L2, L3),
	select(E, L3, L4),
	dodajPrzenies(E, O, N, Carry2, Carry3),
	select(N, L4, L5),
	select(R, L5, L6),
	dodajPrzenies(N, R, E, Carry1, Carry2),
	select(D, L6, L7),
	dodajPrzenies(D, E, Y, 0, Carry1),
	select(Y, L7, _),
	put("\n"),
	print([' ', S, E, N, D]),
	put("\n"),
	print(['+', M, O, R, E]),
	put("\n"),
	print([M, O, N, E, Y]).

solve :-
	sendMoney(_,_,_,_,_,_,_,_).