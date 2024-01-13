-- Lista el total de compras de un cliente/a.
SELECT 
	c.nombre, v.fecha_venta,
    g.marca
FROM clientes c 
JOIN ventas v 
	ON v.id = c.id
JOIN gafas g
	ON g.id = v.id
WHERE c.id = 3 ;
    