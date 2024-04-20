/*LOAD DATA LOCAL INFILE '~/Escritorio/mysql/arxius_de_dades.csv' INTO TABLE contacte;*/

LOAD DATA LOCAL INFILE '~/Escritorio/mysql/agenda-contacte.csv' INTO TABLE contacte;

INSERT INTO tipusvincle (id,nom_tipus) VALUES
(1,'Assessorament'),
(5,'Altres');


INSERT IGNORE INTO tipusvincle (id,nom_tipus) VALUES 
(1,'Comercial'),
(2,'Departament'),
(5,'Altres');

REPLACE INTO tipusvincle (id,nom_tipus) VALUES 
(1,'Comercial'),
(3,'Transport'),
(4,'Assessorament');

INSERT INTO reunions (id_contacte1, id_contacte2, tipus_reunio, estat, data_reunio, durada_reunio)
SELECT 
    c1.numero_telefon AS id_contacte1,
    c2.numero_telefon AS id_contacte2,
    IF(RAND() < 0.5, 'Presencial', 'Telemàtica') AS tipus_reunio,
    CASE 
        WHEN RAND() < 0.3 THEN 1 -- Pendent
        WHEN RAND() BETWEEN 0.3 AND 0.7 THEN 2 -- Realitzada
        ELSE 3 -- No realitzada
    END AS estat,
    
    DATE_ADD('2022-01-01', INTERVAL FLOOR(RAND() * DATEDIFF('2022-12-31', '2022-01-01')) DAY) AS data_reunio,
    
    FLOOR(RAND() * 8) + 1 AS durada_reunio
FROM 
    contacte c1
    CROSS JOIN contacte c2
ORDER BY RAND()
LIMIT 100;
