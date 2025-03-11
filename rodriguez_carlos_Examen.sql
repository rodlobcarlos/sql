-- DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;

CREATE TABLE region(
	id_region INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20)
);

CREATE TABLE ciudad(
	id_ciudad INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	region INT,
	CONSTRAINT fk_ciudad_region FOREIGN KEY (region) REFERENCES region(id_region)
);

CREATE TABLE generacion(
	id_generacion INT PRIMARY KEY, 
	region INT, 
	anyo_descubrimiento INT,
	CONSTRAINT fk_generacion_region FOREIGN KEY (region) REFERENCES region(id_region)
);

CREATE TABLE tipo (
	id_tipo INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30) NOT NULL
);

CREATE TABLE vence_a(
	tipo_fuerte INT,
	tipo_debil INT, 
	CONSTRAINT pk_vence PRIMARY KEY (tipo_fuerte, tipo_debil),
	CONSTRAINT fk_vence_fuerte FOREIGN KEY (tipo_fuerte) REFERENCES tipo(id_tipo),
	CONSTRAINT fk_vence_a_debil FOREIGN KEY (tipo_debil) REFERENCES tipo(id_tipo)
	
);

CREATE TABLE entrenador(
	id_entrenador INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	lleva_zapatillas BOOLEAN,
	dinero DECIMAL(16,2),
	nacido_en INT, 
	CONSTRAINT ciudad_entrenador FOREIGN KEY (nacido_en) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE movimiento(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL, 
	puntos_ataque INT, 
	puntos_poder INT, 
	precision_mov INT ,
	CONSTRAINt chk_precision CHECK (precision_mov >= 0 && precision_mov <= 100)
);

CREATE TABLE set_movimientos(
	id_set INT PRIMARY KEY AUTO_INCREMENT,
	mov_1 INT,
	mov_2 INT, 
	mov_3 INT, 
	mov_4 INT,
	CONSTRAINT fk_mov1 FOREIGN KEY (mov_1) REFERENCES movimiento(id),
	CONSTRAINT fk_mov2 FOREIGN KEY (mov_2) REFERENCES movimiento(id),
	CONSTRAINT fk_mov3 FOREIGN KEY (mov_3) REFERENCES movimiento(id),
	CONSTRAINT fk_mov4 FOREIGN KEY (mov_4) REFERENCES movimiento(id)
);

CREATE TABLE pokemon (
	id_pokemon INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL, 
	originario INT,
	set_movimientos INT,
	tipo INT,
	CONSTRAINT fk_region_pkmn FOREIGN KEY (originario) REFERENCES region(id_region),
	CONSTRAINT fk_set_mov FOREIGN KEY (set_movimientos) REFERENCES set_movimientos(id_set),
	CONSTRAINT tk_tipo_pokemon FOREIGN KEY (tipo) REFERENCES tipo(id_tipo)
);

CREATE TABLE entrenamiento(
	id_entrenador INT,
	id_pokemon INT ,
	nivel INT, 
	ataque INT,
	defensa INT,
	ataque_esp INT,
	defensa_esp INT,
	velocidad INT,
	puntos_salud INT,
	inicio_entrenamiento DATE,
	naturaleza VARCHAR(50),
	habilidad VARCHAR(50),
	CONSTRAINT pk_entrenamiento PRIMARY KEY (id_entrenador, id_pokemon), 
	CONSTRAINT entrenador_entrena FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador),
	CONSTRAINT pokemon_entrena FOREIGN KEY (id_pokemon) REFERENCES pokemon(id_pokemon),
	CONSTRAINT chk_nivel CHECK (nivel > 0 && nivel <= 100)
);

CREATE TABLE gimnasio(
	id_gym INT PRIMARY KEY,
	lider INT,
	num_entrenadores INT,
	ciudad INT,
	CONSTRAINT fk_lider_gym FOREIGN KEY (lider) REFERENCES entrenador(id_entrenador),
	CONSTRAINT fk_ciudad_gym FOREIGN KEY (ciudad) REFERENCES ciudad(id_ciudad)
);


