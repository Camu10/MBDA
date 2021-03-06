ALTER TABLE animes ADD CONSTRAINT CK_animes
    CHECK(genero IN('Kodomo','Shonen','Sh?jo','Seinen','Josei','Mah� sh�jo','Mecha','Sentai','Spokon','Post-apocaliptico','Meitantei','Sh?nen-ai y Yaoi','Sh?jo-ai y Yuri','Hentai','Ecchi','Harem','Harem Reverso','Magical Girlfriend','Anime progresivo','Bish?jo','Bish?nen','Kemono','Super deformed','Moe','Gore'));
ALTER TABLE ropa ADD CONSTRAINT CK_ropa
    CHECK(categoria IN('Pantalon','Camisa','Camiseta','Saco','Medias','Gorro','Chaqueta','Gorra','Pantaloneta','Bufanda'));
ALTER TABLE empleados ADD CONSTRAINT CK_empleados_tipodoc
    CHECK(tipodoc IN ('CC','NIT','TI','CE','TP'));
ALTER TABLE clientes ADD CONSTRAINT CK_clientes
    CHECK(tipodoc IN ('CC','NIT','TI','CE','TP'));
ALTER TABLE ventas ADD CONSTRAINT CK_ventas
    CHECK(tipodoc IN ('CC','NIT','TI','CE','TP'));
ALTER TABLE empleados ADD CONSTRAINT CK_empleados_cargo
    CHECK(cargo IN ('Vendedor','Administrativo Area Ventas','Analista de Ventas','Analista de Marketing','Promotor','Tesorero','Cajero','Analista de Finanzas','Supervisor de Compras','Servicios Generales','Encargado de Recursos Humanos','Encargado de Informatica','Gerente'));
ALTER TABLE figuras ADD CONSTRAINT CK_figuras
    CHECK(tama_o IN('Peque�o','Mediano','Grande','Real'));
ALTER TABLE empleados ADD CONSTRAINT CK_contrato
    CHECK(tipocontrato IN ('Definido','Indefinido'));
ALTER TABLE ventas ADD CONSTRAINT CK_ventas_pago
    CHECK(formapago IN ('Efectivo','Tarjetacredito','Tarjetadebito','Cheque'));
ALTER TABLE tarjetadescuento ADD CONSTRAINT CK_descuento
    CHECK(descuento <=100 AND descuento >= 1);