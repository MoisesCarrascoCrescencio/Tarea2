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


## Introducción al Cáncer de riñon
El cáncer de riñon es una enfermedad en la que las células del riñón comienzan a crecer de forma descontrolada, formando un tumor. Este puede crecer dentro del riñon o propagarse a otras partes del cuerpo. El cáncer de riñón puede ser causado por diferentes factores, como el tabaquismo, la obesidad, la hipertensión arterial y la exposición a cierto productos químicos.

Los síntomas del cáncer de riñón pueden incluir sangre en la orina, dolor en el costado o la espalda, pérdida de peso sin razón aparante, cansancio y fiebre intermitente. Sin embargo, en las etapas tempranas, es posible que no haya síntomas.

El tratamiento para el cáncer de riñon depende del tamaño y la etapa del tumor, así como de  la salud general del paciente. Puede incluir cirugía para extirpar el tumor, radioterapia, quimioterapia, terapia dirigida o inmunoterapia.

Es importante detectar el cáncer de riñon en etapas tempranas, ya que esto puede mejorar las posibilidades de curación. Por eso, es importante estar 
atento a cualquier síntoma y acudir al médico si se presenta alguno de ellos.

Los alimentos que se pueden consumir si se tiene cáncer riñon son:
1. Consumir una variedad de frutas y verduras.
2. Limitar una variedad de grasas saturas y trans.
3. Incluir proteínas magras.
4. Limitar la ingesta de sodio.
5. Beber suficiente agua.

Los medicos que son especialistas en  el cancer de riñon son:
1. Oncólogos
2. Urologos

## Introducción a la Malaria 
La malaria es una enfermedad causada por parásitos que se transmiten a través de las picaduras de mosquitos infectados. Aunque la malaria es una enfermedad prevenible y tratable, sigue siendo un problema de salud importante en muchas partes del mundo, especialmente en regiones tropicales y subtropicales.

Los síntomas de la malaria pueden incluir fiebre, escalofríos, sudoración, dolor de cabeza, dolor muscular y fatiga. En casos graves, la malaria puede causar complicaciones potencialmente mortales si no se trata adecuadamente, como anemia severa, problemas respiratorios o daños en los órganos.

Si se sospecha de malaria, es imporntante buscar atención médica de inmediato. El diagnóstico temprano y el tratamiento oportuno son fundamentales para prevenir complicaciones graves. El médico puede realizar pruebas para confirmar el diagnóstico y recetar medicamentos antipalúdicos específicos.

La prevención de la malaria incluye medidas para evitar las picaduras de mosquitos, como usar repelente de insectos, dormir bajo mosquiteros tratados con insecticida y tomar medicamentos preventivos si se viaja a áreas donde la malaria es endémica.

La malaria se encuentra principalmente en regiones tropicales y subtropicales, especialmente en África subsahariana, el sudeste asiático, el este del mediterráneo y el pacífico occidental. Sin embargo, la enfermedad también puede estar presente en algunas partes de América del sur y central, así como en algunas islas del Pacífico.

## Introducción a la Ladilla

La ladilla, también conocida como piojo o pediculosis púbica, es una infestación parasitaria que afecta principalmente el área del vello púbico, aunque también puede encontrarse en otras áreas del cuerpo cubiertas de vello, como las axilas, el pecho, las piernas y la barba en los hombres. Es causada por el ácaro Phthirus pubis.

Los síntomas de la ladilla incluyen pizacón intensa en el área afectada, irritación de la piel, presencia de pequeñas machas azul grisáceas o sangre en la piel debido a la alimentación de los ácaros y presencia de los propios ácaros o sus huevos en el vello púbico.

Si se sospecha de una infección de ladillas, es importante buscar atención médica para confirmar el diagnóstico y recibir el tratamiento adecuado. El médico puede recetar medicamentos tópicos o en algunos casos, medicamentos orales para tratar la infección.

Los médicos que pueden tratar la ladilla incluyen dertmatólogos, médicos de atención primaria u otros profesionales de la salud.

La prevención de la ladilla incluyen evitar el contacto directo con personas infestadas y mantener una buena higiene personal. También es importante lavar la ropa de cama, toallas y ropa interior en agua caliente y secar en secadora a alta temperatura si se sospecha de una infección.


## Patrones de entrada definidos para las enfermedades

```

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

template([eliza, que, puedo, hacer, para, prevenir, Enfermedad], [R], []) :-
    prevencion(Enfermedad, Medida),
    atom_concat('', Medida, R1),
    atom_concat(R1, ' para prevenir ', R2),
    atom_concat(R2, Enfermedad, R3),
    atom_concat(R3, '.', R).

template([eliza, en, que, region, puedo, contagiarme, de, Enfermedad], [R], []) :-
    region(Enfermedad, Region),
    atom_concat('Puedes contagiarte de ', Enfermedad, R1),
    atom_concat(R1, ' en ', R2),
    atom_concat(R2, Region, R3),
    atom_concat(R3, '.', R).

template([eliza, que, es, Enfermedad], [R], []) :-
    explicacion(Enfermedad, Explicacion),
    atom_concat(Explicacion, '.', R).



template(_, ['Por favor, explica un poco más.'], []). 


```
## Hechos sobre enfermedades

```
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

% medicos
medico(cancer_de_rinon, 'oncologos y urologos').
medico(malaria, 'infectologia e internista').
medico(ladilla, 'dermatologo').

% prevencion

prevencion(cancer_de_rinon, 'no hay nada para prevenirlo').
prevencion(malaria, 'evitar picaduras de mosquitos').
prevencion(ladilla, 'mantener relaciones sexuales seguras').

% region

region(cancer_de_rinon,'no hay regiones especificas').
region(malaria,'regiones tropicales, subtropicales, africa, sudeste asiatico, este mediterraneo y pacifico occidental').
region(ladilla,'no hay regiones especificas').


%explicacion
explicacion(cancer_de_rinon, 'Es un cancer que se desarrolla en los rinones').
explicacion(malaria, 'Es una enfermedad transmitida por mosquitos que causa fiebre y otros sintomas').
explicacion(ladilla, 'Es una enfermedad de transmision sexual causada por piojos pubicos').

```


