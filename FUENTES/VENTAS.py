from sys import stdin
import random
tipo = ['CC','NIT','TI','CE','TP']
forma = ['Efectivo','Tarjetacredito','Tarjetadebito','Cheque']
def lectura():
    j = 0
    l = 0
    for i in range(1001):
        a = stdin.readline().strip()
        if j == len(forma) : j = 0
        if l == len(tipo) : l = 0
        print("INSERT INTO ventas (empleado , formapago ,valorpagar ,tipodoc, numdoc) VALUES ("+str(i)+", '"+str(forma[j])+"', "+str(random.randint(20000,1000000))+", '"+str(tipo[l])+"', '"+str(a)+"');")
        
        j+=1
        l+=1
lectura()
