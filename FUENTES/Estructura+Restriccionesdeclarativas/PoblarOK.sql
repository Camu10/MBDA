INSERT INTO autores (id, nombre) VALUES (1, 'Skye McCaffery');
INSERT INTO autores (id, nombre) VALUES (2, 'Barb Colloff');
INSERT INTO autores (id, nombre) VALUES (3, 'Viki Coultass');
INSERT INTO autores (id, nombre) VALUES (4, 'Gearard Curteis');
INSERT INTO autores (id, nombre) VALUES (5, 'Daphene Reditt');

INSERT INTO animes (id, nombre , genero) VALUES (1, 'Tokyo Ghoul','Gore');
INSERT INTO animes (id, nombre , genero) VALUES (2, 'Shingeki no kyojin','Shonen');
INSERT INTO animes (id, nombre , genero) VALUES (3, 'Dragon ball','Shonen');
INSERT INTO animes (id, nombre , genero) VALUES (4, 'Boku No Hero','Shonen');
INSERT INTO animes (id, nombre , genero) VALUES (5, 'Elfen lied','Gore');

INSERT INTO producciones (autor, anime) VALUES (1, 1);
INSERT INTO producciones (autor, anime) VALUES (2, 2);
INSERT INTO producciones (autor, anime) VALUES (3, 3);
INSERT INTO producciones (autor, anime) VALUES (4, 4);
INSERT INTO producciones (autor, anime) VALUES (5, 5);

INSERT INTO personajes (id, nombre , nombreanime) VALUES (1, 'Kanekas', 'Tokyo Ghoul');
INSERT INTO personajes (id, nombre , nombreanime) VALUES (2, 'Eren', 'Shingeki no kyojin');
INSERT INTO personajes (id, nombre , nombreanime) VALUES (3, 'Goku', 'Dragon ball');
INSERT INTO personajes (id, nombre , nombreanime) VALUES (4, 'Deku', 'Boku No Hero');
INSERT INTO personajes (id, nombre , nombreanime) VALUES (5, 'Lucy', 'Elfen lied');

INSERT INTO elencos (anime , personaje) VALUES (1, 1);
INSERT INTO elencos (anime , personaje) VALUES (2, 2);
INSERT INTO elencos (anime , personaje) VALUES (3, 3);
INSERT INTO elencos (anime , personaje) VALUES (4, 4);
INSERT INTO elencos (anime , personaje) VALUES (5, 5);

INSERT INTO ropa (id , categoria , anime) VALUES (1, 'Pantalon', 'Kanekas');
INSERT INTO ropa (id , categoria , anime) VALUES (2, 'Camisa','Eren');
INSERT INTO ropa (id , categoria , anime) VALUES (3, 'Medias', 'Goku');
INSERT INTO ropa (id , categoria , anime) VALUES (4, 'Gorra', 'Deku');
INSERT INTO ropa (id , categoria , anime) VALUES (5, 'Gorro', 'Lucy');

INSERT INTO figuras (id , peranime, tama_o) VALUES (1, 'Kanekas','Pequeño');
INSERT INTO figuras (id , peranime, tama_o) VALUES (2, 'Eren', 'Grande');
INSERT INTO figuras (id , peranime, tama_o) VALUES (3, 'Goku', 'Real');
INSERT INTO figuras (id , peranime, tama_o) VALUES (4, 'Deku', 'Mediano');
INSERT INTO figuras (id , peranime, tama_o) VALUES (5, 'Lucy', 'Grande');

INSERT INTO inventario ( anime , figura ) VALUES (1, 2);
INSERT INTO inventario ( anime , figura ) VALUES (3, 3);
INSERT INTO inventario ( anime , figura ) VALUES (4, 4);
INSERT INTO inventario ( anime , figura ) VALUES (5, 5);

