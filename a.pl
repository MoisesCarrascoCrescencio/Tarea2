solucion(N, Solucion) :-
    range(1, N, Filas),
    permutation(Filas, Solucion),
    es_tablero(Solucion).

es_tablero([]).
es_tablero([X|Xs]) :-
    no_ataca(X, Xs, 1),
    es_tablero(Xs).

no_ataca(_, [], _).
no_ataca(X, [Y|Ys], Distancia) :-
    X #\= Y,
    abs(X - Y) #\= Distancia,
    NuevaDistancia is Distancia + 1,
    no_ataca(X, Ys, NuevaDistancia).

range(N, N, [N]).
range(M, N, [M|L]) :-
    M < N,
    M1 is M + 1,
    range(M1, N, L).

:- use_module(library(clpfd)).
