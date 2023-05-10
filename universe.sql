--FreeCodeCamp - Celestial Bodies 
--Projeto simples de criação de um banco sobre Corpos celestiais 
--Utilizando o SSMS 

--Excluindo um banco de dados ja existente

DROP DATABASE universe; 

--Criação Banco de Dados Universe

CREATE DATABASE universe; 

--Criação da Tabela galaxy

CREATE TABLE galaxy(
  galaxy_id VARCHAR(30) PRIMARY KEY ,
  size_galaxy NUMERIC UNIQUE, 
  age_galaxy INT,
  tips_galaxy TEXT NOT NULL,
  number_star NUMERIC NOT NULL,
  name VARCHAR(30));

 --Criação da Tabela star

 CREATE TABLE star(
  star_id VARCHAR(30) PRIMARY KEY ,
  age_star INT NOT NULL,
  size_star NUMERIC NOT NULL,
  descrition_Star VARCHAR(30) UNIQUE,
  galaxy_id VARCHAR(30),
  name VARCHAR(30)
);

--Criação da Tabela planet

CREATE TABLE planet (
  planet_id VARCHAR(30) PRIMARY KEY ,
  size_planet NUMERIC NOT NULL,
  tips_planet VARCHAR(30) UNIQUE,
  duration_rotation VARCHAR(30) NOT NULL,
  potentially_inhabited_planets BIT, 
  have_water BIT, 
  star_id VARCHAR(30),
  name VARCHAR(30)
 );

 --Criação da Tabela moon

 CREATE TABLE moon (
  moon_id VARCHAR(30) PRIMARY KEY ,
  size_moon NUMERIC UNIQUE,
  planet_id VARCHAR(30),
  duration_rotation VARCHAR(30) NOT NULL,
  duration_translation VARCHAR(30) NOT NULL,
  name VARCHAR(30)
);

--Criação da Tabela constellation

CREATE TABLE constellation (
  constellations_id VARCHAR(30) PRIMARY KEY ,
  classifications_Constellations VARCHAR(30) UNIQUE NOT NULL,
  name VARCHAR(30) NOT NULL
);

--Inserindo valores ficticios da tabela galaxy

INSERT INTO galaxy (galaxy_id, size_galaxy, age_galaxy, tips_galaxy, number_star, name) 
VALUES 
('ga1', 111, 112, 'tip1', 113,'name1'),
('ga2', 211, 212, 'tip2', 213,'name2'),
('ga3', 311, 312, 'tip3', 313,'name3'),
('ga4', 411, 412, 'tip4', 413,'name4'),
('ga5', 511, 512, 'tip5', 513,'name5'),
('ga6', 611, 612, 'tip6', 613,'name6');

--Inserindo valores ficticios da tabela star

INSERT INTO star(star_id, age_star, size_star, descrition_Star, galaxy_id, name)
VALUES 
('s1', 1, 11, 'des1', 'ga1'	, 'name1'),
('s2', 2, 22, 'des2', 'ga2'	, 'name2'),
('s3', 3, 33, 'des3', 'ga3'	, 'name3'),
('s4', 4, 44, 'des4', 'ga4'	, 'name4'),
('s5', 5, 55, 'des5', 'ga5'	, 'name5'),
('s6', 6, 66, 'des6', 'ga6'	, 'name6');

--Inserindo valores ficticios da tabela planet
 
INSERT INTO planet VALUES ('p1', 1, 't1', '1', 1, 1, 's1', 'name1');
INSERT INTO planet VALUES ('p2', 2, 't2', '2', 1, 0, 's1', 'name2');
INSERT INTO planet VALUES ('p3', 3, 't3', '3', 1, 0, 's1', 'name3');
INSERT INTO planet VALUES ('p4', 4, 't4', '4', 0, 1, 's2', 'name4');
INSERT INTO planet VALUES ('p5', 5, 't5', '5', 1, 0, 's1', 'name5');
INSERT INTO planet VALUES ('p6', 6, 't6', '6', 0, 1, 's3', 'name6');
INSERT INTO planet VALUES ('p7', 7, 't7', '7', 0, 1, 's4', 'name7');
INSERT INTO planet VALUES ('p8', 8, 't8', '8', 1, 0, 's2', 'name8');
INSERT INTO planet VALUES ('p9', 9, 't9', '9', 0, 1, 's3', 'name9');
INSERT INTO planet VALUES ('p10', 10, 't10', '10', 1, 1, 's4', 'name10');
INSERT INTO planet VALUES ('p11', 11, 't11', '11', 1, 1, 's5', 'name11');
INSERT INTO planet VALUES ('p12', 12, 't12', '12', 0, 0, 's6', 'name12');

