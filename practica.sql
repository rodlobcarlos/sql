/*
Crea un usuario con tu nombre y busca la forma de que por defecto tu cuenta esté
 inactiva.
 
 create user "Carlos"@"localhost" identified by "contraseña" account lock;

 */
  create user "Carlos"@"localhost" identified by "contraseña" account lock;


/*
Inicia sesión con tu nuevo usuario y cambia tu contraseña.

alter user "Carlos"@"localhost" identified by "contraseña" account unlock;
alter user "Carlos"@"localhost" identified by "contraseña2"
*/

/*
Crea una base de datos llamada prueba práctica e introduce en ella dos tablas
 relacionadas a través de una foreign key, por ejemplo, cliente- producto.
*/

grant create on *.* to "Carlos"@"localhost";
FLUSH PRIVILEGES;


create database prueba_práctica;
use prueba_práctica