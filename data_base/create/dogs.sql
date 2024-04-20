DROP DATABASE IF EXISTS dogs;
CREATE DATABASE IF NOT EXISTS dogs;
USE dogs;
CREATE TABLE dog (
  id INT AUTO_INCREMENT COMMENT 'Id 1,2,3,4...',
  nom VARCHAR(32) COMMENT 'Nom dels dogs',
  short_url VARCHAR(100),
  short_image VARCHAR(100),
  short_pdf_es VARCHAR(100),
  PRIMARY KEY(id)
) engine=InnoDB;

CREATE TABLE dog_grup (
 id_dog_grup INT AUTO_INCREMENT COMMENT 'id per referenciar els altres taules',
 id_grup INT ,
 PRIMARY KEY(id_dog_grup),
 FOREIGN KEY(id_grup) REFERENCES grup(id_grup)
);

CREATE TABLE grup (
  id_grup INT AUTO_INCREMENT COMMENT 'id per referenciar els altres taules',
  nom_dog VARCHAR(32),
  nom VARCHAR(32),
  noms_subgrup VARCHAR(32),
  PRIMARY KEY(id_grup),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);

CREATE TABLE subgrup (
  id INT AUTO_INCREMENT,
  PRIMARY KEY(altura),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);

CREATE TABLE pais (
  nom_dog VARCHAR(32),
  pais VARCHAR(32),
  PRIMARY KEY(pais),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);

CREATE TABLE color_pelatge (
  nom_dog VARCHAR(32),
  color VARCHAR(32),
  PRIMARY KEY(color),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);

CREATE TABLE altura (
  nom_dog VARCHAR(32),
  altura VARCHAR(32),
  PRIMARY KEY(altura),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);

CREATE TABLE ulls (
  nom_dog VARCHAR(32),
  color VARCHAR(32),
  PRIMARY KEY(color),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);
CREATE TABLE longevitat (
  nom_dog VARCHAR(32),
  longetivitat INT,
  PRIMARY KEY(longetivitat),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);
CREATE TABLE caracter (
  nom_dog VARCHAR(32),
  caracter VARCHAR(32),
  PRIMARY KEY(caracter),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);

CREATE TABLE salut (
  nom_dog VARCHAR(32),
  salut VARCHAR(32),
  PRIMARY KEY(salut),
  FOREIGN KEY(nom_dog) REFERENCES dog(nom)
);