-- Insertar regiones
INSERT INTO region (nombre) VALUES
('Kanto'),
('Johto'),
('Hoenn'),
('Sinnoh'),
('Teselia'),
('Kalos'),
('Alola'),
('Galar');

-- Kanto
INSERT INTO ciudad (nombre, region) VALUES
('Pueblo Paleta', 1),
('Ciudad Verde', 1),
('Ciudad Celeste', 1),
('Ciudad Plateada', 1),
('Ciudad Carmín', 1);

-- Johto
INSERT INTO ciudad (nombre, region) VALUES
('Pueblo Primavera', 2),
('Ciudad Cerezo', 2),
('Ciudad Trigal', 2),
('Ciudad Malva', 2),
('Ciudad Iris', 2);

-- Hoenn
INSERT INTO ciudad (nombre, region) VALUES
('Ciudad Petalia', 3),
('Ciudad Férrica', 3),
('Ciudad Portual', 3),
('Ciudad Mauville', 3),
('Ciudad Algaria', 3);

-- Sinnoh
INSERT INTO ciudad (nombre, region) VALUES
('Pueblo Hojaverde', 4),
('Ciudad Jubileo', 4),
('Ciudad Pirita', 4),
('Ciudad Corazón', 4),
('Ciudad Rocavelo', 4);

-- Teselia
INSERT INTO ciudad (nombre, region) VALUES
('Villa Terracota', 5),
('Ciudad Engobe', 5),
('Ciudad Esmalte', 5),
('Ciudad Fayenza', 5),
('Ciudad Mayólica', 5);

-- Kalos
INSERT INTO ciudad (nombre, region) VALUES
('Ciudad Novarte', 6),
('Ciudad Relieve', 6),
('Ciudad Yantra', 6),
('Ciudad Luminalia', 6),
('Ciudad Fluxus', 6);

-- Alola
INSERT INTO ciudad (nombre, region) VALUES
('Ciudad Hauoli', 7),
('Ciudad Kantai', 7),
('Ciudad Konikoni', 7),
('Ciudad Malíe', 7),
('Ciudad Azafrán', 7);

-- Galar
INSERT INTO ciudad (nombre, region) VALUES
('Ciudad Pistón', 8),
('Ciudad Batuta', 8),
('Ciudad Martillo', 8),
('Ciudad Estepea', 8),
('Ciudad Turrfield', 8);

-- Insertar generaciones
INSERT INTO generacion (id_generacion, region, anyo_descubrimiento) VALUES
(1, 1, 1996),
(2, 2, 1999),
(3, 3, 2002),
(4, 4, 2006),
(5, 5, 2010),
(6, 6, 2013),
(7, 7, 2016),
(8, 8, 2019);

-- Insertar tipos de Pokémon
INSERT INTO tipo (nombre) VALUES
('Normal'),
('Fuego'),
('Agua'),
('Planta'),
('Eléctrico'),
('Hielo'),
('Lucha'),
('Veneno'),
('Tierra'),
('Volador'),
('Psíquico'),
('Bicho'),
('Roca'),
('Fantasma'),
('Dragón'),
('Siniestro'),
('Acero'),
('Hada');

