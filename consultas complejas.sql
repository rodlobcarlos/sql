-- DROP DATABASE IF EXISTS TALLER;
CREATE DATABASE TALLER;
USE TALLER;

CREATE TABLE proveedor (
	codpro VARCHAR(3),
	nompro VARCHAR(30) NOT NULL,
	status INT,
	ciudad VARCHAR(15),
	constraint codpro_pk PRIMARY KEY (codpro),
	CONSTRAINT status_chk CHECK (status >=1 AND status <=10)
);

CREATE TABLE pieza (
	codpie VARCHAR(3),
	nompie VARCHAR(10) NOT NULL,
	color VARCHAR(10),
	peso DECIMAL(5,2),
	ciudad VARCHAR(15),
	CONSTRAINT codpie_pk PRIMARY KEY (codpie),
	CONSTRAINT peso_chk CHECK (peso > 0 AND peso <= 100)
); 

CREATE TABLE proyecto (
codpj VARCHAR(3),
nompj VARCHAR(20) NOT NULL,
ciudad VARCHAR(15),
CONSTRAINT codpj_pk PRIMARY KEY (codpj)
);

CREATE TABLE ventas (
codpro VARCHAR(3),
codpie VARCHAR(3),
codpj VARCHAR(3),
cantidad INT(4),
CONSTRAINT clave_pk PRIMARY KEY (codpro,codpie,codpj),
CONSTRAINT codpro_fk FOREIGN KEY (codpro) REFERENCES proveedor(codpro),
CONSTRAINT codpie_fk FOREIGN KEY (codpie) REFERENCES pieza(codpie),
CONSTRAINT codpj_fk FOREIGN KEY (codpj) REFERENCES proyecto(codpj)
);

INSERT INTO proveedor 
VALUES ('S1', 'Jose Fernandez', 2, 'Madrid');

INSERT INTO proveedor 
VALUES ('S2', 'Manuel Vidal', 1, 'Londres');

INSERT INTO proveedor 
VALUES ('S3', 'Luisa Gomez', 3, 'Lisboa');

INSERT INTO proveedor 
VALUES ('S4', 'Pedro Sanchez', 4, 'Paris');

INSERT INTO proveedor 
VALUES ('S5', 'Maria Reyes', 5, 'Roma');

INSERT INTO pieza
VALUES ('P1', 'Tuerca', 'Gris', 2.5, 'Madrid');

INSERT INTO pieza
VALUES ('P2', 'Tornillo', 'Rojo', 1.25, 'Paris');

INSERT INTO pieza
VALUES ('P3', 'Arandela', 'Blanco', 3, 'Londres');

INSERT INTO pieza
VALUES ('P4', 'Clavo', 'Gris', 5.5, 'Lisboa');

INSERT INTO pieza
VALUES ('P5', 'Alcataya', 'Blanco', 10, 'Roma');

INSERT INTO proyecto
VALUES ('J1', 'Proyecto 1', 'Londres');

INSERT INTO proyecto
VALUES ('J2', 'Proyecto 2', 'Londres');

INSERT INTO proyecto
VALUES ('J3', 'Proyecto 3', 'Paris');

INSERT INTO proyecto
VALUES ('J4', 'Proyecto 4', 'Roma');


INSERT INTO ventas
VALUES ('S1', 'P1', 'J2', 100);

INSERT INTO ventas
VALUES ('S1', 'P1', 'J3', 500);

INSERT INTO ventas
VALUES ('S1', 'P2', 'J1', 200);

INSERT INTO ventas
VALUES ('S2', 'P2', 'J2', 15);

INSERT INTO ventas
VALUES ('S4', 'P2', 'J3', 1700);

INSERT INTO ventas
VALUES ('S1', 'P3', 'J1', 800);

INSERT INTO ventas
VALUES ('S5', 'P3', 'J2', 30);

INSERT INTO ventas
VALUES ('S1', 'P4', 'J1', 10);

INSERT INTO ventas
VALUES ('S1', 'P4', 'J3', 250);

INSERT INTO ventas
VALUES ('S2', 'P5', 'J2', 300);

