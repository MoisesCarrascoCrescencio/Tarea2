% Punto de entrada del programa
eliza :- 
    % Mensaje de bienvenida
    writeln('Hola, mi nombre es Eliza, tu chatbot. Por favor, ingresa tu consulta usando solo minúsculas y sin punto al final:'),
    % Lee la entrada del usuario
    readln(Input),
    % Llama a la función principal con la entrada del usuario
    eliza(Input), !.

% Manejo de la entrada "adios" para terminar la conversación
eliza(Input) :- 
    Input == ['adios'],
    % Mensaje de despedida
    writeln('Adios. Espero haberte podido ayudar.'), !.

% Manejo de la entrada "adios." para terminar la conversación
eliza(Input) :- 
    Input == ['adios', '.'],
    % Mensaje de despedida
    writeln('Adios. Espero haberte podido ayudar.'), !.

% Procesamiento general de la entrada del usuario
eliza(Input) :- 
    % Busca una coincidencia en las plantillas definidas
    template(Stim, Resp, IndStim), match(Stim, Input),
    % Si se encuentra una coincidencia, se reemplaza con los datos adecuados
    replace0(IndStim, Input, 0, Resp, R),
    % Se imprime la respuesta generada
    writeln(R),
    % Se lee la siguiente entrada del usuario para continuar la conversación
    readln(Input1),
    eliza(Input1), !.

% Plantillas que definen patrones de entrada y respuestas correspondientes
template([eliza,  s(_), tiene, hijos, .], [flagfam], [1]).
template([eliza, s(_), es, padre, de, s(_), .], [flagpar], [1,5]).
template(_, ['Por favor, explica un poco más.'], []). 

% Hechos sobre padres e hijos
padre(juan, luis).         
padre(juan, antonio).
padre(luis, carlos). 

% Predicado para generar respuestas sobre la familia
familia(X, R) :- 
    findall(Y, padre(X, Y), Hijos),
    atomic_list_concat(Hijos, ', ', HijosStr),
    format(atom(R), 'Si los  hijos de ~w es/son: ~w.', [X, HijosStr]).

% Predicado para generar respuestas sobre relaciones de parentesco
pariente(X,Y,R):- padre(X, Y), R = ['Yes', X, padre, de, Y].
pariente(X,Y,R):- \+padre(X,Y), R = ['No', X, no, es, padre, de, Y].

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
    X == flagpar,
    pariente(Atom, Atom1, R).

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
