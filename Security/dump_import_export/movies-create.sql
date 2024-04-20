DROP DATABASE IF EXISTS movies;
CREATE DATABASE IF NOT EXISTS movies;
USE movies;

CREATE TABLE estudis (
    id_estudis INT PRIMARY KEY AUTO_INCREMENT,
    estudis VARCHAR(50) UNIQUE DEFAULT NULL
)engine=innoDB;

CREATE TABLE generes (
    id_genere INT PRIMARY KEY AUTO_INCREMENT,
    genere VARCHAR(25) UNIQUE DEFAULT NULL
);

CREATE TABLE paisos (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR(36) UNIQUE DEFAULT NULL
);

CREATE TABLE directors (
    id_director INT PRIMARY KEY AUTO_INCREMENT,
    director VARCHAR(100) UNIQUE DEFAULT NULL
);

CREATE TABLE actors (
    id_actor INT PRIMARY KEY AUTO_INCREMENT,
    actor VARCHAR(36) UNIQUE
);

CREATE TABLE pelicules (
    id_movie INT,
    titol VARCHAR(36),
    any INT,
    vots INT,
    id_estudis INT,
    PRIMARY KEY(id_movie),
    FOREIGN KEY(id_estudis) REFERENCES estudis(id_estudis)
);

CREATE TABLE rols (
    id_movie INT,
    id_actor INT,
    rol VARCHAR(50),
    FOREIGN KEY (id_movie) REFERENCES pelicules(id_movie),
    FOREIGN KEY (id_actor) REFERENCES actors(id_actor)
);

CREATE TABLE pelicules_generes (
    id_movie INT,
    id_genere INT,
    PRIMARY KEY (id_movie, id_genere),
    FOREIGN KEY (id_movie) REFERENCES pelicules(id_movie),
    FOREIGN KEY (id_genere) REFERENCES generes(id_genere)
);

CREATE TABLE pelicules_paisos (
    id_movie INT,
    id_pais INT,
    PRIMARY KEY (id_movie, id_pais),
    FOREIGN KEY (id_movie) REFERENCES pelicules(id_movie),
    FOREIGN KEY (id_pais) REFERENCES paisos(id_pais)
);

CREATE TABLE pelicules_directors (
    id_movie INT,
    id_director INT,
    PRIMARY KEY (id_movie, id_director),
    FOREIGN KEY (id_movie) REFERENCES pelicules(id_movie),
    FOREIGN KEY (id_director) REFERENCES directors(id_director)
);

