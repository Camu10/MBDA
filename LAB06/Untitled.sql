SELECT competencias.nombre, validaciones.numero, A.promedio
FROM validaciones,competencias,(select COUNT(*)*100/(A+B) promedio FROM validaciones,(SELECT COUNT(*) FROM validaciones)) AS A
WHERE validaciones.codigo = competencias.codigo AND validaciones.correo = XCORREO;