/*
Una persona entra en la tienda, pregunta por los animes de los que poseemos conocimiento con el nombre de los autores
*/
SELECT PA_ENCPRODUCTOS.CON_ANIME_AUTOR('Jenine Beaman') FROM DUAL;

/*
pregunta por lo que tenemos en inventario y le llama la atenci�n las figuras de genero Shonen, de 
la cual quiere saber el como la tenemos en el momento para ver si la compra
*/

SELECT PA_ENCPRODUCTOS.CONSULTAR_FIGURA('Shonen') FROM DUAL;
/*
adem�s de esto pregunta por un art�culo que no tenemos en inventario, y verificamos si el mayor proveedor que tenemos lo posee, 
despu�s de esto, el cliente pregunta que, si podr�amos mostrar la lista de descuentos para el escoger uno, el empleado de mala manera
le muestra la lista de descuentos, pero le dice que no es posible ya que fue solo una compra
*/
EXECUTE PA_EMPPERSONA.AD_CLIENTE('CC', '12345678', 5);
EXECUTE PA_EMPVENTA.AD_VENTA(1, 'Efectivo', 40000, 'CC','12345678');
SELECT PA_GERPROVEEDOR.CONSULTAR_PROVEEDOR('Nienow Inc') FROM DUAL;
SELECT PA_EMPPERSONA.CONSULTAR_DESCUENTO_DISPO FROM DUAL;


/*
esta persona, pregunta cuantas sedes hay y 
luego pide al encargado(Gerente) de la sede en la que se encuentra
*/
SELECT PA_GERSEDE.CONSULTAR_SEDES FROM DUAL;
SELECT PA_GERSEDE.CONSULTAR_SEDES_GERENTES(1) FROM DUAL;

/*
despu�s del gerente charlar con el empleado, el gerente lo despide, y procede a arreglar las cosas con el cliente d�ndole una 
tarjeta de descuento, y el cliente pregunta por cuanto descuento seria su tarjeta.
*/
EXECUTE PA_DIREMPLEADO.EL_EMPLEADO(2);
SELECT PA_EMPPERSONA.CONSULTAR_DESCUENTO('CC','12345678') FROM DUAL;
/*
despu�s de que el cliente se va de la tienda con su tarjeta de descuento y solucionar todo este problema, otro empleado de esta
misma sede tiene que realizar el reporte de ventas y flujo de clientes en este d�a el cual debe ser entregado al gerente
*/
SELECT PA_EMPVENTA.CONSULTAR_CLIENTES_DIARIOS FROM DUAL;
SELECT PA_GERSEDE.CONSULTAR_SEDES_GERENTES(1) FROM DUAL;
/*
Al ver el alto flujo de clientes en este d�a tambi�n desea conocer el valor total de todas las 
ventas realizadas en este d�a
*/
SELECT PA_EMPVENTA.CONSULTAR_VENTAS FROM DUAL;
/*
Por el alto flujo de clientes y de ventas hechas durante el d�a desea saber cu�l fue el producto 
que m�s se vendi� 
*/
SELECT PA_ENCPRODUCTOS.CON_MAX_EJEMPLARES FROM DUAL;