--FreeCodeCamp - Celestial Bodies 
--Projeto simples de criação de um banco sobre Corpos celestiais 

--Excluindo um banco de dados ja existente

DROP DATABASE universe; 

--Criação Banco de Dados Universe

CREATE DATABASE universe
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

--Criação da Tabela galaxy

CREATE TABLE galaxy(
  galaxy_id INT PRIMARY KEY ,
  name VARCHAR(30),
  size_galaxy NUMERIC UNIQUE, 
  age_galaxy NUMERIC,
  tips_galaxy TEXT NOT NULL,
  number_star NUMERIC NOT NULL
 );

 --Criação da Tabela star

 CREATE TABLE star(
  star_id INT PRIMARY KEY,
  name VARCHAR(30),
  age_star NUMERIC NOT NULL,
  size_star NUMERIC NOT NULL,
  descrition_Star VARCHAR(100) UNIQUE,
  galaxy_id INT
);

--Criação da Tabela planet

CREATE TABLE planet (
  planet_id INT PRIMARY KEY,
  name VARCHAR(30) UNIQUE,
  size_planet NUMERIC NOT NULL,
  tips_planet VARCHAR(30),
  duration_rotation VARCHAR(30) NOT NULL,
  potentially_inhabited_planets BIT, 
  has_water BIT, 
  star_id INT
 );

 --Criação da Tabela moon

 CREATE TABLE moon (
  moon_id INT PRIMARY KEY,
  name VARCHAR(30),
  size_moon NUMERIC UNIQUE,
  planet_id INT,
  duration_rotation VARCHAR(30) NOT NULL,
  duration_translation VARCHAR(30) NOT NULL
);

--Criação da Tabela constellation

CREATE TABLE constellation (
  constellations_id INT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  classifications_Constellations VARCHAR(50) NOT NULL
);

--Referenciando as PRIMARY KEY's

ALTER TABLE star
ADD CONSTRAINT star_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);

ALTER TABLE planet 
ADD CONSTRAINT planet_star_id FOREIGN KEY (star_id) REFERENCES star(star_id); 

ALTER TABLE planet 
ADD CONSTRAINT PK_planet_planet_id FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

ALTER TABLE moon
ADD CONSTRAINT moon_planet_id FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

--Criando Sequencias para serem utilizadas no ID 

CREATE SEQUENCE SEQ_galaxy;
CREATE SEQUENCE SEQ_star;
CREATE SEQUENCE SEQ_planet;
CREATE SEQUENCE SEQ_moon;
CREATE SEQUENCE SEQ_constellation;


--Inserindo valores ficticios da tabela galaxy

INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Via Láctea', 100000, 13000, 'Espiral', 200000000000);
INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Andrômeda', 150000, 2200000000, 'Espiral', 100000000000);
INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Sombrero', 75000, 2800000000, 'Elíptica', 30000000000);
INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Centaurus A', 90000, 1200000000, 'Elíptica', 100000000000);
INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Olho Negro', 50000, 1000000000, 'Irregular', 5000000000);
INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Whirlpool', 80000, 2500000000, 'Espiral', 10000000000);
INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Triangulum', 60000, 4000000000, 'Espiral', 5000000000);
INSERT INTO galaxy VALUES (NEXTVAL('SEQ_galaxy'), 'Bodes', 70000, 8000000000, 'Espiral', 8000000000);

--Inserindo valores ficticios da tabela star

INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Sol', 5000000000, 109, 'Estrela de tamanho médio que faz parte da Via Láctea', 1);
INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Alpha Centauri', 6000000000, 125, 'Estrela binária mais próxima do Sistema Solar', 1);
INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Betelgeuse', 80000000, 936, 'Estrela supergigante vermelha localizada na constelação de Orion', 2);
INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Sirius', 250000000, 184, 'Estrela mais brilhante no céu noturno vista da Terra', 1);
INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Proxima Centauri', 4000000000, 85, 'Estrela anã vermelha mais próxima do Sistema Solar', 2);
INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Antares', 120000000, 883, 'Super gigante vermelha na constelação de Scorpius', 3);
INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Vega', 500000000, 221, 'Uma das estrelas mais brilhantes no hemisfério norte', 1);
INSERT INTO star VALUES (NEXTVAL('SEQ_star'), 'Canopus', 30000000, 1294, 'Segunda estrela mais brilhante no céu noturno', 4);

