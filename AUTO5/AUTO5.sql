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
           <T�tulos>
              <T�tulo>Nombre =  "Ingeniero Mecatronico"
                            A�o= "2010"
                            Grado = "Doctorado"</T�tulo> 
           </T�tulos>
           <Reconocimientos>
              <Reconocimiento>Nombre = "Inovacion en tencologia"
                            Institucion =  "Tecnnova"
                            A�o = "2015"</Reconocimiento>
           </Reconocimientos>
           <Art�culos>
              <Art�culo>NombreDelArt�culo = "La tecnologia y sus ventajas"
                            NombreDeLaRevista =  "Tecnopolis"
                            A�o = "2015"
                            Categor�aColciencias = "A1"</Art�culo>
           </Art�culos>
           <Asignaturas>
              <Asignatura>Nombre = "Circuitos"
                            Numero = "6"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre = "Universidad Nacional"
                            A�oInicio = "2010"
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
           <T�tulos>
              <T�tulo>Nombre= "Historiador"
                            A�o= "2005"
                            Grado= "Pregrado"</T�tulo>
           </T�tulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Conociendo nuestra historia"
                            Institucion= "Centro de memoria historica"
                            A�o= "2017"</Reconocimiento>
              <Reconocimiento>Nombre= "La historia es de todos"
                            Institucion= "Centro de memoria historica"
                            A�o= "2000"</Reconocimiento>
           </Reconocimientos>
           <Art�culos>
              <Art�culo>NombreDelArt�culo= "Nuestra historia"
                            NombreDeLaRevista= "Basta ya"
                            A�o= "2010"
                            Categor�aColciencias= "B"</Art�culo>
           </Art�culos>
           <Asignaturas>
              <Asignatura>Nombre= "Historia de Colombia"
                            Numero= "10"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Universidad Nacional"
                            A�oInicio= "2010"
                            Cargo="Profesor"</Institucion>
              <Institucion>Nombre= "Universidad Distrital"
                            A�oInicio="2017"
                            Cargo= "Profesor"</Institucion>
           </Experiencia>
        </Informacion>'
    );

