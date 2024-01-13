-- Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.
SELECT
	p.nombre AS Proveedor_GafaVendida,
    v.fecha_venta,
    g.marca AS Marca_Vendida,
    v.id AS id_venta
FROM proveedores p
JOIN gafas g
	ON g.id = p.id
JOIN ventas v
	ON v.id = g.id;