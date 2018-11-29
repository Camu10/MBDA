SELECT competencias.nombre, validaciones.numero, A.promedio
FROM validaciones,competencias,(select COUNT(*)*100/(total) promedio FROM validaciones,(SELECT COUNT(*) total FROM validaciones B)) A
WHERE validaciones.codigo = competencias.codigo;