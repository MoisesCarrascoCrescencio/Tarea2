print("Fibonacci")

def fibonacci(numero):

    if (numero <= 0):
        return ("Ha ingresado un número negativo")

    elif (numero == 1):
        return 0

    elif (numero == 2):
        return 1

    else:
        pass




print("Ingresa un número")
numero = input()
numero = int(numero)
print(fibonacci(numero))
