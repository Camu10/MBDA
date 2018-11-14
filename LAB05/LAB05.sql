CREATE TABLE validaciones(
    numero NUMBER(5) NOT NULL
    ,fecha DATE NOT NULL
    ,justificacion VARCHAR(100)
    ,estado VARCHAR(1) NOT NULL
    ,codigo NUMBER(2) NOT NULL
    ,formacion XMLTYPE
    );
CREATE TABLE perfiles(
    correo VARCHAR(30) NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    );

ALTER TABLE validaciones ADD CONSTRAINT PK_validaciones PRIMARY KEY(numero);
ALTER TABLE perfiles ADD CONSTRAINT PK_perfiles PRIMARY KEY(correo);

ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_consecutivo_valida
    CHECK(numero>=1 AND numero<=99999);
ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_estado_validacion 
    CHECK(estado IN('E','T','A')); 
ALTER TABLE perfiles ADD CONSTRAINT CK_Tipo_correo_perfiles 
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE perfiles ADD CONSTRAINT CK_Tipo_nombre_perfiles
   CHECK(NOT REGEXP_LIKE(nombre,'[0-9@"#$%&/()=?¿!¡<>*+_.:;|°]') AND nombre LIKE '% %');

INSERT INTO perfiles VALUES('meddolls0@ow.ly','Micky Eddolls');
INSERT INTO perfiles VALUES('bdeamer1@ifeng.com','Micky Deamer');
INSERT INTO perfiles VALUES('ystrethill2@phoca.cz','Yasmin Strethill');

INSERT INTO validaciones VALUES(1,TO_DATE('01-12-2018','dd-mm-yyyy'),NULL,'E',11,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Todos por todos </Nombre>
            <Año> 2010 </Año>
            <Rol> Inversor </Rol>
            <Evaluacion>  
                <Evaluado> carlos.murillo-i@mail.escuelaing.edu.co </Evaluado>
                <Evaluador> eduard.jimenez@mail.escuelaing.edu.co </Evaluador>
            </Evaluacion>
        </Proyectos>
    </Validaciones>'
    );
INSERT INTO validaciones VALUES(2,TO_DATE('10-02-2018','dd-mm-yyyy'),NULL,'A',12,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Oculus Rift </Nombre>
            <Año> 2018 </Año>
            <Rol> Contribuyente </Rol>
            <Evaluacion>  
                <Evaluado> julian.benitez@mail.escuelaing.edu.co </Evaluado>
                <Evaluador> cesar.gonzalez-c@mail.escuelaing.edu.co </Evaluador>
            </Evaluacion>
        </Proyectos>
    </Validaciones>' 
    );
INSERT INTO validaciones VALUES(3,TO_DATE('11-12-2018','dd-mm-yyyy'),NULL,'T',13,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Web bunkers </Nombre>
            <Año> 2000 </Año>
            <Rol> Director </Rol>
            <Evaluacion>
                <Evaluado> miguel.sanchez-g@mail.escuelaing.edu.co </Evaluado>
                <Evaluador> andres.rocha@mail.escuelaing.edu.co </Evaluador>
            </Evaluacion>
        </Proyectos>
    </Validaciones>'
    );
    
---NoOk
---La etiqueta nombre esta vacío
INSERT INTO validaciones VALUES(1,TO_DATE('01-12-2018','dd-mm-yyyy'),NULL,'E',11,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> </Nombre>
            <Año> 2010 </Año>
            <Rol> Inversor </Rol>
            <Evaluacion>  
                <Evaluado> carlos.murillo-i@mail.escuelaing.edu.co </Evaluado>
                <Evaluador> eduard.jimenez@mail.escuelaing.edu.co </Evaluador>
            </Evaluacion>
        </Proyectos>
    </Validaciones>'
    );
-- El estado es diferente a E , T , A 
INSERT INTO validaciones VALUES(2,TO_DATE('10-02-2018','dd-mm-yyyy'),NULL,'z',12,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Oculus Rift </Nombre>
            <Año> 2018 </Año>
            <Rol> Contribuyente </Rol>
            <Evaluacion>  
                <Evaluado> julian.benitez@mail.escuelaing.edu.co </Evaluado>
                <Evaluador> cesar.gonzalez-c@mail.escuelaing.edu.co </Evaluador>
            </Evaluacion>
        </Proyectos>
    </Validaciones>' 
    );
--Tiene dos raices
INSERT INTO validaciones VALUES(3,TO_DATE('11-12-2018','dd-mm-yyyy'),NULL,'T',13,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Web bunkers </Nombre>
            <Año> 2000 </Año>
            <Rol> Director </Rol>
            <Evaluacion>
                <Evaluado> miguel.sanchez-g@mail.escuelaing.edu.co </Evaluado>
                <Evaluador> andres.rocha@mail.escuelaing.edu.co </Evaluador>
            </Evaluacion>
        </Proyectos>
    </Validaciones>
    <Val> </Val>'
    );