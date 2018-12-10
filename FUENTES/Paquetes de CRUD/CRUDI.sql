CREATE OR REPLACE PACKAGE BODY PC_PRODUCTOS IS
  PROCEDURE AD_ANIME(XNOMBRE IN VARCHAR,XGENERO IN VARCHAR) IS
  BEGIN
    INSERT INTO animes(nombre , genero) VALUES(XNOMBRE,XGENERO);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR ANIME');
    END AD_ANIME; 

  PROCEDURE AD_FIGURA(XPERANIME IN VARCHAR, XTAMA_O IN VARCHAR) IS
  BEGIN
    INSERT INTO figuras(peranime, tama_o) VALUES(XPERANIME,XTAMA_O);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR FIGURA');
    END AD_FIGURA; 

  PROCEDURE AD_PRODUCCIONES(XAUTOR IN NUMBER, XANIME IN NUMBER) IS
  BEGIN
    INSERT INTO producciones (autor , anime) VALUES (XAUTOR,XANIME);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR PRODUCCIONES');
    END AD_PRODUCCIONES;

  PROCEDURE AD_ELENCOS(XANIME IN NUMBER, XPERSONAJES IN NUMBER) IS
  BEGIN
    INSERT INTO elencos (anime , personaje) VALUES (XANIME,XPERSONAJES);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR ELENCOS');
    END AD_ELENCOS;

  PROCEDURE AD_INVENTARIO(XANIME IN NUMBER, XFIGURA IN NUMBER) IS
  BEGIN
    INSERT INTO inventario (anime , figura) VALUES (XANIME,XFIGURA);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR INVENTARIO');
    END AD_INVENTARIO;

  PROCEDURE AD_PERSONAJE(XNOMBRE IN VARCHAR, XNOMBREANIMES IN VARCHAR) IS
  BEGIN
    INSERT INTO personajes (nombre , nombreanime) VALUES (XNOMBRE,XNOMBREANIMES);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR PERSONAJES');
    END AD_PERSONAJE; 

  PROCEDURE AD_AUTOR(XNOMBRE IN VARCHAR) IS
  BEGIN
    INSERT INTO autores(nombre) VALUES (XNOMBRE);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR AUTOR');
    END AD_AUTOR;

  PROCEDURE AD_ROPA(XCATEGORIA IN VARCHAR, XANIME IN VARCHAR) IS
  BEGIN
    INSERT INTO ropa(categoria , anime) VALUES (XCATEGORIA,XANIME);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR ROPA');
    END AD_ROPA;

  PROCEDURE AD_EJEMPLAR(XCANTIDAD IN VARCHAR, XPRECIO IN VARCHAR, XFIGURA IN VARCHAR, XROPA IN VARCHAR, XANIME IN VARCHAR, XVENTA IN VARCHAR, XSEDE IN VARCHAR) IS
  BEGIN
    INSERT INTO ejemplares(cantidad , precio , figura , ropa , anime , venta , sede) VALUES (XCANTIDAD,XPRECIO,XFIGURA,XROPA,XANIME,XVENTA,XSEDE);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR EJEMPLAR');
    END AD_EJEMPLAR;

  PROCEDURE EL_FIGURA(XID IN NUMBER) IS
  BEGIN
    DELETE FROM figuras WHERE id = XID;
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20025,'NO PUEDE ELIMINAR FIGURAS');
	END EL_FIGURA;

  PROCEDURE EL_ROPA(XID IN NUMBER) IS
  BEGIN
    DELETE FROM ropa WHERE id = XID;
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20025,'NO PUEDE ELIMINAR ROPA');
	END EL_ROPA;
    
  FUNCTION CON_ANIME_GENERO(XGENERO IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT animes.nombre
      FROM animes
      WHERE animes.genero = XGENERO;
    RETURN CONSULTA;
  END;
  
  FUNCTION CONSULTAR_FIGURA(XGENERO IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT animes.nombre, figuras.peranime
      FROM animes,inventario,figuras
    WHERE animes.id = inventario.anime AND inventario.figura = figuras.id AND animes.genero = XGENERO;
    RETURN CONSULTA;
  END;
  
  FUNCTION CON_MAX_EJEMPLARES RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT figura FIGURA, ropa ROPA , anime ANIME
	  FROM (SELECT MAX(cantidad) CANTIDAD FROM ejemplares) A, ejemplares
	  WHERE A.CANTIDAD = ejemplares.cantidad;
    RETURN CONSULTA;
  END;
  
  FUNCTION CON_ANIME_AUTOR(XAUTORES IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT animes.nombre
      FROM animes,autores,producciones
      WHERE autores.nombre = XAUTORES AND producciones.autor = autores.id AND animes.id = producciones.anime;
    RETURN CONSULTA;
  END;
  
  FUNCTION CON_ANIME_ROPA(XANIME IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT anime, categoria
      FROM ropa
      WHERE anime = XANIME;
    RETURN CONSULTA;
  END;
END PC_PRODUCTOS;

/

CREATE OR REPLACE PACKAGE BODY PC_PROVEEDOR IS
  PROCEDURE AD_PROVEEDOR(XNOMBRE IN VARCHAR) IS
  BEGIN
    INSERT INTO proveedores(nombre) VALUES(XNOMBRE);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR PROVEEDOR');
    END AD_PROVEEDOR;
	
  PROCEDURE AD_COMPRA(XVALOR IN NUMBER, XEJEMPLAR IN NUMBER, XPROVEEDOR IN NUMBER) IS
  BEGIN
    INSERT INTO compras (valorcompra , ejemplar , proveedor) VALUES(XVALOR,XEJEMPLAR,XPROVEEDOR);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR COMPRA');
    END AD_COMPRA;
	
  PROCEDURE EL_PROVEEDOR(XID IN NUMBER) IS
  BEGIN
    DELETE FROM proveedores WHERE id = XID;
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20025,'NO PUEDE ELIMINAR PROVEEDOR');
	END EL_PROVEEDOR;
  FUNCTION CONSULTAR_PROVEEDOR(XNOMBRE IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT proveedores.nombre,compras.ejemplar, compras.valorcompra
      FROM proveedores, compras
      WHERE proveedores.nombre = XNOMBRE AND proveedores.id = compras.proveedor;
    RETURN CONSULTA;
  END;
END PC_PROVEEDOR;

/

CREATE OR REPLACE PACKAGE BODY PC_PERSONA IS
  PROCEDURE AD_CLIENTE(XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR, XTARJETA IN NUMBER)IS
  BEGIN
    INSERT INTO clientes (tipodoc , numdoc , tarjetadescuento) VALUES(XTIPODOC,XNUMDOC,XTARJETA);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR CLIENTE');
    END AD_CLIENTE;

  PROCEDURE AD_TARJETADESCUENTO(XDESCUENTO IN NUMBER) IS
  BEGIN
    INSERT INTO tarjetadescuento (descuento) VALUES(XDESCUENTO);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR TARJETA DE DESCUENTO');
    END AD_TARJETADESCUENTO;
  
  FUNCTION CONSULTAR_DESCUENTO(XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT *
      FROM clientes
      WHERE clientes.numdoc = XNUMDOC AND clientes.tipodoc = XTIPODOC; 
    RETURN CONSULTA;
  END;
  
  FUNCTION CONSULTAR_DESCUENTO_DISPO RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT *
      FROM tarjetadescuento;
    RETURN CONSULTA;
  END;
END PC_PERSONA;
/
CREATE OR REPLACE PACKAGE BODY PC_SEDE IS
  PROCEDURE AD_SEDE(XDIRECCION IN VARCHAR) IS
  BEGIN
    INSERT INTO sedes (direccion) VALUES(XDIRECCION);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR SEDE');
    END AD_SEDE;

  PROCEDURE AD_CONTROL(XSEDE IN NUMBER, XVENTA IN NUMBER) IS
  BEGIN
    INSERT INTO control (sede , venta) VALUES(XSEDE,XVENTA);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR CONTROL');
    END AD_CONTROL;

  PROCEDURE AD_CONTRATO(XTIPO IN VARCHAR, XEMPLEADO IN NUMBER) IS
  BEGIN
    INSERT INTO contratos (tipo , empleado) VALUES(XTIPO,XEMPLEADO);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR CONTRATO');
    END AD_CONTRATO;

  PROCEDURE EL_SEDE(XDIRECCION IN VARCHAR) IS
  BEGIN
    DELETE FROM sedes WHERE direccion = XDIRECCION;
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20025,'NO PUEDE ELIMINAR SEDE');
  END EL_SEDE;
  
  FUNCTION CONSULTAR_SEDES RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT *
      FROM sedes;
    RETURN CONSULTA;
  END;
  
  FUNCTION CONSULTAR_SEDES_GERENTES(XID IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT gerente.idemple , gerente.nombre
      FROM gerente
      WHERE gerente.sede = XID;
    RETURN CONSULTA;
  END;
END PC_SEDE;
/
CREATE OR REPLACE PACKAGE BODY PC_VENTA IS
  PROCEDURE AD_VENTA(XEMPLEADO IN NUMBER, XFORMAPAGO IN VARCHAR, XVALORPAGAR IN NUMBER, XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR) IS
  BEGIN
    INSERT INTO ventas (empleado , formapago , valorpagar , tipodoc , numdoc) VALUES(XEMPLEADO,XFORMAPAGO,XVALORPAGAR,XTIPODOC,XNUMDOC);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR VENTA');
    END AD_VENTA;
    
  FUNCTION CONSULTAR_CLIENTES_DIARIOS RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT COUNT(*) EMPLEADOS
	  FROM ventas
	  WHERE fecha = TO_DATE(SYSDATE,'DD-MM-YYYY');
    RETURN CONSULTA;
  END;
    
  FUNCTION CONSULTAR_VENTAS RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT *
      FROM VENTASDIARIAS;
    RETURN CONSULTA;
  END;
END PC_VENTA;
/
CREATE OR REPLACE PACKAGE BODY PC_EMPLEADO IS
  PROCEDURE AD_EMPLEADO(XCARGO IN VARCHAR, XSALARIO IN NUMBER, XTIPOCONTRATO IN VARCHAR, XSEDE IN NUMBER, XTIPODOC IN VARCHAR, XNUMDOC IN VARCHAR) IS
  BEGIN
    INSERT INTO empleados (cargo , salario , tipocontrato , sede , tipodoc , numdoc) VALUES(XCARGO,XSALARIO,XTIPOCONTRATO,XSEDE,XTIPODOC,XNUMDOC);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR EMPLEADO');
    END AD_EMPLEADO;

  PROCEDURE AD_GERENTE(XIDEMPLE IN NUMBER, XSEDE IN NUMBER, XNOMBRE IN VARCHAR,XINFORMACION IN XMLTYPE) IS
  BEGIN
    INSERT INTO gerente (idemple , sede, nombre,informacion) VALUES(XIDEMPLE,XSEDE,XNOMBRE,XINFORMACION);
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20015,'NO PUEDE INGRESAR GERENTE');
    END AD_GERENTE;

  PROCEDURE EL_EMPLEADO(XID IN NUMBER) IS
  BEGIN
    DELETE FROM empleados WHERE id = XID;
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20025,'NO PUEDE ELIMINAR EMPLEADO');
  END EL_EMPLEADO;

  PROCEDURE EL_GERENTE(XIDEMPLE IN NUMBER) IS
  BEGIN
    DELETE FROM gerente WHERE idemple = XIDEMPLE;
    COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20025,'NO PUEDE ELIMINAR GERENTE');
  END EL_GERENTE;

  FUNCTION CONSULTAR_GERENTE(XNOMBRE IN VARCHAR) RETURN SYS_REFCURSOR IS CONSULTA SYS_REFCURSOR;
  BEGIN
    OPEN CONSULTA FOR
      SELECT gerente.nombre ,sedes.direccion
      FROM sedes,gerente
      WHERE gerente.nombre = XNOMBRE AND gerente.sede = sedes.id;
    RETURN CONSULTA;
  END;
END PC_EMPLEADO;