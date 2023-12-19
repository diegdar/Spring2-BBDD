-- Lista las distintas gafas que ha vendido un empleado durante un año.
SELECT 
	v.fecha_venta,
	e.nombre_empleado AS Vendido_Por, 
    g.marca_gafa AS Gafa_vendida, 
    c.nombre_cliente,
    v.id_venta
FROM empleados e
JOIN ventas v
	ON v.id_empleado = e.id_empleado
JOIN gafas g
	ON v.id_gafa = g.id_gafa
JOIN clientes c 
	ON v.id_cliente = c.id_cliente
WHERE v.fecha_venta 
	BETWEEN current_time() - INTERVAL 1 YEAR AND current_time()    
    AND e.nombre_empleado= 'Ana García';
