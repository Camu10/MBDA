from sys import stdin

def lectura():
   
    for i in range(1,1001):
        print("INSERT INTO elencos (anime , personaje) VALUES (" +str(i)+", "+str(i)+");")        
        
lectura()
