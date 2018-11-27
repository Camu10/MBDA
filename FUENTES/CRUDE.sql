CREATE OR REPLACE PACKAGE PC_PRODUCTOS IS 
    PROCEDURE AD_ANIME(XNOMBRE IN VARCHAR, XGENERO IN VARCHAR);
    PROCEDURE AD_FIGURA(XPERANIME IN VARCHAR, XTAMA_O IN VARCHAR);
    PROCEDURE AD_PERSONAJE(XNOMBRE IN VARCHAR, XNOMBREANIMES IN VARCHAR);
    PROCEDURE AD_AUTOR(XNOMBRE IN VARCHAR);
    PROCEDURE AD_ROPA(XCATEGORIA IN VARCHAR, XANIME IN VARCHAR);
    PROCEDURE AD_EJEMPLAR(XCANTIDAD IN VARCHAR, XPRECIO IN VARCHAR, XFIGURA IN VARCHAR, XROPA IN VARCHAR, XANIME IN VARCHAR, XVENTAS IN VARCHAR, XSEDE IN VARCHAR);
    FUNCTION CONSULTAR_AUTORES(XNAME IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CONSULTAR_PERSONAJE(XNAME IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_PRODUCTOS;

CREATE OR REPLACE PACKAGE PC_PROVEEDOR IS
    PROCEDURE AD_PROVEEDOR(XNOMBRE IN VARCHAR);
    PROCEDURE AD_COMPRA(XVALOR IN NUMBER, XEJEMPLAR IN NUMBER, PROVEEDOR IN NUMBER);
    FUNCTION CONSULTAR_COMPRA(XNOMBRE IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_PROVEEDOR;

CREATE OR REPLACE PACKAGE PC_PERSONA IS
    PROCEDURE AD_PERSONA(XNOMBRE IN VARCHAR, XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR);
    PROCEDURE AD_CLIENTE(XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR, XTARJETA IN NUMBER);
    PROCEDURE AD_TARJETADESCUENTO(XDESCUENTO IN NUMBER);
    PROCEDURE AD_EMPLEADO(XCARGO IN VARCHAR, XSALARIO IN NUMBER, XTIPOCONTRATO IN VARCHAR, XSEDE IN VARCHAR, XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR);
    PROCEDURE AD_GERENTE(XIDEMPLE IN NUMBER, XSEDE IN NUMBER);
    PROCEDURE EL_GERENTE(XIDEMPLE IN NUMBER);
    PROCEDURE EL_EMPLEADO(XID IN NUMBER);
    FUNCTION CONSULTAR_GERENTE(XSEDE IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CONSULTAR_DESCUENTO(XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_PERSONA;

CREATE OR REPLACE PACKAGE PC_SEDE IS
    PROCEDURE AD_SEDE(XDIRECCION IN VARCHAR, XNUMEMPLEADOS IN NUMBER); 
    PROCEDURE AD_CONTROL(XSEDE IN NUMBER, XVENTA IN NUMBER);
    PROCEDURE AD_CONTRATO(XTIPO IN VARCHAR, XEMPLEADO IN NUMBER);
    FUNCTION CONSULTAR_SEDE(XID IN NUMBER) RETURN SYS_REFCURSOR;
END PC_SEDE;

CREATE OR REPLACE PACKAGE PC_VENTA IS
    PROCEDURE AD_VENTA(XEMPLEADO IN NUMBER, XFORMAPAGO IN VARCHAR, XVALORPAGAR IN NUMBER, XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR);
    FUNCTION CONSULTAR_VENTA(XID IN NUMBER) RETURN SYS_REFCURSOR;
END PC_VENTA;-                                                                                                                                                                                                                                                      