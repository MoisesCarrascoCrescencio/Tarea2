# Proyecto ChatBot
## Eliza
En prolog Eliza es un programa de procesamiento de lenguaje natural que simula una conversación con un terapeuta. 
Fue desarrollado por Joseph Weizenbaum en 1966 en el MIT. Eliza utiliza patrones de transformación simples para responder
a las entradas del usuario, imitando así el comportamiento de un terapeuta rogeriano, que refleja las declaraciones
del paciente en forma de pregunta para fomentar la reflexión. Eliza es un ejemplo clásico de la capacidad de Prolog para manipular
texto y simular la inteligencia humana en el procesamiento del lenguaje natural.

## Inicio del programa - Saludo y lectura de solicitud
```
eliza :- 
    writeln('Hola, mi nombre es Eliza'),
    readln(Input),
    eliza(Input), !.
```

En esta parte del programa Eliza inicia el programa y además escribe un saludo.

## Despedida del usuario
```
eliza(Input) :- 
    Input == ['adios'],
    writeln('Adios. Espero haberte podido ayudar.'), !.
```
Escribe un mensaje de despedida si el usuario escribe "adios" en la consola swi-prolog.

## Procesamiento de la entrada del usuario
```
eliza(Input) :- 
    template(Stim, Resp, IndStim), match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.
```
Se encarga de procesar lo que el usuario escribe. Primero, busca un patrón de entrada
que coincida con lo que el usuario ha escrito. Si encuentra una coincidencia, genera
una respuesta reemplazando ciertas partes de la entrada del usuario con información específica.
Después, muestra esta respuesta al usuario y espera a que escriba algo más para seguir interactuando.

## Patrones de entrada definidos
```
template([eliza,  s(_), tiene, hijos, .], [flagfam], [1]).
template([eliza, s(_), es, padre, de, s(_), .], [flagpar], [1,5]).
template([eliza, s(_), es, madre, de, s(_), .], [flagmadre], [1,5]).
template([eliza, s(_), es, hermano, de, s(_), .], [flaghermano], [1,5]).
template([eliza, s(_), es, hermana, de, s(_), .], [flaghermana], [1,5]).
template(_, ['Por favor, explica un poco más.'], []). 

```
Estas plantillas definen patrones de entrada y las respuestas. 's(_)' 
es un comodín que puede concidir con cualquier sublista en la entrada del usuario.
Si no hay coincidencia, la respuesta predeterminada es 'Por favor, explica un poco más'.

## Definición de hechos

```
padre(moises, moisesc).         
padre(moises, monica).
padre(moises, mariel). 
padre(moises, jessica).

madre(maribel, moisesc).
madre(maribel, monica).
madre(maribel, mariel).
madre(maribel, jessica).

hermano(moisesc, monica).
hermano(moisesc, mariel).
hermano(moisesc, jessica).
hermana(monica, moisesc).
hermana(monica, mariel).
hermana(monica, jessica).
hermana(jessica, moisesc).
hermana(jessica, monica).
hermana(jessica, mariel).
```
En este punto del algoritmo los hechos definen las relaciones de parentesco.

## Predicados para obtener respuesta sobre la familia

```
familia(X, R) :- 
    findall(Y, (padre(X, Y); madre(X, Y)), Hijos),
    atomic_list_concat(Hijos, ', ', HijosStr),
    format(atom(R), 'Los hijos de ~w son: ~w.', [X, HijosStr]).
```
Este predicado lista a todos los hijos de 'X' individuo.

## Predicados para obtener respuestas sobre el parentesco familiar

```
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

```
Estos predicados generan una respuesta acerca de las relaciones de parentesco familiar.
Las respuestas están basadas en los hechos declarados previamente.


## Coincidencia de patrones match

```
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
```
Estos predicados comprueban si un patrón 'Stim' coincide con la entrada del
usuario 'Input'

## Remplazo de la respuesta replace0

```
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

```
 Primero lee lo que el usuario escribe, luego busca un patrón que coincida con lo que ha escrito el usuario, genera una respuesta basada en ese patrón y muestra la respuesta al usuario.
 Este proceso se repite hasta que el usuario escribe "adios".




