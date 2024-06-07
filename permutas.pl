perm([], []).
perm(Lista, [X|Resto]) :- seleccionar(X, Lista, RestoTemp), perm(RestoTemp, Resto).

seleccionar(X, [X|Resto], Resto).
seleccionar(X, [Y|Resto], [Y|RestoSeleccionado]) :- seleccionar(X, Resto, RestoSeleccionado).