INSERT INTO ventas
VALUES ('S2', 'P2', 'J1', 4500);

INSERT INTO ventas
VALUES ('S3', 'P1', 'J1', 90);

INSERT INTO ventas
VALUES ('S3', 'P2', 'J1', 190);

INSERT INTO ventas
VALUES ('S3', 'P5', 'J3', 20);

INSERT INTO ventas
VALUES ('S4', 'P5', 'J1', 15);

INSERT INTO ventas
VALUES ('S4', 'P1', 'J3', 1500);

INSERT INTO ventas
VALUES ('S1', 'P1', 'J1', 150);

INSERT INTO ventas
VALUES ('S1', 'P4', 'J4', 290);

INSERT INTO ventas
VALUES ('S1', 'P2', 'J4', 175);

-- Ejercicio 1
select*from proyecto;

-- Ejercicio 2
select*from proyecto
where ciudad = "Londres";

-- Ejercicio 3
select codpie
from ventas
where codpro = "S2"
order by codpie;

 -- Ejercicio 4
 select codpro
 from ventas
 where codpj = "J1"
 order by codpro;
 
 -- Ejercicio 5
 select distinct pieza.color, pieza.ciudad
 from pieza;
 
 -- Ejercicio 6
 select codpro, codpie, codpj
 from ventas
 where cantidad is not null;
 
 -- Ejercicio 7
 select codpj, ciudad
 from proyecto
 where substring(ciudad, 2, 1) = "o";
 
-- Ejercicio 8
select nompie
from pieza
where length(nompie > 5)
order by nompie asc;

-- Ejercicio 9
select left(nompj, 3) as nombre_abreviados
from proyecto;

-- Ejercicio 10
select right(nompro, 3) as orden_afabetico
from proveedor
order by nompro;

-- Ejercicio 11
select count(distinct codpie) as piezas_distintas
from pieza;

-- Ejercicio 12
select count(distinct codpie) as numero
from pieza;

-- Ejercicio 13
select count(codpj) as num_proy
from ventas
where codpro = "S1";

-- Ejercicio 14
select count(codpie) as num_piezas
from ventas
where codpie = "P1" and codpro = "S1";

-- Ejercicio 15
select count(codpie) as media_piezas, max(cantidad) as cantidad_max, min(cantidad) as cantidad_min
from ventas;

-- Ejercicio 16
select cantidad
from ventas
where cantidad between 300 and 750;

-- Ejercicio 17
select codpie,
case when pieza.color != "gris" or "azul" then "VERDADERO"
else "FALSO" end as caso_color
from pieza;

-- Ejercicio 18
alter table ventas
add column fecha_adquisicion date;
select*from ventas;

-- Ejercicio 19
update ventas
set fecha_adquisicion = current_date
where codpie = "P2";
select*from ventas;

-- Ejercicio 20
select date_format(fecha_adquisicion, "%Y" "%M" "%D") as formateado
from ventas;

-- Ejercicio 21
select date_format(current_date, "12-11-2001") as formateado
from ventas
where codpj = "J1" and codpj = "J2"; 

-- Ejercicio 22
select pieza.ciudad
from pieza
join proveedor on proveedor.ciudad = pieza.ciudad
join proyecto on proyecto.ciudad = pieza.ciudad;

-- Ejercicio 23
select*from pieza 
cross join proveedor;

-- Ejercicio 24
select distinct pieza.codpie, proveedor.codpro, proyecto.codpj
from ventas
join pieza on pieza.codpie = pieza.codpie
join proveedor on proveedor.codpro = proveedor.codpro
join proyecto on proyecto.codpj = proyecto.codpj
where (pieza.ciudad = proveedor.ciudad and proveedor.ciudad = proyecto.ciudad);

-- Ejercicio 25
select distinct pieza.codpie, proveedor.codpro, proyecto.codpj
from ventas
join pieza on pieza.codpie = pieza.codpie
join proveedor on proveedor.codpro = proveedor.codpro
join proyecto on proyecto.codpj = proyecto.codpj
where (pieza.ciudad = proveedor.ciudad and proveedor.ciudad = proyecto.ciudad);

