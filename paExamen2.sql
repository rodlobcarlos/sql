use empresa;

-- Ejercicio 1
create user practica_vistas identified by "Usuario 123";
grant select, create, insert on banco.* to practica_vistas;
show grants for practica_vistas;

-- Ejercicio 2
create view NombreCompleto as select nombre, apellido1, apellido2 from empleado where cod_postal = 41510;
select*from NombreCompleto;

-- Ejercicio 3 
create view SalarioEmpleado as select empleado.nombre, historial_salarial.salario from empleado, historial_salarial where salario > 1000;
select*from SalarioEmpleado;

-- Ejercicio 4
create view JefeDepartamento as select nombre, dni_jefe from departamento;
select*from JefeDepartamento;

-- Ejercicio 5
create view EmpleadoUni as select empleado.nombre, concat(empleado.apellido1, " ", empleado.apellido2) as Apellidos, informacion_uni.universidad from empleado, informaion_uni;
select*from Empleado;

-- Ejercicio 6
create user usario_vistas identified by "usuario123";
grant select on NombreCompleto to usuario_vistas;
grant select on SalarioEmpleado to usuario_vistas;
grant select on JefeDepartamento to usuario_vistas;
grant select on EmpleadoUni to usuario_vistas;