--Inserindo valores ficticios da tabela planet
 
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Terra', 12756, 'Terrestre', '24', B'1', B'1', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Marte', 6792, 'Terrestre', '24.6', B'0', B'0', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Júpiter', 139820, 'Gasoso', '9.9', B'0', B'0', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Saturno', 116460, 'Gasoso', '10.7', B'0', B'0', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Vênus', 12104, 'Terrestre', '243', B'0', B'0', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Mercúrio', 4879, 'Terrestre', '1408', B'0', B'0', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Netuno', 49528, 'Gasoso', '16.1', B'0', B'0', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Urano', 51118, 'Gasoso', '17.2', B'0', B'0', 1);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Kepler-452b', 20852, 'Terrestre', '384.84', B'1', B'1', 2);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Gliese 581g', 15399, 'Terrestre', '32.9', B'1', B'1', 5);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'TRAPPIST-1e', 4523, 'Terrestre', '6.1', B'1', B'1', 6);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'HD 189733b', 138250, 'Gasoso', '2.2', B'0', B'0', 7);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'Proxima Centauri b', 8500, 'Terrestre', '11.2', B'1', B'1', 5);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), 'WASP-12b', 183303, 'Gasoso', '26.4', B'0', B'0', 8);
INSERT INTO planet VALUES (NEXTVAL('SEQ_planet'), '55 Cancri e', 19085, 'Terrestre', '0.7', B'1', B'0', 4);

-- Inserindo valores ficticios da tabela moon

INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Lua da Terra', 3474, 1, '27.3', '27.3');
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Fobos de Marte', 22, 2, '0.3', '0.3'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Deimos de Marte', 12, 2, '1.3', '1.3');
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Ganimedes de Júpiter', 5262, 3, '7.2', '7.2'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Calisto de Júpiter', 4821, 3, '16.7', '16.7');
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Europa de Júpiter', 3122, 3, '3.6', '3.6'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Io de Júpiter', 3660, 3, '1.8', '1.8'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Titã de Saturno', 5150, 4, '15.9', '15.9');
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Reia de Saturno', 1528, 4, '4.5', '4.5'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Encélado de Saturno', 504, 4, '1.4', '1.4'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Titânia de Urano', 1578, 5, '8.7', '8.7'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Oberon de Urano', 1523, 5, '13.5', '13.5'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Miranda de Urano', 471, 5, '1.4', '1.4'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Tritão de Netuno', 2707, 6, '5.9', '5.9'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Proteu de Netuno', 420, 6, '1.1', '1.1'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Larissa de Netuno', 208, 6, '0.5', '0.5'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Lua de Kepler-452b', 2343, 9, '14.1', '14.1');
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Lua de Gliese 581g', 1132, 10, '4.3', '4.3'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Lua de TRAPPIST-1e', 876, 11, '2.9', '2.9'); 
INSERT INTO moon VALUES (NEXTVAL('SEQ_moon'), 'Lua de Proxima Centauri b', 674, 13, '7.5', '7.5');

--Inserindo valores ficticios da tabela constellation 

INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Órion', 'Constelação de Zodíacos');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Ursa Maior', 'Constelação Circumpolar');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Centauro', 'Constelação de Hemisfério Sul');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Cisne', 'Constelação de Verão');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Escorpião', 'Constelação de Zodíaco');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Andrômeda', 'Constelação de Outono');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Leão', 'Constelação de Zodíaco');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Sagitário', 'Constelação de Zodíaco');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Cassiopeia', 'Constelação de Inverno');
INSERT INTO constellation VALUES (NEXTVAL('SEQ_constellation'), 'Dragão', 'Constelação de Hemisfério Norte');
