CREATE TABLE profesionales(
    nombre VARCHAR(50) NOT NULL
    ,correo VARCHAR(30) NOT NULL 
    ,pais VARCHAR(50) NOT NULL
    );
CREATE TABLE logros(
    correo VARCHAR(30) NOT NULL 
    ,categoria CHAR(1)
    ,nombre VARCHAR(50) NOT NULL
    ,fecha DATE NOT NULL
    );
CREATE TABLE atiende(
    correo VARCHAR(30) NOT NULL
    ,codigo NUMBER(2) NOT NULL
    );
CREATE TABLE perfiles(
    correo VARCHAR(30) NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    );
CREATE TABLE validaciones(
    numero NUMBER(5) NOT NULL
    ,correo VARCHAR(30) NOT NULL
    ,fecha DATE NOT NULL
    ,justificacion VARCHAR(100)
    ,estado VARCHAR(1) NOT NULL
    ,codigo NUMBER(2) NOT NULL
    );
CREATE TABLE competencias(
    codigo NUMBER(2) NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    );
CREATE TABLE evidencias(
    evidencia VARCHAR(50) NOT NULL
    ,numero NUMBER(5) NOT NULL 
    );
CREATE TABLE sigue(
    correo VARCHAR(30) NOT NULL
    ,segcorreo VARCHAR(30) NOT NULL
    );
CREATE TABLE organiza(
    nombre VARCHAR(50) NOT NULL
    ,codigo NUMBER(2) NOT NULL
    );
---CICLO 1: Tablas (Adicione un comentario antes de cada CRUD)
CREATE TABLE fundaciones(
    correo VARCHAR(30) NOT NULL
    ,tama_o VARCHAR(6) NOT NULL
    ,url VARCHAR(50) NOT NULL
    );
CREATE TABLE ofrece(
    nombre VARCHAR(50) NOT NULL
    ,correo VARCHAR(30) NOT NULL
    );
CREATE TABLE bienes(
    nombre VARCHAR(50) NOT NULL
    ,descripcion VARCHAR(20) NOT NULL
    );
CREATE TABLE actua( 
    correo VARCHAR(30) NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    );
CREATE TABLE sectores(
    nombre VARCHAR(50) NOT NULL
    );

--- Poblar
INSERT INTO profesionales VALUES('Micky Eddolls','meddolls0@ow.ly','Japan');
INSERT INTO profesionales VALUES('Micky Deamer','bdeamer1@ifeng.com','Ukraine');
INSERT INTO profesionales VALUES('Yasmin Strethill','ystrethill2@phoca.cz','Indonesia');

INSERT INTO logros VALUES('meddolls0@ow.ly','I','asistencia',TO_DATE('11-08-2010','dd-mm-yyyy'));
INSERT INTO logros VALUES('bdeamer1@ifeng.com','R','eficiencia',TO_DATE('28-01-2008','dd-mm-yyyy'));
INSERT INTO logros VALUES('ystrethill2@phoca.cz','P','trabajo equipo',TO_DATE('08-11-2016','dd-mm-yyyy'));

INSERT INTO atiende VALUES('meddolls0@ow.ly',11);
INSERT INTO atiende VALUES('bdeamer1@ifeng.com',12);
INSERT INTO atiende VALUES('ystrethill2@phoca.cz',13);

INSERT INTO perfiles VALUES('meddolls0@ow.ly','Micky Eddolls');
INSERT INTO perfiles VALUES('bdeamer1@ifeng.com','Micky Deamer');
INSERT INTO perfiles VALUES('ystrethill2@phoca.cz','Yasmin Strethill');

INSERT INTO sigue VALUES('meddolls0@ow.ly','bdeamer1@ifeng.com');
INSERT INTO sigue VALUES('bdeamer1@ifeng.com','meddolls0@ow.ly');
INSERT INTO sigue VALUES('ystrethill2@phoca.cz','meddolls0@ow.ly');

INSERT INTO evidencias VALUES('olakase.html',1);
INSERT INTO evidencias VALUES('todoestabien.pdf',2);
INSERT INTO evidencias VALUES('estautologia.pdf',3);

INSERT INTO validaciones VALUES(1,'meddolls0@ow.ly',TO_DATE('01-12-2018','dd-mm-yyyy'),NULL,'E',11);
INSERT INTO validaciones VALUES(2,'bdeamer1@ifeng.com',TO_DATE('10-02-2018','dd-mm-yyyy'),NULL,'A',12);
INSERT INTO validaciones VALUES(3,'ystrethill2@phoca.cz',TO_DATE('11-12-2018','dd-mm-yyyy'),NULL,'T',13);

INSERT INTO competencias VALUES(11,'modelado de base de datos');
INSERT INTO competencias VALUES(12,'SQL');
INSERT INTO competencias VALUES(13,'PL-SQL');

INSERT INTO organiza VALUES('enseñanza',11);
INSERT INTO organiza VALUES('salud',12);
INSERT INTO organiza VALUES('infraes',13);

