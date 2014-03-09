kolor(czerwony).
kolor(zielony).
kolor(niebieski).

koloruj(Polska,Bialorus,Czechy,Ukraina,Slowacja) :-
	kolor(Polska),
	kolor(Bialorus),
	kolor(Czechy),
	kolor(Ukraina),
	kolor(Slowacja),
	Polska \= Bialorus,
	Polska \= Ukraina,
	Polska \= Czechy,
	Polska \= Slowacja,
	Czechy \= Slowacja,
	Bialorus \= Ukraina,
	Ukraina \= Slowacja.