print("Palabra palindroma")

def palindroma(palabra):

    #Tratamiento de la cadena
    palabra = palabra.lower().replace(" ","")
    p_invertida = palabra[::-1]

    print("La palabra original es: ", palabra)
    print("La palabra invertida es: ", p_invertida) 




print("Ingresa una palabra")
palabra = input()
palindroma(palabra)
