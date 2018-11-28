/*INSERT INTO MBDAA01.DATOS VALUES('carlos.murillo-i@mail.escuelaing.edu.co','Carlos Murillo','Colombia','manuel.murillo.1999@gmail.com',NULL,NULL);
INSERT INTO MBDAA01.DATOS VALUES('miguel.sanchez-g@mail.escuelaing.edu.co','Miguel Sanchez','Colombia','miguel.sanchez@gmail.com',NULL,NULL);


DELETE FROM MBDAA01.DATOS WHERE CORREO = 'miguel.sanchez-g@mail.escuelaing.edu.co';
UPDATE MBDAA01.DATOS SET CORREO = ':3' WHERE CORREO = 'carlos.murillo-i@mail.escuelaing.edu.co';


GRANT UPDATE, DELETE
ON MBDAA01.DATOS
TO MIGUEL;
*/
CREATE TABLE DATOS(
    CORREO VARCHAR2(50),
    NOMBRE VARCHAR2(50),
    PAIS VARCHAR2(50) ,
    EMAIL VARCHAR(50) ,
    TAMA_O VARCHAR2(50),
    URL VARCHAR2(50)
    );
   
INSERT INTO DATOS
SELECT mb.CORREO, mb.NOMBRE, mb.PAIS, mb.EMAIL, mb.TAMA_O, mb.URL
FROM MBDAA01.DATOS mb;

/
CREATE OR REPLACE PACKAGE PC_VALIDACIONES IS
	PROCEDURE AD_VALIDACIONES(XCORREO IN VARCHAR,XJUSTIFICACION IN VARCHAR,XESTADO IN VARCHAR,XCODIGO IN NUMBER);
    PROCEDURE AD_EVIDENCIAS(XNUMERO IN NUMBER, XEVIDENCIA IN VARCHAR);
    PROCEDURE MO_JUSTIFICACION(XNUMERO IN NUMBER, XJUSTIFICACION IN VARCHAR);
    PROCEDURE MO_EVIDENCIA(XNUMERO IN NUMBER,XEVIDENCIA IN VARCHAR);
    PROCEDURE MO_ESTADO(XNUMERO IN NUMBER,XESTADO IN CHAR);
   -- FUNCTION CO_VALIDACIONES_REGISTRADAS RETURN SYS_REFCURSOR;
    --FUNCTION CO_VALIDACIONES RETURN SYS_REFCURSOR;
END PC_VALIDACIONES;
/
CREATE OR REPLACE PACKAGE PC_LOGROS IS
	PROCEDURE AD_LOGROS(XCORREO IN VARCHAR,XCATEGORIA IN VARCHAR,XNOMBRE IN VARCHAR);
    PROCEDURE MO_CATEGORIA(XCORREO IN VARCHAR,XCATEGORIA IN VARCHAR);
    PROCEDURE EL_LOGRO(XCORREO IN VARCHAR);
END PC_LOGROS;
/

CREATE OR REPLACE PACKAGE BODY PC_VALIDACIONES IS
    PROCEDURE AD_VALIDACIONES(XCORREO IN VARCHAR,XJUSTIFICACION IN VARCHAR,XESTADO IN VARCHAR,XCODIGO IN NUMBER) IS
	BEGIN
		INSERT INTO validaciones(correo,justificacion,estado,codigo) VALUES (XCORREO,XJUSTIFICACION,XESTADO,XCODIGO);
		COMMIT;
		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20015,'no');
	END AD_VALIDACIONES;
    
    PROCEDURE AD_EVIDENCIAS(XNUMERO IN NUMBER, XEVIDENCIA IN VARCHAR) IS
	BEGIN
		INSERT INTO evidencias(numero,evidencia) VALUES (XNUMERO,XEVIDENCIA);
		COMMIT;
		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20015,'no');
	END AD_EVIDENCIAS;
    
    PROCEDURE MO_JUSTIFICACION(XNUMERO IN NUMBER, XJUSTIFICACION IN VARCHAR) IS
	BEGIN
		UPDATE validaciones SET justificacion = XJUSTIFICACION WHERE NUMERO = XNUMERO;
		COMMIT;
		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20016,'no');
	END MO_JUSTIFICACION;
    
    PROCEDURE MO_EVIDENCIA(XNUMERO IN NUMBER, XEVIDENCIA IN VARCHAR) IS
	BEGIN
		UPDATE evidencias SET evidencia = XEVIDENCIA WHERE numero = XNUMERO;
		COMMIT;
		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20016,'no');
	END MO_EVIDENCIA;
    
    PROCEDURE MO_ESTADO(XNUMERO IN NUMBER,XESTADO IN CHAR) IS
	BEGIN
		UPDATE validaciones SET estado = XESTADO WHERE numero = XNUMERO;
		COMMIT;
		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20016,'no');
	END MO_ESTADO;
    --consultas
