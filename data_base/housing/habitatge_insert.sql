LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_barcelona.csv' 
INTO TABLE vivenda
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(descripcio,@dummy,@dummy,num_banys,@dummy,@dummy,estat,any_construccio,@dummy,@dummy,@dummy,@dummy,id_vivenda,@dummy,@dummy,@dummy,@dummy,sup_vivenda,sup_terrasa,data_actualitzada,preu_venda,num_dormitori,@dummy,@dummy,@dummy,disponible_llogar);

UPDATE vivenda
SET estat = 
    CASE
        WHEN estat = 'segunda mano/buen estado' THEN 'Nova'
        WHEN estat = 'segunda mano/para reformar' THEN 'Reformada'
        WHEN estat = 'promoción de obra nueva' THEN 'Cal reformar'
        ELSE 'NULL'
    END;

UPDATE vivenda
SET disponible_llogar = 
    CASE
        WHEN RAND() > 0.5 THEN 'SI'
        ELSE 'NO'
    END;
    
UPDATE vivenda
SET any_construccio = 
    CASE
        WHEN any_construccio = '' THEN 'NULL'
        ELSE any_construccio
    END;
 
UPDATE vivenda
SET sup_terrasa = 
    CASE
        WHEN sup_terrasa = '' THEN 'NULL'
        ELSE sup_terrasa
    END;

LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_girona.csv' 
INTO TABLE vivenda
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(descripcio,@dummy,@dummy,num_banys,@dummy,@dummy,estat,any_construccio,@dummy,@dummy,@dummy,@dummy,id_vivenda,@dummy,@dummy,@dummy,@dummy,sup_vivenda,sup_terrasa,data_actualitzada,preu_venda,num_dormitori,@dummy,@dummy,@dummy,disponible_llogar);

UPDATE vivenda
SET estat = 
    CASE
        WHEN estat = 'segunda mano/buen estado' THEN 'Nova'
        WHEN estat = 'segunda mano/para reformar' THEN 'Reformada'
        WHEN estat = 'promoción de obra nueva' THEN 'Cal reformar'
        ELSE 'NULL'
    END;
    
UPDATE vivenda
SET disponible_llogar = 
    CASE
        WHEN RAND() > 0.5 THEN 'SI'
        ELSE 'NO'
    END;

UPDATE vivenda
SET any_construccio = 
    CASE
        WHEN any_construccio = '' THEN 'NULL'
        ELSE any_construccio
    END;
    
UPDATE vivenda
SET sup_terrasa = 
    CASE
        WHEN sup_terrasa = '' THEN 'NULL'
        ELSE sup_terrasa
    END;
    
LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_barcelona.csv' 
INTO TABLE caracteristiques_addicionals
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,aire_condicionat,@dummy,@dummy, mobles,xemeneia,@dummy, @dummy,@dummy, parquing,@dummy, calefacció,id_vivenda,@dummy,ascensor, @dummy,@dummy, @dummy,@dummy, @dummy, @dummy,@dummy, traster,piscina,@dummy, @dummy);

UPDATE caracteristiques_addicionals
SET aire_condicionat = 
    CASE
        WHEN aire_condicionat = 1 THEN 'SI'
        ELSE 'NO'
    END;
    
UPDATE caracteristiques_addicionals
SET mobles = 
    CASE
        WHEN mobles = 1 THEN 'SI'
        ELSE 'NO'
    END;

UPDATE caracteristiques_addicionals
SET xemeneia = 
    CASE
        WHEN xemeneia = 1 THEN 'SI'
        ELSE 'NO'
    END;
    
UPDATE caracteristiques_addicionals
SET ascensor = 
    CASE
        WHEN ascensor = 1 THEN 'SI'
        ELSE 'NO'
    END;

UPDATE caracteristiques_addicionals
SET piscina = 
    CASE
        WHEN piscina = 1 THEN 'SI'
        ELSE 'NO'
    END;
    
UPDATE caracteristiques_addicionals
SET traster = 
    CASE
        WHEN traster = 1 THEN 'SI'
        ELSE 'NO'
    END;
    
    
LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_girona.csv' 
INTO TABLE caracteristiques_addicionals
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,aire_condicionat,@dummy,@dummy, mobles,xemeneia,@dummy, @dummy,@dummy, parquing,@dummy, calefacció,id_vivenda,@dummy,ascensor, @dummy,@dummy, @dummy,@dummy, @dummy, @dummy,@dummy, traster,piscina,@dummy, @dummy);

UPDATE caracteristiques_addicionals
SET aire_condicionat = 
    CASE
        WHEN aire_condicionat = 1 THEN 'SI'
        ELSE 'NO'
    END;
    
UPDATE caracteristiques_addicionals
SET mobles = 
    CASE
        WHEN mobles = 1 THEN 'SI'
        ELSE 'NO'
    END;

UPDATE caracteristiques_addicionals
SET xemeneia = 
    CASE
        WHEN xemeneia = 1 THEN 'SI'
        ELSE 'NO'
    END;
    
UPDATE caracteristiques_addicionals
SET ascensor = 
    CASE
        WHEN ascensor = 1 THEN 'SI'
        ELSE 'NO'
    END;

UPDATE caracteristiques_addicionals
SET piscina = 
    CASE
        WHEN piscina = 1 THEN 'SI'
        ELSE 'NO'
    END;
    
UPDATE caracteristiques_addicionals
SET traster = 
    CASE
        WHEN traster = 1 THEN 'SI'
        ELSE 'NO'
    END; 

LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_barcelona.csv' 
INTO TABLE energia
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,@dummy,@dummy, @dummy,@dummy,@dummy, @dummy,@dummy, @dummy,@dummy, @dummy,id_vivenda,@dummy,@dummy, @dummy,@dummy, @dummy,@dummy, @dummy, @dummy,@dummy, @dummy,@dummy,@dummy, @dummy);

UPDATE energia
SET consum_energetic_KWh = ROUND(RAND() * 10, 2),
    emissio_energetic_percentatge = ROUND(RAND() * 100);

UPDATE energia
SET certificat_electric = 
    CASE ROUND(RAND() * 6) + 1
        WHEN 1 THEN 'A'
        WHEN 2 THEN 'B'
        WHEN 3 THEN 'C'
        WHEN 4 THEN 'D'
        WHEN 5 THEN 'E'
        WHEN 6 THEN 'F'
        ELSE 'G'
    END;

LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_girona.csv' 
INTO TABLE energia
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,@dummy,@dummy, @dummy,@dummy,@dummy, @dummy,@dummy, @dummy,@dummy, @dummy,id_vivenda,@dummy,@dummy, @dummy,@dummy, @dummy,@dummy, @dummy, @dummy,@dummy, @dummy,@dummy,@dummy, @dummy);

UPDATE energia
SET consum_energetic_KWh = ROUND(RAND() * 10, 2),
    emissio_energetic_percentatge = ROUND(RAND() * 100);

UPDATE energia
SET certificat_electric = 
    CASE ROUND(RAND() * 6) + 1
        WHEN 1 THEN 'A'
        WHEN 2 THEN 'B'
        WHEN 3 THEN 'C'
        WHEN 4 THEN 'D'
        WHEN 5 THEN 'E'
        WHEN 6 THEN 'F'
        ELSE 'G'
    END;

DROP TEMPORARY TABLE IF EXISTS casa_pis;
CREATE TEMPORARY TABLE casa_pis(
	id_vivenda INT PRIMARY KEY,
	tipus VARCHAR(100),
	plantes VARCHAR(100),
	sup_garatge DECIMAL(10,2),
	sup_jardi DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_barcelona.csv' 
INTO TABLE casa_pis
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,@dummy,@dummy, @dummy,@dummy,@dummy, @dummy,plantes, @dummy,@dummy, @dummy,id_vivenda,tipus,@dummy, @dummy,@dummy, @dummy,@dummy, @dummy, @dummy,@dummy, @dummy,@dummy,@dummy, @dummy);
    
LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_girona.csv' 
INTO TABLE casa_pis
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,@dummy,@dummy, @dummy,@dummy,@dummy, @dummy,plantes, @dummy,@dummy, @dummy,id_vivenda,tipus,@dummy, @dummy,@dummy, @dummy,@dummy, @dummy, @dummy,@dummy, @dummy,@dummy,@dummy, @dummy);

UPDATE casa_pis
SET sup_garatge = ROUND(RAND() * 10, 2),
    sup_jardi = ROUND(RAND() * 10,2);
    
