/*  A. Adicionando restricciones declarativas       */
---Definir las restricciones declarativas(tuplas)---
CREATE TABLE staff(
    name VARCHAR(50) NOT NULL
    ,id VARCHAR(50) NOT NULL
    );
CREATE TABLE event(
    id VARCHAR(20)  NOT NULL
    ,director VARCHAR(50)  NOT NULL
    ,room VARCHAR(10)  NOT NULL
    ,intensity VARCHAR(10)  NOT NULL
    );  
CREATE TABLE rooms(
    id VARCHAR(20) NOT NULL
    ,name VARCHAR(50)
    ,capacity NUMBER(2) NOT NULL
    ,provision VARCHAR(2)NOT NULL
    );
CREATE TABLE teaches(
    staff VARCHAR(20)
    ,event VARCHAR(20)
    );
---Definir las restricciones declarativas(Atributos)---
ALTER TABLE staff ADD CONSTRAINT PK_staff PRIMARY KEY(id);
ALTER TABLE event ADD CONSTRAINT PK_event_ PRIMARY KEY(id);
ALTER TABLE rooms ADD CONSTRAINT PK_rooms PRIMARY KEY(id);
ALTER TABLE teaches ADD CONSTRAINT PK_teaches PRIMARY KEY(staff,event);
ALTER TABLE event ADD CONSTRAINT  FK_rooms_event FOREIGN KEY(room) REFERENCES rooms(id);
ALTER TABLE teaches ADD CONSTRAINT  FK_staff_teaches FOREIGN KEY(staff) REFERENCES staff(id);
ALTER TABLE teaches ADD CONSTRAINT  FK_teaches_event FOREIGN KEY(event) REFERENCES event(id);

---Minimo debe tener un apellido y un nombre---
ALTER TABLE staff ADD CONSTRAINT CK_name
    CHECK(name LIKE '%, %');
---Las unicas personas que pueden estar a cargo son:  MacLean, Aileen y Kemmer, Rob---
ALTER TABLE event ADD CONSTRAINT CK_director
    CHECK(director IN('MacLean','Aileen y Kemmer','Rob'));
---La intensity es de dos sesiones: viernes 2:00 a 5:00 p.m. (L) y sábado de 8:00 a 12:00 (T).---
ALTER TABLE event ADD CONSTRAINT CK_intensity
    CHECK(intensity IN('T','L'));    
---La disponibilidad puede ser SI o NO---
ALTER TABLE rooms ADD CONSTRAINT CK_provision
    CHECK(provision IN('SI','NO'));

---(AtributosOK,TuplasOK)---
INSERT INTO staff VALUES('Cumming, Andrew','co.CA');
INSERT INTO staff VALUES('Soutar, Alastair','co.SA');
INSERT INTO staff VALUES('Armitage, Dr Alistair','co.AA');
INSERT INTO staff VALUES('Groat, Anne','co.GA');

INSERT INTO rooms VALUES('co.117',NULL,32,'NO');
INSERT INTO rooms VALUES('co.100',NULL,10,'SI');
INSERT INTO rooms VALUES('co.111',NULL,1,'SI');
INSERT INTO rooms VALUES('co.112',NULL,67,'NO');
INSERT INTO rooms VALUES('co.113',NULL,22,'SI');

INSERT INTO event VALUES('co12004','Aileen y Kemmer','co.117','L');
INSERT INTO event VALUES('co12002','Aileen y Kemmer','co.111','T');
INSERT INTO event VALUES('co12005','MacLean','co.112','L');
INSERT INTO event VALUES('co12007','Rob','co.113','T');
---(AtributosNoOK,TuplasNoOK)---
INSERT INTO staff VALUES('SANCHEZ','co.S');
INSERT INTO rooms VALUES('co.117',NULL,NULL,'NO');
INSERT INTO event VALUES('co12004','EDUARD','103','e');

/* B. Adicionando acciones de referencia*/
---(Los eventos se pueden eliminar si no poseen, una semana o estudiantes o un profesor que lo atiendan)
ALTER TABLE teaches DROP CONSTRAINT FK_teaches_event; 
ALTER TABLE teaches ADD CONSTRAINT FK_teaches_event
FOREIGN KEY (teaches_event) REFERENCES event(id) ON DELETE CASCADE;

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
--- El id inicia en ‘co.’ seguido por la primera letra del apellido y la primera letra del nombre.---
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
---El salón se asigna automáticamente considerando la disponibilidad.---
CREATE OR REPLACE TRIGGER AD_ROOMS
    BEFORE INSERT ON event 
    FOR EACH ROW
DECLARE
    dis VARCHAR(20);
BEGIN
    SELECT id INTO dis FROM rooms WHERE provision = 'SI';
    IF dis IS NOT NULL THEN
        :new.room := dis;
    ELSE
        RAISE_APPLICATION_ERROR(-20004,'NO HAY ROOM DISPONIBLE');
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
--- Xdisparadores ---
DROP TRIGGER EL_staff;
DROP TRIGGER AD_rooms;
DROP TRIGGER NO_UPDATE_event;
DROP TRIGGER NO_DELETE_event;

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