mover(1, Origen, Destino, _) :-  
    write('Mover disco superior de '), 
    write(Origen), 
    write(' a '), 
    write(Destino), 
    nl. 
mover(N, Origen, Destino, Auxiliar) :- 
    N > 1, 
    M is N - 1, 
    mover(M, Origen, Auxiliar, Destino), 
    mover(1, Origen, Destino, _), 
    mover(M, Auxiliar, Destino, Origen).  
