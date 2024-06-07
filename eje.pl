siguiente_generacion(Actual, Siguiente) :-
    findall(Celda, (vecino(Celda, Actual), regla(Celda, Actual)), NuevaGeneracion),
    list_to_set(NuevaGeneracion, Siguiente).

vecino(Celda, (X,Y)) :-
    vecino_offset(OffsetX, OffsetY),
    Celda is (X + OffsetX, Y + OffsetY).

vecino_offset(-1,-1).
vecino_offset(-1, 0).
vecino_offset(-1, 1).
vecino_offset( 0,-1).
vecino_offset( 0, 1).
vecino_offset( 1,-1).
vecino_offset( 1, 0).
vecino_offset( 1, 1).

regla((X,Y), Actual) :-
    contar_vecinos_vivos((X,Y), Actual, Vecinos),
    (   member((X,Y), Actual), Vecinos = 2
    ;   Vecinos = 3
    ).

contar_vecinos_vivos(Celda, Actual, Vecinos) :-
    findall(1, (vecino(CeldaVecina, Celda), member(CeldaVecina, Actual)), VecinosVivos),
    length(VecinosVivos, Vecinos).
