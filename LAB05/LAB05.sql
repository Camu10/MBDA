CREATE TABLE validaciones(
    numero NUMBER(5) NOT NULL
    ,correo VARCHAR(30) NOT NULL
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
ALTER TABLE validaciones ADD CONSTRAINT FK_validaciones_perfiles FOREIGN KEY(correo) REFERENCES perfiles(correo);

ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_consecutivo_valida
    CHECK(numero>=1 AND numero<=99999);
ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_estado_validacion 
    CHECK(estado IN('E','T','A')); 
ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_correo_validaciones
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE perfiles ADD CONSTRAINT CK_Tipo_correo_perfiles 
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE perfiles ADD CONSTRAINT CK_Tipo_nombre_perfiles
   CHECK(NOT REGEXP_LIKE(nombre,'[0-9@"#$%&/()=?¿!¡<>*+_.:;|°]') AND nombre LIKE '% %');

INSERT INTO perfiles VALUES('meddolls0@ow.ly','Micky Eddolls');
INSERT INTO perfiles VALUES('bdeamer1@ifeng.com','Micky Deamer');
INSERT INTO perfiles VALUES('ystrethill2@phoca.cz','Yasmin Strethill');

INSERT INTO validaciones VALUES(1,'meddolls0@ow.ly',TO_DATE('01-12-2018','dd-mm-yyyy'),NULL,'E',11,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Todos por todos </Nombre>
            <Año> 2010 </Año>
            <Rol> Inversor </Rol>
            <Evaluacion>  </Evaluacion>
        </Proyectos>
    </Validaciones>'
    );
INSERT INTO validaciones VALUES(2,'bdeamer1@ifeng.com',TO_DATE('10-02-2018','dd-mm-yyyy'),NULL,'A',12,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Oculus Rift </Nombre>
            <Año> 2018 </Año>
            <Rol> Contribuyente </Rol>
            <Evaluacion>  </Evaluacion>
        </Proyectos>
    </Validaciones>' 
    );
INSERT INTO validaciones VALUES(3,'ystrethill2@phoca.cz',TO_DATE('11-12-2018','dd-mm-yyyy'),NULL,'T',13,
'<?xml version = "1.0" encoding="UTF-8"?>
    <Validaciones>
        <Proyectos>
            <Nombre> Web bunkers </Nombre>
            <Año> 2000 </Año>
            <Rol> Director </Rol>
            <Evaluacion>  </Evaluacion>
        </Proyectos>
    </Validaciones>'
    );