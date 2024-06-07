mcd(X, 0, X).
mcd(X, Y, M) :- Y > 0, Z is X mod Y, mcd(Y, Z, M).

mcm(X, Y, M) :- mcd(X, Y, D), M is X * Y / D.
