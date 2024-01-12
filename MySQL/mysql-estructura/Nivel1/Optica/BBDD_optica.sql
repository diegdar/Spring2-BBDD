DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;

USE optica;

CREATE TABLE proveedores(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
nif char(9) NOT NULL UNIQUE,
nombre varchar(50) NOT NULL,
direccion varchar(50) NOT NULL,
telefono int,
fax int
);

INSERT INTO 
proveedores (nif, nombre, direccion, telefono, fax)
VALUES 
('A12345678', 'El Corte Inglés', 'Calle Gran Vía, 28013, Madrid', '915948800', '915948801'),
('B12345678', 'Amazon', 'Calle Princesa, 52, 28008, Madrid', '915948802', '915948803'),
('C12345678', 'MediaMarkt', 'Avenida de la Ilustración, 102, 28022, Madrid', '915948804', '915948805'),
('D12345678', 'Ikea', 'Calle Serrano, 34, 28001, Madrid', '915948806', '915948807'),
('E12345678', 'Lidl', 'Calle Alcalá, 23, 28014, Madrid', '915948808', '915948809'),
('F12345678', 'Mercadona', 'Calle Princesa, 15, 28008, Madrid', '915948810', '915948811'),
('G12345678', 'El Corte Inglés (Barcelona)', 'Calle Avinguda Diagonal, 546, 08029, Barcelona', '935948812', '935948813'),
('H12345678', 'Amazon (Barcelona)', 'Calle Pau Claris, 123, 08010, Barcelona', '935948814', '935948815'),
('I12345678', 'MediaMarkt (Barcelona)', 'Calle Gran Vía, 2, 08012, Barcelona', '935948816', '935948817');

CREATE TABLE gafas(
id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
marca varchar(20) NOT NULL, 
grad_derch float NOT NULL,
grad_izq float NOT NULL,
tipo_montura ENUM('flotante', 'pasta', 'metálica') NOT NULL,
color_montura varchar(30) NOT NULL,
color_vidrio_izq varchar(40) NOT NULL,
color_vidrio_der varchar(40) NOT NULL,
precio decimal(6,2) UNSIGNED NOT NULL,
id_proveedor int NOT NULL,
	-- no puede haber dos registros en la tabla gafas con el mismo id(gafa) y el mismo id_proveedor lo que garantiza que cada marca de gafas solo puede ser vendida por un único proveedor
UNIQUE (id, id_proveedor), 
CONSTRAINT fk_gafas_proveedores FOREIGN KEY (id_proveedor) REFERENCES proveedores (id)
);

INSERT INTO 
gafas (id, marca, grad_derch, grad_izq, tipo_montura, color_montura, color_vidrio_izq, color_vidrio_der, precio, id_proveedor)
VALUES
(1, 'Ray-Ban', 0.75, 0.5, 'flotante', 'marrón', 'gris', 'gris', 55.99, 1),
(2, 'Óptica 2000', -1.0, -0.75, 'pasta', 'negra', 'marfil', 'marfil', 39.99, 2),
(3, 'Hawkers', 0.25, 0.25, 'metálica', 'dorada', 'verde', 'verde', 44.99, 3),
(4, 'Carolina Herrera', 1.25, 0.8, 'metálica', 'plateada', 'azul', 'azul', 110.00, 4),
(5, 'Armani Exchange', -1.5, -1.25, 'flotante', 'marrón', 'negra', 'negra', 89.99, 5),
(6, 'Versace', 0.5, 0.25, 'pasta', 'negra', 'verde', 'verde', 150.00, 6);


CREATE TABLE empleados(
id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50) NOT NULL
);

INSERT INTO empleados (id, nombre)
VALUES
(1, "Martín López"),
(2, "Carmen Pérez"),
(3, "Antonio Martínez"),
(4, "Laura García"),
(5, "Luis Rodríguez"),
(6, "David García"),
(7, "María González"),
(8, "Pedro Sánchez");

CREATE TABLE clientes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(50) NULL,
  id_cliente_recomendador int UNSIGNED NULL,
  telefono int NULL,
  email VARCHAR(50) NULL,
	/* CURRENT_TIMESTAMP: introduce automaticamente la fecha y hora en que se produce el registro */
  fecha_registro_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
    
-- He creado varias inserciones para que la fecha de registro sea en momentos diferentes
INSERT INTO
clientes (id, nombre, direccion, telefono, email) 
VALUES
(1, 'Juan Pérez', 'Calle Mayor, 1', 666123456, 'juan.perez@gmail.com'),
(2, 'María López', 'Calle Fuencarral, 2', 999234567, 'maria.lopez@hotmail.com'),
(3, 'Pedro Sánchez', 'Calle Gran Vía, 3', 888345678, 'pedro.sanchez@yahoo.es'),
(4, 'Ana García', 'Calle Alcalá, 4', 777456789, 'ana.garcia@outlook.com');
INSERT INTO 
clientes (id, nombre, direccion, telefono, email, id_cliente_recomendador) 
VALUES
(5, 'Luis Fernández', 'Calle Princesa, 5', '666567890', 'luis.fernandez@gmail.com', 2),
(6, 'Carmen Gómez', 'Calle Serrano, 6', '999678901', 'carmen.gomez@hotmail.com', 1),
(7, 'José Rodríguez', 'Calle Goya, 7', '888789012', 'jose.rodriguez@yahoo.es', 1),
(8, 'Isabel Martínez', 'Calle Velázquez, 8', '777890123', 'isabel.martinez@outlook.com', 4),
(9, 'Antonio García', 'Calle Colón, 9', '666901234', 'antonio.garcia@gmail.com', 2);
    
CREATE TABLE ventas( 
id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
cantidad int UNSIGNED NOT NULL,
id_gafa int UNSIGNED NOT NULL,
id_empleado int UNSIGNED NOT NULL,
id_cliente int UNSIGNED NOT NULL,
fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fK_ventas_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id),
CONSTRAINT fk_ventas_gafas FOREIGN KEY (id_gafa) REFERENCES gafas (id),
CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

INSERT INTO ventas (cantidad, id_gafa, id_empleado, id_cliente, fecha_venta)
VALUES
(1, 1, 1, 1, '2023-12-25 12:00:00'),
(2, 5, 2, 2, '2023-12-22 13:00:00'),
(3, 3, 3, 3, '2023-12-11 14:00:00'),
(4, 4, 2, 4, '2023-12-10 15:00:00'),
(5, 5, 2, 5, '2023-11-29 16:00:00'),
(6, 6, 6, 6, '2023-10-30 17:00:00');

