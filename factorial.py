print("Factorial de un número")


def factorial(numero):

    if (numero == 0):
        return 1

    elif (numero < 0):
        return ("Ha ingresado un número negativo")

    elif (numero >= 1):
        resultado = 1
        for i in range(1, numero + 1):
            resultado *= i
        return resultado
        
    

print("Ingresa un número")
numero = input()
numero = int(numero)
print(factorial(numero))