INSERT INTO proveedores (id , nombre ) VALUES (1, 'Animeperon');
INSERT INTO proveedores (id , nombre ) VALUES (2, 'loveAnime');
INSERT INTO proveedores (id , nombre ) VALUES (3, 'Toriyama');
INSERT INTO proveedores (id , nombre ) VALUES (4, 'rincon Otaku');
INSERT INTO proveedores (id , nombre ) VALUES (5, 'Otakon');

INSERT INTO tarjetadescuento (id , descuento) VALUES (1, 10);
INSERT INTO tarjetadescuento (id , descuento) VALUES (2, 50);
INSERT INTO tarjetadescuento (id , descuento) VALUES (3, 100);
INSERT INTO tarjetadescuento (id , descuento) VALUES (4, 5);
INSERT INTO tarjetadescuento (id , descuento) VALUES (5, 25);

INSERT INTO clientes (tipodoc , numdoc , tarjetadescuento) VALUES ('CC', 1 ,1);
INSERT INTO clientes (tipodoc , numdoc , tarjetadescuento) VALUES ('NIT', 2 , 2);
INSERT INTO clientes (tipodoc , numdoc , tarjetadescuento) VALUES ('TI', 3 , 3);
INSERT INTO clientes (tipodoc , numdoc , tarjetadescuento) VALUES ('CC', 4 , 4);
INSERT INTO clientes (tipodoc , numdoc , tarjetadescuento) VALUES ('CE', 5 , 5);

INSERT INTO ventas (id , empleado , formapago ,valorpagar ,tipodoc, numdoc) VALUES (1 , 1 , 'Efectivo' , 25000,  'CC', 1 );
INSERT INTO ventas (id , empleado , formapago ,valorpagar ,tipodoc, numdoc) VALUES (2 , 2 , 'Efectivo' , 30000 , 'NIT', 2 );
INSERT INTO ventas (id , empleado , formapago ,valorpagar ,tipodoc, numdoc) VALUES (3 , 3 , 'Efectivo' , 38000 ,'TI', 3 );
INSERT INTO ventas (id , empleado , formapago ,valorpagar ,tipodoc, numdoc) VALUES (4 , 4 , 'Efectivo' , 35900 ,'CC', 4 );
INSERT INTO ventas (id , empleado , formapago ,valorpagar ,tipodoc, numdoc) VALUES (5 , 5 , 'Efectivo' , 80000 ,'CE', 5);

INSERT INTO sedes ( id , direccion, numempleados , venta ) VALUES (1 , 'Carrera 3 # 18- 45' , 200, 1 );
INSERT INTO sedes ( id , direccion, numempleados , venta ) VALUES (2 , 'Carrera 7 # 84- 72' , 300, 2 );
INSERT INTO sedes ( id , direccion, numempleados , venta ) VALUES (3 , 'Calle 4 No. 5 – 10' , 20, 3 );
INSERT INTO sedes ( id , direccion, numempleados , venta ) VALUES (4 , 'Calle 11 No. 4 - 14' , 50, 4 );
INSERT INTO sedes ( id , direccion, numempleados , venta ) VALUES (5 , 'Calle 24 N° 5-60' , 10, 5 );

INSERT INTO ejemplares ( id , cantidad , precio , figura ,ropa , anime , venta , sede ) VALUES (1 , 1 , 20000 , NULL , NULL , 1 ,1 , 1 );
INSERT INTO ejemplares ( id , cantidad , precio , figura ,ropa , anime , venta , sede ) VALUES (2 , 20 , 300000 , 2 , NULL , NULL , 2 , 2 );
INSERT INTO ejemplares ( id , cantidad , precio , figura ,ropa , anime , venta , sede ) VALUES (3 , 10 , 100000 , NULL , NULL , 3 , 3 , 3 );
INSERT INTO ejemplares ( id , cantidad , precio , figura ,ropa , anime , venta , sede ) VALUES (4 , 15 , 125000 , NULL , 4 , NULL , 4 , 4 );
INSERT INTO ejemplares ( id , cantidad , precio , figura ,ropa , anime , venta , sede ) VALUES (5 , 25 , 350000 , NULL , 5 , NULL , 5 , 5 );