---
INSERT INTO sectores VALUES('enseñanza');
INSERT INTO sectores VALUES('salud');
INSERT INTO sectores VALUES('infraes');

INSERT INTO ofrece VALUES('libros','lflanner0@vk.com');
INSERT INTO ofrece VALUES('medicamentos','mlusk1@reuters.com');
INSERT INTO ofrece VALUES('colegios','gvanweedenburg2@wikia.com');

INSERT INTO fundaciones VALUES('lflanner0@vk.com','0-50','http://lflanner0.html');
INSERT INTO fundaciones VALUES('mlusk1@reuters.com','50-100','http://mlusk1.html');
INSERT INTO fundaciones VALUES('gvanweedenburg2@wikia.com','100+','http://gvanweedenburg2.html');

INSERT INTO bienes VALUES('libros','guarda conocimiento');
INSERT INTO bienes VALUES('medicina','cura enfermedad');
INSERT INTO bienes VALUES('colegios','lugar aprender');

INSERT INTO actua VALUES('lflanner0@vk.com','enseñanza');
INSERT INTO actua VALUES('mlusk1@reuters.com','salud');
INSERT INTO actua VALUES('gvanweedenburg2@wikia.com','infraes');

---Poblar NoOK
INSERT INTO profesionales VALUES(NULL,'gvanweedenburg2@wikia.com','Colombia');
INSERT INTO atiende VALUES(12,'a');
INSERT INTO profesionales VALUES(NULL,NULL,NULL);
INSERT INTO logros VALUES('bdeamer1@ifeng.com',NULL,'eficiencia','28-01-2008');
INSERT INTO evidencias VALUES(1321561328,'A');

INSERT INTO logros VALUES('meddolls0@ow.ly','l','asistencia',TO_DATE('11-08-2010','dd-mm-yyyy'));
INSERT INTO fundaciones VALUES('lflanner0@vk.com','25-30','http://lflanner0.html');
INSERT INTO perfiles VALUES('meddolls0@ow.ly','Lucia');
INSERT INTO actua VALUES('gvanwee@denburg2@wikia.com','infraes');
INSERT INTO validaciones VALUES(0,'ystrethill2@phoca.cz',TO_DATE('11-12-2018','dd-mm-yyyy'),NULL,'T',13);

DELETE FROM profesionales;
DELETE FROM logros;
DELETE FROM atiende;
DELETE FROM perfiles;
DELETE FROM validaciones;
DELETE FROM competencias;
DELETE FROM evidencias;
DELETE FROM sigue;
DELETE FROM organiza;
DELETE FROM fundaciones;
DELETE FROM ofrece;
DELETE FROM bienes;
DELETE FROM actua;
DELETE FROM sectores;

---Atributos
ALTER TABLE logros ADD CONSTRAINT CK_Tipo_categoria_logros
    CHECK(categoria IN('P','R','I'));   
ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_consecutivo_valida
    CHECK(numero>=1);
ALTER TABLE evidencias ADD CONSTRAINT CK_Tipo_consecutivo_eviden
    CHECK(numero>=1);
ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_estado_validacion 
    CHECK(estado IN('E','T','A'));   
ALTER TABLE perfiles ADD CONSTRAINT CK_Tipo_correo_perfiles 
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE profesionales ADD CONSTRAINT CK_Tipo_correo_profesionales
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE validaciones ADD CONSTRAINT CK_Tipo_correo_validaciones
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE sigue ADD CONSTRAINT CK_Tipo_correo_siguen
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE sigue ADD CONSTRAINT CK_Tipo_segcorreo_siguen
    CHECK(segcorreo NOT LIKE '@%' AND segcorreo NOT LIKE '%@' AND segcorreo NOT LIKE '%@%@%' AND segcorreo NOT LIKE '%@@%'  AND segcorreo LIKE '%@%' AND segcorreo NOT LIKE '%hotmail.com' AND segcorreo NOT LIKE '%gmail.com' AND segcorreo NOT LIKE '%yahoo.com'); 
ALTER TABLE fundaciones ADD CONSTRAINT CK_Tipo_correo_fundaciones
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE logros ADD CONSTRAINT CK_Tipo_correo_logros
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE atiende ADD CONSTRAINT CK_Tipo_correo_atiende
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE ofrece ADD CONSTRAINT CK_Tipo_correo_ofrece
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 
ALTER TABLE actua ADD CONSTRAINT CK_Tipo_correo_actua
    CHECK(correo NOT LIKE '@%' AND correo NOT LIKE '%@' AND correo NOT LIKE '%@%@%' AND correo NOT LIKE '%@@%'  AND correo LIKE '%@%' AND correo NOT LIKE '%hotmail.com' AND correo NOT LIKE '%gmail.com' AND correo NOT LIKE '%yahoo.com'); 

