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
    ,'<?xml version = "1.0" encoding="UTF-8"?>
        <Informacion>
           <Area>informatica</Area>
           <Ultimogrado>pos-doctorado</Ultimogrado>
           <Títulos>
              <Título>Nombre =  "Ingeniero Mecatronico"
                            Año= "2010"
                            Grado = "Doctorado"</Título> 
           </Títulos>
           <Reconocimientos>
              <Reconocimiento>Nombre = "Inovacion en tencologia"
                            Institucion =  "Tecnnova"
                            Año = "2015"</Reconocimiento>
           </Reconocimientos>
           <Artículos>
              <Artículo>NombreDelArtículo = "La tecnologia y sus ventajas"
                            NombreDeLaRevista =  "Tecnopolis"
                            Año = "2015"
                            CategoríaColciencias = "A1"</Artículo>
           </Artículos>
           <Asignaturas>
              <Asignatura>Nombre = "Circuitos"
                            Numero = "6"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre = "Universidad Nacional"
                            AñoInicio = "2010"
                            Cargo = "Profesor"</Institucion>
           </Experiencia>
        </Informacion>'
    );
    
INSERT INTO staff VALUES(
    'co.ACg'
    ,'Cumming, Andrew'
    ,'<?xml version="1.0" encoding="UTF-8"?>
        <Informacion>
           <Area>Historia</Area>
           <Ultimogrado>Doctorado</Ultimogrado>
           <Títulos>
              <Título>Nombre= "Historiador"
                            Año= "2005"
                            Grado= "Pregrado"</Título>
           </Títulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Conociendo nuestra historia"
                            Institucion= "Centro de memoria historica"
                            Año= "2017"</Reconocimiento>
              <Reconocimiento>Nombre= "La historia es de todos"
                            Institucion= "Centro de memoria historica"
                            Año= "2000"</Reconocimiento>
           </Reconocimientos>
           <Artículos>
              <Artículo>NombreDelArtículo= "Nuestra historia"
                            NombreDeLaRevista= "Basta ya"
                            Año= "2010"
                            CategoríaColciencias= "B"</Artículo>
           </Artículos>
           <Asignaturas>
              <Asignatura>Nombre= "Historia de Colombia"
                            Numero= "10"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Universidad Nacional"
                            AñoInicio= "2010"
                            Cargo="Profesor"</Institucion>
              <Institucion>Nombre= "Universidad Distrital"
                            AñoInicio="2017"
                            Cargo= "Profesor"</Institucion>
           </Experiencia>
        </Informacion>'
    );

INSERT INTO staff VALUES(
    'co.AFA'
    ,'Armitage, Dr Alistair'
    ,'<?xml version="1.0" encoding="UTF-8"?>
        <Informacion>
           <Area>Matemática</Area>
           <Ultimogrado>Pos-Doctorado</Ultimogrado>
           <Títulos>
              <Título>Nombre= "Matematico"
                            Año= "2011"
                            Grado="Doctorado"</Título>
           </Títulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Matematicas y la vida"
                            Institucion= "Distrito de Educacion Nacional"
                            Año= "2016"</Reconocimiento>
           </Reconocimientos>
           <Artículos>
              <Artículo>NombreDelArtículo= "Matematicas en nuestro diario vivir"
                            NombreDeLaRevista= "Ciencia y Tecnologia"
                            Año= "2010"
                            CategoríaColciencias= "A2"</Artículo>
              <Artículo>NombreDelArtículo= "La tecnologia y sus ventajas"
                            NombreDeLaRevista= "Tecnopolis"
                            Año= "2015"
                            CategoríaColciencias = "A1"</Artículo>
           </Artículos>
           <Asignaturas>
              <Asignatura>Nombre= "Calculo Vectorial"
                            Numero= "13"</Asignatura>
              <Asignatura>Nombre= "Calculo Integral"
                            Numero= "12"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                            AñoInicio= "2000"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad De La Sabana"
                            AñoInicio= "2005"
                            Cargo="Profesor"</Institucion>
           </Experiencia>
        </Informacion>'
    ); 
