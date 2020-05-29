from pyswip import Prolog
import serial,time
"""Proyecto Programacion Logica Y Funcional

Presenta:
Guzman Ruiz Edvin Uriel
Pineda Bedolla Sergio

Decidimos dar un giro y utilizar sensores para detectar personas a 1.5 metros
en esta simulacion tendremos el control de saber quien es la persona y sus
sintomas, es decir, su historial medico por el cual podremos saber si es
una persona de riesgo y debemos mantener distancia o podemos interactuar
con la persona sin ningun problema
"""
#Creamos un objeto prolog y mandamos a abrir su archivo
p = Prolog()
p.consult("C:/Users/checo/OneDrive/Escritorio/ProyectoProlog/covid19.pl")

#Leemos el serial del arduino para verificar los sensores
ser = serial.Serial('COM3',9600)
info=ser.readline()
text = str( info )
personaa=int(text[2])
print(personaa)


def actualiza_valor():
    info=ser.readline()
    text = str( info )
    valor=int(text[2])    
    return valor


#Mientras la persona sea menos a 10 (Nuestro numero de personas en la base de prolog
while personaa <=10:
    val=actualiza_valor()
    print("El valor actual es ",val)
    if val == 1:
        for solucion in p.query("diagnostico(checo,X)"):
            print(solucion["X"])
    elif val == 2:
        for solucion in p.query("diagnostico(uriel,X)"):
            print(solucion["X"])
    elif val == 3:
        for solucion in p.query("diagnostico(alan,X)"):
            print(solucion["X"])
    elif val == 4:
        for solucion in p.query("diagnostico(alex,X)"):
            print(solucion["X"])
    elif val == 5:
        for solucion in p.query("diagnostico(beto,X)"):
            print(solucion["X"])
    elif val == 6:
        for solucion in p.query("diagnostico(carlos,X)"):
            print(solucion["X"])
    elif val == 7:
        for solucion in p.query("diagnostico(daniel,X)"):
            print(solucion["X"])
    elif val == 8:
        for solucion in p.query("diagnostico(jaime,X)"):
            print(solucion["X"])
    elif val == 9:
        for solucion in p.query("diagnostico(paco),X)"):
            print(solucion["X"])
    else:
        for solucion in p.query("diagnostico(desconocido,X)"):
            print(solucion["X"])
    time.sleep(2)
