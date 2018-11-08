from sys import stdin


def lectura():
    generos  =['Kodomo','Shonen','Sh?jo','Seinen','Josei','Mahô shôjo','Mecha','Sentai','Spokon','Post-apocalíptico','Meitantei','Sh?nen-ai y Yaoi','Sh?jo-ai y Yuri','Hentai','Ecchi','Harem','Harem Reverso','Magical Girlfriend','Anime progresivo','Bish?jo','Bish?nen','Kemono','Super deformed','Moé','Gore']
    j = 0
    for i in range(501):
        a = stdin.readline().strip()
        if j == len(generos): j = 0
        print("INSERT INTO animes(nombre,genero) VALUES ('"+str(a)+"' , '"+str(generos[j])+"');")
        j+=1

lectura()