END PC_VALIDACIONES;

/
CREATE OR REPLACE PACKAGE BODY PC_LOGROS IS
    PROCEDURE AD_LOGROS(XCORREO IN VARCHAR,XCATEGORIA IN VARCHAR,XNOMBRE IN VARCHAR) IS
	BEGIN
		INSERT INTO logros (correo, nombre, categoria) VALUES (XCORREO,XNOMBRE,XCATEGORIA);
		COMMIT;
		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20015,'no');
	END AD_LOGROS;
    
    PROCEDURE MO_CATEGORIA(XCORREO IN VARCHAR,XCATEGORIA IN VARCHAR) IS
	BEGIN
		UPDATE logros SET categoria = XCATEGORIA WHERE correo = XCORREO;
		COMMIT;
		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20016,'no');
	END MO_CATEGORIA;
    
    PROCEDURE EL_LOGRO(XCORREO IN VARCHAR) IS
    BEGIN
        DELETE FROM logros WHERE correo = XCORREO;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20150,'no');
    END EL_LOGRO;
END PC_LOGROS;

---CRUDOK
/
INSERT INTO perfiles (correo, nombre) VALUES ('CARLOS@163.com', 'CARLOS MANUEL');
INSERT INTO competencias (codigo, nombre) VALUES (40, 'OLA K ASE');
BEGIN
	PC_VALIDACIONES.AD_VALIDACIONES('CARLOS@163.com',NULL,'E',40);
END;
/
BEGIN
	PC_VALIDACIONES.AD_EVIDENCIAS(1,'https://dell1com/volutpat.html?=velrisus.pdf');
END;
/
BEGIN
	PC_VALIDACIONES.MO_JUSTIFICACION(1,'HOLA');
END;
/
BEGIN
	PC_VALIDACIONES.MO_EVIDENCIA(1,'http://cnbccom/pellentesque.pdf');
END;
/
BEGIN
	PC_VALIDACIONES.MO_ESTADO(1,'T');
END;
/
INSERT INTO sectores (nombre) VALUES ('Transportation');
INSERT INTO profesionales (correo, pais, nombre) VALUES ('eshropsheir0@buzzfeed.com', 'Colombia', 'Transportation');
BEGIN
	PC_LOGROS.AD_LOGROS('eshropsheir0@buzzfeed.com','P','Gigabox');
END;
/
BEGIN
	PC_LOGROS.MO_CATEGORIA('eshropsheir0@buzzfeed.com','R');
END;
/
BEGIN
	PC_LOGROS.EL_LOGRO('eshropsheir0@buzzfeed.com');
END;
/
---CRUDNOOK
BEGIN
	PC_VALIDACIONES.AD_VALIDACIONES('CARLOS@16@3.com',NULL,'E',40);--EL CORREO TIENE DOS '@'
END;
/
BEGIN
	PC_VALIDACIONES.MO_JUSTIFICACION();--ERROR DE ARGUMENTOS
END;
/
BEGIN
	PC_VALIDACIONES.AD_EVIDENCIAS(1,'https://dell1com/volutpat.html?=velrisus');--ERROR DE EVIDENCIA
END;
/
--XCRUD
DROP PACKAGE PC_VALIDACIONES;
DROP PACKAGE PC_LOGROS;