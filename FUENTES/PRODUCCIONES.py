from sys import stdin

def lectura():
   
    for i in range(1,1001):
        print("INSERT INTO producciones (autor , anime) VALUES (" +str(i)+", "+str(i)+");")        
        
lectura()