ALTER TABLE perfiles ADD CONSTRAINT CK_Tipo_nombre_perfiles
   CHECK(NOT REGEXP_LIKE(nombre,'[0-9@"#$%&/()=?¿!¡<>*+_.:;|°]') AND nombre LIKE '% %');

ALTER TABLE fundaciones ADD CONSTRAINT CK_Tipo_tamañ_o_organiza
    CHECK(tama_o IN('0-50','50-100','100+'));
    
ALTER TABLE evidencias ADD CONSTRAINT CK_Tipo_ulr_evidencias
    CHECK(evidencia LIKE '..%' OR evidencia LIKE '.%.%' OR evidencia LIKE '%..%' OR evidencia LIKE '%.%.%' OR (evidencia lIKE '%pdf' OR evidencia lIKE '%html') OR evidencia  lIKE '%.%.%' OR evidencia  LIKE '.%.%');
ALTER TABLE fundaciones ADD CONSTRAINT CK_Tipo_ulr_fundaciones
    CHECK(url LIKE '..%' AND url LIKE '.%.%' AND url LIKE '%..%' AND url LIKE '%.%.%' AND url lIKE '%pdf' OR url lIKE '%html' AND url lIKE '%.%.%' OR url LIKE '.%.%');


---Primarias
ALTER TABLE perfiles ADD CONSTRAINT PK_perfiles PRIMARY KEY(correo);
ALTER TABLE profesionales ADD CONSTRAINT PK_profesionales PRIMARY KEY(correo);
ALTER TABLE logros ADD CONSTRAINT PK_logros PRIMARY KEY(correo,nombre);
ALTER TABLE sigue ADD CONSTRAINT PK_sigue PRIMARY KEY(correo,segcorreo);
ALTER TABLE validaciones ADD CONSTRAINT PK_validaciones PRIMARY KEY(numero);
ALTER TABLE evidencias ADD CONSTRAINT PK_evidencias PRIMARY KEY(numero,evidencia);
ALTER TABLE ofrece ADD CONSTRAINT PK_ofrece PRIMARY KEY(nombre,correo);
ALTER TABLE bienes ADD CONSTRAINT PK_bienes PRIMARY KEY(nombre);

ALTER TABLE fundaciones ADD CONSTRAINT PK_fundaciones PRIMARY KEY(correo);
ALTER TABLE actua ADD CONSTRAINT PK_actua PRIMARY KEY(correo,nombre);
ALTER TABLE sectores ADD CONSTRAINT PK_sectores PRIMARY KEY(nombre);
ALTER TABLE organiza ADD CONSTRAINT PK_organiza PRIMARY KEY(nombre,codigo);
ALTER TABLE competencias ADD CONSTRAINT PK_competencias PRIMARY KEY(codigo);
ALTER TABLE atiende ADD CONSTRAINT PK_atiende PRIMARY KEY(correo,codigo);

---Únicas
ALTER TABLE fundaciones ADD CONSTRAINT UK_fundaciones UNIQUE (url);

---Foraneas
ALTER TABLE validaciones ADD CONSTRAINT FK_validaciones_perfiles FOREIGN KEY(correo) REFERENCES perfiles(correo);
ALTER TABLE sigue ADD CONSTRAINT FK_siguen_perfiles FOREIGN KEY(correo) REFERENCES perfiles(correo);
ALTER TABLE sigue ADD CONSTRAINT FK_siguen_perfiles_seg FOREIGN KEY(segcorreo) REFERENCES perfiles(correo);
ALTER TABLE fundaciones ADD CONSTRAINT FK_fundaciones_perfiles FOREIGN KEY(correo) REFERENCES perfiles(correo);
ALTER TABLE ofrece ADD CONSTRAINT FK_fundaciones_ofrece FOREIGN KEY(correo) REFERENCES fundaciones(correo);
ALTER TABLE ofrece ADD CONSTRAINT FK_ofrece_bienes FOREIGN KEY(nombre) REFERENCES bienes(nombre);
ALTER TABLE actua ADD CONSTRAINT FK_actua_fundaciones FOREIGN KEY(correo) REFERENCES fundaciones(correo);
ALTER TABLE actua ADD CONSTRAINT FK_actua_sectores FOREIGN KEY(nombre) REFERENCES sectores(nombre);
ALTER TABLE evidencias ADD CONSTRAINT FK_validaciones_evidencias FOREIGN KEY(numero) REFERENCES validaciones(numero);

ALTER TABLE validaciones ADD CONSTRAINT FK_validaciones_competencias FOREIGN KEY(codigo) REFERENCES competencias(codigo);
ALTER TABLE atiende ADD CONSTRAINT FK_competencias_atiende FOREIGN KEY(codigo) REFERENCES competencias(codigo);
ALTER TABLE atiende ADD CONSTRAINT FK_atiende_profesionales FOREIGN KEY(correo) REFERENCES profesionales(correo);
ALTER TABLE profesionales ADD CONSTRAINT FK_perfiles_profesionales FOREIGN KEY(correo) REFERENCES perfiles(correo);