-- Ejercicio 26
select * from ventas
join pieza on pieza.codpie = pieza.codpie
join proveedor on proveedor.codpro = proveedor.codpro
join proyecto on proyecto.codpj = proyecto.codpj
where (pieza.ciudad = proveedor.ciudad and pieza.ciudad != proyecto.ciudad) or 
(proyecto.ciudad = pieza.ciudad and proyecto.ciudad != proveedor.ciudad);

-- Ejercicio 27
select * from ventas
join pieza on pieza.codpie = pieza.codpie
join proveedor on proveedor.codpro = proveedor.codpro
join proyecto on proyecto.codpj = proyecto.codpj
where proveedor.ciudad != proyecto.ciudad and proyecto.ciudad != pieza.ciudad and pieza.ciudad != proveedor.ciudad;

-- Ejercicio 28
select distinct codpie 
from ventas
join proveedor on proveedor.ciudad = proveedor.ciudad
where proveedor.ciudad = "Londres";

-- Ejercicio 29
select codpie
from ventas
join proveedor on proveedor.ciudad = proveedor.ciudad
join proyecto on proyecto.ciudad = proyecto.ciudad
where proveedor.ciudad = "Londres" and proyecto.ciudad = "Londres";

-- Ejercicio 30
select pieza.ciudad, codpro, codpj
from pieza
join proveedor on proveedor.codpro = "S1"
join proyecto on proyecto.codpj = "J2";

-- Ejercicio 31
select codpie
from pieza, proyecto
join proveedor on proveedor.ciudad = proyecto.ciudad;

-- Ejercicio 32 // TENGO DUDAS
select proyecto.codpj, proveedor.codpro
from ventas, proyecto
join proveedor on proveedor.ciudad != proyecto.ciudad;

-- Ejercicio 33 // ESTÁ MAL
select codpie, codpie
from pieza
join proveedor on proveedor.codpro =  proveedor.codpro;

-- Ejercicio 34 // ESTÁ MAL
select distinct codpie, codpie
from ventas 
join proveedor on proveedor.codpro = proveedor.codpro 
where codpie = codpie;

-- Ejercicio 35
select codpie, codpj, cantidad
from ventas;

-- Ejercicio 36
select codpie, codpj, cantidad
from ventas
where cantidad > 320;

-- Ejercicio 37
select distinct upper(nompro)
from proveedor
where codpro 
in (
select codpro from ventas where ventas.cantidad > 100 and ventas.codpie = "P1"
);

-- Ejercicio 38
select nompj
from proyecto
join proveedor on proveedor.codpro = "S1";

-- Ejercicio 39
select color
from pieza
where codpie 
in (
select codpie from ventas where ventas.codpro = "S1"
);

-- Ejercicio 40
select codpie
from ventas
where codpj
in (
select codpj from proyecto where proyecto.ciudad = "Londres");

-- Ejercicio 41 
select proveedor.codpro 
from proveedor 
where proveedor.status < (
	select status 
    from proveedor
    where proveedor.codpro = "S1"
);

-- Ejercicio 42 
select codpj
from ventas
where codpie = "P1" group by codpj having avg(cantidad) > (
	select max(cantidad)
    from ventas 
    where codpie = "P1" and codpj = "J1"
);

-- Ejercicio 43 
select codpro 
from ventas
where codpie = "P1" and cantidad > (
	select avg(cantidad)
    from ventas
    where codpie = "P1" and codpj = codpj 
);

-- Ejercicio 44
select codpj
from ventas
where codpro in (
	select proveedor.codpro
    from ventas
    join proveedor on proveedor.codpro = proveedor.codpro
    where proveedor.codpro = "S1"
);

-- Ejercicio 45
SELECT DISTINCT codpro
FROM ventas 
WHERE codpie IN (
    -- Piezas suministradas por proveedores que suministran piezas rojas
    SELECT pieza.codpie
    FROM ventas 
    JOIN pieza  ON pieza.codpie = pieza.codpie
    WHERE pieza.color = 'Rojo'
);

-- Ejercicio 46 // POR TERMINAR
select codpie
from pieza