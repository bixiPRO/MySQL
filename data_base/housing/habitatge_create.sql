DROP DATABASE IF EXISTS HABITATGE;
CREATE DATABASE IF NOT EXISTS HABITATGE;
USE HABITATGE;

CREATE TABLE vivenda(
	id_vivenda INT PRIMARY KEY,
	num_dormitori INT,
	num_banys INT,
	sup_vivenda INT DEFAULT NULL,
	sup_terrasa VARCHAR(5) DEFAULT NULL,
	any_construccio VARCHAR(4) DEFAULT NULL,
	estat VARCHAR(100),
	preu_venda INT,
	disponible_llogar ENUM('SI','NO') DEFAULT NULL,
	descripcio VARCHAR(140),
	data_actualitzada DATE
)engine=InnoDB;

CREATE TABLE casa(
	id_vivenda INT PRIMARY KEY,
	tipus ENUM(' Casa de pueblo',' Casa o chalet independiente',' Chalet adosado ',' Finca rústica ',' Torre',' Chalet pareado',' Casa o chalet','Casa rural',' Castillo',' Masía',' Casa terrera',' Caserón',' Palacio'),
	plantes VARCHAR(100),
	sup_garatge DECIMAL(10,2),
	sup_jardi DECIMAL(10,2),
	FOREIGN KEY(id_vivenda) REFERENCES vivenda(id_vivenda)
);

CREATE TABLE pis(
	id_vivenda INT PRIMARY KEY,
	tipus ENUM('Piso','Ático','Dúplex','Estudio','Loft'),
	plantes VARCHAR(100),
	FOREIGN KEY(id_vivenda) REFERENCES vivenda(id_vivenda)
);

CREATE TABLE caracteristiques_addicionals(
	id_vivenda INT PRIMARY KEY,
	aire_condicionat ENUM('SI','NO'),
	ascensor ENUM('SI','NO'),
	calefacció VARCHAR(255),
	mobles ENUM('SI','NO'),
	parquing VARCHAR(255),
	piscina ENUM('SI','NO'),
	traster ENUM('SI','NO'),
	xemeneia ENUM('SI','NO'),
	FOREIGN KEY(id_vivenda) REFERENCES vivenda(id_vivenda)
);

CREATE TABLE energia(
	id_vivenda INT PRIMARY KEY,
	certificat_electric ENUM('A','B','C','D','E','F','G'),
	consum_energetic_KWh DECIMAL(10,2),
	emissio_energetic_percentatge INT,
	FOREIGN KEY(id_vivenda) REFERENCES vivenda(id_vivenda)
);

CREATE TABLE provincia(
	id_provincia INT PRIMARY KEY,
	nom_catala VARCHAR(100),
	nom_oficial VARCHAR(100),
	id_comunitat_autonoma INT,
	nom_ccaa VARCHAR(255)
);

CREATE TABLE municipi(
	id_municipi INT PRIMARY KEY,
	nom_municipi VARCHAR(48),
	id_ine INT,
	id_provincia INT,
	nom_provincia VARCHAR(48),
	utmX INT,
    	utmY INT,
    	longitud DECIMAL(9,6),
    	latitud DECIMAL(9,6),
    	point VARCHAR(255),
	FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE comarca(
	id_comarca INT PRIMARY KEY,
	id_provincia INT,
	nom_comarca VARCHAR(100),
	FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
);


CREATE TABLE vivenda_municipi(
	id_vivenda INT PRIMARY KEY,
	id_municipi INT,
	FOREIGN KEY(id_vivenda) REFERENCES vivenda(id_vivenda),
	FOREIGN KEY(id_municipi) REFERENCES municipi(id_municipi)
);