-- Insertar movimientos
INSERT INTO movimiento (nombre, puntos_ataque, puntos_poder, precision_mov) VALUES
('Placaje', 35, 40, 100),
('Lanzallamas', 15, 90, 95),
('Acua Jet', 30, 40, 100),
('Hoja Afilada', 25, 70, 95),
('Trueno', 10, 110, 70),
('Rayo Hielo', 10, 90, 100),
('Golpe Karate', 25, 50, 100),
('Toxico', 10, NULL, 90),
('Látigo Cepa', 15, 55, 100),
('Picotazo Venenoso', 35, 50, 100),
('Onda Trueno', 15, 90, 100),
('Lanzarrocas', 10, 30, 90),
('Pantalla de Humo', NULL, NULL, NULL),
('Cola Férrea', 15, 80, 100),
('Bola Sombra', 10, 80, 100),
('Llamarada', 5, 110, 85),
('Ataque Ala', 10, 60, 100),
('Hiperrayo', 5, 150, 90),
('Rayo Burbuja', 20, 65, 100),
('Garra Dragón', 15, 80, 100),
('Psicorrayo', 10, 90, 100),
('Megapatada', 20, 120, 75),
('Viento Hielo', 10, 55, 95),
('Colmillo Ígneo', 15, 65, 95),
('Cabezazo', 15, 70, 100),
('Garra', 20, 75, 95),
('Rayo', 10, 110, 85),
('Ataque Aéreo', 20, 75, 95),
('Poder Pasado', 10, 80, 100),
('Bofetón Lodo', 10, 65, 100),
('Cabezazo Zen', 15, 80, 90),
('Furia Dragón', 10, 80, 100),
('Luz Lunar', 10, 75, 100),
('Avalancha', 10, 75, 90),
('Golpe Bajo', 20, 80, 100),
('Excavar', 10, 80, 100),
('Giro Bola', 5, 50, 100),
('Viento Plata', 10, 60, 100),
('Granizo', NULL, NULL, NULL),
('Bomba Germen', 15, 80, 100),
('Bomba Sónica', 5, 100, 100),
('Pulso Umbrío', 10, 80, 100),
('Pulso Dragón', 10, 85, 100),
('Ciclón', 5, 40, 100),
('Golpe Cabeza', 15, 70, 100),
('Puño Trueno', 15, 75, 100),
('Disparo Lodo', 10, 65, 100),
('Roca Afilada', 5, 50, 90),
('Puño Fuego', 15, 75, 100),
('Onda Trueno', 20, 120, 70),
('Rueda Fuego', 15, 60, 100),
('Bomba Lodo', 10, 65, 100),
('Ventisca', 10, 110, 70),
('Pisotón', 20, 40, 100),
('Avalancha', 10, 75, 90),
('Anillo Ígneo', 10, 65, 85),
('Poder Oculto', NULL, NULL, 100),
('A Bocajarro', 5, 120, 70),
('Residuos', 20, 120, 70),
('Lluvia de Esporas', NULL, NULL, 75),
('Ataque Aéreo', 20, 140, 90),
('Psicorrayo', 10, 80, 100),
('Golpe Roca', 15, 50, 90),
('Lanzarrocas', 10, 30, 90),
('Lengüetazo', 30, 30, 100),
('Golpe Cuerpo', 15, 85, 100),
('Fuerza Bruta', 10, 120, 100),
('Onda Certera', 20, 120, 100),
('Sofoco', NULL, NULL, 100),
('Rayo Solar', 10, 120, 100),
('Puño Bala', 30, 40, 100),
('Golpe Aéreo', 10, 60, 100),
('Tajo Aéreo', 15, 70, 100),
('Ataque Alarido', 15, 60, 100),
('Viento Plata', 10, 60, 100),
('Desarme', 10, 90, 100),
('Rayo Confuso', 10, 50, 100),
('Aguante', NULL, NULL, NULL),
('Espora', NULL, NULL, 100),
('Triturar', 15, 70, 100),
('Terremoto', 10, 100, 100),
('Lanzallamas', 15, 90, 95),
('Ventisca', 10, 110, 70),
('Hidrobomba', 5, 110, 80),
('Golpe Roca', 15, 75, 90),
('Fuego Fatuo', 15, 65, 100),
('Tajo Cruzado', 15, 70, 100),
('Cola Férrea', 15, 80, 100),
('Rayo Confuso', 10, 50, 100),
('Hoja Afilada', 25, 70, 95),
('Ataque Rápido', 20, 40, 100),
('Golpe Aéreo', 10, 60, 100),
('Arañazo', 30, 40, 100),
('Ataque Ala', 10, 60, 100),
('Colmillo Ígneo', 15, 65, 95),
('Ataque de Alas', 15, 60, 100),
('Cola Férrea', 15, 80, 100),
('Garra Dragón', 15, 80, 100),
('Oscuro', 10, 80, 100),
('Mordisco', 25, 60, 100),
('Ataque Arena', 15, 100, 85),
('Megacuerno', 10, 120, 85),
('Ataque Ala', 10, 60, 100),
('Llamarada', 5, 110, 85),
('Hiperrayo', 5, 150, 90),
('Roca Afilada', 5, 50, 90),
('Acua Jet', 30, 40, 100),
('Hoja Afilada', 25, 70, 95),
('Mordisco', 25, 60, 100),
('Rayo Hielo', 10, 90, 100),
('Golpe Karate', 25, 50, 100),
('Puño Bala', 30, 40, 100);

