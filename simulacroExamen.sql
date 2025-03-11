use centro_educativo;

-- Ejercicio 1
select*from MATRICULADO
where Nota1 = (Nota2 + Nota3);

-- Ejericicio 2
select*from MATRI CULADO
where ((Nota1 + Nota2 + Nota3) / 3) > 8;

-- Ejercicio 3
select*from ALUMNO 
where Nacido_en = 2;

-- Ejercicio 4
SELECT *, CONCAT('Quedan ',
DATEDIFF(CONCAT('2025-', MONTH(fecha_nac), '-', DAY(fecha_nac)), CURDATE()),
' días para el cumpleaños de ', nombre) AS recordatorio FROM alumno;

-- Ejercicio 5
select Nombre, Apellidos 
from PROFESOR
where DNI %2 = 0; 

-- Ejercicio 6
SELECT nombre, apellidos, dni,
CONCAT( UPPER(LEFT(nombre, 1)), -- Primera letra del nombre 
UPPER(LEFT(apellidos, 3)),  -- Tres primeras letras del segundo apellido
RIGHT(LEFT(dni, 8), 3) -- Tres últimas cifras del DNI (sin la letra)
) AS identificador_seneca
FROM alumno;

-- Ejercicio 7
select*from PROFESOR
where Nacido_en = 1 and (Nombre like "%A%" or Apellidos like "%A%");

-- Ejercicio 8
select ID_ASIG, ID_PROF
from IMPARTE
where ID_PROF %2 = 0;

-- Ejercicio 9
select*from PROVINCIA order by Nombre desc limit 1;

-- Ejercicio 10 // POR HACER

-- Ejercicio 11
select max(Nota1 + Nota2 + Nota3) / 3 as Record_de_clasificacion
from MATRICULADO;