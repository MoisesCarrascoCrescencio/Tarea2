particion(_, [], [], []).
particion(Pivote, [X|Xs], [X|L], G) :- X =< Pivote, particion(Pivote, Xs, L, G).
particion(Pivote, [X|Xs], L, [X|G]) :- X > Pivote, particion(Pivote, Xs, L, G).

quicksort([], []).
quicksort([Pivote|Xs], Ordenada) :- particion(Pivote, Xs, L, G), quicksort(L, LOrdenada), quicksort(G, GOrdenada), append(LOrdenada, [Pivote|GOrdenada], Ordenada).
