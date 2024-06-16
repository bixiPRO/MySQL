LOAD DATA LOCAL INFILE '~/consensionari/marcas.csv' INTO TABLE marca FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (id_marca,nom);

LOAD DATA LOCAL INFILE '~/consensionari/model.csv' INTO TABLE model FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (nom,id_marca);

UPDATE model m
JOIN marca ma ON (m.id_marca = ma.id_marca) 
SET m.id_marca = ma.id_marca;

LOAD DATA LOCAL INFILE '~/consensionari/motor.csv' INTO TABLE motor FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (tipus);

LOAD DATA LOCAL INFILE '~/consensionari/color.csv' INTO TABLE color FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (nom);

DROP TEMPORARY TABLE IF EXISTS motors;
CREATE TEMPORARY TABLE motors(
	numero_serie varchar(17) PRIMARY KEY UNIQUE,
	motor enum('gasolina','diesel','gas','hibrid','electric','gasoil','altres')
)ENGINE=InnoDB;;

LOAD DATA LOCAL INFILE '~/consensionari/coches.csv' INTO TABLE motors FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (numero_serie, @dummy, motor, @dummy, @dummy, @dummy, @dummy, @dummy,@dummy, @dummy);

LOAD DATA LOCAL INFILE '~/consensionari/coches.csv' INTO TABLE cotxe FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (numero_serie, id_marca, @dummy, potencia_CV, personalitzat, estat, disponible, any_fabricació, id_color, imatge);

UPDATE cotxe c
JOIN motors m ON (c.numero_serie = m.numero_serie) JOIN motor mo ON(m.motor=mo.tipus) 
SET c.id_motor = mo.id_motor;

DROP TEMPORARY TABLE IF EXISTS motors;

UPDATE cotxe c
JOIN color co ON (c.id_color = co.nom) 
SET c.id_color = co.nom;

UPDATE cotxe c
JOIN marca m ON (c.id_marca = m.id_marca) 
SET c.id_marca = m.id_marca;

UPDATE cotxe
SET Etiqueta_enviental = CASE
    WHEN FLOOR(1 + (RAND() * 6)) = 1 THEN 'CERO'
    WHEN FLOOR(1 + (RAND() * 6)) = 2 THEN 'ECO'
    WHEN FLOOR(1 + (RAND() * 6)) = 3 THEN 'C'
    WHEN FLOOR(1 + (RAND() * 6)) = 4 THEN 'B'
    WHEN FLOOR(1 + (RAND() * 6)) = 5 THEN 'A'
    ELSE 'altres'
END;

LOAD DATA LOCAL INFILE '~/consensionari/clients.csv' INTO TABLE client_reserva FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (numero_serie,DNI,nom,cognom,telefon,adreça,data_reserva);

UPDATE client_reserva cr
JOIN cotxe c ON cr.numero_serie = c.numero_serie
SET cr.numero_serie = c.numero_serie
WHERE c.disponible = 'pendent';

LOAD DATA LOCAL INFILE '~/consensionari/model_cotxe.csv' INTO TABLE tipus FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (@dummy,@dummy,tipus);

DROP TEMPORARY TABLE IF EXISTS relaciocotxe;
CREATE TEMPORARY TABLE relaciocotxe(
	numero_serie VARCHAR(17) UNIQUE PRIMARY KEY,
	nom_model VARCHAR(150),
	nom_tipus VARCHAR(50)
)ENGINE=InnoDB;

LOAD DATA LOCAL INFILE '~/consensionari/model_cotxe.csv' INTO TABLE relaciocotxe FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (numero_serie,nom_model,nom_tipus);

INSERT INTO modeltipuscotxe (numero_serie, id_model, id_tipus)
SELECT r.numero_serie, m.id_model, t.id_tipus
FROM relaciocotxe r
JOIN model m ON (r.nom_model = m.nom)
JOIN tipus t ON (r.nom_tipus = t.tipus)
JOIN cotxe c ON(c.numero_serie=r.numero_serie) WHERE m.id_marca=c.id_marca;

DROP TEMPORARY TABLE IF EXISTS relaciocotxe;

INSERT INTO nou(numero_serie)
SELECT numero_serie FROM cotxe WHERE estat='nou';

UPDATE nou
SET preucompra = FLOOR(8000 + (RAND() * (200000 - 8000 + 1)));

UPDATE nou
SET preuventa = preucompra * 1.35;


INSERT INTO segona_ma(numero_serie)
SELECT numero_serie FROM cotxe WHERE estat='segona ma';

UPDATE segona_ma
SET preucompra = FLOOR(8000 + (RAND() * (200000 - 8000 + 1)));

UPDATE segona_ma
SET preuventa = preucompra * 1.20;

UPDATE segona_ma
SET km = FLOOR(000001 + (RAND() * (999999 - 000001)));

UPDATE segona_ma
SET reparat = CASE
    WHEN FLOOR(1 + (RAND() * 2)) = 1 THEN 'no'
    ELSE 'si'
END;

LOAD DATA LOCAL INFILE '~/consensionari/descripcio.csv' INTO TABLE modificacio FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' LINES TERMINATED BY '\n' IGNORE 1 LINES (numero_serie,descripcio);

UPDATE modificacio m
JOIN cotxe c ON (c.numero_serie = m.numero_serie) 
SET m.numero_serie = c.numero_serie;


DROP TEMPORARY TABLE IF EXISTS relacio;
CREATE TEMPORARY TABLE relacio (
	nom_model VARCHAR(150),
	nom_tipus VARCHAR(50)
)ENGINE=InnoDB;

