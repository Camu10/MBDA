from sys import stdin

def lectura():
   
    for i in range(1,1001):
        print("INSERT INTO inventario (anime , figura) VALUES (" +str(i)+", "+str(i)+");")        
        
lectura()
