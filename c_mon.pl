cambio(0, []).
cambio(Cantidad, [H|T]) :- moneda(H), Cantidad >= H, Cantidad1 is Cantidad - H, cambio(Cantidad1, T).

moneda(1).
moneda(5).
moneda(10).
moneda(25).
moneda(50).
moneda(100).