SELECT * FROM movimiento;

-- Insertar registros para la tabla set_movimientos
INSERT INTO set_movimientos (mov_1, mov_2, mov_3, mov_4) VALUES
(1, 2, 3, 4),
(5, 6, 7, 8),
(9, 10, 11, 12),
(13, 14, 15, 16),
(17, 18, 19, 20),
(21, 22, 23, 24),
(25, 26, 27, 28),
(29, 30, 31, 32),
(33, 34, 35, 36),
(37, 38, 39, 40),
(41, 42, 43, 44),
(45, 46, 47, 48),
(49, 50, 51, 52),
(53, 54, 55, 56),
(57, 58, 59, 60),
(61, 62, 63, 64),
(65, 66, 67, 68),
(69, 70, 71, 72),
(73, 74, 75, 76),
(77, 78, 79, 80),
(81, 82, 83, 84),
(85, 86, 87, 88),
(89, 90, 91, 92),
(93, 94, 95, 96),
(97, 98, 99, 100),
(2, 4, 6, 8),
(10, 12, 14, 16),
(18, 20, 22, 24),
(26, 28, 30, 32),
(34, 36, 38, 40),
(42, 44, 46, 48),
(50, 52, 54, 56),
(58, 60, 62, 64),
(66, 68, 70, 72),
(74, 76, 78, 80),
(82, 84, 86, 88),
(90, 92, 94, 96),
(1, 3, 5, 7),
(9, 11, 13, 15),
(17, 19, 21, 23),
(25, 27, 29, 31),
(33, 35, 37, 39),
(41, 43, 45, 47),
(49, 51, 53, 55),
(57, 59, 61, 63),
(65, 67, 69, 71),
(73, 75, 77, 79),
(81, 83, 85, 87),
(89, 91, 93, 95),
(2, 3, 4, 5),
(6, 7, 8, 9),
(10, 11, 12, 13),
(14, 15, 16, 17),
(18, 19, 20, 21),
(22, 23, 24, 25),
(26, 27, 28, 29),
(30, 31, 32, 33),
(34, 35, 36, 37),
(38, 39, 40, 41),
(42, 43, 44, 45),
(46, 47, 48, 49),
(50, 51, 52, 53),
(54, 55, 56, 57),
(58, 59, 60, 61),
(62, 63, 64, 65),
(66, 67, 68, 69),
(70, 71, 72, 73),
(74, 75, 76, 77),
(78, 79, 80, 81),
(82, 83, 84, 85),
(86, 87, 88, 89),
(90, 91, 92, 93),
(94, 95, 96, 97),
(98, 99, 100, 1),
(81, 83, 85, 87),
(89, 91, 93, 95),
(2, 3, 4, 5),
(6, 7, 8, 9),
(10, 11, 12, 13),
(14, 15, 16, 17),
(18, 19, 20, 21),
(22, 23, 24, 25),
(26, 27, 28, 29),
(30, 31, 32, 33),
(34, 35, 36, 37),
(38, 39, 40, 41),
(42, 43, 44, 45),
(46, 47, 48, 49),
(50, 51, 52, 53),
(54, 55, 56, 57),
(58, 59, 60, 61),
(62, 63, 64, 65),
(66, 67, 68, 69),
(70, 71, 72, 73),
(74, 75, 76, 77),
(78, 79, 80, 81),
(82, 83, 84, 85),
(86, 87, 88, 89),
(90, 91, 92, 93),
(94, 95, 96, 97),
(98, 99, 100, 1);

