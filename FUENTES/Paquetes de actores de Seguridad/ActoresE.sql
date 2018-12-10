CREATE OR REPLACE PACKAGE PA_ENCPRODUCTOS IS 
    PROCEDURE AD_ANIME(XNOMBRE IN VARCHAR, XGENERO IN VARCHAR);
    PROCEDURE AD_FIGURA(XPERANIME IN VARCHAR, XTAMA_O IN VARCHAR);
    PROCEDURE AD_PRODUCCIONES(XAUTOR IN NUMBER, XANIME IN NUMBER);
    PROCEDURE AD_ELENCOS(XANIME IN NUMBER, XPERSONAJES IN NUMBER);
    PROCEDURE AD_INVENTARIO(XANIME IN NUMBER, XFIGURA IN NUMBER);
    PROCEDURE AD_PERSONAJE(XNOMBRE IN VARCHAR, XNOMBREANIMES IN VARCHAR);
    PROCEDURE AD_AUTOR(XNOMBRE IN VARCHAR);
    PROCEDURE AD_ROPA(XCATEGORIA IN VARCHAR, XANIME IN VARCHAR);
    PROCEDURE AD_EJEMPLAR(XCANTIDAD IN VARCHAR, XPRECIO IN VARCHAR, XFIGURA IN VARCHAR, XROPA IN VARCHAR, XANIME IN VARCHAR, XVENTA IN VARCHAR, XSEDE IN VARCHAR);
	PROCEDURE EL_FIGURA(XID IN NUMBER);
	PROCEDURE EL_ROPA(XID IN NUMBER);
	FUNCTION CON_ANIME_GENERO(XGENERO IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CONSULTAR_FIGURA(XGENERO IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CON_ANIME_AUTOR(XAUTORES IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CON_ANIME_ROPA(XANIME IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CON_MAX_EJEMPLARES RETURN SYS_REFCURSOR;
END PA_ENCPRODUCTOS;
/
CREATE OR REPLACE PACKAGE PA_GERPROVEEDOR IS
    PROCEDURE AD_PROVEEDOR(XNOMBRE IN VARCHAR);
    PROCEDURE AD_COMPRA(XVALOR IN NUMBER, XEJEMPLAR IN NUMBER, XPROVEEDOR IN NUMBER);
    PROCEDURE EL_PROVEEDOR(XID IN NUMBER);
	FUNCTION CONSULTAR_PROVEEDOR(XNOMBRE IN VARCHAR) RETURN SYS_REFCURSOR;
END PA_GERPROVEEDOR;
/
CREATE OR REPLACE PACKAGE PA_EMPPERSONA IS
    PROCEDURE AD_CLIENTE(XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR, XTARJETA IN NUMBER);
    PROCEDURE AD_TARJETADESCUENTO(XDESCUENTO IN NUMBER);
    FUNCTION CONSULTAR_DESCUENTO(XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CONSULTAR_DESCUENTO_DISPO RETURN SYS_REFCURSOR;

END PA_EMPPERSONA;
/
CREATE OR REPLACE PACKAGE PA_GERSEDE IS
    PROCEDURE AD_SEDE(XDIRECCION IN VARCHAR); 
    PROCEDURE AD_CONTROL(XSEDE IN NUMBER, XVENTA IN NUMBER);
    PROCEDURE AD_CONTRATO(XTIPO IN VARCHAR, XEMPLEADO IN NUMBER);
	PROCEDURE EL_SEDE(XDIRECCION IN VARCHAR);
    FUNCTION CONSULTAR_SEDES RETURN SYS_REFCURSOR;
    FUNCTION CONSULTAR_SEDES_GERENTES(XID IN VARCHAR) RETURN SYS_REFCURSOR;
END PA_GERSEDE;
/
CREATE OR REPLACE PACKAGE PA_EMPVENTA IS
    PROCEDURE AD_VENTA(XEMPLEADO IN NUMBER, XFORMAPAGO IN VARCHAR, XVALORPAGAR IN NUMBER, XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR);
    FUNCTION CONSULTAR_CLIENTES_DIARIOS RETURN SYS_REFCURSOR;
    FUNCTION CONSULTAR_VENTAS RETURN SYS_REFCURSOR;
END PA_EMPVENTA;
/
CREATE OR REPLACE PACKAGE PA_DIREMPLEADO IS
	PROCEDURE AD_EMPLEADO(XCARGO IN VARCHAR, XSALARIO IN NUMBER, XTIPOCONTRATO IN VARCHAR, XSEDE IN NUMBER, XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR);
    PROCEDURE AD_GERENTE(XIDEMPLE IN NUMBER, XSEDE IN NUMBER ,XNOMBRE IN VARCHAR,XINFORMACION IN XMLTYPE);
    PROCEDURE EL_EMPLEADO(XID IN NUMBER);
    PROCEDURE EL_GERENTE(XIDEMPLE IN NUMBER);
    FUNCTION CONSULTAR_GERENTE(XNOMBRE IN VARCHAR) RETURN SYS_REFCURSOR;
END PA_DIREMPLEADO;
/