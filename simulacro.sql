create database simulacro;
use simulacro;

create table proveedor(
Id int auto_increment,
CIF char(15) unique not null,
Nombre char(20) not null,
Pais varchar(20),
URL varchar(100) default "www.default.es",
constraint pk_proveedor primary key(Id)
);

create table booking( 
Localizador char(6) not null,
Fecha_cheking date,
Precio_coste decimal(10,2),
Precio_venta decimal(2),
Id_proveedor int,
Cod_agente int,
constraint check (Precio_venta > Precio_coste),
constraint pk_booking primary key(Localizador)
);

create table agente(
Cod_agente int,
Nombre varchar(20) not null,
Apellidos varchar(20),
Telefono char(9),
Tipo varchar(1) constraint check(tipo in ('C', 'N')),
constraint pk_agente primary key(Cod_agente)
);

insert into proveedor values
(1, "R5502108", "jet2Travel", "España", "www.default.es"),
(2, "D76506849", "Corendon", "Turquía", "www.default.es");

insert into booking values
("ZN5DESC", "2022/10/19", "150.12", "299.90", 1, 1),
("SF3XSR", "2022/12/30", "194.64", "275.00", 1, 2),
("XL14LH", "2023/04/06", "701.00", "881.50", 2, 1);

insert into agente values
(1, "Eduardo", "Ruiz Salvador", "953 63 93 37", "C"),
(2, "Elisa", "Cáceres Pulido", "971 40 87 99", "N");

alter table booking modify Localizador char(7);
alter table booking modify Precio_venta decimal(10,2);
alter table agente modify Telefono char(12);
update agente set Cod_agente = 7 where Cod_agente = 2 and Nombre = "Elisa" and Apellidos = "Cáceres Pulido";

delete from proveedor where Id = 2;
delete from booking where Id_proveedor = 12345 and Localizador = 'ABC123';

alter table agente modify Tipo varchar(1) check(tipo = ('C','N', 'ST'));

drop table proveedor;
drop table booking;
drop table agente;