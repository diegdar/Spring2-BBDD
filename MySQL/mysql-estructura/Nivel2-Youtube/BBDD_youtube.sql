DROP DATABASE IF EXISTS youtube;

CREATE DATABASE youtube;
USE youtube;

CREATE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    nombreUsuario VARCHAR(255) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    sexo ENUM("hombre", "mujer", "No definido") NOT NULL,
    pais VARCHAR(255) NOT NULL,
    codigoPostal INT
);

CREATE TABLE videos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    tamano INT NOT NULL,
    nomVideo VARCHAR(255) NOT NULL,
    duracion INT NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    numReproducciones INT NOT NULL,
    numLikes INT NOT NULL,
    numDislikes INT NOT NULL,
    estado ENUM("publico","oculto","privado") NOT NULL,
    fechaCreacion DATETIME NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT fk_videos_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
);

CREATE TABLE etiquetas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomEtiqueta VARCHAR(150) NOT NULL
);

CREATE TABLE videos_etiquetas(
    video_id INT NOT NULL,
    etiqueta_id INT NOT NULL,
    CONSTRAINT fk_videosEtiquetas_videos FOREIGN KEY (video_id) REFERENCES videos (id),
    CONSTRAINT fk_videosEtiquetas_etiquetas FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(id)
);

CREATE TABLE canales (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuarioDuenoCanal_id INT NOT NULL,
    nomCanal VARCHAR(150) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fechaCreacion DATETIME NOT NULL,
    CONSTRAINT fk_canales_usuarios FOREIGN KEY (usuarioDuenoCanal_id) REFERENCES usuarios (id)
);

CREATE TABLE suscripciones (
    usuarioSuscriptor_id INT NOT NULL,
    canal_id INT NOT NULL,
    PRIMARY KEY (usuarioSuscriptor_id, canal_id),
    CONSTRAINT fk_suscripciones_usuarios FOREIGN KEY (usuarioSuscriptor_id) REFERENCES usuarios (id),
    CONSTRAINT fk_suscripciones_canales FOREIGN KEY (canal_id) REFERENCES canales (id)
);

CREATE TABLE playlists (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  usuarioCreador_id INT NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado ENUM("publica", "privada"),
  CONSTRAINT fk_playlists_usuarios FOREIGN KEY (usuarioCreador_id) REFERENCES usuarios (id)
);

CREATE TABLE videos_playlist(
    video_id INT NOT NULL,
    playlist_id INT NOT NULL,
    CONSTRAINT fk_videosPlaylist_videos FOREIGN KEY (video_id) REFERENCES videos (id),
    CONSTRAINT fk_videosPlaylist_playlists FOREIGN KEY (playlist_id) REFERENCES playlists (id)
);

CREATE TABLE likes_dislikes_videos (
    video_id INT NOT NULL,
    usuarioReacciona_id INT NOT NULL,
    reaccionVideo ENUM("like", "dislike") NOT NULL,
    fechaReaccion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (video_id, usuarioReacciona_id),
    FOREIGN KEY (video_id) REFERENCES videos (id),
    FOREIGN KEY (usuarioReacciona_id) REFERENCES usuarios (id)
);

CREATE TABLE comentarios (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  texto VARCHAR(255) NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  usuarioCreador_id INT NOT NULL,
  video_id INT NOT NULL,
  FOREIGN KEY (video_id) REFERENCES videos (id),
  FOREIGN KEY (usuarioCreador_id) REFERENCES usuarios (id)
);

CREATE TABLE reaccion_comentarios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comentario_id INT NOT NULL,
    usuarioReacciona_id INT NOT NULL,
    reaccionComentario ENUM("like", "dislike") NOT NULL,
    fechaReaccion DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reaccionComentarios_comentarios FOREIGN KEY (comentario_id) REFERENCES comentarios (id),
    CONSTRAINT fk_reaccionComentarios_usuarios FOREIGN KEY (usuarioReacciona_id) REFERENCES Usuarios(id)
);

