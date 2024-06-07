insertar(X, nil, bst(X, nil, nil)).
insertar(X, bst(Raiz, Izquierda, Derecha), bst(Raiz, IzquierdaNueva, Derecha)) :- X =< Raiz, insertar(X, Izquierda, IzquierdaNueva).
insertar(X, bst(Raiz, Izquierda, Derecha), bst(Raiz, Izquierda, DerechaNueva)) :- X > Raiz, insertar(X, Derecha, DerechaNueva).

en_orden(nil, []).
en_orden(bst(Raiz, Izquierda, Derecha), Lista) :- en_orden(Izquierda, IzquierdaLista), en_orden(Derecha, DerechaLista), append(IzquierdaLista, [Raiz|DerechaLista], Lista).
