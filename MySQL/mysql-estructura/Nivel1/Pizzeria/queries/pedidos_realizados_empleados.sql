-- Lista cuántos pedidos ha efectuado un determinado empleado/a.
SELECT
	COUNT(*) AS cantidad_pedidos
FROM pedidos pe
JOIN empleados e
	ON e.id = pe.id_empleado
WHERE e.nombre='Luis García';




