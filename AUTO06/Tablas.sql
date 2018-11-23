/*  A. Adicionando restricciones declarativas       */
---Definir las restricciones declarativas(tuplas)---
CREATE TABLE staff(
    name VARCHAR(50) NOT NULL
    ,id VARCHAR(50) NOT NULL
    ,hojadevida XMLTYPE
    );
CREATE TABLE event(
    id VARCHAR(20)  NOT NULL
    ,modle VARCHAR(20) NOT NULL
    ,kind CHAR(1) NOT NULL
    ,dow VARCHAR(15) NOT NULL
    ,tod CHAR(5) NOT NULL
    ,duration NUMBER NOT NULL
    ,room VARCHAR(20)  NOT NULL
    );  
CREATE TABLE rooms(
    id VARCHAR(20) NOT NULL
    ,name VARCHAR(50)
    ,capacity NUMBER(2) NOT NULL
    ,parent VARCHAR(2)
    );
CREATE TABLE teaches(
    event VARCHAR(20)
    ,staff VARCHAR(20)
    );
---Definir las restricciones declarativas(Atributos)---
ALTER TABLE staff ADD CONSTRAINT PK_staff PRIMARY KEY(id);
ALTER TABLE event ADD CONSTRAINT PK_event_ PRIMARY KEY(id);
ALTER TABLE rooms ADD CONSTRAINT PK_rooms PRIMARY KEY(id);
ALTER TABLE teaches ADD CONSTRAINT PK_teaches PRIMARY KEY(staff,event);
ALTER TABLE event ADD CONSTRAINT  FK_rooms_event FOREIGN KEY(room) REFERENCES rooms(id);
ALTER TABLE teaches ADD CONSTRAINT  FK_staff_teaches FOREIGN KEY(staff) REFERENCES staff(id) ON DELETE CASCADE;
ALTER TABLE teaches ADD CONSTRAINT  FK_teaches_event FOREIGN KEY(event) REFERENCES event(id);

---Minimo debe tener un apellido y un nombre---
ALTER TABLE staff ADD CONSTRAINT CK_name
    CHECK(name LIKE '%, %');
---Las unicas personas que pueden estar a cargo son:  MacLean, Aileen y Kemmer, Rob---
--ALTER TABLE teaches ADD CONSTRAINT CK_director
   -- CHECK(staff IN('co.AMn','co.RK'));
---La intensity es de dos sesiones: viernes 2:00 a 5:00 p.m. (L) y sábado de 8:00 a 12:00 (T).---
ALTER TABLE event ADD CONSTRAINT CK_intensity
    CHECK(kind IN('T','L'));    

