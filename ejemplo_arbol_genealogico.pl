hombre(juan).
hombre(miguel).
mujer(ana).
mujer(susana).
progenitor_de(juan, ana).
progenitor_de(susana, ana).
progenitor_de(ana, miguel).

padre_de(Padre, Hijo) :- hombre(Padre), progenitor_de(Padre, Hijo).
madre_de(Madre, Hijo) :- mujer(Madre), progenitor_de(Madre, Hijo).
