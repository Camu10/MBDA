CREATE TABLE autores(
    id  NUMBER NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    );
CREATE TABLE producciones(
    autor NUMBER NOT NULL
    ,anime NUMBER NOT NULL
    );
CREATE TABLE personajes(
    id NUMBER NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    ,nombreanime VARCHAR(90) NOT NULL
    );
CREATE TABLE elencos(
    anime NUMBER NOT NULL
    ,personaje NUMBER NOT NULL
    );
CREATE TABLE animes(
    id NUMBER NOT NULL
    ,nombre VARCHAR(90) NOT NULL
    ,genero VARCHAR(50) NOT NULL
    );
CREATE TABLE inventario(
    anime NUMBER NOT NULL
    ,figura NUMBER NOT NULL
    );
CREATE TABLE ropa(
    id NUMBER NOT NULL
    ,categoria VARCHAR(50) NOT NULL
    ,anime VARCHAR(90) NOT NULL
    );
CREATE TABLE figuras(
    id NUMBER NOT NULL
    ,peranime VARCHAR(50) NOT NULL
    ,tama_o VARCHAR(20) NOT NULL
    );
CREATE TABLE ejemplares(
    id NUMBER NOT NULL
    ,cantidad NUMBER NOT NULL
    ,precio NUMBER NOT NULL
    ,figura NUMBER
    ,ropa NUMBER 
    ,anime NUMBER 
    ,venta NUMBER NOT NULL
    ,sede NUMBER NOT NULL
    );
CREATE TABLE compras(
    id NUMBER NOT NULL
    ,valorcompra NUMBER NOT NULL
    ,ejemplar NUMBER NOT NULL
    ,proveedor NUMBER NOT NULL
    );
CREATE TABLE tarjetadescuento(
    descuento NUMBER NOT NULL
    );
CREATE TABLE clientes(
    tipodoc VARCHAR(50) NOT NULL
    ,numdoc VARCHAR(50) NOT NULL
    ,tarjetadescuento NUMBER    
    );
CREATE TABLE ventas(
    id NUMBER NOT NULL
    ,empleado NUMBER NOT NULL
    ,formapago VARCHAR(50) NOT NULL
    ,valorpagar NUMBER NOT NULL
    ,tipodoc VARCHAR(3) NOT NULL
    ,numdoc VARCHAR(50) NOT NULL
    ,fecha DATE NOT NULL
    );
CREATE TABLE sedes(
    id NUMBER NOT NULL
    ,direccion VARCHAR(50) NOT NULL
    );
CREATE TABLE control(
    sede NUMBER NOT NULL
    ,venta NUMBER NOT NULL
);
CREATE TABLE empleados(
    id NUMBER NOT NULL
    ,cargo VARCHAR(50) NOT NULL
    ,salario NUMBER NOT NULL
    ,tipocontrato VARCHAR(50) NOT NULL
    ,sede NUMBER NOT NULL
    ,tipodoc VARCHAR(3) NOT NULL
    ,numdoc VARCHAR(100) NOT NULL
    );

CREATE TABLE contratos(
    id NUMBER NOT NULL
    ,tipo VARCHAR(50) NOT NULL
    ,empleado NUMBER NOT NULL
    );
CREATE TABLE gerente(
    idemple NUMBER NOT NULL
    ,sede NUMBER NOT NULL
    ,nombre VARCHAR(90) NOT NULL
    ,informacion XMLTYPE
    );
CREATE TABLE proveedores(
    id NUMBER NOT NULL
    ,nombre VARCHAR(50) NOT NULL
    );