% Punto de entrada del programa
eliza :- 
    writeln('Hola, mi nombre es Eliza'),
    readln(Input),
    eliza(Input), !.

eliza(Input) :- 
    Input == ['adios'],
    % Mensaje de despedida
    writeln('Adios. Espero haberte podido ayudar.'), !.

% Procesamiento general de la entrada del usuario
eliza(Input) :- 
    template(Stim, Resp, IndStim), match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

% Plantillas que definen patrones de entrada y respuestas correspondientes
template([eliza,  s(_), tiene, hijos, .], [flagfam], [1]).
template([eliza, s(_), es, padre, de, s(_), .], [flagpar], [1,5]).
template([eliza, s(_), es, madre, de, s(_), .], [flagmadre], [1,5]).
template([eliza, s(_), es, hermano, de, s(_), .], [flaghermano], [1,5]).
template([eliza, s(_), es, hermana, de, s(_), .], [flaghermana], [1,5]).
template(_, ['Por favor, explica un poco más.'], []). 

% Hechos sobre padres e hijos
padre(moises, moisesc).         
padre(moises, monica).
padre(moises, mariel). 
padre(moises, jessica).

% Hechos sobre madres e hijos
madre(maribel, moisesc).
madre(maribel, monica).
madre(maribel, mariel).
madre(maribel, jessica).

% Hechos sobre hermanos y hermanas
hermano(moisesc, monica).
hermano(moisesc, mariel).
hermano(moisesc, jessica).
hermana(monica, moisesc).
hermana(monica, mariel).
hermana(monica, jessica).
hermana(jessica, moisesc).
hermana(jessica, monica).
hermana(jessica, mariel).

% Predicado para generar respuestas sobre la familia
familia(X, R) :- 
    findall(Y, (padre(X, Y); madre(X, Y)), Hijos),
    atomic_list_concat(Hijos, ', ', HijosStr),
    format(atom(R), 'Los hijos de ~w son: ~w.', [X, HijosStr]).

% Predicado para generar respuestas sobre relaciones de parentesco (padre, madre, hermano, hermana)
pariente(flagpar, X, Y, R) :- 
    (padre(X, Y), R = ['Sí,', X, 'es padre de', Y]);
    (\+ padre(X, Y), R = ['No,', X, 'no es padre de', Y]).

pariente(flagmadre, X, Y, R) :- 
    (madre(X, Y), R = ['Sí,', X, 'es madre de', Y]);
    (\+ madre(X, Y), R = ['No,', X, 'no es madre de', Y]).

pariente(flaghermano, X, Y, R) :- 
    (hermano(X, Y), R = ['Sí,', X, 'es hermano de', Y]);
    (\+ hermano(X, Y), R = ['No,', X, 'no es hermano de', Y]).

pariente(flaghermana, X, Y, R) :- 
    (hermana(X, Y), R = ['Sí,', X, 'es hermana de', Y]);
    (\+ hermana(X, Y), R = ['No,', X, 'no es hermana de', Y]).

% Coincidencia de patrones (match)
match([], []).
match([], _) :- true.

match([S|Stim], [I|Input]) :- 
    atom(S), % si I es un s(X) devuelve falso
    S == I,
    match(Stim, Input), !.

match([S|Stim], [_|Input]) :- 
    % I es un s(X), lo ignoro y continúo con el resto de la lista
    \+ atom(S),
    match(Stim, Input), !.

% Reemplazo en las respuestas (replace0)
replace0([], _, _, Resp, R) :- 
    append(Resp, [], R), !.

replace0([I|_], Input, _, Resp, R) :- 
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagfam,
    familia(Atom, R).

replace0([I, J], Input, _, Resp, R) :- 
    nth0(I, Input, Atom),
    nth0(J, Input, Atom1),
    nth0(0, Resp, X),
    pariente(X, Atom, Atom1, R).

replace0([I|Index], Input, N, Resp, R) :- 
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R), !.

replace0([I|Index], Input, N, Resp, R) :- 
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R), !.
