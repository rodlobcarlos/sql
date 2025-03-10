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
from ALUMNO
where DNI %2 = 0;

-- Ejercicio 6
select 