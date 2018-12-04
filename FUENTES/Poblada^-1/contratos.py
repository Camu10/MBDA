from sys import stdin

def lectura():
   
    for i in range(501,1001):
        print("INSERT INTO contratos (tipo , empleado) VALUES ( 'Indefinido' , "+str(i)+");")        
        
lectura()
