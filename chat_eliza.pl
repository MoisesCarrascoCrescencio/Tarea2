% Punto de entrada del programa
eliza :- 
    writeln('Hola, mi nombre es Eliza 600'),
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
template([eliza, s(_), es, primo, de, s(_), .], [flagprimo], [1,5]).
template([eliza, s(_), es, tio, de, s(_), .], [flagtio], [1,5]).
template([eliza, s(_), es, abuelo, de, s(_), .], [flagabuelo], [1,5]).
template([eliza, s(_), es, abuela, de, s(_), .], [flagabuela], [1,5]).

template([eliza, tengo, X], [R], []) :-
    sintoma(X, Enfermedad),
    atom_concat('Tienes ', Enfermedad, R1),
    atom_concat(R1, '.', R).

template([eliza, cual, es, el, tratamiento, para, Enfermedad], [R], []) :-
    tratamiento(Enfermedad, Tratamiento),
    atom_concat('El tratamiento para ', Enfermedad, R1),
    atom_concat(R1, ' es ', R2),
    atom_concat(R2, Tratamiento, R3),
    atom_concat(R3, '.', R).


template([eliza, que, puedo, comer, si, tengo, Enfermedad], [R], []) :-
    alimentacion(Enfermedad, Alimento),
    atom_concat('', Alimento, R1),
    atom_concat(R1, ' si tienes ', R2),
    atom_concat(R2, Enfermedad, R3),
    atom_concat(R3, '.', R).

template([eliza, que, medico, me, puede, atender, si, tengo, Enfermedad], [R], []) :-
    medico(Enfermedad, Medico),
    atom_concat('El médico que te puede atender si tienes ', Enfermedad, R1),
    atom_concat(R1, ' es un ', R2),
    atom_concat(R2, Medico, R3),
    atom_concat(R3, '.', R).






template(_, ['Por favor, explica un poco más.'], []). 

% sintomas del cancer
sintoma(sangre_en_la_orina, 'cancer de rinon').
sintoma(dolor_en_la_zona_lumbar, 'cancer de rinon').
sintoma(dolor_de_espalda, 'cancer de rinon').
sintoma(perdida_de_peso, 'cancer de rinon').
sintoma(cansancio, 'cancer de rinon').

% sintomas de malaria
sintoma(fiebre, 'malaria').
sintoma(escalofrios, 'malaria').
sintoma(sudoracion, 'malaria').
sintoma(dolor_de_cabeza, 'malaria').
sintoma(dolor_muscular, 'malaria').
sintoma(fatiga, 'malaria').
sintoma(anemia, 'malaria').
sintoma(problemas_respiratorios, 'malaria').

% sintomas de ladilla
sintoma(picazon_en_el_vello_pubico, 'ladilla').
sintoma(picazon_en_las_axilas, 'ladilla').
sintoma(picazon_en_el_pecho, 'ladilla').
sintoma(picazon_en_las_piernas, 'ladilla').
sintoma(picazon_en_la_barba, 'ladilla').
sintoma(irritacion_en_la_piel, 'ladilla').
sintoma(manchas_azules, 'ladilla').
sintoma(pequenas_heridas, 'ladilla').

% tratamientos
tratamiento(cancer_de_rinon,'cirugia para extirpar el tumor, radioterapia, quimioterapia e inmunoterapia').
tratamiento(malaria, 'medicamento antipaludico').
tratamiento(ladilla, 'medicamentos topicos, medicamentos orales').

% recomendaciones alimenticias
alimentacion(cancer_de_rinon,'consumir frutas, limitar grasas, limitar el sodio').
alimentacion(malaria,'beber suficiente agua, limitar grasas trans, limitar el sodio').
alimentacion(ladilla, 'beber mucha agua y comer bien').

%medicos
medico(cancer_de_rinon, 'oncologos y urologos').
medico(malaria, 'infectologia e internista').
medico(ladilla, 'dermatologo').



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
    (tio(X, Y), R = ['Sí,', X, 'es tío de', Y]);
    (\+ tio(X, Y), R = ['No,', X, 'no es tío de', Y]).

pariente(flagabuelo, X, Y, R) :- 
    (abuelo(X, Y), R = ['Sí,', X, 'es abuelo de', Y]);
    (\+ abuelo(X, Y), R = ['No,', X, 'no es abuelo de', Y]).

pariente(flagabuela, X, Y, R) :- 
    (abuelo(X, Y), R = ['Sí,', X, 'es abuela de', Y]);
    (\+ abuelo(X, Y), R = ['No,', X, 'no es abuela de', Y]).

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