INSERT INTO staff VALUES(
    'co.AFA'
    ,'Armitage, Dr Alistair'
    ,'<?xml version="1.0" encoding="UTF-8"?>
        <Informacion>
           <Area>Matem�tica</Area>
           <Ultimogrado>Pos-Doctorado</Ultimogrado>
           <T�tulos>
              <T�tulo>Nombre= "Matematico"
                            A�o= "2011"
                            Grado="Doctorado"</T�tulo>
           </T�tulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Matematicas y la vida"
                            Institucion= "Distrito de Educacion Nacional"
                            A�o= "2016"</Reconocimiento>
           </Reconocimientos>
           <Art�culos>
              <Art�culo>NombreDelArt�culo= "Matematicas en nuestro diario vivir"
                            NombreDeLaRevista= "Ciencia y Tecnologia"
                            A�o= "2010"
                            Categor�aColciencias= "A2"</Art�culo>
              <Art�culo>NombreDelArt�culo= "La tecnologia y sus ventajas"
                            NombreDeLaRevista= "Tecnopolis"
                            A�o= "2015"
                            Categor�aColciencias = "A1"</Art�culo>
           </Art�culos>
           <Asignaturas>
              <Asignatura>Nombre= "Calculo Vectorial"
                            Numero= "13"</Asignatura>
              <Asignatura>Nombre= "Calculo Integral"
                            Numero= "12"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                            A�oInicio= "2000"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad De La Sabana"
                            A�oInicio= "2005"
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
           <T�tulos>
              <T�tulo>Nombre= "Ingeniero de Civil"
                            A�o= "2001"
                            Grado="Doctorado"</T�tulo>
           </T�tulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Fisico del a�o"
                            Institucion= "Distrito de Educacion Nacional"
                            A�o= "2010"</Reconocimiento>
           </Reconocimientos>
           <Art�culos>
              <Art�culo>NombreDelArt�culo= "Fisica en nuestro dias"
                            NombreDeLaRevista= "Ciencia y Tecnologia"
                            A�o= "2009"
                            Categor�aColciencias= "C"</Art�culo>
           </Art�culos>
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
                            A�oInicio= "2005"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad De La Salle"
                            A�oInicio= "2011"
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
           <T�tulos>
              <T�tulo>Nombre= "Ingeniero de Sistemas"
                            A�o= "2000"
                            Grado="Doctorado"</T�tulo>
           </T�tulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "El avance de la tecnologia"
                            Institucion= "MinTIC"
                            A�o= "2007"</Reconocimiento>
           </Reconocimientos>
           <Art�culos>
              <Art�culo>NombreDelArt�culo= "Tecnologia ventaja o amenaza"
                            NombreDeLaRevista= "Ciencia y Tecnologia"
                            A�o= "2012"
                            Categor�aColciencias= "C"</Art�culo>
           </Art�culos>
           <Asignaturas>
              <Asignatura>Nombre= "Programacion Imperativa Modular"
                            Numero= "9"</Asignatura>
              <Asignatura>Nombre= "Programacion Imperativa Basica"
                            Numero= "14"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                            A�oInicio= "2005"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad De La Distrital"
                            A�oInicio= "2011"
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
           <T�tulos>
              <T�tulo>Nombre= "Economista"
                            A�o= "2015"
                            Grado="Maestria"</T�tulo>
           </T�tulos>
           <Reconocimientos>
              <Reconocimiento>Nombre= "Como invertir en la bolsa"
                            Institucion= "Wall Street"
                            A�o= "2007"</Reconocimiento>
           </Reconocimientos>
           <Art�culos>
              <Art�culo>NombreDelArt�culo= "La economia en el hogar"
                            NombreDeLaRevista= "Economia"
                            A�o= "2014"
                            Categor�aColciencias= "A1"</Art�culo>
           </Art�culos>
           <Asignaturas>
              <Asignatura>Nombre= "Fundamentos de Economia"
                            Numero= "9"</Asignatura>
              <Asignatura>Nombre= "Fundamentos Contables y Financieros"
                            Numero= "10"</Asignatura>
           </Asignaturas>
           <Experiencia>
              <Institucion>Nombre= "Escuela Colombiana de Ingenieria Julio Garavito"
                            A�oInicio= "2005"
                            Cargo= "Profesor"</Institucion>
              <Institucion>Nombre= "Universidad Sergio Arboleda"
                            A�oInicio= "1999"
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
    <!ELEMENT T�tulos(Titulo+)>
        <!ATTLIST T�tulo
            Nombre CDATA #REQUIRED
            A�o CDATA #REQUIRED
            Grado CDATA #IMPLIED>
     <!ELEMENT Reconocimientos(Reconocimiento*)>
        <!ATTLIST Reconocimiento
            Nombre CDATA #REQUIRED
            Institucion CDATA #REQUIRED
            A�o CDATA #REQUIRED>
    <!ELEMENT Articulos(Articulo*)>
        <!ATTLIST Articulo
            NombreDelArt�culo CDATA #REQUIRED
            NombreDeLaRevista CDATA #REQUIRED
            A�o CDATA #REQUIRED
            Categor�aColciencias (A1|A2|B|C) #REQUIRED>
    <!ELEMENT Asignaturas(Asignatura+)>
        <!ATTLIST Asignatura
            Nombre CDATA #REQUIRED
            Numero CDATA #REQUIRED>
    <!ELEMENT Experiencia(Institucion*)>
        <!ATTLIST Institucion
            Nombre CDATA #REQUIRED
            A�oInicio CDATA #REQUIRED
            A�oFin CDATA #IMPLIED
            Cargo CDATA #REQUIRED>
]>
1. Los profesores pueden tener o no articulos 
2. Todas las experiencias deben tener en cargo
3. Los profesores deben tener un ultimio grado
*/