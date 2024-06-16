clear;
/** fer un cat el carregar el .sql del .txt */
pager cat | tee -a director.txt
/** utilitzar la base de dades usuari */
USE usuari;
/**TAULA VENEDORS*/

/** posar doble select per 1 mostrar quan estigui en .txt i altre per executar la comanda */
SELECT 'SELECT * FROM venedors;' AS 'QUERY 1'\G
SELECT * FROM venedors;

SELECT 'DELETE FROM venedors WHERE nom = "Bill Adams";' AS 'QUERY 2'\G
DELETE FROM venedors WHERE nom = 'Bill Adams';

/** he fet select per la verificacio del delete si no surt cap registre es que s'ha eliminat correctament*/
SELECT 'SELECT * FROM venedors WHERE nom="Bill Adams";' AS 'QUERY 3'\G
SELECT * FROM venedors WHERE nom="Bill Adams";

/**TAULA COMANDES*/
SELECT 'SELECT * FROM comandes;' AS 'QUERY 4'\G
SELECT * FROM comandes;

SELECT 'INSERT INTO comandes VALUES ("113100" ,"comanda prova", "2021-01-22" ,"2102" ,"101" ,"21" ,"0");' AS 'QUERY 5'\G
INSERT INTO comandes VALUES ('113100' ,'comanda prova', '2021-01-22' ,'2102','101' ,'21' ,'0');

/** he fet select del insert del nou registre per la verificació*/
SELECT 'SELECT * FROM comandes WHERE num_comanda="113100";' AS 'QUERY 6'\G
SELECT * FROM comandes WHERE num_comanda='113100';

SELECT 'DELETE FROM comandes WHERE descripcio = "Autoservei";' AS 'QUERY 7'\G
DELETE FROM comandes WHERE descripcio = 'Autoservei';

/** he fet select per la verificacio del delete si no surt cap registre es que s'ha eliminat correctament*/
SELECT 'SELECT * FROM comandes WHERE descripcio = "Autoservei";' AS 'QUERY 8'\G
SELECT * FROM comandes WHERE descripcio = 'Autoservei';


nopager;
notee;
