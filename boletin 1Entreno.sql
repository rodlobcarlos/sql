create database boletin1Entreno;
use boletin1Entreno;

create user usuario_test;
drop user usuario_test;
create user usuario_test identified by "contraseña" account lock;

use academia;
grant select on alumnos to usuario_test;
set password for usuario_test = "nueva_contraseña";
rename user usuaurio_test to usuario_test2;

create view info_tabla1 as 
select alumnos.nombre , alumnos.apellido 
from alumnos; 

select*from info_tabla1;