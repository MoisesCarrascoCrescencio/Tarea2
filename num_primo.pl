es_primo(2) :- true, !.
es_primo(N) :- N < 2, !, false.
es_primo(N) :- N mod 2 =:= 0, !, false.
es_primo(N) :- \+tiene_factor(N, 3).

tiene_factor(N, Factor) :- N mod Factor =:= 0.
tiene_factor(N, Factor) :- Factor * Factor < N, Factor2 is Factor + 2, tiene_factor(N, Factor2).