ALTER TABLE profesionales ADD CONSTRAINT FK_sectores_profesionales FOREIGN KEY(nombre) REFERENCES sectores(nombre);
ALTER TABLE logros ADD CONSTRAINT FK_profesionales_logoros FOREIGN KEY(correo) REFERENCES profesionales(correo);
ALTER TABLE organiza ADD CONSTRAINT FK_sectores_organiza FOREIGN KEY(nombre) REFERENCES sectores(nombre);
ALTER TABLE organiza ADD CONSTRAINT FK_organiza_competencias FOREIGN KEY(codigo) REFERENCES competencias(codigo);


---CICLO 1: PoblarNoOK

INSERT INTO logros VALUES('meddolls0@ow.ly','l','asistencia',TO_DATE('11-08-2010','dd-mm-yyyy')); 

INSERT INTO fundaciones VALUES('lflanner0@vk.com','25-30','http://lflanner0.html'); 

INSERT INTO perfiles VALUES('meddolls0@ow.ly','Lucia');

INSERT INTO actua VALUES('gvanwee@denburg2@wikia.com','infraes'); 
INSERT INTO validaciones VALUES(0,'ystrethill2@phoca.cz',TO_DATE('11-12-2018','dd-mm-yyyy'),NULL,'T',13);
INSERT INTO profesionales VALUES('Micky Eddolls','meddol@ls0@ow.ly','Japan'); 
INSERT INTO fundaciones VALUES('gvanweedenburg2@wikia.com','100+','http://gvanweedenburg2.cpp'); 

INSERT INTO logros VALUES('meddolls0@ow.ly','h','asistencia',TO_DATE('11-08-2010','dd-mm-yyyy'));
INSERT INTO validaciones VALUES(3,'ystrethill2@phoca.cz',TO_DATE('11-12-2018','dd-mm-yyyy'),NULL,'n',13); 
INSERT INTO perfiles VALUES('meddolls0@ow.ly','Micky'); 
INSERT INTO bienes VALUES(NULL, 'descripcion');

---Poblar mokarro
INSERT INTO perfiles (correo, nombre) VALUES ('eshropsheir0@buzzfeed.com', 'Eugenie Shropsheir');
INSERT INTO perfiles (correo, nombre) VALUES ('fshewring1@google.com.au', 'Frazer Shewring');
INSERT INTO perfiles (correo, nombre) VALUES ('sandress2@house.gov', 'Sauncho Andress');
INSERT INTO perfiles (correo, nombre) VALUES ('cwallbrook3@examiner.com', 'Cale Wallbrook');
INSERT INTO perfiles (correo, nombre) VALUES ('ao4@shutterfly.com', 'Archambault O'' Driscoll');
INSERT INTO perfiles (correo, nombre) VALUES ('wlumbley5@technorati.com', 'Wolfgang Lumbley');
INSERT INTO perfiles (correo, nombre) VALUES ('krider6@acquirethisname.com', 'Katee Rider');
INSERT INTO perfiles (correo, nombre) VALUES ('djauncey7@odnoklassniki.ru', 'Denny Jauncey');
INSERT INTO perfiles (correo, nombre) VALUES ('mbuchan8@barnesandnoble.com', 'Marjory Buchan');
INSERT INTO perfiles (correo, nombre) VALUES ('dridd9@163.com', 'Deeyn Ridd');

INSERT INTO sigue (correo, segcorreo) VALUES ('eshropsheir0@buzzfeed.com', 'fshewring1@google.com.au');
INSERT INTO sigue (correo, segcorreo) VALUES ('fshewring1@google.com.au', 'eshropsheir0@buzzfeed.com');
INSERT INTO sigue (correo, segcorreo) VALUES ('sandress2@house.gov', 'cwallbrook3@examiner.com');
INSERT INTO sigue (correo, segcorreo) VALUES ('cwallbrook3@examiner.com', 'sandress2@house.gov');
INSERT INTO sigue (correo, segcorreo) VALUES ('ao4@shutterfly.com', 'wlumbley5@technorati.com');
INSERT INTO sigue (correo, segcorreo) VALUES ('wlumbley5@technorati.com', 'ao4@shutterfly.com');
INSERT INTO sigue (correo, segcorreo) VALUES ('krider6@acquirethisname.com', 'djauncey7@odnoklassniki.ru');
INSERT INTO sigue (correo, segcorreo) VALUES ('djauncey7@odnoklassniki.ru', 'krider6@acquirethisname.com');
INSERT INTO sigue (correo, segcorreo) VALUES ('mbuchan8@barnesandnoble.com', 'dridd9@163.com');
INSERT INTO sigue (correo, segcorreo) VALUES ('dridd9@163.com', 'mbuchan8@barnesandnoble.com');

