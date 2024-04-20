LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE actors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,actor);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE directors 
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,director);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE generes
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(@dummy,@dummy,@dummy,@dummy,genere);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE paisos
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(@dummy,@dummy,@dummy,@dummy,@dummy,pais);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE pelicules
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(id_movie,titol,any,vots,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE estudis
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,estudis,@dummy,@dummy);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE rols
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,rol);


DROP TEMPORARY TABLE IF EXISTS taula_universal;
CREATE TEMPORARY TABLE IF NOT EXISTS taula_universal(
    id_movie INT PRIMARY KEY,
    titol VARCHAR(36),
    any INT,
    vots INT,
    genere VARCHAR(25),
    pais VARCHAR(36),
    director VARCHAR(100),
    estudis VARCHAR(50),
    actor VARCHAR(36),
    rol VARCHAR(50)
);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE taula_universal
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(id_movie,titol,any,vots,genere,pais,director,estudis,actor,rol);

DELETE FROM pelicules;
INSERT INTO pelicules(id_movie,titol,any,vots,id_estudis)
SELECT tu.id_movie, tu.titol, tu.any, tu.vots,(SELECT id_estudis FROM estudis e WHERE e.estudis=tu.estudis) AS id_estudis FROM taula_universal tu ORDER BY tu.id_movie;

INSERT INTO pelicules_generes
SELECT pelicules.id_movie,generes.id_genere FROM taula_universal JOIN pelicules ON (taula_universal.id_movie = pelicules.id_movie) JOIN generes ON (taula_universal.genere = generes.genere) order by pelicules.id_movie;

INSERT INTO pelicules_paisos
SELECT pelicules.id_movie,paisos.id_pais FROM taula_universal JOIN pelicules ON (taula_universal.id_movie = pelicules.id_movie) JOIN paisos ON (taula_universal.pais = paisos.pais) order by pelicules.id_movie;

INSERT INTO pelicules_directors
SELECT pelicules.id_movie,directors.id_director FROM taula_universal JOIN pelicules ON (taula_universal.id_movie = pelicules.id_movie) JOIN directors ON (taula_universal.director = directors.director) order by pelicules.id_movie;

UPDATE actors SET actor = NULLIF(actor, '') WHERE actor = '';
UPDATE generes SET genere = NULLIF(genere, '') WHERE genere = '';
UPDATE directors SET director = NULLIF(director, '') WHERE director = '';
UPDATE estudis SET estudis = NULLIF(estudis, '') WHERE estudis = '';
UPDATE paisos SET pais = NULLIF(pais, '') WHERE pais = '';
UPDATE rols SET rol = NULLIF(rol, '') WHERE rol = '';
UPDATE pelicules SET id_movie = NULLIF(id_movie, '') WHERE id_movie = '';

UPDATE estudis
SET estudis = REPLACE(REPLACE(SUBSTRING_INDEX(estudis, ',', 1), '[', ''),'"', '')
WHERE estudis LIKE '%"%' OR estudis LIKE '"%';

UPDATE directors
SET director = REPLACE(REPLACE(REPLACE(director, '"', ''),'[', ''),']', '')
WHERE director LIKE '%"%' OR director LIKE '"%';

DROP TEMPORARY TABLE IF EXISTS taula_universal;


DROP TEMPORARY TABLE IF EXISTS universal_rols;
CREATE TEMPORARY TABLE IF NOT EXISTS universal_rols(
  id_movie INT NOT NULL,
  titol VARCHAR(50) NOT NULL,
  any INT,
  vots INT,
  genere VARCHAR(25),
  pais VARCHAR(36),
  director VARCHAR(100),
  estudis VARCHAR(50),
  actor VARCHAR(36),
  rol VARCHAR(50),
  id_prova INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(id_prova)
);

LOAD DATA LOCAL INFILE '~/Escritorio/movies/raspi_json_movies.csv' INTO TABLE universal_rols
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DELETE FROM rols;
INSERT INTO rols
SELECT universal_rols.id_movie,actors.id_actor,universal_rols.rol  FROM universal_rols JOIN pelicules ON (universal_rols.id_movie = pelicules.id_movie) JOIN actors ON (universal_rols.actor = actors.actor) order by pelicules.id_movie;

DROP TEMPORARY TABLE IF EXISTS universal_rols;
