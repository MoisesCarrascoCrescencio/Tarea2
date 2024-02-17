print("Factorial de un número")


def factorial(numero):

    if (numero == 0):
        return 1

    elif (numero < 0):
        return ("Ha ingresado un número negativo")

    elif (numero >= 1):
        return numero
        
    

print("Ingresa un número")
numero = input()
numero = int(numero)
print(factorial(numero))

