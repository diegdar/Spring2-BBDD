DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;

USE pizzeria;

CREATE TABLE clientes(
id int  UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre varchar (50) NOT NULL,
direccion varchar(50) NOT NULL,
cp int NOT NULL,
localidad varchar(15) NOT NULL,
provincia varchar(15) NOT NULL,
telefono int NOT NULL
);

INSERT INTO 
`clientes` (`nombre`, `direccion`, `cp`, `localidad`, `provincia`, `telefono`)
 VALUES
('Carmen Rodríguez', 'Calle Cervantes, 100', 50001, 'Zaragoza', 'Zaragoza', 976543210),
('José Fernández', 'Avenida del Cid, 200', 30002, 'Valencia', 'Valencia', 963543210),
('Isabel Gómez', 'Calle Mayor, 300', 08004, 'Barcelona', 'Barcelona', 932543210),
('Antonio García', 'Plaza de España, 400', 14005, 'Sevilla', 'Sevilla', 954553210),
('Marta Hernández', 'Calle del Mar, 500', 36006, 'Málaga', 'Málaga', 952553210);

CREATE TABLE categoriasPizzas(
id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
categoria varchar(30)
);

INSERT INTO categoriasPizzas 
VALUES
(1, 'Clásicas'),
(2, 'Exóticas'),
(3, 'Vegetarianas');

CREATE TABLE productos(
id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
concepto varchar(30) NOT NULL,
precio decimal(5,2) UNSIGNED,
tipo_producto enum('pizzas', 'hamburguesas', 'bebidas') NOT NULL,
descripcion varchar(100),
imagen varchar(120),
id_categoriaPizza int UNSIGNED,
CONSTRAINT fk_productos_categoriasPizzas FOREIGN KEY (id_categoriaPizza) REFERENCES categoriasPizzas (id)
);

INSERT INTO
-- insertamos primero las pizzas que llevaran asignada la categoriaPizza
	productos (id_categoriaPizza, concepto, descripcion, imagen, precio, tipo_producto)
VALUES
(1, 'Pizza Margarita', 'Pizza tradicional con salsa de tomate, mozzarella y albahaca', 'pizza-margarita.jpg', 10.99, 'pizzas'),
(1, 'Pizza Napolitana', 'Pizza con salsa de tomate, mozzarella, anchoas y orégano', 'pizza-napolitana.jpg', 12.99, 'pizzas'),
(2, 'Pizza Danny', 'Pizza con salsa de tomate, mozzarella, chorizo, olivas negras, champiñones', 'pizza-cuatro-quesos.jpg', 14.99, 'pizzas'),
(1, 'Pizza Barbacoa', 'Pizza con salsa barbacoa, mozzarella, pollo, cebolla y piña', 'pizza-barbacoa.jpg', 16.99, 'pizzas'),
(3, 'Pizza Vegetariana', 'Pizza con salsa de tomate, mozzarella, verduras (tomate, cebolla, champiñones, pimientos, aceitunas)', 'pizza-vegetariana.jpg', 18.99, 'pizzas');

INSERT INTO productos (concepto, descripcion, imagen, precio, tipo_producto)
VALUES
('Hamburguesa Clásica', 'Hamburguesa con carne de vacuno, queso, lechuga, tomate y cebolla', 'img/hamburguesa-clasica.jpg', 7.99, 'hamburguesas'),
('Hamburguesa Bacon', 'Hamburguesa con carne de vacuno, queso, bacon, lechuga, tomate y cebolla', 'img/hamburguesa-bacon.jpg', 9.99, 'hamburguesas'),
('Hamburguesa Vegetariana', 'Hamburguesa vegetal con queso, lechuga, tomate y cebolla', 'img/hamburguesa-vegetariana.jpg', 12.99, 'hamburguesas'),
('Coca Cola', 'Refresco de cola', 'img/coca-cola.jpg', 2.99, 'bebidas'),
('Fanta', 'Refresco de naranja', 'img/fanta.jpg', 2.99, 'bebidas'),
('Sprite', 'Refresco de limón', 'img/sprite.jpg', 2.99, 'bebidas'),
('Agua', 'Agua mineral', 'img/agua.jpg', 1.99, 'bebidas');

