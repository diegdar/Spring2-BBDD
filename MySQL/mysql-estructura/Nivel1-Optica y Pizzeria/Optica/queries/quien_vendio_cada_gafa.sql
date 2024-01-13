-- quién ha sido el empleado/a que ha vendido cada gafa, y establecer la fecha 
SELECT e.nombre, g.marca, v.fecha_venta
FROM empleados e
JOIN ventas v
	ON e.id = v.id
JOIN gafas g
	ON v.id = g.id;