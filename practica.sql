/*
Crea un usuario con tu nombre y busca la forma de que por defecto tu cuenta esté
 inactiva.
 */
  create user "carlos"@"localhost" identified by "contraseña" account lock;


/*
Inicia sesión con tu nuevo usuario y cambia tu contraseña.
*/
alter user "carlos"@"localhost" identified by "contraseña" account unlock;
alter user "carlos"@"localhost" identified by "contraseña1"

/*
Crea una base de datos llamada prueba práctica e introduce en ella dos tablas
 relacionadas a través de una foreign key, por ejemplo, cliente- producto.
*/;

create database prueba_practica;
use prueba_practica;

create table cliente (
id_cliente int primary key,
nombre_cliente varchar(50)
);

create table pedido (
id_cliente int ,
id_producto int
);

create table producto (
id_producto int primary key,
id_cliente int,
nombre_producto varchar(50),
constraint pf_producto foreign key(id_producto) references cliente(id_cliente)
);
drop table producto;

insert into cliente values
(1, "Carlos");

insert into producto values
(2, "Coche");

create view info_cruzada as
select id_cliente, id_producto 
from producto;
select*from info_cruzada;

create user "becario"@"localhost" identified by "becario1";
grant select on info_cruzada to "becario1";

drop user "becario"@"localhost";