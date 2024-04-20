DROP DATABASE IF EXISTS agenda;
CREATE DATABASE IF NOT EXISTS agenda;
USE agenda;

CREATE TABLE tipusvincle(
  id INT,
  nom_tipus VARCHAR(50),
  PRIMARY KEY(id)
);

CREATE TABLE contacte(
  numero_telefon CHAR(9), 
  nom VARCHAR(50),
  cognom1 VARCHAR(50),
  cognom2 VARCHAR(50) DEFAULT NULL,
  data_naixament DATE,
  correu_electronic VARCHAR(100) UNIQUE,
  KEY(numero_telefon),
  PRIMARY KEY(numero_telefon)
);

CREATE TABLE relacio(
  id_relacio INT AUTO_INCREMENT,
  id_contacte1 CHAR(9),
  id_contacte2 CHAR(9),
  id_tipusvincle INT,
  PRIMARY KEY(id_Relacio),
  FOREIGN KEY (id_contacte1) REFERENCES contacte(numero_telefon),
  FOREIGN KEY (id_contacte2) REFERENCES contacte(numero_telefon),
  FOREIGN KEY (id_tipusvincle) REFERENCES tipusvincle(id)
);

CREATE TABLE reunions(
  id_reunio INT AUTO_INCREMENT,
  id_contacte1 CHAR(9),
  id_contacte2 CHAR(9),
  data_reunio DATETIME,
  durada_reunio INT CHECK (durada_reunio BETWEEN 1 AND 8),
  tipus_reunio ENUM('Presencial', 'Telemàtica'),
  estat INT CHECK (estat BETWEEN 1 AND 3),
  descripcio VARCHAR(200) GENERATED ALWAYS AS (
    CASE
      WHEN estat = 1 THEN 'Pendent'
      WHEN estat = 2 THEN 'Realitzada'
      WHEN estat = 3 THEN 'No realitzada'
      ELSE 'NULL'
    END
  ),
  data_registre DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id_reunio),
  FOREIGN KEY (id_contacte1) REFERENCES contacte(numero_telefon),
  FOREIGN KEY (id_contacte2) REFERENCES contacte(numero_telefon)
);
