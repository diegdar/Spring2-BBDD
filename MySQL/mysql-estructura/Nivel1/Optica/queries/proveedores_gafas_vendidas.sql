-- Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.
SELECT
	p.nombre_proveedor AS Proveedor_GafaVendida,
    v.fecha_venta,
    g.marca_gafa AS Marca_Vendida,
    v.id_venta
FROM proveedores p
JOIN gafas g
	ON g.nif_proveedor = p.nif_proveedor
JOIN ventas v
	ON v.id_gafa = g.id_gafa;