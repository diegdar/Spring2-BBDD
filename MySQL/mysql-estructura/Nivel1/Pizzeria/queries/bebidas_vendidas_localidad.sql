-- Lista cuántos productos de tipo “Bebidas” se han vendido en una determinada localidad.
SELECT
	pe.cantidad_productos,
	t.localidad
FROM productos p
JOIN pedidos pe 
	ON p.id_producto = pe.id_producto
JOIN tiendas t
	ON t.id_tienda = pe.id_tienda
WHERE p.tipo_producto LIKE '%bebidas%' 
	AND t.localidad LIKE '%Madrid%';
