import math 
def distancia_manhattan(v1, v2):
    dim = len(v1)
    suma = 0
    for i in range(dim):
        suma += abs(v1[i] - v2[i])
    return suma

def distancia_euclidiana(v1, v2):
    dim = len(v1)
    suma = 0
    for i in range(dim):
        suma += math.pow(v1[i] - v2[i],2)
    return math.sqrt(suma)

def euclidiana_normalizada(v1,v2):
    dim = len(v1)
    suma = 0
    for i in range(dim):
        suma += math.pow(v1[i],2) - 2*(v1[i] * v2[i]) + math.pow(v2[i],2)
    return suma

def sorence_dice(v1,v2):
    dim = len(v1)
    suma=0
    suma1=0
    suma2=0
    cociente=0


    for j in range(0, dim):
        suma+= v1[j]*v2[j] 

    for j in range(0,dim):
        suma1+=math.pow(v1[j],2)

    for j in range(0,dim):
        suma2+=math.pow(v2[j],2)

    cociente=(2*suma)/(suma1+suma2)

    return cociente


def coseno(v1,v2):
    dim = len(v1)
    suma=0
    suma1=0
    suma2=0
    cociente=0

    for j in range(0, dim):
        suma+= v1[j]*v2[j] 

    for j in range(0,dim):
        suma1+=math.pow(v1[j],2)

    for j in range(0,dim):
        suma2+=math.pow(v2[j],2)

    cociente=(suma)/math.sqrt(suma1*suma2)
    return cociente

def jaccard(v1,v2):
    dim = len(v1)
    suma=0
    suma1=0
    suma2=0
    cociente=0


    for j in range(0, dim):
        suma+= v1[j]*v2[j] 

    for j in range(0,dim):
        suma1+=math.pow(v1[j],2)

    for j in range(0,dim):
        suma2+=math.pow(v2[j],2)

    cociente=(suma)/(suma1+suma2-suma)

    return cociente