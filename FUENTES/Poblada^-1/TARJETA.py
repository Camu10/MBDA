from sys import stdin
tipo = ['CC','NIT','TI','CE','TP']
tarjeta = [i for i in range(1,51)]
def lectura():
    j = 0
    l = 0
    for i in range(1001):
        a = stdin.readline().strip()
        if j == len(tipo) : j = 0
        if l == len(tarjeta) : l = 0
        print("INSERT INTO clientes (tipodoc , numdoc , tarjetadescuento) VALUES ('"+str(tipo[j])+"', '"+a+"', "+str(tarjeta[l])+");")
        j+=1
        l+=1
lectura()