INSERT INTO compras (id , valorcompra , ejemplar , proveedor ) VALUES (1, 20000 , 1 , 1);
INSERT INTO compras (id , valorcompra , ejemplar , proveedor ) VALUES (2, 25000 , 2 , 2);
INSERT INTO compras (id , valorcompra , ejemplar , proveedor ) VALUES (3, 10000 , 3 , 3);
INSERT INTO compras (id , valorcompra , ejemplar , proveedor ) VALUES (4, 30000 , 4 , 4);
INSERT INTO compras (id , valorcompra , ejemplar , proveedor ) VALUES (5, 50000 , 5 , 5);

INSERT INTO personas ( nombre , tipodoc , numdoc ) VALUES ('Cesar' ,'CC', 1);
INSERT INTO personas ( nombre , tipodoc , numdoc ) VALUES ('Migue' ,'NIT', 2);
INSERT INTO personas ( nombre , tipodoc , numdoc ) VALUES ('Santiago' ,'TI', 3 );
INSERT INTO personas ( nombre , tipodoc , numdoc ) VALUES ('Carlos','CC', 4 );
INSERT INTO personas ( nombre , tipodoc , numdoc ) VALUES ('Eduard' ,'CE', 5 );

INSERT INTO empleados ( id , cargo , salario ,tipocontrato , sede , tipodoc , numdoc ) VALUES (1 , 'Vendedor' , 200000 , 'Definido' , 1 ,'CC', 1);
INSERT INTO empleados ( id , cargo , salario ,tipocontrato , sede , tipodoc , numdoc ) VALUES (2 , 'Administrativo Área Ventas' , 3000000 , 'Definido' , 2 , 'NIT', 2);
INSERT INTO empleados ( id , cargo , salario ,tipocontrato , sede , tipodoc , numdoc ) VALUES (3 , 'Analista de Ventas' , 1000000 , 'Definido' ,3 , 'TI', 3 );
INSERT INTO empleados ( id , cargo , salario ,tipocontrato , sede , tipodoc , numdoc ) VALUES (4 , 'Analista de Ventas' , 1250000 , 'Indefinido' , 4 , 'CC', 4 );
INSERT INTO empleados ( id , cargo , salario ,tipocontrato , sede , tipodoc , numdoc ) VALUES (5 , 'Promotor' , 3500000 , 'Indefinido' , 5 , 'CE', 5 );

INSERT INTO contratos (id, tipo , empleado) VALUES (1 , 'Definido' , 1);
INSERT INTO contratos (id, tipo , empleado) VALUES (2 , 'Definido' , 2);
INSERT INTO contratos (id, tipo , empleado) VALUES (3 , 'Definido' ,3);
INSERT INTO contratos (id, tipo , empleado) VALUES (4 , 'Indefinido' , 4);
INSERT INTO contratos (id, tipo , empleado) VALUES (5 , 'Indefinido' , 5);

INSERT INTO recursoshumanos (sede , contrato) VALUES (1 , 1);
INSERT INTO recursoshumanos (sede , contrato) VALUES (2 , 2);
INSERT INTO recursoshumanos (sede , contrato) VALUES (3 , 3);
INSERT INTO recursoshumanos (sede , contrato) VALUES (4 , 4);
INSERT INTO recursoshumanos (sede , contrato) VALUES (5 , 5);

INSERT INTO gerente ( idemple , sede ) VALUES (1 , 1);
INSERT INTO gerente ( idemple , sede ) VALUES (2 , 2);
INSERT INTO gerente ( idemple , sede ) VALUES (3 , 3);
INSERT INTO gerente ( idemple , sede ) VALUES (4 , 4);
INSERT INTO gerente ( idemple , sede ) VALUES (5 , 5);