INSERT INTO casa (id_vivenda, tipus, plantes, sup_garatge, sup_jardi)
SELECT id_vivenda, tipus, plantes, sup_garatge, sup_jardi
FROM casa_pis
WHERE tipus IN (' Casa de pueblo',' Casa o chalet independiente',' Chalet adosado ',' Finca rústica ',' Torre',' Chalet pareado',' Casa o chalet','Casa rural',' Castillo',' Masía',' Casa terrera',' Caserón',' Palacio');

INSERT INTO pis (id_vivenda, tipus, plantes)
SELECT id_vivenda, tipus, plantes
FROM casa_pis
WHERE tipus IN ('Piso','Ático','Dúplex','Estudio','Loft');

DROP TEMPORARY TABLE IF EXISTS casa_pis;

LOAD DATA LOCAL INFILE '~/Escritorio/A9/provincia.csv' 
INTO TABLE provincia
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_provincia, nom_catala, nom_oficial,id_comunitat_autonoma,nom_ccaa);

DROP TEMPORARY TABLE IF EXISTS ids;
CREATE TEMPORARY TABLE ids (
    id_municipi INT PRIMARY KEY,
    nom_municipi VARCHAR(48),
    id_provincia INT,
    nom_provincia VARCHAR(48),
    id_comarca INT,
    nom_comarca VARCHAR(48),
    utmX INT,
    utmY INT,
    longitud DECIMAL(9,6),
    latitud DECIMAL(9,6),
    point VARCHAR(255)
);

LOAD DATA LOCAL INFILE '~/Escritorio/A9/municipi_com_prov.csv' 
INTO TABLE ids
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_municipi,nom_municipi,id_provincia,nom_provincia,id_comarca,nom_comarca,utmX,utmY,longitud,latitud,point);

INSERT INTO municipi (id_municipi, nom_municipi, id_provincia,nom_provincia,utmX,utmY,longitud,latitud,point)
SELECT id_municipi, nom_municipi, id_provincia,nom_provincia,utmX,utmY,longitud,latitud,point
FROM ids;

UPDATE municipi AS m
JOIN ids AS i ON (m.id_municipi = i.id_municipi)
SET m.id_municipi = i.id_municipi;

UPDATE municipi
SET id_ine = CONCAT(id_provincia,id_municipi);

DROP TEMPORARY TABLE IF EXISTS ids;


DROP TEMPORARY TABLE IF EXISTS provincia_comarca;
CREATE TEMPORARY TABLE provincia_comarca (
    id_provincia INT,
    id_comarca INT PRIMARY KEY,
    nom_comarca VARCHAR(48)
);

LOAD DATA LOCAL INFILE '~/Escritorio/A9/municipi_com_prov.csv' 
INTO TABLE provincia_comarca
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,id_provincia,@dummy,id_comarca,nom_comarca,@dummy,@dummy,@dummy,@dummy,@dummy);


INSERT INTO comarca (id_comarca, id_provincia, nom_comarca)
SELECT id_comarca, id_provincia, nom_comarca
FROM provincia_comarca;


UPDATE comarca  c
INNER JOIN provincia_comarca AS pc ON (c.id_comarca= pc.id_comarca)
SET c.id_provincia = pc.id_provincia;

DROP TEMPORARY TABLE IF EXISTS provincia_comarca;

DROP TEMPORARY TABLE IF EXISTS viv_mun;
CREATE TEMPORARY TABLE viv_mun(
	id_vivenda INT PRIMARY KEY,
	nom_municipi VARCHAR(100)
);

LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_barcelona.csv' 
INTO TABLE viv_mun
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,id_vivenda,@dummy,@dummy,nom_municipi,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy);

LOAD DATA LOCAL INFILE '~/Escritorio/A9/houses_girona.csv' 
INTO TABLE viv_mun
CHARACTER SET utf8mb3
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,id_vivenda,@dummy,@dummy,nom_municipi,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy);


INSERT INTO vivenda_municipi(id_vivenda, id_municipi)
SELECT id_vivenda, id_municipi
FROM municipi m
JOIN viv_mun vm ON (m.nom_municipi=vm.nom_municipi);


DROP TEMPORARY TABLE IF EXISTS viv_mun;



