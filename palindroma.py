print("Palabra palindroma")

def palindroma(palabra):

    #Tratamiento de la cadena
    palabra = palabra.lower().replace(" ","")
    p_invertida = palabra[::-1]

    #Vericar si las cadenas son iguales
    if (palabra == p_invertida):
        return True

    else:
        return False
    




print("Ingresa una palabra")
palabra = input()
print(palindroma(palabra))
