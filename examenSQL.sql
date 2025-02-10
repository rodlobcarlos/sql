create database rodriguez_carlos;
use rodriguez_carlos;

create table jugador(
id int auto_increment,
dni char(15),
nombre varchar(20) not null,
apellidos varchar(20),
telefono char(12),
entrenador varchar(20),
constraint pk_jugador primary key(id)
/*constraint pf_jugador foreign key(nombre) references reserva(fecha)*/
);

create table reserva(
pista char(20),
jugador varchar(20),
fecha date,
precio decimal,
observaciones varchar(20),
constraint pk_reserva primary key(fecha)
/*constraint pf_reserva foreign key(jugador) references jugador(id)*/
/*constraint pf_reserva foreign key(pista) references pista(id)*/
);

create table pareja(
id int auto_increment,
jugador1 varchar(20),
jugador2 varchar(20),
fecha_creacion date,
nombre varchar(20) not null unique,
constraint pk_pareja primary key(id)
/*constraint pf_paraja foreign key(fecha) references partido(fecha)*/
/*constraint pf_pareja foreign key(nombre) references partido(valoracion)*/
);

create table partido(
pareja1 varchar(20),
pareja2 varchar(20),
fecha date,
puntos_pareja1 int,
puntos_pareja2 int,
valoracion varchar(20),
constraint pk_partido primary key(fecha)
);

create table estado_pista(
id int auto_increment,
operativa varchar(20),
fecha_ult_revision date,
pista char(20),
constraint pk_estado primary key(id)
);

create table pista(
id int auto_increment,
letra varchar(1),
tipo varchar(20) default "no disponible",
tipo_iluminacion varchar(20),
constraint pk_pista primary key(id)
/*constraint pf_pista foreign key(tipo) references estado_pista(operativa)*/
);

alter table pista modify tipo_iluminacion varchar(20) check(tipo_iluminacion = ("500LM", "1000LM"));
alter table reserva add check(precio <100);
alter table reserva modify observaciones varchar(500);
alter table partido modify valoracion varchar(500);
alter table pareja modify jugador1 varchar(20) unique;
alter table pareja modify jugador2 varchar(20) unique;
alter table partido modify pareja1 varchar(20) not null;
alter table partido modify pareja2 varchar(20) not null;
alter table partido add check(puntos_pareja1 > 1);
alter table partido add check(puntos_pareja2 > 1);

insert into jugador(nombre) values
("Enrrique");
insert into jugador(nombre) values
("Pablo");
insert into jugador(nombre) values
("Estafanía");
insert into jugador(nombre) values
("Susuna");

insert into pareja(nombre) values
("Viso Team");
insert into pareja(nombre) values
("Mairena Team");

insert into reserva(fecha, observaciones) values
("2025/01/14", "gana Mairena Team");

insert into jugador(nombre) values
("Gloria");

insert into reserva(jugador) values
("Gloria");

alter table reserva modify pista varchar(1);
insert into reserva(pista) values
("A");

insert into reserva(precio) values
("10.2");

alter table estado_pista add column url_imagen_pista varchar(150) default "www.url.com/pista_default";