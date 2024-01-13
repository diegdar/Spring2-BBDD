-- Lista las distintas gafas que ha vendido un empleado durante un año.
SELECT  
	g.marca AS marca_gafa,
    SUM(v.cantidad) AS cantidad_vendidas
FROM ventas v
JOIN gafas g ON v.id_gafa = g.id
JOIN empleados e ON e.id = v.id_empleado
WHERE  v.fecha_venta BETWEEN current_time() - INTERVAL 1 YEAR AND current_time()    
    AND e.nombre= 'Carmen Pérez'
GROUP BY g.marca;
    
    
