%Programacion Logica Y Funcional Proyecto De Prolog
%
%	Guzman Ruiz Uriel
%	Pineda Bedolla Sergio
%
%Esta es una solucion PÄRCIAL al problema del Covid-19, pues en este caso suponemos que la base de datos ya esta llenada de manera correcta con los sintomas de un paciente
%al utilizarse en hospitales y ser para ayudar a las personas en este punto masivos de contagio, Prolog nos ayuda ofreciendo una consulta
%en su base de datos para determinar si la persona la cual Python no esta pidiendo verificar esta contagiada o no de Covid-19 segun sus sintomas

% sintoma_de(sintoma,enfermedad).
sintoma_de(fiebre, gripa).
sintoma_de(cansancio, gripa).
sintoma_de(escalofrios, gripa).
sintoma_de(dolores_musculares, gripa).
sintoma_de(tos_seca, gripa).
sintoma_de(congestion_nasal, gripa).
sintoma_de(dolor_de_cabeza, gripa).
sintoma_de(tos_flemas, gripa).
sintoma_de(fiebre, influenza).
sintoma_de(escalofrios, influenza).
sintoma_de(dolores_musculares, influenza).
sintoma_de(cansancio, influenza).
sintoma_de(tos_seca, influenza).
sintoma_de(congestion_nasal, influenza).
sintoma_de(dolor_de_cabeza, influenza).
sintoma_de(tos_flemas, influenza).
sintoma_de(fiebre, covid).
sintoma_de(tos_seca, covid).
sintoma_de(cansancio, covid).
sintoma_de(diarrea, covid).
sintoma_de(dificultad_para_respirar, covid).
sintoma_de(dolor_en_pecho, covid).
sintoma_de(incapaz_de_moverse, covid).
sintoma_de(dolores_musculares, covid).
sintoma_de(dolor_de_cabeza, covid).
sintoma_de(perdida_sentidos, covid).

%sintomas(nombre o numero de la persona, sintomas)
sintomas(checo,dificultad_para_respirar).
sintomas(checo,dolor_en_pecho).
sintomas(checo,tos_seca).
sintomas(checo,fiebre).
sintomas(alan,congestion_nasal).
sintomas(alan,tos_seca).
sintomas(alan,fiebre).
sintomas(alan,escalofrios).
sintomas(alan,dolores_musculares).
sintomas(alan,cansancio).
sintomas(alex,fiebre).
sintomas(alex,escalofrios).
sintomas(alex,dolores_musculares).
sintomas(alex,tos_flemas).
sintomas(alex,dolor_de_cabeza).
sintomas(beto,dolor_en_pecho).
sintomas(beto,incapaz_de_moverse).
sintomas(beto,dolores_musculares).
sintomas(beto,perdida_sentidos).
sintomas(carlos,delirio).
sintomas(carlos,fatiga).
sintomas(carlos,sangrado_excesivo).
sintomas(carlos,vomito).
sintomas(daniel,fiebre).
sintomas(daniel,tos_seca).
sintomas(daniel,dolor_de_cabeza).
sintomas(daniel,cansancio).
sintomas(jaime,fiebre).
sintomas(jaime,tos_seca).
sintomas(jaime,dolor_de_cabeza).
sintomas(jaime,cansancio).
sintomas(jaime,dolor_en_pecho).
sintomas(paco,fiebre).
sintomas(paco,escalofrios).
sintomas(paco,tos_flemas).
sintomas(paco,vomito).
sintomas(paco,delirio).


%persona(nombre o numero de la persona)
persona(checo).
persona(uriel).
persona(alan).
persona(alex).
persona(beto).
persona(carlos).
persona(daniel).
persona(jaime).
persona(paco).


diagnosticox(Persona, Enfermedad) :- bagof(Y,enfermedades(Persona,Y),Enfermedad).

diagnostico(Persona,Res) :- diagnosticox(Persona,Enfermedad),contadorcovid(covid,Enfermedad,Resultado),contadorcovid(gripa,Enfermedad,Resultado2),mayor(Resultado,Resultado2,Res),!
;not(diagnosticox(Persona,_)),persona(Persona), Res = 'La persona esta limpia',!
;not(persona(Persona)), Res = 'Esa persona no se encuentra en la base de datos, alejese!'.

enfermedades(Persona, E):- sintoma_de(M, E), sintomas(Persona, M).

listaSintomas(X, Lista) :- setof(Y,sintoma_de(Y, X), Lista).

contadorcovid(_, [], 0).
contadorcovid(E, [X|XS], R) :- contadorcovid(E, XS, R1),E=X, R is R1+1;contadorcovid(E, XS, R1),R is R1.

mayor(C,I,Res) :- C<I, Res = 'Esa persona tiene gripe, no se preocupe',!.
mayor(C,I,Res) :- C>I, Res = 'Mantenga distancia de esa persona, probablemente tenga covid 19',!.
mayor(C,I,Res) :- C=:=I, Res = 'Puede que esa persona sea portadora, tenga cuidado'.

