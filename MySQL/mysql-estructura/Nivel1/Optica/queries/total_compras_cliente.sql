-- Lista el total de compras de un cliente/a.
SELECT 
	c.nombre_cliente, v.fecha_venta,
    g.marca_gafa
FROM clientes c 
JOIN ventas v 
	ON v.id_cliente = c.id_cliente
JOIN gafas g
	ON g.id_gafa = v.id_gafa
WHERE c.id_cliente = 3 ;
    