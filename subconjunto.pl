suma([], 0).
suma([H|T], S) :- suma(T, S1), S is S1 + H.

subconjunto([], []).
subconjunto([H|T], [H|T1]) :- subconjunto(T, T1).
subconjunto([_|T], T1) :- subconjunto(T, T1).

suma_subconjunto(Lista, Suma, Subconjunto) :- subconjunto(Lista, Subconjunto), suma(Subconjunto, Suma).
