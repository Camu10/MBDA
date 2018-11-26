ALTER TABLE autores ADD CONSTRAINT PK_autores PRIMARY KEY(id);
ALTER TABLE producciones ADD CONSTRAINT PK_produccion PRIMARY KEY(autor,anime);
ALTER TABLE personajes ADD CONSTRAINT PK_personajes PRIMARY KEY(id);
ALTER TABLE elencos ADD CONSTRAINT PK_elenco PRIMARY KEY(anime,personaje);
ALTER TABLE animes ADD CONSTRAINT PK_animes PRIMARY KEY(id);
ALTER TABLE inventario ADD CONSTRAINT PK_inventario PRIMARY KEY(anime,figura);
ALTER TABLE ropa ADD CONSTRAINT PK_ropa PRIMARY KEY(id);
ALTER TABLE figuras ADD CONSTRAINT PK_figuras PRIMARY KEY(id);
ALTER TABLE ejemplares ADD CONSTRAINT PK_ejemplar PRIMARY KEY(id);
ALTER TABLE compras ADD CONSTRAINT PK_compras PRIMARY KEY(id);
ALTER TABLE proveedores ADD CONSTRAINT PK_proveedores PRIMARY KEY(id);
ALTER TABLE gerente ADD CONSTRAINT PK_gerente PRIMARY KEY(idemple);
ALTER TABLE tarjetadescuento ADD CONSTRAINT PK_tarjetadescuento PRIMARY KEY(id);
ALTER TABLE clientes ADD CONSTRAINT PK_clientes PRIMARY KEY(tipodoc,numdoc);
ALTER TABLE ventas ADD CONSTRAINT PK_ventas PRIMARY KEY(id);
ALTER TABLE sedes ADD CONSTRAINT PK_sedes PRIMARY KEY(id);
ALTER TABLE empleados ADD CONSTRAINT PK_empleados PRIMARY KEY(id);
ALTER TABLE contratos ADD CONSTRAINT PK_contratos PRIMARY KEY(id);
ALTER TABLE personas ADD CONSTRAINT PK_personas PRIMARY KEY(tipodoc,numdoc);
ALTER TABLE control ADD CONSTRAINT PK_control PRIMARY KEY(id);