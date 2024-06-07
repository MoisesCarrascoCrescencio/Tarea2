padre(juan, pedro).
madre(maria, pedro).
padre(pedro, jorge).
madre(ana, jorge).
padre(jorge, carlos).

abuelo(X, Y) :- padre(X, Z), padre(Z, Y); padre(X, Z), madre(Z, Y).
bisabuelo(X, Y) :- padre(X, Z), abuelo(Z, Y); padre(X, Z), abuelo(Z, Y).

hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.
tio(X, Y) :- hermano(X, Z), padre(Z, Y); hermano(X, Z), madre(Z, Y).
