SHOW GRANTS FOR "root"@"localhost";

use basededatos;
CREATE USER "administrador";
CREATE USER "administrador"@"localhost" identified by "pass_admin";
GRANT ALL PRIVILEGES ON basededatos TO 'administrador'@'localhost';

SELECT user FROM mysql.user;
SELECT "administrador";

SHOW GRANTS FOR "administrador"@"localhost"; 

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

CREATE VIEW comentarios_por_alumno AS
SELECT Alumno.nombre, Comentarios.comentario
FROM Alumno, comentarios
WHERE comentarios.ID = Alumno.ID;

GRANT SHOW VIEW ON basededatos.comentarios_por_alumno TO "administrador"@"localhost";
SHOW GRANTS FOR  "administrador"@"localhost";

REVOKE SHOW VIEW ON basededatos.comentarios_por_alumno FROM "administrador"@"localhost";
SHOW GRANTS FOR  "administrador"@"localhost";

CREATE USER "alumno"@"localhost" IDENTIFIED BY "pass_alum"; /*No pasa nada*/
GRANT CREATE, DELETE, UPDATE, SELECT ON basededatos TO "alumno"@"localhost";

create user "alumno" ;

CREATE ROLE conexion;
CREATE ROLE consulta_de_datos;

grant all privileges on *.* to "conexion" with grant option;
grant conexion to "alumno"@"localhost";

set default role conexion to "alumno"@"localhost";
show grants for "alumno"@"localhost";

DROP USER "alumno";

/*DROP USER "administrador";
/*DROP TABLE Alumno;
/*DROP TABLE Comentarios;