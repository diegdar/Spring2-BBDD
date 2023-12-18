CREATE DATABASE optica;

USE optica;

CREATE TABLE proveedores(
nif_proveedor varchar(9) NOT NULL,
nombre_proveedor varchar(50) NOT NULL,
direccion_proveedor varchar(50) NOT NULL,
telf_proveedor varchar (15),
fax_proveedor varchar(15),
PRIMARY KEY (nif_proveedor)  
);

INSERT INTO 
proveedores (nif_proveedor, nombre_proveedor, direccion_proveedor, telf_proveedor, fax_proveedor)
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
id_gafa int NOT NULL AUTO_INCREMENT,
marca_gafa varchar(20) NOT NULL, 
graduacion float(5,2)NOT NULL,
tipo_montura varchar(30) NOT NULL,
color_montura varchar(30) NOT NULL,
color_vidrio varchar(30) NOT NULL,
precio smallint NOT NULL,
nif_proveedor varchar(15) NOT NULL,
PRIMARY KEY (id_gafa),
CONSTRAINT fk_pedidos_proveedores FOREIGN KEY (nif_proveedor) REFERENCES proveedores (nif_proveedor)
);

INSERT INTO 
gafas (marca_gafa, graduacion, tipo_montura, color_montura, color_vidrio, precio, nif_proveedor)
VALUES
('Ray-Ban', 4.00, 'Metálica', 'Dorado', 'Verde', 120, 'I12345678'),
('Oakley', 5.50, 'Plástica', 'Negro', 'Marrón', 150, 'E12345678'),
('Dolce & Gabbana', 6.00, 'Metálica', 'Rojo', 'Azul', 180, 'B12345678'),
('Versace', 7.50, 'Plástica', 'Blanco', 'Rosa', 210, 'I12345678'),
('Armani', 8.00, 'Metálica', 'Plata', 'Cristalino', 240, 'E12345678'),
('Prada', 9.50, 'Plástica', 'Negro mate', 'Gris', 270, 'B12345678'),
('Chanel', 10.00, 'Metálica', 'Oro rosa', 'Violeta', 300, 'I12345678');

CREATE TABLE empleados(
id_empleado int NOT NULL AUTO_INCREMENT,
nombre_empleado varchar(50) NOT NULL,
PRIMARY KEY (id_empleado)
);

INSERT INTO 
	empleados (id_empleado, nombre_empleado)
VALUES
	(1, 'Juan Pérez'),
	(2, 'María López'),
	(3, 'Pedro Sánchez'),
	(4, 'Ana García'),
	(5, 'Luis Fernández'),
	(6, 'Carmen Gómez'),
	(7, 'José Rodríguez'),
	(8, 'Isabel Martínez');

CREATE TABLE optica.clientes (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre_cliente VARCHAR(50) NOT NULL,
  direccion_cliente VARCHAR(50) NULL,
  telf_cliente VARCHAR(15) NULL,
  email VARCHAR(50) NULL,
  cliente_recomendo VARCHAR(45) NULL,
	-- CURRENT_TIMESTAMP: introduce automaticamente la fecha y hora en que se produce el registro 
  fecha_registro_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_cliente));

-- He creado varias inserciones para que la fecha de venta se registre en momentos diferentes
INSERT INTO 
clientes (id_cliente, nombre_cliente, direccion_cliente, telf_cliente, email, cliente_recomendo) 
VALUES
(1, 'Juan Pérez', 'Calle Mayor, 1', '666 123 456', 'juan.perez@gmail.com', NULL),
(2, 'María López', 'Calle Fuencarral, 2', '999 234 567', 'maria.lopez@hotmail.com', 1),
(3, 'Pedro Sánchez', 'Calle Gran Vía, 3', '888 345 678', 'pedro.sanchez@yahoo.es', NULL),
(4, 'Ana García', 'Calle Alcalá, 4', '777 456 789', 'ana.garcia@outlook.com', 2);
INSERT INTO 
	clientes (id_cliente, nombre_cliente, direccion_cliente, telf_cliente, email, cliente_recomendo) 
VALUES
(5, 'Luis Fernández', 'Calle Princesa, 5', '666 567 890', 'luis.fernandez@gmail.com', 3),
(6, 'Carmen Gómez', 'Calle Serrano, 6', '999 678 901', 'carmen.gomez@hotmail.com', 4),
(7, 'José Rodríguez', 'Calle Goya, 7', '888 789 012', 'jose.rodriguez@yahoo.es', 5),
(8, 'Isabel Martínez', 'Calle Velázquez, 8', '777 890 123', 'isabel.martinez@outlook.com', 6),
(9, 'Antonio García', 'Calle Colón, 9', '666 901 234', 'antonio.garcia@gmail.com', 7);
INSERT INTO 
	clientes (id_cliente, nombre_cliente, direccion_cliente, telf_cliente, email, cliente_recomendo) 
VALUES
(10, 'Laura López', 'Calle Serrano, 10', '999 012 345', 'laura.lopez@hotmail.com', 8),
(11, 'David Fernández', 'Calle Goya, 11', '888 123 456', 'david.fernandez@yahoo.es', 9),
(12, 'Marta Gómez', 'Calle Velázquez, 12', '777 456 789', 'marta.gomez@outlook.com', 10);
INSERT INTO 
	clientes (id_cliente, nombre_cliente, direccion_cliente, telf_cliente, email, cliente_recomendo) 
VALUES
(13, 'Pedro Rodríguez', 'Calle Colón, 13', '666 789 012', 'pedro.rodriguez@gmail.com', 11),
(14, 'Ana Martínez', 'Calle Serrano, 14', '999 890 123', 'ana.martinez@hotmail.com', 12);
-- ----------------------------------
    
CREATE TABLE ventas( 
id_venta int NOT NULL AUTO_INCREMENT,
id_gafa int NOT NULL,
id_empleado int NOT NULL,
id_cliente int NOT NULL,
fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id_venta),
CONSTRAINT fK_ventas_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
CONSTRAINT fk_ventas_gafas FOREIGN KEY (id_gafa) REFERENCES gafas (id_gafa),
CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- He creado varias inserciones para que la fecha de venta se registre en momentos diferentes
INSERT INTO 
	ventas (id_gafa, id_empleado, id_cliente) 
VALUES
	(5, 4, 3),
	(6, 5, 2),
	(1, 4, 3);
    
INSERT INTO 
ventas (id_gafa, id_empleado, id_cliente) 
VALUES
	(3, 7, 6),
	(2, 4, 2),
	(5, 5, 3);
    
INSERT INTO 
	ventas (id_gafa, id_empleado, id_cliente) 
VALUES  
	(2, 5, 2),
	(6, 7, 7);
INSERT INTO 
	ventas (id_gafa, id_empleado, id_cliente, fecha_venta) 
VALUES
	(5, 4, 3, "2022-10-10");
    
-- --------------------------