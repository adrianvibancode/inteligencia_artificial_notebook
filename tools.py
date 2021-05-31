def ConvertToVector(data, columna):
    vector=[]
    line=[]
    for i in data:
        line = i.split(",")
        vector.append(int(line[columna]))
   
    return vector


def espar(n):
    if (n % 2 == 0):
        return True
    else:
        return False

def leerarchivo(data):
    for i in data:
        print(i)