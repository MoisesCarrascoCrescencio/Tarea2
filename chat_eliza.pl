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
template([eliza, s(_), tiene, hijos, .], [flagfam], [1]).
template([eliza, s(_), es, padre, de, s(_), .], [flagpar], [1, 5]).
template([eliza, s(_), es, madre, de, s(_), .], [flagmadre], [1, 5]).
template([eliza, s(_), es, hermano, de, s(_), .], [flaghermano], [1, 5]).
template([eliza, s(_), es, hermana, de, s(_), .], [flaghermana], [1, 5]).
template([eliza, s(_), es, primo, de, s(_), .], [flagprimo], [1, 5]).
template([eliza, s(_), es, tio, de, s(_), .], [flagtio], [1, 5]).
template([eliza, s(_), es, abuelo, de, s(_), .], [flagabuelo], [1, 5]).
template([eliza, s(_), es, abuela, de, s(_), .], [flagabuela], [1, 5]).
template([eliza, es, un, pokemon, s(Nombre), .], [flagpokemon], [4]).
template(_, ['Por favor, explica un poco más.'], []).

% Hechos sobre los Pokémon
pokemon(bulbasaur).
pokemon(ivysaur).
pokemon(venusaur).
pokemon(charmander).
pokemon(charmeleon).
pokemon(charizard).
pokemon(squirtle).
pokemon(wartortle).
pokemon(blastoise).
pokemon(pikachu).
pokemon(raichu).
pokemon(jigglypuff).
pokemon(wigglytuff).
pokemon(zubat).
pokemon(golbat).
pokemon(oddish).
pokemon(gloom).
pokemon(vileplume).
pokemon(diglett).
pokemon(dugtrio).

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
hermana(mariel, moisesc).
hermana(mariel, monica).
hermana(mariel, jessica).

% Hechos sobre primos
primo(moisesc, fernanda).
primo(moisesc, marcela).
primo(moisesc, kevin).
primo(moisesc, ciro).
primo(moisesc, daniela).
primo(moisesc, alondra).
primo(monica, fernanda).
primo(monica, marcela).
primo(monica, kevin).
primo(monica, ciro).
primo(monica, daniela).
primo(monica, alondra).
primo(mariel, fernanda).
primo(mariel, marcela).
primo(mariel, kevin).
primo(mariel, ciro).
primo(mariel, daniela).
primo(mariel, alondra).
primo(jessica, fernanda).
primo(jessica, marcela).
primo(jessica, kevin).
primo(jessica, ciro).
primo(jessica, daniela).
primo(jessica, alondra).

% Hechos sobre tíos
tio(vanesa, moisesc).
tio(vanesa, monica).
tio(vanesa, mariel).
tio(vanesa, jessica).
tio(lupe, moisesc).
tio(lupe, monica).
tio(lupe, mariel).
tio(lupe, jessica).
tio(violeta, moisesc).
tio(violeta, monica).
tio(violeta, mariel).
tio(violeta, jessica).

% Hechos sobre abuelos
abuelo(joaquin, moisesc).
abuelo(joaquin, monica).
abuelo(joaquin, mariel).
abuelo(joaquin, jessica).
abuelo(carmen, moisesc).
abuelo(carmen, monica).
abuelo(carmen, mariel).
abuelo(carmen, jessica).
abuelo(isabel, moisesc).
abuelo(isabel, monica).
abuelo(isabel, mariel).
abuelo(isabel, jessica).
abuelo(ciro, moisesc).
abuelo(ciro, monica).
abuelo(ciro, mariel).
abuelo(ciro, jessica).

% Predicado para generar respuestas sobre la familia
familia(X, R) :- 
    findall(Y, (padre(X, Y); madre(X, Y)), Hijos),
    atomic_list_concat(Hijos, ', ', HijosStr),
    format(atom(R), 'Los hijos de ~w son: ~w.', [X, HijosStr]).

% Predicado para generar respuestas sobre relaciones de parentesco (padre, madre, hermano, hermana, primo, tio, abuelo, abuela)
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

pariente(flagprimo, X, Y, R) :- 
    (primo(X, Y), R = ['Sí,', X, 'es primo de', Y]);
    (\+ primo(X, Y), R = ['No,', X, 'no es primo de', Y]).

pariente(flagtio, X, Y, R) :- 
    (tio(X, Y), R = ['Sí,', X, 'es tio de', Y]);
    (\+ tio(X, Y), R = ['No,', X, 'no es tio de', Y]).

pariente(flagabuelo, X, Y, R) :- 
    (abuelo(X, Y), R = ['Sí,', X, 'es abuelo de', Y]);
    (\+ abuelo(X, Y), R = ['No,', X, 'no es abuelo de', Y]).

pariente(flagabuela, X, Y, R) :- 
    (abuelo(X, Y), R = ['Sí,', X, 'es abuela de', Y]);
    (\+ abuelo(X, Y), R = ['No,', X, 'no es abuela de', Y]).

% Predicado para generar respuestas sobre si algo es un Pokémon
pariente(flagpokemon, _, X, R) :-
    nth0(0, X, Nombre),
    (pokemon(Nombre) -> R = ['Sí,', Nombre, 'es un Pokémon.'] ; R = ['No,', Nombre, 'no es un Pokémon.']).

% Predicados auxiliares para el procesamiento de las plantillas y entradas
match([], []).
match([H|T], [H|T2]) :-
    match(T, T2).
match([s(X)|T], [H|T2]) :- 
    X = H,
    match(T, T2).

replace0([], X, _, R, R).
replace0([I|T], X, Index, [H|T2], R) :- 
    nth0(I, X, H),
    Index1 is Index + 1,
    replace0(T, X, Index1, T2, R).
