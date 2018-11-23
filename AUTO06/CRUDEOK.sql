BEGIN
    PC_PROFESORES.AD_PROFESORES('Crerar, Dr Alison',
    xmltype('<?xml version="1.0" encoding="UTF-8"?>
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