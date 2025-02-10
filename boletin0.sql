create database boletin0;
use boletin0;

create table alumnos(
Nombre varchar(20),
Apellido1 varchar(20),
Apellido2 varchar(20),
DNI char(9),
Direccion varchar(20),
Sexo varchar(10),
Fecha_nacimiento date,
Curso int not null,
constraint pk_alumnos primary key(DNI),
constraint check_sexo check (sexo in ("M", "H")),
constraint fk_alumnos foreign key(Curso) references cursos(Cod_curso)
);

create table cursos(
Nombre_curso varchar(20) unique,
Cod_curso int not null unique,
DNI_profesor char(9),
Maximo_alumnos varchar(35),
Fecha_inicio date,
Fecha_fin date,
Num_horas int not null,
constraint pk_cursos primary key(Cod_curso),
constraint check_fecha check(Fecha_inicio < Fecha_fin),
constraint fk_cursos foreign key(DNI_profesor) references profesores(DNI)
);

create table profesores(
Nombre varchar(20) unique,
Apellido1 varchar(20),
Apellido2 varchar(20),
DNI char(9) not null unique,
Direccion varchar(20),
Titulo char(20),
Gana int not null,
constraint pk_profesores primary key(DNI)
);

insert into alumnos values
("Lucas", "Manilava", "López", "23755174S", "Alhamar, 4", "H", "1970/01/01", 1),
("José", "Llorente", "Escuato", "36107620","Jarcha, 5", "H", "1990/02/03", 1);
insert into alumnos(NOmbre, Apellido1, Apellido2, DNI, Direccion, Sexo, Curso)values
("Antonia", "Santos", "Alcántara", "03818863N", "Maniquí, 21", "M", 2);
insert into alumnos(NOmbre, Apellido1, Apellido2, DNI, Direccion, Curso)values
("Manuel", "Baños", "Rioseco", "33577501P", "Jurel,2", 2);

insert into cursos values
("Inglés básico", 1, "50427865C", "15", "23/01/01", "23/10/01", "120");
insert into cursos(Nombre_curso, Cod_curso, DNI_profesor, Fecha_inicio, Num_horas)values
("Adm_Linux", 2, "76978084M", "23/02/03", 80);

insert into profesores values
("Juan", "Arcos", "López", "76978084M", "Puerta negra, 4", "Ing_Informático", "7500"),
("María", "Olivia", "Rubio", "50427865C", "Juan Alfonso, 23", "Lda_Fil_Inglesa", "4900"),
("Sara", "Lemes", "Sancho", "99857929W", "Calle Viento, 1", "magisterio", "6100");

alter table profesores add column edadalumnos int;
alter table profesores modify edad check(edad >18, edad < 65);