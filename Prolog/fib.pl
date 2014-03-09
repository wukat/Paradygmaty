fib(0,0).
fib(1,1).
fib(Number, Result) :-
	Number > 1,
	NewNumber is Number - 1,
	fib(NewNumber, TempResult),
	NewNumber1 is Number - 2,
	fib(NewNumber1, TempResult1),
	Result is TempResult + TempResult1.