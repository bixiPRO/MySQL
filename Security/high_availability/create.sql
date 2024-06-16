/** En postgre sql he creat algunes taules si no existeixen i en postgresql no s'utilitza AUTO_INCREMENT sino SERIAL que fa la mateixa funció*/
CREATE TABLE IF NOT EXISTS persones (
	id_persones SERIAL PRIMARY KEY,
	nom VARCHAR(55)
);

CREATE TABLE IF NOT EXISTS prova (
	id_prova SERIAL PRIMARY KEY,
	nom VARCHAR(55)
);

CREATE TABLE IF NOT EXISTS prova2 (
	id_prova2 SERIAL PRIMARY KEY,
	nom VARCHAR(55)
);

CREATE TABLE IF NOT EXISTS prova3 (
	id_prova3 SERIAL PRIMARY KEY,
	nom VARCHAR(55)
);