USE pokemon;
SELECT * FROM set_movimientos;

-- Insertar Pokémon
INSERT INTO pokemon (nombre, originario, set_movimientos, tipo) VALUES
('Pikachu', 1, 1, 13),
('Charizard', 1, 5, 10),
('Bulbasaur', 1, 9, 12),
('Squirtle', 1, 13, 11),
('Jigglypuff', 1, 17, 1),
('Vulpix', 1, 21, 10),
('Pidgey', 1, 25, 1),
('Geodude', 1, 8, 6),
('Ekans', 1, 9, 4),
('Abra', 1, 10, 14),
('Machop', 1, 11, 2),
('Bellsprout', 1, 12, 12),
('Tentacool', 1, 13, 4),
('Gastly', 1, 14, 8),
('Magikarp', 1, 15, 11),
('Eevee', 1, 16, 1),
('Omanyte', 1, 17, 5),
('Kabuto', 1, 18, 5),
('Dratini', 1, 19, 2),
('Mewtwo', 1, 20, 14),
('Chikorita', 2, 21, 12),
('Cyndaquil', 2, 22, 10),
('Totodile', 2, 23, 11),
('Ledyba', 2, 24, 1),
('Spinarak', 2, 25, 4),
('Chinchou', 2, 26, 11),
('Togepi', 2, 27, 1),
('Natu', 2, 28, 14),
('Marill', 2, 29, 11),
('Hoppip', 2, 30, 12),
('Sunkern', 2, 31, 12),
('Wooper', 2, 32, 11),
('Murkrow', 2, 33, 15),
('Slugma', 2, 34, 10),
('Remoraid', 2, 35, 11),
('Delibird', 2, 36, 15),
('Skarmory', 2, 37, 17),
('Houndour', 2, 38, 4),
('Phanpy', 2, 39, 11),
('Stantler', 2, 40, 1),
('Smeargle', 2, 41, 1),
('Miltank', 2, 42, 1),
('Larvitar', 2, 43, 6),
('Treecko', 3, 44, 12),
('Torchic', 3, 45, 10),
('Mudkip', 3, 46, 11),
('Poochyena', 3, 47, 4),
('Zigzagoon', 3, 48, 1),
('Wurmple', 3, 49, 12),
('Lotad', 3, 50, 11),
('Seedot', 3, 51, 12),
('Taillow', 3, 52, 1),
('Wingull', 3, 53, 11),
('Ralts', 3, 54, 14),
('Surskit', 3, 55, 4),
('Shroomish', 3, 56, 12),
('Slakoth', 3, 57, 1),
('Nincada', 3, 58, 4),
('Whismur', 3, 59, 1),
('Makuhita', 3, 60, 2),
('Nosepass', 3, 61, 6),
('Skitty', 3, 62, 1),
('Sableye', 3, 63, 8),
('Mawile', 3, 64, 8),
('Aron', 3, 65, 16),
('Meditite', 3, 66, 2),
('Electrike', 3, 67, 13),
('Plusle', 3, 68, 13),
('Minun', 3, 69, 13),
('Volbeat', 3, 70, 7),
('Illumise', 3, 71, 7),
('Roselia', 3, 72, 12),
('Gulpin', 3, 73, 4),
('Carvanha', 3, 74, 11),
('Wailmer', 3, 75, 11),
('Numel', 3, 76, 10),
('Torkoal', 3, 77, 10),
('Spoink', 3, 78, 14),
('Spinda', 3, 79, 1),
('Trapinch', 3, 80, 6),
('Cacnea', 3, 81, 12),
('Swablu', 3, 82, 1),
('Zangoose', 3, 83, 1),
('Seviper', 3, 84, 4);

