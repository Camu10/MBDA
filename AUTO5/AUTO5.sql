 --Definiendo y poblando
 CREATE TABLE staff(
    id VARCHAR(20) NOT NULL
    ,name VARCHAR(50)
    ,hojadevida XMLTYPE
    );
    

ALTER TABLE staff ADD CONSTRAINT PK_staff PRIMARY KEY(id);

INSERT INTO staff VALUES(
    'co.ACr'
    ,'Crerar, Dr Alison'
    ,'<?xml version="1.0"?>
        <Informacion>
           <Area> informatica </Area> 
           <Ultimogrado> pos-doctorado </Ultimogrado>
           <Títulos> 
                <Título>
                    Nombre =  "Ingeniero Mecatronico"
                    Año= "2010"
                    Grado = "Doctorado"
                </Título>
           </Títulos>
           <Reconocimientos> 
                <Reconocimiento>
                    Nombre = "Inovacion en tencologia"
                    Institucion =  "Tecnnova"
                    Año = "2015"
                </Reconocimiento>
           </Reconocimientos>
           <Artículos> 
                <Artículo> 
                    NombreDelArtículo = "La tecnologia y sus ventajas"
                    NombreDeLaRevista =  "Tecnopolis"
                    Año = "2015"
                    CategoríaColciencias = "A1"
                </Artículo> 
            </Artículos>
           <Asignaturas> 
                <Asignatura>
                    Nombre = "Circuitos"
                    Numero = "6"
                </Asignatura>
           </Asignaturas>
           <Experiencia>
                <Institucion>
                    Nombre = "Universidad Nacional"
                    AñoInicio = "2010"
                    Cargo = "Profesor"
                </Institucion>
           </Experiencia>
        </Informacion>'
    );
    
INSERT INTO staff VALUES(
    'co.ACg'
    ,'Cumming, Andrew'
    ,'<?xml version="1.0"?>
        <Informacion>
           <Area> Historia </Area>
           <Ultimogrado>  Doctorado </Ultimogrado>
           <Títulos> 
                <Título>
                    Nombre= "Historiador"
                    Año= "2005"
                    Grado= "Pregrado"
                </Título>
           </Títulos>
           <Reconocimientos> 
                <Reconocimiento>
                    Nombre= "Conociendo nuestra historia"
                    Institucion= "Centro de memoria historica"
                    Año= "2017"
                </Reconocimiento>
                <Reconocimiento>
                    Nombre= "La historia es de todos"
                    Institucion= "Centro de memoria historica"
                    Año= "2000"
                </Reconocimiento>
           </Reconocimientos>
           <Artículos> 
                <Artículo> 
                    NombreDelArtículo= "Nuestra historia"
                    NombreDeLaRevista= "Basta ya"
                    Año= "2010"
                    CategoríaColciencias= "B"
                </Artículo> 
            </Artículos>
           <Asignaturas> 
                <Asignatura>
                    Nombre= "Historia de Colombia"
                    Numero= "10"
                </Asignatura>
           </Asignaturas>
           <Experiencia>
                <Institucion>
                    Nombre= "Universidad Nacional"
                    AñoInicio= "2010"
                    Cargo="Profesor"
                </Institucion>
                <Institucion>
                    Nombre= "Universidad Distrital"
                    AñoInicio="2017"
                    Cargo= "Profesor"
                </Institucion>
           </Experiencia>
        </Informacion>'
    );

INSERT INTO staff VALUES(
    'co.AFA'
    ,'Armitage, Dr Alistair'
    ,'<?xml version="1.0"?>
        <Informacion>
           <Area> Matemática </Area> 
           <Ultimogrado>  Pos-Doctorado </Ultimogrado>
           <Títulos> 
                <Título>
                    Nombre= "Matematico"
                    Año= "2011"
                    Grado="Doctorado"
                </Título>
           </Títulos>
           <Reconocimientos> 
                <Reconocimiento>
                    Nombre= "Matematicas y la vida"
                    Institucion= "Distrito de Educacion Nacional"
                    Año= "2016"
                </Reconocimiento>
           </Reconocimientos>
           <Artículos> 
                <Artículo> 
                    NombreDelArtículo= "Matematicas en nuestro diario vivir"
                    NombreDeLaRevista= "Ciencia y Tecnologia"
                    Año= "2010"
                    CategoríaColciencias= "A2"
                </Artículo>
                <Artículo> 
                    NombreDelArtículo= "La tecnologia y sus ventajas"
                    NombreDeLaRevista= "Tecnopolis"
                    Año= "2015"
                    CategoríaColciencias = "A1"
                </Artículo> 
            </Artículos>
           <Asignaturas> 
                <Asignatura>
                    Nombre= "Calculo Vectorial"
                    Numero= "13"
                </Asignatura>
                <Asignatura>
                    Nombre= "Calculo Integral"
                    Numero= "12"
                </Asignatura>
           </Asignaturas>
           <Experiencia>
                <Institucion>
                    Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                    AñoInicio= "2000"
                    Cargo= "Profesor"
                </Institucion>
                <Institucion>
                    Nombre= "Universidad De La Sabana"
                    AñoInicio= "2005"
                    Cargo="Profesor"
                </Institucion>
           </Experiencia>
        </Informacion>'
    );  
    
    
<?xml version="1.0"?>
<!DOCTYPE Informacion[
    <!ELEMENT informacion(Area,Ultimogrado,titulos,reconocimientos,articulos,asignaturas,experiencia)>
    <!ELEMENT Area EMPTY> 
    <!ELEMENT Ultimogrado EMPTY>
    <!ELEMENT Títulos(Titulo*)>
        <!ATTLIST Título
            Nombre CDATA #REQUIRED
            Año CDATA #REQUIRED
            Grado CDATA #REQUIRED>
     <!ELEMENT Reconocimientos(Reconocimiento*)>
        <!ATTLIST Reconocimiento
            Nombre CDATA #REQUIRED
            Institucion CDATA #REQUIRED
            Año CDATA #REQUIRED>
    <!ELEMENT Articulos(Articulo*)>
        <!ATTLIST Articulo
            NombreDelArtículo CDATA #REQUIRED
            NombreDeLaRevista CDATA #REQUIRED
            Año CDATA #REQUIRED
            CategoríaColciencias CDATA #REQUIRED>
    <!ELEMENT Asignaturas(Asignatura*)>
        <!ATTLIST Asignatura
            Nombre CDATA #REQUIRED
            numero CDATA #REQUIRED>
    <!ELEMENT Instituciones(Institucion*)>
        <!ATTLIST Institucion
            Nombre CDATA #REQUIRED
            AñoInicio CDATA #REQUIRED
            Cargo CDATA #REQUIRED>
]>