-- Inserindo valores ficticios da tabela moon

INSERT INTO moon VALUES ('m1', 1, 'p1', 't1', 't11', 'name1');
INSERT INTO moon VALUES ('m2', 2, 'p1', 't2', 't22', 'name2'); 
INSERT INTO moon VALUES ('m3', 3, 'p1', 't3', 't33', 'name3');
INSERT INTO moon VALUES ('m4', 4, 'p2', 't4', 't44', 'name4'); 
INSERT INTO moon VALUES ('m5', 5, 'p2', 't5', 't55', 'name5');
INSERT INTO moon VALUES ('m6', 6, 'p3', 't6', 't66', 'name6'); 
INSERT INTO moon VALUES ('m7', 7, 'p3', 't7', 't77', 'name7'); 
INSERT INTO moon VALUES ('m8', 8, 'p4', 't8', 't88', 'name8'); 
INSERT INTO moon VALUES ('m9', 9, 'p4', 't9', 't99', 'name9'); 
INSERT INTO moon VALUES ('m10', 10, 'p5', 't10', 't1010', 'name10'); 
INSERT INTO moon VALUES ('m11', 11, 'p6', 't11', 't1111', 'name11'); 
INSERT INTO moon VALUES ('m12', 12, 'p7', 't12', 't1212', 'name12'); 
INSERT INTO moon VALUES ('m13', 13, 'p7', 't13', 't1313', 'name13'); 
INSERT INTO moon VALUES ('m14', 14, 'p8', 't14', 't1414', 'name14'); 
INSERT INTO moon VALUES ('m15', 15, 'p8', 't15', 't1515', 'name15'); 
INSERT INTO moon VALUES ('m16', 16, 'p9', 't16', 't1616', 'name16'); 
INSERT INTO moon VALUES ('m17', 17, 'p10', 't17', 't1717', 'name17');
INSERT INTO moon VALUES ('m18', 18, 'p10', 't18', 't1818', 'name18'); 
INSERT INTO moon VALUES ('m19', 19, 'p11', 't19', 't1919', 'name19'); 
INSERT INTO moon VALUES ('m20', 20, 'p12', 't20', 't2020', 'name20');

--Inserindo valores ficticios da tabela constellation 

INSERT INTO constellation VALUES ('const1', 'class1', 'name1');
INSERT INTO constellation VALUES ('const2', 'class2', 'name2');
INSERT INTO constellation VALUES ('const3', 'class3', 'name3');
INSERT INTO constellation VALUES ('const4', 'class4', 'name4');
INSERT INTO constellation VALUES ('const5', 'class5', 'name5');
INSERT INTO constellation VALUES ('const6', 'class6', 'name6');
INSERT INTO constellation VALUES ('const7', 'class7', 'name7');
INSERT INTO constellation VALUES ('const8', 'class8', 'name8');
INSERT INTO constellation VALUES ('const9', 'class9', 'name9');
INSERT INTO constellation VALUES ('const10', 'class10', 'name10');

--Referenciando as PRIMARY KEY's

ALTER TABLE star
ADD CONSTRAINT star_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);

ALTER TABLE planet 
ADD CONSTRAINT planet_star_id FOREIGN KEY (star_id) REFERENCES star(star_id); 

ALTER TABLE planet 
ADD CONSTRAINT PK_planet_planet_id FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

ALTER TABLE moon
ADD CONSTRAINT moon_planet_id FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

