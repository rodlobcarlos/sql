 create database boletin_2;
use boletin_2;

create table historial_salarial (
	DNI_empl char(9),
    salario decimal(6,2),
    fecha_inicio date,
    fecha_fin date,
    constraint pk_historial_salarial primary key(DNI_empl),
    constraint fk_historial_salarial foreign key(salario)
);							
create table univesidad (
	cod_univ int,
	nombre varchar(30) not null,
	ciudad varchar(20),
	cod_postal char(5),
    constraint pk_universidad primary key(cod_univ),
	constraint fk_universidad foreign key(nombre)
);
create table estudio (
	DNI_empl char(9),
	cod_univ int(5),
    fecha_fin date,
	titulo varchar(30),
    especialidad varchar(30),
    	constraint fk_estudio foreign key(cod_univ)
);
create table trabajo (
	cod_trabajo int unique auto_increment,
    nombre varchar(20) not null,
    salario_max decimal(6,2) unique,
    salario_min decimal(6,2) unique,
    constraint pk_trabajo primary key(cod_trabajo),
	constraint fk_trabajo foreign key(nombre)
);
create table departamento (
	cod_dpto int unique auto_increment,
    nombre varchar(30) unique, 
    DNI_jefe char(9),
    presupuesto decimal(6,2),
	constraint departamento primary key(cod_dpto),
	constraint fk_departamento foreign key(nombre)
);
create table historial_laboral (
	DNI_empl char(9),
    cod_trabajo int,
    cod_dpto int,
    fecha_inicio date,
    fecha_fin date,
    DNI_super char(9),
	constraint historial_laboral primary key(DNI_empl),
    constraint fk_historial_laboral foreign key(cod_trabajo)
);
create table empleado (
	DNI_empl char(9),
	nombre varchar(30),
	apellido_1 varchar(20),
	apellido_2 varchar(20),
    direccion varchar(20),
    ciudad varchar(20),
    municipio varchar(20),
    cod_postal char(1),
    sexo char(1),
    fecha_nac date,
    constraint empleado primary key(DNI_empl),
    constraint valor_sexo check('M' 'H' 'm' 'h'),
	constraint fk_empleado foreign key(nombre)
);

ALTER TABLE `boletin_2`.`empleado` 
CHANGE COLUMN `nombre` `nombre` VARCHAR(30) NOT NULL

-- Ejercicio 2 --
insert into empleados()
values();