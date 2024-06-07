resolver(Sudoku, Solucion) :- Solucion = Sudoku, sudoku(Solucion), !.

sudoku(Sudoku) :-
    length(Sudoku, 9), maplist(length_(9), Sudoku),
    maplist(fd_domain, Sudoku), 
    maplist(fd_all_different, Sudoku),
    columnas(Sudoku, Columnas),
    maplist(fd_all_different, Columnas),
    filas(Sudoku, Filas),
    maplist(fd_all_different, Filas),
    regiones(Sudoku, Regiones),
    maplist(fd_all_different, Regiones),
    maplist(fd_labeling, Sudoku).

length_(Length, List) :- length(List, Length).
columnas(Sudoku, Columnas) :- transpose(Sudoku, Columnas).
filas(Sudoku, Filas) :- Sudoku = Filas.
regiones(Sudoku, Regiones) :-
    sudoku_region(Sudoku, 0, Reg1),
    sudoku_region(Sudoku, 3, Reg2),
    sudoku_region(Sudoku, 6, Reg3),
    append([Reg1, Reg2, Reg3], Regiones).

sudoku_region(Sudoku, I, Region) :-
    I1 is I + 1, I2 is I + 2,
    nth0(I, Sudoku, R1), nth0(I1, Sudoku, R2), nth0(I2, Sudoku, R3),
    append(R1, R2, Temp), append(Temp, R3, Region).
