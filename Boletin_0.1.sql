-- Crear la base de datos
CREATE DATABASE academia;
USE academia;
-- Crear la tabla de alumnos
CREATE TABLE alumnos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50),
 apellido VARCHAR(50)
);
-- Crear la tabla de asignaturas
CREATE TABLE asignaturas (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100)
);
-- Crear la tabla de profesores
CREATE TABLE profesores (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50),
 apellido VARCHAR(50)
);
-- Crear la tabla de matrículas
CREATE TABLE matriculas (
 id INT AUTO_INCREMENT PRIMARY KEY,
 alumno_id INT,
 asignatura_id INT,
 horas INT,
 FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
 FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id)
);
-- Crear la tabla de asignaturas_profesores
CREATE TABLE asignaturas_profesores (
 id INT AUTO_INCREMENT PRIMARY KEY,
 asignatura_id INT,
 profesor_id INT,
 FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id),
 FOREIGN KEY (profesor_id) REFERENCES profesores(id)
);
-- Insertar datos de prueba
INSERT INTO alumnos (nombre, apellido) VALUES
('Juan', 'Pérez'),
('María', 'López'),
('Carlos', 'Gómez');
INSERT INTO asignaturas (nombre) VALUES
('Matemáticas'),
('Historia'),
('Física');
INSERT INTO profesores (nombre, apellido) VALUES
('Ana', 'Martínez'),
('Luis', 'Fernández');
INSERT INTO matriculas (alumno_id, asignatura_id, horas) VALUES
(1, 1, 120),
(2, 2, 90),
(3, 3, 110);
INSERT INTO asignaturas_profesores (asignatura_id, profesor_id) VALUES
(1, 1),
(2, 2),
(3, 1);