INSERT INTO entrenador (nombre, lleva_zapatillas, dinero, nacido_en) VALUES
('Ash Ketchum', true, 10000.00, 1),
('Misty', true, 8000.50, 1),
('Brock', true, 7500.25, 1),
('Red', false, 12000.75, 1),
('May', true, 9500.00, 2),
('Dawn', false, 8500.50, 2),
('Brendan', true, 9000.25, 2),
('Ethan', true, 11000.00, 2),
('Cynthia', false, 15000.00, 4),
('Steven', true, 14000.50, 4),
('Wallace', true, 13000.25, 4),
('N', true, 12500.00, 5),
('Guzma', false, 11200.75, 6),
('Lusamine', true, 16000.50, 7),
('Giovanni', true, 17000.25, 1),
('Erika', false, 10500.00, 1),
('Lt. Surge', true, 9500.50, 1),
('Sabrina', true, 9200.25, 1),
('Blaine', false, 9800.00, 1);


-- Insertar información aleatoria de entrenamiento
INSERT INTO entrenamiento (id_entrenador, id_pokemon, nivel, ataque, defensa, ataque_esp, defensa_esp, velocidad, puntos_salud, inicio_entrenamiento, naturaleza, habilidad) VALUES
(1, 1, 50, 100, 90, 110, 100, 120, 300, '2022-01-01', 'Audaz', 'Fuerza Solar'),
(2, 2, 45, 85, 80, 100, 90, 110, 250, '2022-02-05', 'Osada', 'Torrente'),
(3, 3, 55, 95, 100, 120, 110, 130, 280, '2022-03-10', 'Alegre', 'Poder Solar'),
(4, 4, 60, 105, 110, 130, 120, 140, 320, '2022-04-15', 'Activa', 'Mar Interior'),
(5, 5, 40, 75, 70, 90, 80, 100, 200, '2022-05-20', 'Cauta', 'Foco Interno'),
(6, 6, 70, 115, 120, 140, 130, 150, 340, '2022-06-25', 'Serena', 'Torrente'),
(7, 7, 65, 110, 105, 125, 115, 135, 310, '2022-07-30', 'Alocada', 'Mar Interior'),
(8, 8, 50, 90, 85, 105, 95, 115, 270, '2022-08-30', 'Audaz', 'Poder Solar'),
(9, 9, 55, 100, 95, 115, 105, 125, 290, '2022-09-30', 'Osada', 'Foco Interno'),
(10, 10, 65, 110, 105, 125, 115, 135, 310, '2022-10-30', 'Activa', 'Torrente'),
(11, 11, 40, 80, 75, 95, 85, 105, 220, '2022-11-30', 'Cauta', 'Mar Interior'),
(12, 12, 70, 120, 115, 135, 125, 145, 330, '2022-12-30', 'Serena', 'Poder Solar'),
(13, 13, 75, 125, 120, 140, 130, 150, 350, '2023-01-30', 'Alocada', 'Torrente'),
(14, 14, 55, 105, 100, 120, 110, 130, 300, '2023-02-28', 'Audaz', 'Foco Interno'),
(15, 15, 60, 115, 110, 130, 120, 140, 320, '2023-03-31', 'Osada', 'Mar Interior'),
(16, 16, 45, 85, 80, 100, 90, 110, 250, '2023-04-30', 'Alegre', 'Poder Solar'),
(17, 17, 50, 95, 90, 110, 100, 120, 270, '2023-05-31', 'Activa', 'Torrente'),
(18, 18, 65, 115, 110, 130, 120, 140, 330, '2023-06-30', 'Serena', 'Mar Interior'),
(19, 19, 70, 125, 120, 140, 130, 150, 350, '2023-07-31', 'Alocada', 'Foco Interno'),
(2, 19, 45, 85, 80, 100, 90, 110, 250, '2023-08-31', 'Audaz', 'Torrente');


