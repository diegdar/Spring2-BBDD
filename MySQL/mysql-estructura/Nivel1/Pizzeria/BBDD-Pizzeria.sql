CREATE DATABASE pizzeria;

USE pizzeria;

CREATE TABLE clientes(
id_cliente int AUTO_INCREMENT NOT NULL,
nom_cliente varchar (50) NOT NULL,
direccion varchar(50) NOT NULL,
cp varchar(5) NOT NULL,
localidad varchar(15) NOT NULL,
provincia varchar(15) NOT NULL,
telefono varchar(12) NOT NULL,
PRIMARY KEY (id_cliente)
);

INSERT INTO 
	clientes (nom_cliente, direccion, cp, localidad, provincia, telefono)
VALUES
('Juan Pérez', 'Calle Mayor, 12', '28015', 'Madrid', 'Madrid', '666 123 456'),
('María López', 'Avenida de la Paz, 34', '08036', 'Barcelona', 'Barcelona', '933 456 789'),
('Antonio García', 'Paseo de Colón, 56', '46002', 'Valencia', 'Valencia', '963 456 789'),
('Pedro Sánchez', 'Calle del Carmen, 78', '13001', 'Córdoba', 'Córdoba', '957 456 789'),
('Ana Rodríguez', 'Plaza de España, 90', '41004', 'Sevilla', 'Sevilla', '954 456 789'),
('Luis González', 'Calle de la Independencia, 101', '37002', 'Salamanca', 'Salamanca', '923 456 789');

CREATE TABLE categoriasPizzas(
id_categoriaPizza int NOT NULL AUTO_INCREMENT,
nom_categoria varchar(30),
PRIMARY KEY(id_categoriaPizza)
);

INSERT INTO categoriasPizzas (nom_categoria)
VALUES
('Clásicas'),
('Exóticas'),
('Vegetarianas');

CREATE TABLE productos(
id_producto int NOT NULL AUTO_INCREMENT,
nom_producto varchar(30) NOT NULL,
precio float,
tipo_producto enum('pizzas', 'hamburguesas', 'bebidas') NOT NULL,
descripcion varchar(100),
imagen varchar(120),
id_categoriaPizza int,
PRIMARY KEY(id_producto),
CONSTRAINT fk_productos_categoriasPizzas FOREIGN KEY (id_categoriaPizza) REFERENCES categoriasPizzas (id_categoriaPizza)
);

INSERT INTO
-- insertamos primero las pizzas que llevaran asignada la categoriaPizza
	productos (id_categoriaPizza, nom_producto, descripcion, imagen, precio, tipo_producto)
VALUES
(1, 'Pizza Margarita', 'Pizza tradicional con salsa de tomate, mozzarella y albahaca', 'pizza-margarita.jpg', 10.99, 'pizzas'),
(1, 'Pizza Napolitana', 'Pizza con salsa de tomate, mozzarella, anchoas y orégano', 'pizza-napolitana.jpg', 12.99, 'pizzas'),
(2, 'Pizza Danny', 'Pizza con salsa de tomate, mozzarella, chorizo, olivas negras, champiñones', 'pizza-cuatro-quesos.jpg', 14.99, 'pizzas'),
(1, 'Pizza Barbacoa', 'Pizza con salsa barbacoa, mozzarella, pollo, cebolla y piña', 'pizza-barbacoa.jpg', 16.99, 'pizzas'),
(3, 'Pizza Vegetariana', 'Pizza con salsa de tomate, mozzarella, verduras (tomate, cebolla, champiñones, pimientos, aceitunas)', 'pizza-vegetariana.jpg', 18.99, 'pizzas');

INSERT INTO productos (nom_producto, descripcion, imagen, precio, tipo_producto)
VALUES
('Hamburguesa Clásica', 'Hamburguesa con carne de vacuno, queso, lechuga, tomate y cebolla', 'img/hamburguesa-clasica.jpg', 7.99, 'hamburguesas'),
('Hamburguesa Bacon', 'Hamburguesa con carne de vacuno, queso, bacon, lechuga, tomate y cebolla', 'img/hamburguesa-bacon.jpg', 9.99, 'hamburguesas'),
('Hamburguesa Vegetariana', 'Hamburguesa vegetal con queso, lechuga, tomate y cebolla', 'img/hamburguesa-vegetariana.jpg', 12.99, 'hamburguesas'),
('Coca Cola', 'Refresco de cola', 'img/coca-cola.jpg', 2.99, 'bebidas'),
('Fanta', 'Refresco de naranja', 'img/fanta.jpg', 2.99, 'bebidas'),
('Sprite', 'Refresco de limón', 'img/sprite.jpg', 2.99, 'bebidas'),
('Agua', 'Agua mineral', 'img/agua.jpg', 1.99, 'bebidas');

