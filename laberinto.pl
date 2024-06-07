camino(Inicio, Fin, Camino) :- viajar(Inicio, Fin, [Inicio], Q), reverse(Q, Camino).

viajar(X, X, P, P).
viajar(X, Y, P, Q) :- conexion(X, Z), \+member(Z, P), viajar(Z, Y, [Z|P], Q).

conexion(a, b).
conexion(b, c).
conexion(c, d).
conexion(d, e).
conexion(e, f).