INSERT INTO competencias (codigo, nombre) VALUES (32, 'Wisozk and Sons');
INSERT INTO competencias (codigo, nombre) VALUES (50, 'Jacobi, Quitzon and Goldner');
INSERT INTO competencias (codigo, nombre) VALUES (18, 'Stark-Cummings');
INSERT INTO competencias (codigo, nombre) VALUES (95, 'O''Hara-Bergstrom');
INSERT INTO competencias (codigo, nombre) VALUES (16, 'Gaylord-DuBuque');
INSERT INTO competencias (codigo, nombre) VALUES (15, 'Bosco Inc');
INSERT INTO competencias (codigo, nombre) VALUES (93, 'Gislason, Bosco and Hettinger');
INSERT INTO competencias (codigo, nombre) VALUES (75, 'Carter, Hoeger and Funk');
INSERT INTO competencias (codigo, nombre) VALUES (47, 'Jaskolski-Gaylord');
INSERT INTO competencias (codigo, nombre) VALUES (33, 'Schiller-Erdman');

INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (63984, 'eshropsheir0@buzzfeed.com',  TO_DATE('16-10-2014','dd-mm-yyyy'), NULL, 'A', 32);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (14783, 'fshewring1@google.com.au',TO_DATE('08-11-2012','dd-mm-yyyy'), NULL, 'A', 50);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (76308, 'sandress2@house.gov',TO_DATE('26-12-2013','dd-mm-yyyy'), NULL, 'A', 18);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (8813, 'cwallbrook3@examiner.com',TO_DATE('11-09-2015','dd-mm-yyyy'), NULL, 'A', 95);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (1427, 'ao4@shutterfly.com',TO_DATE('30-01-2018','dd-mm-yyyy'), NULL, 'A', 16);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (78516, 'wlumbley5@technorati.com',TO_DATE('20-07-2015','dd-mm-yyyy'), NULL, 'A', 15);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (18583, 'krider6@acquirethisname.com',TO_DATE('22-06-2017','dd-mm-yyyy'), NULL, 'A', 93);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (15832, 'djauncey7@odnoklassniki.ru',TO_DATE('09-01-2015','dd-mm-yyyy'), NULL, 'A', 75);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (66339, 'mbuchan8@barnesandnoble.com',TO_DATE('10-02-2011','dd-mm-yyyy'), NULL, 'A', 47);
INSERT INTO validaciones (numero, correo, fecha, justificacion, estado, codigo) VALUES (78731, 'dridd9@163.com', TO_DATE('25-09-2013','dd-mm-yyyy'), NULL, 'A', 33);


INSERT INTO sectores (nombre) VALUES ('Transportation');
INSERT INTO sectores (nombre) VALUES ('Energy');
INSERT INTO sectores (nombre) VALUES ('Consumer Non-Durables');
INSERT INTO sectores (nombre) VALUES ('Consumer Durables');
INSERT INTO sectores (nombre) VALUES ('Consumer Services');
INSERT INTO sectores (nombre) VALUES ('Finance');
INSERT INTO sectores (nombre) VALUES ('Health Care');
INSERT INTO sectores (nombre) VALUES ('n/a');
INSERT INTO sectores (nombre) VALUES ('Miscellaneous');
INSERT INTO sectores (nombre) VALUES ('Technology');

INSERT INTO profesionales (correo, pais, nombre) VALUES ('eshropsheir0@buzzfeed.com', 'Colombia', 'Transportation');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('fshewring1@google.com.au', 'Sweden', 'Energy');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('sandress2@house.gov', 'Guatemala', 'Consumer Non-Durables');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('cwallbrook3@examiner.com', 'Germany', 'Consumer Durables');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('ao4@shutterfly.com', 'Poland', 'Consumer Services');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('wlumbley5@technorati.com', 'Afghanistan', 'Finance');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('krider6@acquirethisname.com', 'Mongolia', 'Health Care');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('djauncey7@odnoklassniki.ru', 'Indonesia', 'n/a');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('mbuchan8@barnesandnoble.com', 'Brazil', 'Miscellaneous');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('dridd9@163.com', 'China', 'Technology');

INSERT INTO atiende (correo, codigo) VALUES ('eshropsheir0@buzzfeed.com', 32);
INSERT INTO atiende (correo, codigo) VALUES ('fshewring1@google.com.au', 50);
INSERT INTO atiende (correo, codigo) VALUES ('sandress2@house.gov', 18);
INSERT INTO atiende (correo, codigo) VALUES ('cwallbrook3@examiner.com', 95);
INSERT INTO atiende (correo, codigo) VALUES ('ao4@shutterfly.com', 16);
INSERT INTO atiende (correo, codigo) VALUES ('wlumbley5@technorati.com', 15);
INSERT INTO atiende (correo, codigo) VALUES ('krider6@acquirethisname.com', 93);
INSERT INTO atiende (correo, codigo) VALUES ('djauncey7@odnoklassniki.ru', 75);
INSERT INTO atiende (correo, codigo) VALUES ('mbuchan8@barnesandnoble.com', 47);
INSERT INTO atiende (correo, codigo) VALUES ('dridd9@163.com', 33);

