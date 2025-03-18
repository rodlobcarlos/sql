-- Ejercicio 1
create user "CarlosRL"@"localhost" identified by "contraseña" account lock; 

-- Ejercicio 2
/*He tenido que salir al menu principal para iniciar sesión
con el nuevo usuario. Para ello voy a tener que desbloquear el usuario para poder entrar dentro 
del mismo.
*/
alter user "CarlosRL"@"localhost" identified by "contraseña" account unlock;

-- Ejercicio 3
create database prueba;
use prueba;

create table cliente (
id_cliente int primary key,
nombre_cliente varchar(50)
);

create table pedido (
id_pedido int primary key,
nombre_cliente varchar(50),
constraint pf_pedido foreign key(id_pedido) references cliente(id_cliente)
);

-- Ejercicio 4
insert into cliente (id_cliente, nombre_cliente) values
(1, "Carlos"),
(2, "Ramon");

insert into pedido (id_pedido, nombre_cliente) values
(1, "Carlos"),
(2, "Ramon");

-- Ejercicio 5
create view info_cruzada as
select id_pedido, nombre_cliente
from pedido;
select*from info_cruzada;

-- Ejercicio 6
create user "alumno_practica"@"localhost" identified by "contraseña1";
grant select on info_cruzada to "alumno_practica"@"localhost"; 

-- Ejercicio 7
drop user "alumno_practica"@"localhost";