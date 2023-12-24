-- 1.	Lista el nombre de todos los productos que hay en la tabla "producto".
SELECT nombre FROM producto;
-- 2.	Lista los nombres y precios de todos los productos de la tabla "producto".
SELECT nombre, precio FROM producto;
-- 3.	Lista todas las columnas de la tabla "producto".
SELECT * FROM producto;
-- 4.	Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio AS precio_EUR, (precio * 1.09) AS precio_USD FROM producto;
-- 5.	Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses. Utiliza los siguientes sobrenombre para las columnas: nombre de "producto", euros, dólares estadounidenses.
SELECT nombre AS producto, precio AS euros, (precio * 1.09) AS dolares_estadounidenses FROM producto;
-- 6.	Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;
-- 7.	Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a minúscula.
SELECT lower(nombre), precio FROM producto;
-- 8.	Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;
-- 9.	Lista los nombres y precios de todos los productos de la tabla "producto", redondeando el valor del precio.
SELECT nombre, ROUND(precio, 0) FROM producto;
-- 10.	Lista los nombres y precios de todos los productos de la tabla "producto", truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- 11.	Lista el código de los fabricantes que tienen productos en la tabla "producto".
SELECT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 12.	Lista el código de los fabricantes que tienen productos en la tabla "producto", eliminando los códigos que aparecen repetidos.
SELECT DISTINCT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 13.	Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14.	Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15.	Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- 16.	Devuelve una lista con las 5 primeras filas de la tabla "fabricante".
SELECT * FROM fabricante LIMIT 5;
-- 17.	Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla "fabricante". La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 3,2;
-- 18.	Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MIN(precio), necesitarías GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19.	Lista el nombre y precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MAX(precio), necesitarías GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20.	Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT p.nombre AS nom_producto FROM producto p  JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.codigo = 2;
-- 21.	Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre AS nom_producto, p.precio, f.nombre AS nom_fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
-- 22.	Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre AS nom_producto, p.precio, f.nombre AS nom_fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY nom_fabricante;
-- 23.	Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.codigo AS codigo_producto, p.nombre AS nom_producto, p.codigo_fabricante AS codigo_fabricante, f.nombre AS nom_fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
-- 24.	Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;
-- 25.	Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
-- 26.	Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT p.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'lenovo';
-- 27.	Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT p.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Crucial' AND p.precio > 200;
-- 28.	Devuelve una lista con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT p.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate';
-- 29.	Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Usando el operador IN.
SELECT p.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN('Asus', 'Hewlett-Packard', 'Seagate');
-- 30.	Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%e';
-- 31.	Devuelve un listado con el nombre y precio de todos los productos de cuyos fabricantes contenga el carácter w en su nombre.
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%w%';
-- 32.	Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio > 180 ORDER BY p.precio DESC, p.nombre ASC;
-- 33.	Devuelve un listado con el código y el nombre de fabricante, solo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT f.codigo, f.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante GROUP BY f.codigo;
-- 34.	Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;
-- 35.	Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.nombre AS nombre_fabricante FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.nombre IS NULL;
-- 36.	Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT p.nombre AS nombre_producto FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre='lenovo' AND p.nombre IS NOT NULL; 
-- 37.	Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT p.codigo AS codigo_producto, p.nombre AS nom_producto, p.precio FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre='lenovo' ORDER BY p.precio DESC LIMIT 1; 
-- 38.	Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre AS nom_producto FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre='lenovo' ORDER BY p.precio DESC LIMIT 1; 
-- 39.	Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre AS nom_producto FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre='Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1; 
-- 40.	Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto p WHERE p.precio >= ( SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre='lenovo') ); 