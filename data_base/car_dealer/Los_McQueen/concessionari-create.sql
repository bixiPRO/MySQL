DROP DATABASE IF EXISTS concessionari;
CREATE DATABASE concessionari;
USE concessionari;

CREATE TABLE marca (
    id_marca INT PRIMARY KEY,
    nom VARCHAR(55) UNIQUE NOT NULL COMMENT'Unique perque no es repeteixin la mateixa marca'
) ENGINE=InnoDB;

CREATE TABLE model(
    id_model INT PRIMARY KEY AUTO_INCREMENT,
    id_marca INT COMMENT'Cada marca tindra diferents models',
    nom VARCHAR(150) NOT NULL UNIQUE COMMENT'Unique perque no es repeteixin el mateix model',
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
) ENGINE=InnoDB;

CREATE TABLE tipus (
    id_tipus INT PRIMARY KEY AUTO_INCREMENT,
    tipus VARCHAR(50) UNIQUE NOT NULL COMMENT'Introdueix el tipus de cotxe sense repetir'
) ENGINE=InnoDB;

CREATE TABLE tipus_model (
    id_model INT COMMENT'Cada model pot tenir mes de 1 tipus en alguns casos',
    id_tipus INT,
    FOREIGN KEY (id_model) REFERENCES model(id_model),
    FOREIGN KEY (id_tipus) REFERENCES tipus(id_tipus)
) ENGINE=InnoDB;

CREATE TABLE motor (
    id_motor INT PRIMARY KEY AUTO_INCREMENT,
    tipus ENUM('gasolina', 'diesel', 'gas', 'hibrid', 'electric', 'gasoil', 'altres') UNIQUE NOT NULL COMMENT 'Posar altres per un futur si utilitzen altre tipus de motor la puguin seleccionar'
) ENGINE=InnoDB;

CREATE TABLE color (
    id_color INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB;


CREATE TABLE cotxe (
    numero_serie VARCHAR(17) UNIQUE PRIMARY KEY COMMENT 'Cada cotxe té un numero de serie que el identifica com a unic',
    id_marca INT,
    id_motor INT,
    Etiqueta_enviental ENUM('CERO','ECO','C','B','A','altres') NOT NULL COMMENT 'Posar la lletra del certificat del cotxe i altres per un futur',
    potencia_CV INT,
    personalitzat ENUM('si', 'no') NOT NULL COMMENT 'Si personalitzat es un si indica les caracteristiques del cotxe que han implementat',
    estat ENUM('nou', 'segona ma') NOT NULL COMMENT 'El estat del cotxe només pot estar en nou o segona ma',
    disponible ENUM('si', 'no', 'pendent') NOT NULL COMMENT'El cotxe te que tenir un estat de que esta disponible o no per presentar els clients',
    any_fabricació YEAR DEFAULT NULL,
    id_color INT NOT NULL COMMENT'Cada cotxe té un color assignat',
    imatge LONGBLOB DEFAULT NULL COMMENT 'Utilitzar longblob per posar imatges',
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca),
    FOREIGN KEY (id_motor) REFERENCES motor(id_motor),
    FOREIGN KEY (id_color) REFERENCES color(id_color)
) ENGINE=InnoDB;

CREATE TABLE modeltipuscotxe(
    numero_serie VARCHAR(17) UNIQUE COMMENT'Cada cotxe esta assignat amb un numero serial i té el seu propi model i tipus que és',
    id_model INT,
    id_tipus INT,
    PRIMARY KEY(numero_serie, id_model, id_tipus) COMMENT'Com que cada cotxe te el seu model i tipus obligatoriament he posat els 3 valors en PK',
    FOREIGN KEY (numero_serie) REFERENCES cotxe(numero_serie),
    FOREIGN KEY (id_model) REFERENCES model(id_model),
    FOREIGN KEY (id_tipus) REFERENCES tipus(id_tipus)
) ENGINE=InnoDB;

CREATE TABLE nou (
    numero_serie VARCHAR(17) UNIQUE PRIMARY KEY COMMENT'Segons si es nou o segona ma tindra valors diferents automatitzats',
    preucompra DECIMAL(10,2),
    preuventa DECIMAL(10,2),
    FOREIGN KEY (numero_serie) REFERENCES cotxe(numero_serie)
) ENGINE=InnoDB;

CREATE TABLE segona_ma (
    numero_serie VARCHAR(17) UNIQUE PRIMARY KEY COMMENT'Segons si es nou o segona ma tindra mñes o menys valors',
    km INT(6) DEFAULT NULL COMMENT'Els cotxes de segona ma tindra km recorreguts',
    preucompra DECIMAL(10,2),
    preuventa DECIMAL(10,2),
    reparat ENUM('si', 'no') NOT NULL COMMENT'Els cotxes de segona ma pot estar reparat o no',
    FOREIGN KEY (numero_serie) REFERENCES cotxe(numero_serie)
) ENGINE=InnoDB;

CREATE TABLE client_reserva (
    numero_serie VARCHAR(17) UNIQUE,
    DNI VARCHAR(9) UNIQUE,
    nom VARCHAR(55),
    cognom VARCHAR(55),
    telefon INT NOT NULL COMMENT'Necessitarem el telefon per contactar per aixo no pot ser null',
    adreça VARCHAR(255),
    data_reserva DATE NOT NULL,
    PRIMARY KEY(numero_serie,DNI) COMMENT'El client pot reservar un cotxe pero es necessari registrar el DNI del client i el numero de serie del cotxe',
    FOREIGN KEY (numero_serie) REFERENCES cotxe(numero_serie)
) ENGINE=InnoDB;

CREATE TABLE modificacio (
    numero_serie VARCHAR(17) UNIQUE PRIMARY KEY,
    descripcio VARCHAR(255) NOT NULL COMMENT'Aqui es guarden les caracteristiques dels cotxes addicionals',
    FOREIGN KEY (numero_serie) REFERENCES cotxe(numero_serie)
) ENGINE=InnoDB;
