BEGIN
    PC_PROFESORES.AD_PROFESORES('Crerar, Dr Alison',
    xmltype('<?xml version="1.0" encoding="UTF-8"?>
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
    ));
END;
/
BEGIN
    PC_PROFESORES.EL_PROFESORES('co.AMn');
END;
/
BEGIN 
    PC_PROFESORES.MO_PROFESORES('co.CB');
END;
/
BEGIN
    PC_TALLERES.AD_TALLERES('co12004.T03','co12004','T','Tuesday','13:00',2,'co.117');
END;
/