CREATE TABLE tiendas(
id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
direccion varchar(50) NOT NULL,
cp int NOT NULL,
localidad varchar(15) NOT NULL,
provincia varchar(15) NOT NULL
);

-- CREACION DE LAS TIENDAS
INSERT INTO
`tiendas` (`direccion`, `cp`, `localidad`, `provincia`) 
VALUES
('Calle Gran Vía, 10', 28001, 'Madrid', 'Madrid'),
('Avenida de la Constitución, 2', 46002, 'Valencia', 'Valencia'),
('Calle Rambla de Catalunya, 31', 08003, 'Barcelona', 'Barcelona');

CREATE TABLE empleados(
id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50) NOT NULL,
nif char(9) NOT NULL UNIQUE,
puesto enum('cocinero', 'repartidor'),
telefono int NOT NULL,
id_tienda int UNSIGNED NOT NULL ,
CONSTRAINT fk_empleados_tiendas FOREIGN KEY (id_tienda) REFERENCES tiendas (id)
);
INSERT INTO 
`empleados` (`nombre`, `nif`, `puesto`, `telefono`, `id_tienda`) 
VALUES
('Luis García', '12345678A', 'cocinero', 654789123, 1),
('María López', '23456789B', 'repartidor', 963456789, 2),
('Pedro González', '34567890C', 'cocinero', 932345678, 3),
('Ana Sánchez', '45678901D', 'repartidor', 954567890, 1),
('Luis Martínez', '56789012E', 'cocinero', 952345678, 2),
('Carmen Rodríguez', '67890123F', 'repartidor', 976543210, 3),
('José Fernández', '78901234G', 'cocinero', 963543210, 1),
('Isabel Gómez', '89012345H', 'repartidor', 932543210, 2);

CREATE TABLE pedidos(
id int UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
tipo enum('domicilio','tienda') NOT NULL,
importe_total decimal (5,2) UNSIGNED,
id_cliente int UNSIGNED NOT NULL,
id_empleado int UNSIGNED NOT NULL,
id_tienda int UNSIGNED NOT NULL,
CONSTRAINT fk_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id),
CONSTRAINT fk_pedidos_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id),
CONSTRAINT fk_pedidos_tiendas FOREIGN KEY (id_tienda) REFERENCES tiendas (id)
);

INSERT INTO 
`pedidos` (`fecha`, `tipo`, `importe_total`, `id_cliente`, `id_empleado`, `id_tienda`)
VALUES
('2023-12-20 12:00:00', 'domicilio', 30.00, 1, 1, 1),
('2023-12-21 15:00:00', 'tienda', 25.50, 2, 2, 2),
('2023-12-22 17:00:00', 'domicilio', 40.20, 3, 6, 3),
('2023-12-23 20:00:00', 'tienda', 18.90, 4, 1, 1);

CREATE TABLE detalle_pedidos(
id_pedido int UNSIGNED NOT NULL,
id_producto int UNSIGNED NOT NULL,
cantidad_producto TINYINT NOT NULL,
PRIMARY KEY (id_pedido, id_producto),
CONSTRAINT fk_detalle_pedidos_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos (id),
CONSTRAINT fk_detalle_pedidos_productos FOREIGN KEY (id_producto) REFERENCES productos (id)
);

INSERT INTO 
`detalle_pedidos` (`id_pedido`, `id_producto`, `cantidad_producto`)
VALUES
(1, 11, 2),
(1, 12, 1),
(2, 9, 3),
(2, 10, 1),
(3, 11, 5),
(3, 12, 1),
(4, 9, 7),
(4, 10, 2);

CREATE TABLE repartos(
id int UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
id_empleado int UNSIGNED NOT NULL,
id_pedido int UNSIGNED NOT NULL,
CONSTRAINT fk_repartos_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos (id),
CONSTRAINT fk_repartos_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id)
);

INSERT INTO 
	`repartos`(`id_pedido`, `id_empleado`)
VALUES
	(1, 3),
    (3,	6);
INSERT INTO 
	`repartos`(`id_pedido`, `id_empleado`, `fecha`)
VALUES    
    (3, 4, "2023-12-16 18:39:22"),
    (1, 8, "2023-11-15 12:23:57") ;

