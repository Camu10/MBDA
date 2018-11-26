---POBLADO DE PRODUCCIONES
CREATE OR REPLACE TRIGGER POBLADO
AFTER INSERT ON animes
FOR EACH ROW
BEGIN
	INSERT INTO producciones(autor, anime) VALUES (:NEW.id, :NEW.id);
END;

drop trigger POBLADO;