-- quién ha sido el empleado/a que ha vendido cada gafa, y establecer la fecha 
SELECT e.nombre_empleado, g.marca_gafa, v.fecha_venta
FROM empleados e
JOIN ventas v
	ON e.id_empleado = v.id_empleado
JOIN gafas g
	ON v.id_gafa = g.id_gafa;