clear;
/** fer un cat el carregar el .sql del .txt */
pager cat | tee -a gerent.txt
/** utilitzar la base de dades usuari */
USE usuari;

/** TAULA VENEDORS*/
/** posar doble select per 1 mostrar quan estigui en .txt i altre per executar la comanda */
SELECT 'SELECT * FROM venedors;' AS 'QUERY 1'\G
SELECT * FROM venedors;

SELECT 'DELETE FROM venedors WHERE quota = "300000";' AS 'QUERY 2'\G
DELETE FROM venedors WHERE quota = '300000';
/** he fet select per la verificacio del delete*/
SELECT 'SELECT * FROM venedors WHERE quota BETWEEN "290000" AND "400000";' AS 'QUERY 3'\G
SELECT * FROM venedors WHERE quota BETWEEN '290000' AND '400000';

/** TAULA COMANDES*/
SELECT 'SELECT * FROM comandes;' AS 'QUERY 4'\G
SELECT * FROM comandes;

SELECT 'DELETE FROM comandes WHERE descripcio = "Comanda client VIP";' AS 'QUERY 5'\G
DELETE FROM comandes WHERE descripcio = 'Comanda client VIP';
/** he fet select de distint descripcio que hi ha en la taula comandes per la verificacio del delete*/
SELECT 'SELECT DISTINCT(descripcio) FROM comandes;' AS 'QUERY 6'\G
SELECT DISTINCT(descripcio) FROM comandes;

/** CREACIÓ TAULA GERENCIA*/
/** Eliminar la taula si ja existeix per evitar problemes de repetició*/
SELECT 'DROP TABLE IF EXISTS gerencia;' AS 'QUERY 7'\G
DROP TABLE IF EXISTS gerencia;
/** Crear la taula gerencia amb la id que es autoincremental i el nom*/
SELECT 'CREATE TABLE gerencia(
	id_gerencia INT PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(55)
);'AS 'QUERY 8'\G
CREATE TABLE gerencia(
	id_gerencia INT PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(55)
);
nopager;
notee;
