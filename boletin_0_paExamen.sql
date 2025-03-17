-- Ejercicio 1
SHOW GRANTS FOR "root"@"localhost";

-- Ejercicio 2
use basededatos;
CREATE USER "administrador"@"localhost" identified by "pass_admin";
GRANT ALL PRIVILEGES ON basededatos TO 'administrador'@'localhost';

-- Ejercicio 4
SELECT user FROM mysql.user;
SELECT "administrador";

-- Ejercicio 5
SHOW GRANTS FOR "administrador"@"localhost"; 

-- Ejercicio 6
CREATE TABLE Alumno(
ID INT,
Nombre VARCHAR(20),
CONSTRAINT pk_Alumno PRIMARY KEY Alumno(ID)
);
INSERT INTO Alumno VALUES
(1, "Andrés"),
(2, "Lucas"),
(3, "Carlos"),
(4, "José"),
(5, "Pedro");

-- Ejercicio 7
CREATE TABLE Comentarios(
ID INT,
comentario VARCHAR(120),
Alumno_relacionado INT,
CONSTRAINT fk_Comentarios FOREIGN KEY (Alumno_relacionado) REFERENCES Alumno(ID)
);
INSERT INTO Comentarios(comentario) VALUES
("Este es el primer comentario"),
("Este es el segundo comentario"),
("Este es el tercer comentario");

-- Ejercicio 8
CREATE VIEW comentarios_por_alumno AS
SELECT Alumno.nombre, Comentarios.comentario
FROM Alumno, comentarios
WHERE comentarios.ID = Alumno.ID;


GRANT SHOW VIEW ON basededatos.comentarios_por_alumno TO "administrador"@"localhost";
SHOW GRANTS FOR  "administrador"@"localhost";

-- Ejercicio 9
REVOKE SHOW VIEW ON basededatos.comentarios_por_alumno FROM "administrador"@"localhost";
SHOW GRANTS FOR  "administrador"@"localhost";

-- Ejercicio 10
CREATE USER "alumno"@"localhost" IDENTIFIED BY "pass_alum"; /*No ocurre nada*/
GRANT CREATE, DELETE, UPDATE, SELECT ON basededatos TO "alumno"@"localhost";

create user "alumno" ;

-- Ejercicio 11
CREATE ROLE conexion;
CREATE ROLE consulta_de_datos;

-- Ejercicio 12
grant all privileges on *.* to "conexion" with grant option;
grant conexion to "alumno"@"localhost";

set default role conexion to "alumno"@"localhost";
show grants for "alumno"@"localhost";

-- Ejercicio 13
DROP USER "alumno";

/*DROP USER "administrador";
/*DROP TABLE Alumno;
/*DROP TABLE Comentarios;