INSERT INTO usuarios (email, password, nombreUsuario, fechaNacimiento, sexo, pais, codigoPostal)
VALUES
    ('juan@gmail.com', 'contraseña123', 'Juan Pérez', '1990-05-15', 'hombre', 'España', 28001),
    ('maria@gmail.com', 'contraseña456', 'María López', '1995-09-20', 'mujer', 'México', 01010),
    ('carlos@gmail.com', 'contraseña789', 'Carlos Rodríguez', '1988-03-10', 'hombre', 'Argentina', 1001),
    ('laura@gmail.com', 'contraseñaabc', 'Laura Gómez', '1992-11-30', 'mujer', 'Colombia', 110231);

INSERT INTO videos (titulo, descripcion, tamano, nomVideo, duracion, thumbnail, numReproducciones, numLikes, numDislikes, estado, fechaCreacion, usuario_id)
VALUES
    ('Viaje a la playa', 'Un video de mis vacaciones en la playa', 1024, 'viaje playa', 300, 'thumbnail1.jpg', 100, 50, 10, 'oculto', '2022-06-15 14:30:00', 1),
    ('Receta de cocina', 'Aprende a cocinar una deliciosa receta', 2048, 'receta cocina', 600, 'thumbnail2.jpg', 200, 100, 20, 'privado', '2022-06-20 10:45:00', 2),
    ('Tutorial de programación', 'Aprende a programar en Python', 512, 'tutorial programacion', 400, 'thumbnail3.jpg', 50, 20, 5, 'publico', '2022-06-25 16:15:00', 3),
    ('Consejos de belleza', 'Descubre los mejores consejos de belleza', 4096, 'consejos belleza', 900, 'thumbnail4.jpg', 300, 150, 30, 'publico', '2022-06-30 12:00:00', 4);

INSERT INTO etiquetas (nomEtiqueta)
VALUES
    ('viajes'),
    ('cocina'),
    ('programación'),
    ('belleza');

INSERT INTO videos_etiquetas (video_id, etiqueta_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO canales (usuarioDuenoCanal_id, nomCanal, descripcion, fechaCreacion)
VALUES
    (1, 'Canal de Viajes', 'Descubre los mejores destinos para viajar', '2022-06-15 14:30:00'),
    (2, 'Canal de Cocina', 'Recetas fáciles y deliciosas', '2022-06-20 10:45:00'),
    (3, 'Canal de Programación', 'Aprende a programar desde cero', '2022-06-25 16:15:00'),
    (4, 'Canal de Belleza', 'Consejos y tutoriales de belleza', '2022-06-30 12:00:00');

INSERT INTO suscripciones (usuarioSuscriptor_id, canal_id)
VALUES
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 1);

INSERT INTO playlists (usuarioCreador_id, nombre, estado)
VALUES
    (1, 'Mis Viajes', 'publica'),
    (2, 'Recetas Favoritas', 'publica'),
    (3, 'Mis Proyectos', 'privada'),
    (4, 'Tips de Belleza', 'privada');

INSERT INTO videos_playlist (video_id, playlist_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO likes_dislikes_videos (video_id, usuarioReacciona_id, reaccionVideo, fechaReaccion)
VALUES
    (1, 2, 'like', '2022-06-15 14:45:00'),
    (2, 3, 'dislike', '2022-06-21 11:00:00'),
    (3, 4, 'like', '2022-06-26 17:30:00'),
    (4, 1, 'dislike', '2022-07-01 13:15:00');

INSERT INTO comentarios (texto, fecha, usuarioCreador_id, video_id)
VALUES
    ('¡Qué hermoso lugar!', '2022-06-15 15:00:00', 2, 1),
    ('La receta se ve deliciosa', '2022-06-21 11:30:00', 3, 2),
    ('Muy útil el tutorial, gracias', '2022-06-26 18:00:00', 4, 3),
    ('Excelentes consejos, los pondré en práctica', '2022-07-01 13:30:00', 1, 4);

INSERT INTO reaccion_comentarios (comentario_id, usuarioReacciona_id, reaccionComentario, fechaReaccion)
VALUES
    (1, 3, 'like', '2022-06-15 15:15:00'),
    (2, 4, 'dislike', '2022-06-21 12:00:00'),
    (3, 1, 'like', '2022-06-26 18:30:00'),
    (4, 2, 'dislike', '2022-07-01 14:00:00');