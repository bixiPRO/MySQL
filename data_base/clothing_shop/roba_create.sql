DROP DATABASE IF EXISTS SARA;
CREATE DATABASE IF NOT EXISTS SARA;
USE SARA;

CREATE TABLE categoria (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	categoria VARCHAR(36) UNIQUE,
	descripcio VARCHAR(100)
);

CREATE TABLE classe (
	id_classe INT AUTO_INCREMENT PRIMARY KEY,
	id_categoria INT,
	nom VARCHAR(50) UNIQUE,
	FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE model (
	id_model INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(50) UNIQUE
);

CREATE TABLE material (
	id_material INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(50) UNIQUE
);

CREATE TABLE color (
	id_color INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(36) UNIQUE
);


CREATE TABLE compost (
	id_compost INT AUTO_INCREMENT PRIMARY KEY,
	id_color INT,
	id_material INT,
	id_model INT,
	FOREIGN KEY (id_color) REFERENCES color(id_color),
	FOREIGN KEY (id_material) REFERENCES material(id_material),
	FOREIGN KEY (id_model) REFERENCES model(id_model)
);

CREATE TABLE article (
	id_article INT AUTO_INCREMENT PRIMARY KEY,
	id_compost INT,
	id_classe INT,
	nom VARCHAR(50),
	preu DECIMAL(10,2),
	preuvenda DECIMAL(10,2),
	anyfabricacio DATE,
	FOREIGN KEY (id_compost) REFERENCES compost(id_compost),
	FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);


CREATE TABLE mida_roba_casa (
	id_article INT,
	llargada DECIMAL(10,2),
	amplada DECIMAL(10,2),
	descripcio VARCHAR(36),
	uds INT,
	PRIMARY KEY (id_article, llargada, amplada),
	FOREIGN KEY (id_article) REFERENCES article(id_article)
);

CREATE TABLE talla_adult_inferior (
	id_article INT,
	mida INT,
	uds INT,
	sexe VARCHAR(36),
	PRIMARY KEY (id_article, mida),
	FOREIGN KEY (id_article) REFERENCES article(id_article)
);

CREATE TABLE talla_adult_superior (
	id_article INT,
	mida VARCHAR(5),
	uds INT,
	sexe VARCHAR(36),
	PRIMARY KEY (id_article, mida),
	FOREIGN KEY (id_article) REFERENCES article(id_article)
);

CREATE TABLE talla_nen (
	id_article INT,
	anys INT,
	uds INT,
	sexe VARCHAR(36),
	PRIMARY KEY (id_article, anys),
	FOREIGN KEY (id_article) REFERENCES article(id_article)
);

CREATE TABLE talla_nado (
	id_article INT,
	mesos INT,
	uds INT,
	sexe VARCHAR(36),
	PRIMARY KEY (id_article, mesos),
	FOREIGN KEY (id_article) REFERENCES article(id_article)
);
