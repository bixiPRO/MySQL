clear;
/** fer un cat el carregar el .sql del .txt */
pager cat | tee -a venedor.txt
/** utilitzar la base de dades usuari */
USE usuari;

/** TAULA COMANDES*/
/** posar doble select per 1 mostrar quan estigui en .txt i altre per executar la comanda */
SELECT 'SELECT * FROM comandes;' AS 'QUERY 1'\G
SELECT * FROM comandes;

SELECT 'INSERT INTO comandes VALUES ("120000" ,"comanda prova", "2022-01-24" ,"2102" ,"101" ,"21" ,"0");' AS 'QUERY 2'\G
INSERT INTO comandes VALUES ('120000' ,'comanda prova', '2022-01-24' ,'2102' ,'101' ,'21' ,'0');
/** he fet select del insert del nou registre per la verificació*/
SELECT 'SELECT * FROM comandes WHERE num_comanda="120000";' AS 'QUERY 3'\G
SELECT * FROM comandes WHERE num_comanda='120000';

SELECT 'UPDATE comandes SET dte = 20 WHERE num_comanda BETWEEN "112000" AND "113000";' AS 'QUERY 4'\G
UPDATE comandes SET dte = 20 WHERE num_comanda BETWEEN '112000' AND '113000';
/** he fet select del update realitzat per la verificació*/
SELECT 'SELECT * FROM comandes WHERE num_comanda BETWEEN "112000" AND "113000";' AS 'QUERY 5'\G
SELECT * FROM comandes WHERE num_comanda BETWEEN '112000' AND '113000';

/** TAULA DETALL*/
/** posar doble select per 1 mostrar quan estigui en .txt i altre per executar la comanda */
SELECT 'SELECT * FROM detall;' AS 'QUERY 6'\G
SELECT * FROM detall;

SELECT 'INSERT INTO detall VALUES ("112885" ,"rei", "2a44g", "32" ,"300");' AS 'QUERY 7'\G
INSERT INTO detall VALUES ('112885' ,'rei', '2a44g', '32' ,'300');
/** he fet select del insert del nou registre per la verificació*/
SELECT 'SELECT * FROM detall WHERE num_comanda="112885";' AS 'QUERY 8'\G
SELECT * FROM detall WHERE num_comanda='112885';

SELECT 'UPDATE detall SET quantitat = 50 WHERE producte="41004";' AS 'QUERY 9'\G
UPDATE detall SET quantitat = 50 WHERE producte='41004';
/** he fet select del update realitzat per la verificació*/
SELECT 'SELECT * FROM detall WHERE producte="41004";' AS 'QUERY 10'\G
SELECT * FROM detall WHERE producte='41004';


/** TAULA PRODUCTES*/
/** posar doble select per 1 mostrar quan estigui en .txt i altre per executar la comanda */
SELECT 'SELECT * FROM productes;' AS 'QUERY 11'\G
SELECT * FROM productes;

SELECT 'INSERT INTO productes VALUES ("pro" ,"d4534x", "mouse", "32" ,"280", "2024-05-19", "mouse.png");' AS 'QUERY 2'\G
INSERT INTO productes VALUES ('pro' ,'d4534x', 'mouse', '32' ,'280', '2024-05-19', 'mouse.png');
/** he fet select del insert del nou registre per la verificació*/
SELECT 'SELECT * FROM productes WHERE imatge="mouse.png";' AS 'QUERY 3'\G
SELECT * FROM productes WHERE imatge='mouse.png';

nopager;
notee;
