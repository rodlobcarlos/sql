create database basededatos;

create table historial_salarial(
DNI_empl char(9),
Salario decimal(6,2),
Fecha_inicio date,
Fecha_fin date
);

create table empleado(
DNI char(9),
Nombre varchar(20),
Apellido1 varchar(20),
Apellido2 varchar(20),
Direccion varchar(20),
Ciudad varchar(20),
Municipio varchar(20),
Cod_postal char(5),
Sexo char(1),
Fecha_nac date
);

create table universidad(
Cod_univ int,
Nombre varchar(30),
Ciudad varchar(20),
Cod_postal char(5)
);