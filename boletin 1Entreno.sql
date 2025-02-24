create database boletin1Entreno;
use boletin1Entreno;

create user usuario_test;
drop user usuario_test;
create user "usuario_test"@"localhost" identified by "contraseña" account lock;

use academia;
grant select on alumnos to usuario_test;
set password for usuario_test = "nueva_contraseña";
rename user usuario_test to usuario_test2;

create view info_tabla1 as 
select alumnos.nombre , alumnos.apellido 
from alumnos; 

select*from info_tabla1;

create user "consulta_info"@"localhost" identified by "contraseña2";
grant select on info_tabla1 to "consulta_info"@"localhost";
select*from info_tabla1;

revoke all privileges on database boletin1Entreno from usuario_test2;

grant all privileges on database boletin1Entreno to usuario_test2;

select user from mysql.user;