INSERT INTO organiza (nombre, codigo) VALUES ('Transportation', 32);
INSERT INTO organiza (nombre, codigo) VALUES ('Energy', 50);
INSERT INTO organiza (nombre, codigo) VALUES ('Consumer Non-Durables', 18);
INSERT INTO organiza (nombre, codigo) VALUES ('Consumer Durables', 95);
INSERT INTO organiza (nombre, codigo) VALUES ('Consumer Services', 16);
INSERT INTO organiza (nombre, codigo) VALUES ('Finance', 15);
INSERT INTO organiza (nombre, codigo) VALUES ('Health Care', 93);
INSERT INTO organiza (nombre, codigo) VALUES ('n/a', 75);
INSERT INTO organiza (nombre, codigo) VALUES ('Miscellaneous', 47);
INSERT INTO organiza (nombre, codigo) VALUES ('Technology', 33);

INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('eshropsheir0@buzzfeed.com', 'Gigabox', 'P', TO_DATE('23-02-2013','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('fshewring1@google.com.au', 'Zoomlounge', 'R', TO_DATE('08-08-2011','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('sandress2@house.gov', 'Pixonyx', 'I', TO_DATE('23-10-2011','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('cwallbrook3@examiner.com', 'Fadeo', 'R', TO_DATE('22-06-2015','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('ao4@shutterfly.com', 'Mydeo', 'R', TO_DATE('21-07-2012','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('wlumbley5@technorati.com', 'Babbleset', 'R', TO_DATE('29-03-2012','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('krider6@acquirethisname.com', 'Jayo', 'R', TO_DATE('26-12-2014','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('djauncey7@odnoklassniki.ru', 'Aimbu', 'I', TO_DATE('25-06-2014','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('mbuchan8@barnesandnoble.com', 'Geba', 'I', TO_DATE('12-04-2014','dd-mm-yyyy'));
INSERT INTO logros (correo, nombre, categoria, fecha) VALUES ('dridd9@163.com', 'Flipstorm', 'P', TO_DATE('28-06-2013','dd-mm-yyyy'));

INSERT INTO evidencias (numero, evidencia) VALUES (63984, 'https://dell1com/volutpat.html?=velrisus.pdf');
INSERT INTO evidencias (numero, evidencia) VALUES (14783, 'http://cnbccom/pellentesque.pdf');
INSERT INTO evidencias (numero, evidencia) VALUES (76308, 'https://surveymonkey.com/eu/massa/donec.pdf');
INSERT INTO evidencias (numero, evidencia) VALUES (8813, 'https://360.cn/vitae/lorem/integer.html');
INSERT INTO evidencias (numero, evidencia) VALUES (1427, 'https://taobao.com/odio/curabitur.pdf');
INSERT INTO evidencias (numero, evidencia) VALUES (78516, 'https://angelfire.com/duis/mattis/egestas.pdf');
INSERT INTO evidencias (numero, evidencia) VALUES (18583, 'http://walmart.com/nibh/quisque/id.pdf');
INSERT INTO evidencias (numero, evidencia) VALUES (15832, 'http://example.com/sit/amet/eros.pdf');
INSERT INTO evidencias (numero, evidencia) VALUES (66339, 'https://wikispaces.com/id.html');
INSERT INTO evidencias (numero, evidencia) VALUES (78731, 'https://sciencedirect.com/nisl.pdf');

INSERT INTO fundaciones (correo, tama_o, url) VALUES ('eshropsheir0@buzzfeed.com', '50-100', 'https://mysql.com/nulla=nulla.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('fshewring1@google.com.au', '100+', 'http://microsoft.com/cubiliaaccumsan=curae.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('sandress2@house.gov', '0-50', 'https://java.com/donec/=morbiinteger=non.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('cwallbrook3@examiner.com', '100+', 'http://latimes.com/interdum/veitasse=.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('ao4@shutterfly.com', '100+', 'http://mit.edu/hac/habitasse.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('wlumbley5@technorati.com', '100+', 'http://geocities.com/musto=.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('krider6@acquirethisname.com', '50-100', 'http://sohu.com/us.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('djauncey7@odnoklassniki.ru', '0-50', 'http://toplist.cz/doltate.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('mbuchan8@barnesandnoble.com', '100+', 'https://nps.gov/luctus/.html');
INSERT INTO fundaciones (correo, tama_o, url) VALUES ('dridd9@163.com', '100+', 'https://cisco.com/ut/nulla/sed..html');

INSERT INTO bienes (nombre, descripcion) VALUES ('carro', 'A');
INSERT INTO bienes (nombre, descripcion) VALUES ('utiles', 'B');
INSERT INTO bienes (nombre, descripcion) VALUES ('comida', 'C');
INSERT INTO bienes (nombre, descripcion) VALUES ('vivienda', 'V');
INSERT INTO bienes (nombre, descripcion) VALUES ('mesa', 'BB');
INSERT INTO bienes (nombre, descripcion) VALUES ('estudio', 'DFG');
INSERT INTO bienes (nombre, descripcion) VALUES ('trabajo', 'DJH');
INSERT INTO bienes (nombre, descripcion) VALUES ('casa', 'Waldo');
INSERT INTO bienes (nombre, descripcion) VALUES ('comedor', 'GFHJ');
INSERT INTO bienes (nombre, descripcion) VALUES ('lavadora', 'GHJ');


INSERT INTO ofrece (nombre, correo) VALUES ('carro', 'eshropsheir0@buzzfeed.com');
INSERT INTO ofrece (nombre, correo) VALUES ('utiles', 'fshewring1@google.com.au');
INSERT INTO ofrece (nombre, correo) VALUES ('comida', 'sandress2@house.gov');
INSERT INTO ofrece (nombre, correo) VALUES ('vivienda', 'cwallbrook3@examiner.com');
INSERT INTO ofrece (nombre, correo) VALUES ('mesa', 'ao4@shutterfly.com');
INSERT INTO ofrece (nombre, correo) VALUES ('estudio', 'wlumbley5@technorati.com');
INSERT INTO ofrece (nombre, correo) VALUES ('trabajo', 'krider6@acquirethisname.com');
INSERT INTO ofrece (nombre, correo) VALUES ('casa', 'djauncey7@odnoklassniki.ru');
INSERT INTO ofrece (nombre, correo) VALUES ('comedor', 'mbuchan8@barnesandnoble.com');
INSERT INTO ofrece (nombre, correo) VALUES ('lavadora', 'dridd9@163.com');

INSERT INTO actua (correo, nombre) VALUES ('eshropsheir0@buzzfeed.com', 'Transportation');
INSERT INTO actua (correo, nombre) VALUES ('fshewring1@google.com.au', 'Energy');
INSERT INTO actua (correo, nombre) VALUES ('sandress2@house.gov', 'Consumer Non-Durables');
INSERT INTO actua (correo, nombre) VALUES ('cwallbrook3@examiner.com', 'Consumer Durables');
INSERT INTO actua (correo, nombre) VALUES ('ao4@shutterfly.com', 'Consumer Services');
INSERT INTO actua (correo, nombre) VALUES ('wlumbley5@technorati.com', 'Finance');
INSERT INTO actua (correo, nombre) VALUES ('krider6@acquirethisname.com', 'Health Care');
INSERT INTO actua (correo, nombre) VALUES ('djauncey7@odnoklassniki.ru', 'n/a');
INSERT INTO actua (correo, nombre) VALUES ('mbuchan8@barnesandnoble.com', 'Miscellaneous');
INSERT INTO actua (correo, nombre) VALUES ('dridd9@163.com', 'Technology');

DELETE FROM actua;
DELETE FROM ofrece;
DELETE FROM bienes;
DELETE FROM fundaciones;
DELETE FROM evidencias;
DELETE FROM logros;
DELETE FROM organiza;
DELETE FROM atiende;
DELETE FROM profesionales;
DELETE FROM sectores;
DELETE FROM validaciones;
DELETE FROM competencias;
DELETE FROM sigue;
DELETE FROM perfiles;



---eliminar FORANEAS

ALTER TABLE validaciones DROP CONSTRAINT FK_validaciones_perfiles;
ALTER TABLE sigue DROP CONSTRAINT FK_siguen_perfiles;
ALTER TABLE sigue DROP CONSTRAINT FK_siguen_perfiles_seg;
ALTER TABLE fundaciones DROP CONSTRAINT FK_fundaciones_perfiles;
ALTER TABLE ofrece DROP CONSTRAINT FK_fundaciones_ofrece;
ALTER TABLE ofrece DROP CONSTRAINT FK_ofrece_bienes;
ALTER TABLE actua DROP CONSTRAINT FK_actua_fundaciones;
ALTER TABLE actua DROP CONSTRAINT FK_actua_sectores;
ALTER TABLE evidencias DROP CONSTRAINT FK_validaciones_evidencias;

ALTER TABLE validaciones DROP CONSTRAINT FK_validaciones_competencias;
ALTER TABLE atiende DROP CONSTRAINT FK_competencias_atiende;
ALTER TABLE atiende DROP CONSTRAINT FK_atiende_profesionales;
ALTER TABLE profesionales DROP CONSTRAINT FK_perfiles_profesionales;

ALTER TABLE profesionales DROP CONSTRAINT FK_sectores_profesionales;
ALTER TABLE logros DROP CONSTRAINT FK_profesionales_logoros;
ALTER TABLE organiza DROP CONSTRAINT FK_sectores_organiza;
ALTER TABLE organiza DROP CONSTRAINT FK_organiza_competencias;






---Registrar Validación
---Disparadores
CREATE OR REPLACE TRIGGER AD_NUMERO
BEFORE INSERT ON validaciones
FOR EACH ROW
BEGIN
  SELECT COUNT(*)+1 INTO :NEW.numero FROM validaciones;
  SELECT TO_DATE(SYSDATE,'DD-MM-YYYY') INTO :NEW.fecha FROM DUAL;
  :NEW.estado := 'E';
END;
/
CREATE OR REPLACE TRIGGER MOD_VALORAR
BEFORE INSERT ON validaciones
FOR EACH ROW
DECLARE
    cod NUMBER;
BEGIN
    cod := 0;
    SELECT COUNT(*) INTO cod FROM validaciones WHERE :NEW.correo = :OLD.correo AND :NEW.codigo=:OLD.codigo;
    IF cod>0 THEN
        raise_application_error(-20002,'Ya lo valoró una vez');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER MODIFICAR_VALIDACIONES
BEFORE UPDATE OF numero,correo,fecha,codigo ON validaciones
FOR EACH ROW
BEGIN
    IF :OLD.estado != 'E'  THEN
        raise_application_error(-20003,'No se puede modificar');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER MOD_ESTADO
BEFORE UPDATE OF estado ON validaciones
FOR EACH ROW
DECLARE
    num NUMBER;
    numer NUMBER;
BEGIN
    num := 0;
    numer := :OLD.numero;
    IF :NEW.estado = 'T' THEN
        SELECT COUNT(*) INTO num FROM evidencias WHERE numero = numer;
        IF :OLD.justificacion = NULL OR num = 0 THEN
            raise_application_error(-20004,'No se puede modificar');
        END IF;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER MOD_ESTADO_ANUALDO
BEFORE UPDATE OF estado ON validaciones
FOR EACH ROW
BEGIN
    IF :OLD.ESTADO = 'A' THEN
        raise_application_error(-20004,'No se puede modificar el estado');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER MOD_TERMINADO_ANUALDO
BEFORE UPDATE OF estado ON validaciones
FOR EACH ROW
BEGIN
    IF :OLD.ESTADO = 'T' AND :NEW.estado = 'E' THEN
        raise_application_error(-20005,'No se puede modificar el estado');
    END IF;
END;
/

---Registrar logros
CREATE OR REPLACE TRIGGER AD_FECHA
BEFORE INSERT ON logros
FOR EACH ROW
BEGIN
  SELECT TO_DATE(SYSDATE,'DD-MM-YYYY') INTO :NEW.fecha FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER AD_CATEGORIA
BEFORE INSERT ON logros
FOR EACH ROW
BEGIN
    IF :NEW.categoria IS NULL THEN
        :NEW.categoria := 'R';
    END IF;
END;
/
CREATE OR REPLACE TRIGGER MO_TIPO
BEFORE UPDATE OF correo,nombre,fecha ON logros
FOR EACH ROW
BEGIN
  raise_application_error(-20004,'No se puede modificar');
END;
/
CREATE OR REPLACE TRIGGER DEL_LOGRO
BEFORE DELETE ON logros
FOR EACH ROW
DECLARE
    con NUMBER;
BEGIN
    con := 0;
    SELECT COUNT(*) INTO con FROM profesionales,atiende,competencias WHERE :OLD.correo = profesionales.correo AND profesionales.correo = atiende.correo AND atiende.codigo = competencias.codigo;
    IF :old.fecha != SYSDATE AND con>0 THEN
        raise_application_error(-20005,'No se puede eliminar');
    END IF;
END;
/

---Mantener bienes

CREATE OR REPLACE TRIGGER RE_DESCRIPCION
BEFORE INSERT ON bienes
FOR EACH ROW
DECLARE
    des VARCHAR(20);
BEGIN
  des := :NEW.nombre;
  IF (LENGTH( :NEW.descripcion ) < 10) THEN
		:NEW.descripcion := des;
  END IF;
END;
/
---RE_DESCRIPCION OK
INSERT INTO bienes VALUES('prueba', 'BB');

---RE_DESCRIPCION NoOk
INSERT INTO bienes VALUES('pruebaA', 'Esta prueba');


CREATE OR REPLACE TRIGGER MO_DESCRIPCION
BEFORE UPDATE ON bienes
FOR EACH ROW
DECLARE
    des VARCHAR(20);
BEGIN
  des := :OLD.nombre;
  IF (LENGTH( des ) > LENGTH (:NEW.descripcion)) THEN
		raise_application_error(-20050,'la descripcion es demasiado corta');
  END IF;
END;
/


INSERT INTO bienes VALUES('prueba2', 'descripcion');
---MO_DESCRIPCION NoOk
UPDATE bienes SET descripcion = 'BB' WHERE nombre = 'prueba2';

---MO_DESCRIPCION OK
UPDATE bienes SET descripcion = 'Esta prueba' WHERE nombre = 'prueba2';