CREATE TABLE tiendas(
id_tienda int NOT NULL AUTO_INCREMENT,
direccion varchar(50) NOT NULL,
cp varchar(5) NOT NULL,
localidad varchar(15) NOT NULL,
provincia varchar(15) NOT NULL,
PRIMARY KEY (id_tienda)
);

-- CREACION DE LAS TIENDAS
INSERT INTO 
	tiendas (direccion, cp, localidad, provincia)
VALUES
('Calle Mayor, 12', '28015', 'Madrid', 'Madrid'),
('Avenida de la Paz, 34', '08036', 'Barcelona', 'Barcelona'),
('Paseo de Colón, 56', '46002', 'Valencia', 'Valencia');

CREATE TABLE empleados(
id_empleado int NOT NULL AUTO_INCREMENT,
nom_empleado varchar(50) NOT NULL,
nif varchar(9) NOT NULL,
puesto enum('cocinero', 'repartidor'),
telefono varchar(12) NOT NULL,
id_tienda int NOT NULL,
PRIMARY KEY (id_empleado),
CONSTRAINT fk_empleados_tiendas FOREIGN KEY (id_tienda) REFERENCES tiendas (id_tienda)
);
INSERT INTO empleados (nom_empleado, nif, puesto, telefono, id_tienda)
VALUES
('Juan Pérez', '23456789A', 'cocinero', '666 123 456', 2),
('María López', '97654321B', 'cocinero', '933 456 789', 2),
('Antonio García', '98764321C', 'repartidor', '963 456 789', 2),
('Pedro Sánchez', '98765431D', 'repartidor', '954 456 789', 3),
('Ana Rodríguez', '87654321E', 'cocinero', '923 456 789', 3),
('Luis González', '87654321F', 'repartidor', '912 456 789', 3),
('Carmen Gómez', '97654321G', 'cocinero', '901 456 789', 1),
('Fernando Hernández', '87654321H', 'repartidor', '890 456 789', 1);

CREATE TABLE pedidos(
id_pedido int AUTO_INCREMENT NOT NULL,
fecha_pedido datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
tipo_pedido enum('domicilio','tienda') NOT NULL,
id_producto int NOT NULL,
cantidad_productos smallint NOT NULL,
importe_total float,
id_cliente int NOT NULL,
id_empleado int NOT NULL,
id_tienda int NOT NULL,
PRIMARY KEY (id_pedido),
CONSTRAINT fk_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
CONSTRAINT fk_pedidos_productos FOREIGN KEY (id_producto) REFERENCES productos (id_producto),
CONSTRAINT fk_pedidos_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
CONSTRAINT fk_pedidos_tiendas FOREIGN KEY (id_tienda) REFERENCES tiendas (id_tienda)
);

INSERT INTO
	pedidos (tipo_pedido, id_producto, cantidad_productos, importe_total, id_cliente, id_empleado, id_tienda)
VALUES
('domicilio', 11, 2, 5.98, 1, 1, 1),
('tienda', 9, 3, 8.97, 2, 2, 2),
('domicilio', 12, 4, 11.96, 3, 2, 2),
('tienda', 10, 1, 2.99, 4, 1, 1),
('domicilio', 11, 5, 14.95, 5, 1, 1),
('tienda', 12, 6, 17.94, 6, 3, 3),
('domicilio', 9, 7, 20.93, 1, 3, 3),
('tienda', 10, 8, 23.92, 2, 1, 2);

CREATE TABLE repartos(
id_reparto int AUTO_INCREMENT NOT NULL,
fecha_reparto datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
id_empleado int NOT NULL,
id_pedido int NOT NULL,
PRIMARY KEY (id_reparto),
CONSTRAINT fk_repartos_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
CONSTRAINT fk_repartos_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
);

INSERT INTO 
	repartos(id_pedido, id_empleado)
VALUES
	(1, 3),
    (3,	6);
INSERT INTO 
	repartos(id_pedido, id_empleado, fecha_reparto)
VALUES    
    (5, 4, "2023-12-16 18:39:22"),
    (7, 8, "2023-11-15 12:23:57") ;