LOAD DATA LOCAL INFILE '~/consensionari/model_cotxe.csv' INTO TABLE relacio FIELDS TERMINATED BY ',' enclosed by '"' escaped by '"' IGNORE 1 LINES (@dummy,nom_model,nom_tipus);

INSERT INTO tipus_model (id_model, id_tipus)
SELECT m.id_model, t.id_tipus
FROM relacio r
JOIN model m ON (r.nom_model = m.nom)
JOIN tipus t ON (r.nom_tipus = t.tipus);


DROP TEMPORARY TABLE IF EXISTS relacio;


UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/celica.jpg')
WHERE numero_serie = '4E5ABCJK98Y457610';

SELECT imatge FROM cotxe WHERE numero_serie = '4E5ABCJK98Y457610' INTO DUMPFILE '/tmp/celica.jpg';


UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/844.jpeg')
WHERE numero_serie = '6Q7PQRST78M679832';

SELECT imatge FROM cotxe WHERE numero_serie = '6Q7PQRST78M679832' INTO DUMPFILE '/tmp/844.jpeg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/ASX.jpeg')
WHERE numero_serie = '6G7HIJKL76W679832';

SELECT imatge FROM cotxe WHERE numero_serie = '6G7HIJKL76W679832' INTO DUMPFILE '/tmp/ASX.jpeg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/buzz.jpeg')
WHERE numero_serie = '8I9RSTUV12U891054';

SELECT imatge FROM cotxe WHERE numero_serie = '8I9RSTUV12U891054' INTO DUMPFILE '/tmp/buzz.jpeg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/civic.JPG')
WHERE numero_serie = '3D4UVWXY78T349589';

SELECT imatge FROM cotxe WHERE numero_serie = '3D4UVWXY78T349589' INTO DUMPFILE '/tmp/civic.JPG';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/corolla.png')
WHERE numero_serie = '5F6DEFGH34X568721';

SELECT imatge FROM cotxe WHERE numero_serie = '5F6DEFGH34X568721' INTO DUMPFILE '/tmp/corolla.png';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/fiesta.jpg')
WHERE numero_serie = '1B2KLMNR87Q123567';

SELECT imatge FROM cotxe WHERE numero_serie = '1B2KLMNR87Q123567' INTO DUMPFILE '/tmp/fiesta.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/gtr.jpg')
WHERE numero_serie = '9T0FGHIJ34J902165';

SELECT imatge FROM cotxe WHERE numero_serie = '9T0FGHIJ34J902165' INTO DUMPFILE '/tmp/gtr.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/lancer.jpeg')
WHERE numero_serie = '5F6DEFGH34X568721';

SELECT imatge FROM cotxe WHERE numero_serie = '5F6DEFGH34X568721' INTO DUMPFILE '/tmp/lancer.jpeg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/modelot.jpg')
WHERE numero_serie = '0O1KLMNO56Z013276';

SELECT imatge FROM cotxe WHERE numero_serie = '0O1KLMNO56Z013276' INTO DUMPFILE '/tmp/modelot.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/primastar.jpg')
WHERE numero_serie = '8M9ABCDE12Q891054';

SELECT imatge FROM cotxe WHERE numero_serie = '8M9ABCDE12Q891054' INTO DUMPFILE '/tmp/primastar.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/z4.png')
WHERE numero_serie = '9X0FGHIJ34Q902165';

SELECT imatge FROM cotxe WHERE numero_serie = '9X0FGHIJ34Q902165' INTO DUMPFILE '/tmp/z4.png';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/A8.jpg')
WHERE numero_serie = '4C5FGHIJ34L457610';

SELECT imatge FROM cotxe WHERE numero_serie = '4C5FGHIJ34L457610' INTO DUMPFILE '/tmp/A8.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/asx.jpg')
WHERE numero_serie = '6O7PQRST78Z679832';

SELECT imatge FROM cotxe WHERE numero_serie = '6O7PQRST78Z679832' INTO DUMPFILE '/tmp/asx.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/claseE.jpg')
WHERE numero_serie = '2U3VWXYZ90T235498';

SELECT imatge FROM cotxe WHERE numero_serie = '2U3VWXYZ90T235498' INTO DUMPFILE '/tmp/claseE.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/escort.jpg')
WHERE numero_serie = '0C1KLMNO56L013276';

SELECT imatge FROM cotxe WHERE numero_serie = '0C1KLMNO56L013276' INTO DUMPFILE '/tmp/escort.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/golf.jpg')
WHERE numero_serie = '9R0FGHIJ34W902165';

SELECT imatge FROM cotxe WHERE numero_serie = '9R0FGHIJ34W902165' INTO DUMPFILE '/tmp/golf.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/hondaE.jpg')
WHERE numero_serie = '3L4ABCDE12C346509';

SELECT imatge FROM cotxe WHERE numero_serie = '3L4ABCDE12C346509' INTO DUMPFILE '/tmp/hondaE.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/pajero.jpg')
WHERE numero_serie = '6I7PQRST78F679832';

SELECT imatge FROM cotxe WHERE numero_serie = '6I7PQRST78F679832' INTO DUMPFILE '/tmp/pajero.jpg';

UPDATE cotxe
SET imatge = LOAD_FILE('/var/lib/mysql/concessionari/fotos/tiguan.jpg')
WHERE numero_serie = '8K9ABCDE12D891054';

SELECT imatge FROM cotxe WHERE numero_serie = '8K9ABCDE12D891054' INTO DUMPFILE '/tmp/tiguan.jpg';

UPDATE cotxe
SET imatge = SUBSTR(imatge,1,20);
