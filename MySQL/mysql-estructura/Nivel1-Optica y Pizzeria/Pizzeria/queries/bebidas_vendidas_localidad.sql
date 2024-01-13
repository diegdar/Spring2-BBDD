-- Lista cuántos productos de tipo “Bebidas” se han vendido en una determinada localidad.
SELECT
	t.localidad, SUM(dp.cantidad_producto) AS cantidad_bebidas
FROM productos p
JOIN detalle_pedidos dp ON dp.id_producto = p.id
JOIN pedidos pe ON pe.id = dp.id_pedido
JOIN tiendas t	ON t.id = pe.id_tienda    
WHERE p.tipo_producto LIKE '%bebidas%' AND t.localidad LIKE '%Madrid%'
GROUP BY t.localidad;
    
