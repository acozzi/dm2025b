import random
import math

def es_primo(n):
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    raiz = int(math.sqrt(n)) + 1
    for i in range(3, raiz, 2):
        if n % i == 0:
            return False
    return True

def generar_primos(cantidad=100, minimo=111111, maximo=999999):
    primos = set()
    while len(primos) < cantidad:
        n = random.randint(minimo, maximo)
        if es_primo(n):
            primos.add(n)
    return list(primos)

# Uso
primos_generados = generar_primos()
print(primos_generados)

