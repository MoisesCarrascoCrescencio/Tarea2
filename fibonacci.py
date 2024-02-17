def fibonacci(numero):
    if numero <= 0:
        return "Ha ingresado un número negativo"
    elif numero == 1:
        return 0
    elif numero == 2:
        return 1
    else:
        return fibonacci(numero - 1) + fibonacci(numero - 2)

print("Ingresa un número")
numero = int(input())
print(fibonacci(numero))