INSERT INTO staff VALUES(
    'co.AG'
    ,'Groat, Anne'
    ,'<?xml version="1.0" encoding="UTF-8"?>
        <Informacion>
           <Area> Fisica </Area>
           <Ultimogrado> Pregrado </Ultimogrado>
           <Títulos>
              <Título>Nombre= "Ingeniero de Civil"
                            Año= "2001"
                            Grado="Doctorado"</Título>
           </Títulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Fisico del año"
                            Institucion= "Distrito de Educacion Nacional"
                            Año= "2010"</Reconocimiento>
           </Reconocimientos>
           <Artículos>
              <Artículo>NombreDelArtículo= "Fisica en nuestro dias"
                            NombreDeLaRevista= "Ciencia y Tecnologia"
                            Año= "2009"
                            CategoríaColciencias= "C"</Artículo>
           </Artículos>
           <Asignaturas>
              <Asignatura>Nombre= "Fisica Electronica y de magnetismo"
                            Numero= "9"</Asignatura>
              <Asignatura>Nombre= "Fundamentos de Fisica"
                            Numero= "14"</Asignatura>
               <Asignatura>Nombre= "Fisica de Calor y Ondas"
                            Numero= "14"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                            AñoInicio= "2005"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad De La Salle"
                            AñoInicio= "2011"
                            Cargo="Profesor"</Institucion>
           </Experiencia>
        </Informacion>'
    );
INSERT INTO staff VALUES(
    'co.AL'
    ,'Lawson, Alistair'
    ,'<?xml version="1.0" encoding="UTF-8"?>
        <Informacion>
           <Area> Programacion </Area>
           <Ultimogrado> Maestria </Ultimogrado>
           <Títulos>
              <Título>Nombre= "Ingeniero de Sistemas"
                            Año= "2000"
                            Grado="Doctorado"</Título>
           </Títulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "El avance de la tecnologia"
                            Institucion= "MinTIC"
                            Año= "2007"</Reconocimiento>
           </Reconocimientos>
           <Artículos>
              <Artículo>NombreDelArtículo= "Tecnologia ventaja o amenaza"
                            NombreDeLaRevista= "Ciencia y Tecnologia"
                            Año= "2012"
                            CategoríaColciencias= "C"</Artículo>
           </Artículos>
           <Asignaturas>
              <Asignatura>Nombre= "Programacion Imperativa Modular"
                            Numero= "9"</Asignatura>
              <Asignatura>Nombre= "Programacion Imperativa Basica"
                            Numero= "14"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                            AñoInicio= "2005"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad De La Distrital"
                            AñoInicio= "2011"
                            Cargo="Profesor"</Institucion>
           </Experiencia>
        </Informacion>'
    );
INSERT INTO staff VALUES(
    'co.AMn'
    ,'Maclean, Aileen'
    ,'<?xml version="1.0" encoding="UTF-8"?>
        <Informacion>
           <Area> Economia </Area>
           <Ultimogrado> Pregrado </Ultimogrado>
           <Títulos>
              <Título>Nombre= "Economista"
                            Año= "2015"
                            Grado="Maestria"</Título>
           </Títulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Como invertir en la bolsa"
                            Institucion= "Wall Street"
                            Año= "2007"</Reconocimiento>
           </Reconocimientos>
           <Artículos>
              <Artículo>NombreDelArtículo= "La economia en el hogar"
                            NombreDeLaRevista= "Economia"
                            Año= "2014"
                            CategoríaColciencias= "A1"</Artículo>
           </Artículos>
           <Asignaturas>
              <Asignatura>Nombre= "Fundamentos de Economia"
                            Numero= "9"</Asignatura>
              <Asignatura>Nombre= "Fundamentos Contables y Financieros"
                            Numero= "10"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                            AñoInicio= "2005"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad Sergio Arboleda"
                            AñoInicio= "1999"
                            Cargo="Profesor"</Institucion>
           </Experiencia>
        </Informacion>'
    );
/* 
<?xml version="1.0"?>
<!DOCTYPE Informacion[
    <!ELEMENT Informacion(Area,Ultimogrado,Titulos,Reconocimientos,Articulos,Asignaturas,Experiencia)
    <!ELEMENT Area EMPTY> 
    <!ELEMENT Ultimogrado EMPTY>
    <!ELEMENT Títulos(Titulo+)>
        <!ATTLIST Título
            Nombre CDATA #REQUIRED
            Año CDATA #REQUIRED
            Grado CDATA #IMPLIED>
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
            CategoríaColciencias (A1|A2|B|C) #REQUIRED>
    <!ELEMENT Asignaturas(Asignatura+)>
        <!ATTLIST Asignatura
            Nombre CDATA #REQUIRED
            Numero CDATA #REQUIRED>
    <!ELEMENT Experiencia(Institucion*)>
        <!ATTLIST Institucion
            Nombre CDATA #REQUIRED
            AñoInicio CDATA #REQUIRED
            AñoFin CDATA #IMPLIED
            Cargo CDATA #REQUIRED>
]>
1. Los profesores pueden tener o no articulos 
2. Todas las experiencias deben tener en cargo
3. Los profesores deben tener un ultimio grado
*/