-- Insertar gimnasios
INSERT INTO gimnasio (id_gym, lider, num_entrenadores, ciudad) VALUES
(1, 1, 5, 1),
(2, 2, 7, 2),
(3, 3, 6, 3),
(4, 4, 8, 4),
(5, 5, 6, 5),
(6, 6, 7, 6),
(7, 7, 5, 7),
(8, 8, 9, 8),
(9, 9, 6, 9),
(10, 10, 7, 10),
(11, 11, 5, 11),
(12, 12, 8, 12),
(13, 13, 7, 13),
(14, 14, 6, 14),
(15, 15, 5, 15),
(16, 16, 9, 16),
(17, 17, 7, 17),
(18, 18, 6, 18),
(19, 19, 8, 19);

SELECT * FROM tipo;


INSERT INTO vence_a (tipo_fuerte, tipo_debil) VALUES
(1, 11),  -- Planta vence a Roca
(2, 4),   -- Agua vence a Fuego
(3, 7),   -- Eléctrico vence a Agua
(4, 8),   -- Planta vence a Roca
(5, 9),   -- Hielo vence a Planta
(6, 13),  -- Lucha vence a Hielo
(8, 17),  -- Volador vence a Lucha
(9, 3),   -- Veneno vence a Bicho
(10, 18), -- Psíquico vence a Veneno
(11, 10), -- Bicho vence a Siniestro
(12, 5),  -- Fantasma vence a Psíquico
(13, 2),  -- Roca vence a Fuego
(14, 15); -- Lucha vence a Normal

-- Ejercicio 1
select nombre
from ciudad
where region = 3;

-- Ejercicio 2
select concat("Esta es la generación ", id_generacion,  " y fue descubierta en el año ", anyo_descubrimiento )
from generacion;

-- Ejercicio 3
select*from entrenamiento
where nivel > 50 and ataque > 100;

-- Ejercicio 4
select*from entrenamiento
where nivel %2 = 0;

-- Ejercicio 5
select concat(left(nombre, 1), "a")
from entrenador;

-- Ejercicio 6
select nombre
from pokemon
where length(nombre > 5) and originario = 1;

-- Ejercicio 7
select concat(left(nombre, 1), "Ch%") and (ataque > 80 or ataque_esp > 80)
from pokemon
where pokemon.id_pokemon = entrenamiento.id_entrenador = entrenamiento.id_entrenador;

-- Ejercicio 8
select id_pokemon
from entrenamiento
where (ataque_esp >= 20 / 100) > ataque;

-- Ejercicio 9
select id_pokemon
from entrenamiento
where (ataque < 100 and velocidad > 120) or (ataque > 120 and velocidad < 100);

-- Ejercicio 10
select id_pokemon 
from entrenamiento
where ataque_esp > 100 or defensa > 90;

-- Ejercicio 11
select id_pokemon
from entrenamiento
where (ataque_esp between 80 and 120) and (velocidad between 90 and 110);

-- Ejercicio 12
select id_entrenador  
from entrenador
where concat(left(nombre, 0 -1), "J", "o");

-- Ejercicio 13
select nombre
from entrenador
where length(nombre) >= 6;

-- Ejercicio 14
select*from generacion order by anyo_descubrimiento desc limit 1;

-- Ejercicio 15
select*from entrenamiento order by id_pokemon limit 1;

-- Ejercicio 16
select id_pokemon
from entrenamiento
where ataque_esp > (defensa and defensa_esp);

-- Ejercicio 17
select id_entrenador
from entrenador
where ((dinero < 10000.00) or (dinero > 10000.00) and (nombre not like "p" and nombre not like "b"));

-- Ejercicio 18
select nombre
from movimiento
where precision_mov < 100;

-- Ejercicio 19
select distinct id_pokemon
from entrenamiento;

-- Ejercicio 20
select id_entrenador =
case
	when lleva_zapatillas = true = concat("Enhorabuena ", nombre, " has ganado un total de ",dinero, " pasta ", lleva_zapatillas)
    when lleva_zapatillas = false = concat("Enhorabuena ", nombre, " has ganado un total de ",dinero, " pasta")
from entrenador