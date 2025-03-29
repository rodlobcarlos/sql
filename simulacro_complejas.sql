create database baloncesto;
use baloncesto;

create table jugadores(
codigo int,
nombre varchar(30),
procedencia varchar(20),
altura varchar (4),
peso int,
posicion varchar(5),
nombre_equipo varchar(20)
constraint pf_jugadores 
);

create table estadisticas(
temporada varchar (5),
jugador int,
puntos_por_partido float,
asistencias_por_partido float,
tapones_por_partido float,
rebotes_por_partido float
);

create table equipos(
nombre varchar(20),
ciudad varchar (20),
conferencia varchar (4),
division varchar (20)

);

create table partidos(
codigo int,
equipo_local varchar (20),
equipo_visitante varchar (20),
puntos_local int,
puntos_visitante int,
temporada varchar (5)
);

INSERT INTO jugadores (codigo, nombre, procedencia, altura, peso, posicion, nombre_equipo) VALUES
(1, 'Corey Brewer', 'Florida', '6-9', 185, 'F-G', 'Timberwolves'),
(2, 'Greg Buckner', 'Clemson', '6-4', 210, 'G-F', 'Timberwolves'),
(3, 'Michael Doleac', 'Utah', '6-11', 262, 'C', 'Timberwolves'),
(4, 'Randy Foye', 'Villanova', '6-4', 213, 'G', 'Timberwolves'),
(5, 'Ryan Gomes', 'Providence', '6-7', 250, 'F', 'Timberwolves'),
(6, 'Marko Jaric', 'Serbia', '6-7', 224, 'G', 'Timberwolves'),
(7, 'Al Jefferson', 'Prentiss HS', '6-10', 265, 'C-F', 'Timberwolves'),
(8, 'Mark Madsen', 'Stanford', '6-9', 255, 'C-F', 'Timberwolves'),
(9, 'Rashard McCants', 'North Carolina', '6-4', 210, 'G', 'Timberwolves'),
(10, 'Chris Richard', 'Florida', '6-9', 270, 'F', 'Timberwolves');

INSERT INTO estadisticas (temporada, jugador, puntos_por_partido, asistencias_por_partido, tapones_por_partido, rebotes_por_partido) VALUES
('00/01', 2, 6.2, 1.3, 0.2, 4.2),
('00/01', 3, 6.4, 0.8, 0.5, 3.5),
('00/01', 8, 2.3, 0.3, 0.1, 2.2),
('00/01', 14, 23.4, 5.5, 0.6, 8.9),
('00/01', 21, 9.0, 3.2, 1.6, 10.1),
('00/01', 26, 6.9, 6.1, 0.3, 3.4),
('00/01', 29, 12.6, 1.2, 4.2, 4.1),
('00/01', 33, 19.5, 2.5, 0.3, 5.0),
('00/01', 39, 12.6, 1.8, 0.6, 4.1),
('00/01', 43, 2.1, 0.2, 0.1, 1.5);

INSERT INTO equipos (nombre, ciudad, conferencia, division) VALUES
('76ers', 'Philadelphia', 'East', 'Atlantic'),
('Bobcats', 'Charlotte', 'East', 'SouthEast'),
('Bucks', 'Milwaukee', 'East', 'Central'),
('Bulls', 'Chicago', 'East', 'Central'),
('Cavaliers', 'Cleveland', 'East', 'Central'),
('Celtics', 'Boston', 'East', 'Atlantic'),
('Clippers', 'Los Angeles', 'West', 'Pacific'),
('Grizzlies', 'Memphis', 'West', 'SouthWest'),
('Hawks', 'Atlanta', 'East', 'SouthEast'),
('Heat', 'Miami', 'East', 'SouthEast');

INSERT INTO partidos (codigo, equipo_local, equipo_visitante, puntos_local, puntos_visitante, temporada) VALUES
(1, 'Raptors', 'Lakers', 74, 117, '98/99'),
(2, 'Raptors', 'Grizzlies', 70, 118, '98/99'),
(3, 'Raptors', 'Clippers', 105, 76, '98/99'),
(4, 'Raptors', 'Knicks', 76, 124, '98/99'),
(5, 'Raptors', 'Timberwolves', 66, 68, '98/99'),
(6, 'Raptors', 'Celtics', 52, 67, '98/99'),
(7, 'Raptors', '76ers', 74, 103, '98/99'),
(8, 'Raptors', 'Nets', 101, 129, '98/99'),
(9, 'Raptors', 'Pistons', 88, 105, '98/99'),
(10, 'Raptors', 'Cavaliers', 129, 158, '98/99');

-- Ejercicio 1
select*from jugadores
join equipos on equipos.division = "Central"
where division in (
select peso from equipos where (jugadores.nombre = "%A" and jugadores.nombre = "E%") and jugadores.peso > avg(peso));

-- Ejercicio 2
