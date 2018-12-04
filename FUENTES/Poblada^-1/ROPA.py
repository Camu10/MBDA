from sys import stdin


def lectura():
    ropa = ['Pantalon','Camisa','Camiseta','Saco','Medias','Gorro','Chaqueta','Gorra','Pantaloneta','Bufanda']
    j = 0
    for i in range(500):
        a = stdin.readline().strip()
        if j == len(ropa): j = 0
        print("INSERT INTO ropa (categoria,anime) VALUES ('"+str(ropa[j])+"', '"+str(a)+"');")
        j+=1

lectura()
