print("Fibonacci")

def fibonacci(numero):

    if (numero <= 0):
        return ("Ha ingresado un número negativo")

    elif (numero == 1):
        return 0

    elif (numero == 2):
        return 1

    else:
        a = 0
        b = 1

        for _ in range(2, numero):
            a, b = b, a + b
        return b

print("Ingresa un número")
numero = int(input())
print(fibonacci(numero))

