ALTER TABLE producciones 
    DROP CONSTRAINT FK_producciones_autores;
ALTER TABLE producciones 
    DROP CONSTRAINT FK_producciones_anime;
ALTER TABLE elencos 
    DROP CONSTRAINT FK_personajes_elencos;
ALTER TABLE elencos 
    DROP CONSTRAINT FK_animes_elencos;
ALTER TABLE inventario 
    DROP CONSTRAINT FK_animes_inventario;
ALTER TABLE inventario 
    DROP CONSTRAINT FK_inventario_figuras;
ALTER TABLE ejemplares 
    DROP CONSTRAINT FK_animes_ejemplares;
ALTER TABLE ejemplares 
    DROP CONSTRAINT FK_ropa_ejemplares;
ALTER TABLE ejemplares 
    DROP CONSTRAINT FK_figuras_ejemplares;
ALTER TABLE ejemplares 
    DROP CONSTRAINT FK_venta_ejemplares;
ALTER TABLE ejemplares 
    DROP CONSTRAINT FK_sedes_ejemplares;
ALTER TABLE compras 
    DROP CONSTRAINT FK_ejemplar_compras;
ALTER TABLE compras 
    DROP CONSTRAINT FK_proveedores_compras;
ALTER TABLE empleados 
    DROP CONSTRAINT FK_sedes_empleados;
ALTER TABLE gerente 
    DROP CONSTRAINT FK_sedes_gerente;
ALTER TABLE contratos
    DROP CONSTRAINT FK_empleados_contrato;
ALTER TABLE gerente
    DROP CONSTRAINT FK_empleados_gerente;
ALTER TABLE ventas
    DROP CONSTRAINT FK_ventas_clientes;
ALTER TABLE clientes 
    DROP CONSTRAINT FK_tarjetadescuento_clientes;

ALTER TABLE producciones ADD CONSTRAINT  FK_producciones_autores
    FOREIGN KEY(autor) REFERENCES autores(id)
    ON DELETE CASCADE;
ALTER TABLE producciones ADD CONSTRAINT  FK_producciones_anime 
    FOREIGN KEY(anime) REFERENCES animes(id)
    ON DELETE CASCADE;
ALTER TABLE elencos ADD CONSTRAINT  FK_personajes_elencos 
    FOREIGN KEY(personaje) REFERENCES personajes(id)
    ON DELETE CASCADE;
ALTER TABLE elencos ADD CONSTRAINT  FK_animes_elencos 
    FOREIGN KEY(anime) REFERENCES animes(id)
    ON DELETE CASCADE;
ALTER TABLE inventario ADD CONSTRAINT  FK_animes_inventario 
    FOREIGN KEY(anime) REFERENCES animes(id)
    ON DELETE CASCADE;
ALTER TABLE inventario ADD CONSTRAINT  FK_inventario_figuras 
    FOREIGN KEY(figura) REFERENCES figuras(id)
    ON DELETE CASCADE;
ALTER TABLE ejemplares ADD CONSTRAINT  FK_animes_ejemplares 
    FOREIGN KEY(anime) REFERENCES animes(id)
    ON DELETE CASCADE;
ALTER TABLE ejemplares ADD CONSTRAINT  FK_ropa_ejemplares 
    FOREIGN KEY(ropa) REFERENCES ropa(id)
    ON DELETE CASCADE;
ALTER TABLE ejemplares ADD CONSTRAINT  FK_figuras_ejemplares 
    FOREIGN KEY(figura) REFERENCES figuras(id)
    ON DELETE CASCADE;
ALTER TABLE ejemplares ADD CONSTRAINT  FK_venta_ejemplares 
    FOREIGN KEY(venta) REFERENCES ventas(id)
    ON DELETE CASCADE;
ALTER TABLE ejemplares ADD CONSTRAINT  FK_sedes_ejemplares 
    FOREIGN KEY(sede) REFERENCES sedes(id)
    ON DELETE CASCADE;
ALTER TABLE compras ADD CONSTRAINT  FK_ejemplar_compras 
    FOREIGN KEY(ejemplar) REFERENCES ejemplares(id)
    ON DELETE CASCADE;
ALTER TABLE compras ADD CONSTRAINT  FK_proveedores_compras 
    FOREIGN KEY(proveedor) REFERENCES proveedores(id)
    ON DELETE CASCADE;
ALTER TABLE clientes ADD CONSTRAINT  FK_tarjetadescuento_clientes 
    FOREIGN KEY(tarjetadescuento) REFERENCES tarjetadescuento(descuento)
    ON DELETE CASCADE;
ALTER TABLE empleados ADD CONSTRAINT  FK_sedes_empleados 
    FOREIGN KEY(sede) REFERENCES sedes(id)
    ON DELETE CASCADE;
ALTER TABLE gerente ADD CONSTRAINT  FK_sedes_gerente 
    FOREIGN KEY(sede) REFERENCES sedes(id)
    ON DELETE CASCADE;
ALTER TABLE contratos ADD CONSTRAINT  FK_empleados_contrato 
    FOREIGN KEY(empleado) REFERENCES empleados(id)
    ON DELETE CASCADE;
ALTER TABLE gerente ADD CONSTRAINT  FK_empleados_gerente 
    FOREIGN KEY(idemple) REFERENCES empleados(id)
    ON DELETE CASCADE;
ALTER TABLE ventas ADD CONSTRAINT  FK_ventas_clientes 
    FOREIGN KEY(tipodoc,numdoc) REFERENCES clientes(tipodoc,numdoc)
    ON DELETE CASCADE;