---(AtributosOK,TuplasOK)---
INSERT INTO staff VALUES('MacLean, Aileen','co.AMn',
    '<?xml version = "1.0" encoding="UTF-8"?>
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
INSERT INTO staff VALUES('Kemmer, Rob','co.RK',
    '<?xml version="1.0" encoding="UTF-8"?>
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

INSERT INTO rooms VALUES('co.117',NULL,32,NULL);
INSERT INTO rooms VALUES('co.100',NULL,10,NULL);
INSERT INTO rooms VALUES('co.111',NULL,1,NULL);
INSERT INTO rooms VALUES('co.112',NULL,67,NULL);
INSERT INTO rooms VALUES('co.113',NULL,22,NULL);

INSERT INTO event VALUES('co12004.L01','co12004','L','Wednesday','11:00',3,'co.113');
INSERT INTO event VALUES('co12004.L02','co12004','T','Monday','17:00',2,'co.111');
INSERT INTO event VALUES('co12004.T01','co12004','L','Monday','11:00',2,'co.100');
INSERT INTO event VALUES('co12004.T02','co12004','T','Tuesday','15:00',1,'co.117');

INSERT INTO teaches VALUES('co12004.L01','co.AMn');
INSERT INTO teaches VALUES('co12004.L02','co.AMn');
INSERT INTO teaches VALUES('co12004.T01','co.RK');
INSERT INTO teaches VALUES('co12004.T02','co.RK');

---(AtributosNoOK,TuplasNoOK)---
INSERT INTO staff VALUES('SANCHEZ','co.S');
INSERT INTO rooms VALUES('co.117',NULL,NULL,'NO');

/* B. Adicionando acciones de referencia*/
---(Los eventos se pueden eliminar si no poseen, una semana o estudiantes o un profesor que lo atiendan)
ALTER TABLE teaches DROP CONSTRAINT FK_teaches_event; 
ALTER TABLE teaches ADD CONSTRAINT FK_teaches_event
FOREIGN KEY (event) REFERENCES event(id) ON DELETE CASCADE;

---(Validar acciones ok)
DELETE FROM event WHERE id = 'co12004.L01';

/*          C. Adicionando disparadores             */
---No es posible modificar ninguno de los datos salvo el título.---
CREATE OR REPLACE TRIGGER MO_NAME
    BEFORE UPDATE OF name ON staff
    FOR EACH ROW
DECLARE 
    poscoma NUMBER;
    apellido VARCHAR(50);
BEGIN
    poscoma := INSTR(:old.name,',');
    apellido := SUBSTR(:old.name, 0, poscoma);
    IF apellido != SUBSTR(:new.name, 0, poscoma) THEN
        RAISE_APPLICATION_ERROR(-20002,'NO PUEDE ACTUALIZAR');
    END IF;
END;
/
--- El id inicia en co. seguido por la primera letra del apellido y la primera letra del nombre.---
CREATE OR REPLACE TRIGGER MO_NAME_INI
    BEFORE INSERT ON staff
    FOR EACH ROW
DECLARE 
    poscoma NUMBER;
    espa NUMBER;
    primlet VARCHAR(50);
    seglet VARCHAR(50);
BEGIN
    espa := LENGTH(:new.name)-LENGTH(REPLACE(:new.name,' '));
    IF espa = 1 THEN
        poscoma := INSTR(:new.name,',');
        primlet := SUBSTR(:new.name,1,1);
        seglet := SUBSTR(:new.name,poscoma+2,1);
        :new.id := 'co.'||primlet||seglet;
    ELSE
        poscoma := INSTR(:new.name,',');
        primlet := SUBSTR(:new.name,1,1);
        seglet := SUBSTR(:new.name,poscoma+5,1);
        :new.id := 'co.'||primlet||seglet;
    END IF;
END;
/
---No es posible modificarlos ni eliminarlos---
CREATE OR REPLACE TRIGGER NO_UPDATE_EVENT
    BEFORE UPDATE ON event
    FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20005,'NO SE PERMITE ACTUALIZAR');
END;
/
CREATE OR REPLACE TRIGGER NO_DELETE_event
    BEFORE DELETE ON event
    FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20006,'NO SE PERMITE ELIMINAR');
END;
/
/*
--- Xdisparadores ---
DROP TRIGGER MO_NAME;
DROP TRIGGER MO_NAME_INI;
DROP TRIGGER NO_UPDATE_EVENT;
DROP TRIGGER NO_DELETE_event;
*/
--- Escriba 3 instrucciones que permitan probar la actualización de la base de datos ---
UPDATE staff
SET name='Cumming, Dr Andrew' WHERE id = 'co.CA';
UPDATE staff
SET name='Soutar, Dr Alastai' WHERE id = 'co.SA';
UPDATE staff
SET name='Armitage, Dr Alistair' WHERE id = 'co.AA';

INSERT INTO staff(name) VALUES('Varey, Alison');
INSERT INTO staff(name) VALUES('Cowan, Bruce');
INSERT INTO staff(name) VALUES('Russell, Dr Gordon');

---  Escriban 3 instrucciones por disparador para validar que protege la base de datos impidiendo que se actualice ---
UPDATE staff
SET name='Cuming, Dr Andrew' WHERE id = 'co.CA';
UPDATE staff
SET name='Souar, Dr Alastai' WHERE id = 'co.SA';
UPDATE staff
SET name='Armiage, Dr Alistair' WHERE id = 'co.AA';

UPDATE event
SET room='75' WHERE id = 'co12002';
UPDATE event
SET room='fdg' WHERE id = 'co12005';
UPDATE event
SET room='cs' WHERE id = 'co12007';

DELETE FROM event
WHERE id = 'co12002';
DELETE FROM event
WHERE id = 'co12007';
DELETE FROM event
WHERE id = 'co12005';
DELETE FROM staff
WHERE id = 'co.RK';