porownaj([_,_,D,D|_]).  %trzeci z czwartym
zamien([A, B, C, D|Reszta], [A, B, D, C|Reszta]).

%CODE BELOW IS NOT MINE, only for studying (from http://ai.ia.agh.edu.pl/wiki/pl:prolog:prolog_lab:listy1)
% comments below explains how clauses works (in Polish)

nalezy(X,[X|_]). % jesli pierwszy element
nalezy(X,[_|Yogon]) :- %rekurencyjnie, sprawdzamy całą listę aż X będzie pierwszy
	nalezy(X,Yogon).

dlugosc([],0).  %pusta zwraca 0
dlugosc([_|Ogon],Dlug) :- %wywolujemy rekurencyjnie krotsza o 1 
	dlugosc(Ogon,X), %i wracajac zwiekszamy dlugosc
	Dlug is X+1.

a2b([],[]). %dziala tylko dla stalych a i b
a2b([a|Ta],[b|Tb]) :- %zwraca true jesli jedna lista tylko [a,...a] a druga [b...b]
   a2b(Ta,Tb).

sklej([],X,X). %łączy listy do jednej, coś jak APPEND/3
				%tutaj konczy gdy pierwsza jest pusta
sklej([X|L1],L2,[X|L3]) :- %3 argument to poczatek (czyli X) oraz sklejenie konca pierwszego i calego drugiego argumentu
	sklej(L1,L2,L3).

nalezy1(X,L) :- %druga wersja
	sklej(_,[X|_],L). %nalezy X do L jeśli da się skleić coś + Xcoś żeby dostać L

%%%%%%%%%%%% HERE IS MY PART %%%%%%%%%%
ostatni1(Element,Lista) :- %z uzyciem sklej
	sklej(_,[Element], Lista). %jeśli da się skleić coś z Element, to wiadomo że będzie osatnim
%bez sklej
ostatni(Element, [Element]). %rekurencyjnie, ostatni jeśli Element jest jedyny w liście
ostatni(Element, Lista) :- 
	[_|Reszta] = Lista, % _ - pierwszy element, Reszta - ogon, sukcesywnie zmniejszamy o jeden
	ostatni(Element,Reszta). % i tak do skutku, jeśli zostanie tylko Element w liscie to true

%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%

dodaj(X,L,[X|L]). %dodajemy L do X 

% usuniecie X z listy, trzeci argument - lista bez X
usun(X,[X|Reszta],Reszta). %tu - jesli X jest pierwszym elementem, to łatwo
usun(X,[Y|Ogon],[Y|Reszta]) :- %jesli nie jest pierwszym, to wyrzucamy jeden i rekurencyjnie
	usun(X,Ogon,Reszta). % przy powrotach z powrotem będą dodawały się wyrzucane elementy

wstaw(X,L,Duza) :- %wstawienie X do L (rezultat - Duża) to to samo co usunięcie z X z Duzej
	usun(X,Duza,L).

nalezy2(X,L) :- %X nalezy do L
	usun(X,L,_). %równoznaczne z tym, że można usunąć X z L

zawiera(S,L) :-  %L zawiera S
	sklej(_,L2,L), %cos + L2 da L
	sklej(S,_,L2). %S + cos da L2, więc S jest wewnątrz L2 => wewnątrz L

%listy są wzajemnymi permutacjami/ raczej szukanie permutacji pierwszej
permutacja([],[]). %dochodzimy do dwóch pustych
permutacja([X|L],P) :- %dzielimy na pierwszy element, ogon (L) i P
	permutacja(L,L1), %rekurencyjnie bez pierwszego elementu; wchodzimy aż do dwóch pustych
	wstaw(X,L1,P). %L1 powinno być takie, że wstawienie gdzies X da P; wychodząc w górę dodaje się po jednym znaku do P, 
					%tylko w różnych miejscach
	 
permutacja2([],[]).
permutacja2(L,[X|P]) :- %X - pierwszy element z P
	usun(X,L,L1), %usuwa X z L, dając L1
	permutacja2(L1,P). %wywołuje dla L bez X i P bez X; tak schodzi na sam dół, do [] i [] (jesli się da),
						% przy wyszukiwaniu drugiego argumentu w miejscu usun() wybiera sobie co chce usunąc, punkt nawrotu

odwroc([],[]). 
odwroc([H|T],L) :- %dzieli na H - poczatek pierwszej, T - reszta, oraz druga lista L
	odwroc(T,R), %rekurancyjnie z nieznanym parametrem (punkt nawrotu)
	sklej(R,[H],L). %R to lista do której doklejając H dostaniemy L
	% przy szukaniu wchodzi aż do [], wychodząc musi dawać w odwrotnej kolejności

wypisz([H|T]) :- %wypisywanie
	put(H), wypisz(T). %put kładzie na wyjscie
wypisz([]).

plural(Noun, PL) :- %w ang z liczby pojedynczej na mnoga
	name(Noun, L), %robi liste z 'napis'
	name(s,T), %T to lista [s]
	append(L,T, NL), 
	name(PL, NL). %przez to wyrzuca napis, a nie listę

%do put można też ascii podać np. put(65)
% '' sprawiają, że 'napis' traktowany jako string, write potrafi to wypisać
% "" -"- że jako tablica ascii, dlatego wypisz działa dla "", a dla '' nie

%odwracanie z akumulacja
odwroc2(L,R) :- %szybsza niz to wyzej, 
     odwr2(L,[],R). %zaczynamy z pustym akumulatorem, żeby było gdzie odkładać
odwr2([H|T],A,R) :- % pierwszy element, ogon, akumulator, prawa lista
     odwr2(T,[H|A],R). %wywoluje to samo, tylko że H poszło do akumulatora; zaczynajac od pustego, będą w nim się odkładać w 
     					%kolejności "od tyłu"
odwr2([],A,A). %a jak już nie ma co odkładać, to wracamy.


% notation L - End groups L and End
sklej_roznicowo(L - End, End, L). %glue using difference list
%sklej_roznicowo([a,b,c|End]-End,[d,e,f],Wynik). % example
sklej_roznicowo(L - End, End - End2, L - End2). %glue using difference list

%example from http://en.wikibooks.org/wiki/Prolog/Difference_Lists
%append(I-M, M-O, I-O).
%append([a,b,c|E]-E,  [x,y,z|W]-W,  O).
%E = [x, y, z|W],
%O = [a, b, c, x, y, z|W]-W.

%%%%%%%%%%%%%%%%%%% BELOW MINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% redefinition of some of clauses using difference lists 

zawiera3(S,[_|Tail]) :-
	zawiera(S, Tail).
zawiera3(S, L) :-
	sklej_roznicowo(S - X, X, L).