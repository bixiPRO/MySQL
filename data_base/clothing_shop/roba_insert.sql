INSERT INTO categoria (id_categoria, categoria, descripcio) VALUES
(1,'Roba de casa','Roba que utilitzes normalment en casa com pijama'),
(2,'Complements','Prendes i accesoris que complementa el estil de vestir'),
(3,'Roba de vestir', 'Roba que utilitzes normalment per surtir');

INSERT INTO classe (id_classe, id_categoria, nom) VALUES
(1,2,'Accessoris'),
(2,3,'Roba de Festa'),
(3,3,'Roba de treball'),
(4,1,'Roba Dormitori'),
(5,2,'Roba Salo');

INSERT INTO model (id_model, nom) VALUES
(1,'Vaquers o jeans'),
(2,'Vestit'),
(3,'Gorra'),
(4,'Pantallons llargs'),
(5,'Camisetta'),
(6,'Llançols'),
(7,'Capa Sofa');

INSERT INTO material (id_material, nom) VALUES
(1,'llana'),
(2,'Poliéster'),
(3,'Cotó');

INSERT INTO color (id_color, nom) VALUES
(1,'Blanc'),
(2,'Negre'),
(3,'Vermell'),
(4,'Blau');

INSERT INTO compost (id_compost, id_color, id_material, id_model) VALUES
(1,2,2,4),
(2,4,3,4),
(3,2,2,3),
(4,1,1,6),
(5,3,3,7),
(6, 2, 1, 1),
(7, 3, 2, 2),
(8, 4, 3, 3),
(9, 1, 1, 4),
(10, 2, 2, 5),
(11, 3, 3, 6),
(12, 4, 1, 7),
(13, 1, 2, 3),
(14, 2, 3, 5),
(15, 3, 1, 6);

INSERT INTO article (id_article, id_compost, id_classe, nom, preu, preuvenda, anyfabricacio) VALUES
(1,1,2,'BAGGY FIT',30.05,49.95,'2023-04-23'),
(2,2,3,'TUBO MIDI',27.35,35.95,'2023-07-19'),
(3,3,1,'BOB DENIM ETIQUETA',7,9.95,'2022-09-27'),
(4,4,5,'HOSTER DUMP',28.65,50.47,'2022-05-31'),
(5,5,4,'LAUZY HAST',30.05,49.95,'2021-05-22'),
(6,1,2,'MANSTE LAK',33.46,46.87,'2020-02-09'),
(7,2,3,'MANSTE LAK ',19.76,23,'2024-02-02'),
(8,3,1,'GANSTOT KILIAH',42.35,67.21,'2018-02-03'),
(9,4,4,'PALOW GOD',6,12,'2019-04-23'),
(10,5,2,'NAMESTER SWITCH',37,46.67,'2023-04-07'),
(11,3,2,'LAUZY HAST',38,45,'2023-04-03'),
(12,4,3,'KAFHER NAGGOR',34,54.50,'2020-05-17'),
(13,5,3,'KAFHER NANNORR',23,46.76,'2020-07-17'),
(14,3,2,'KING OF KINDOMS',23,46.76,'2020-07-17'),
(15, 6, 2, 'DENIM PENCIL', 33.46, 46.87, '2020-02-09'),
(16, 7, 3, 'MANTEAU TURQUOISE', 19.76, 23, '2024-02-02'),
(17, 8, 1, 'YELLOW PULLOVER', 42.35, 67.21, '2018-02-03'),
(18, 9, 4, 'YELLOW PULLOVER', 6, 12, '2019-04-23'),
(19, 10, 2, 'BAGGY FIT', 37, 46.67, '2023-04-07'),
(20, 11, 2, 'BAGGY FIT', 38, 45, '2023-04-03'),
(21, 12, 3, 'BLACK APRON', 34, 54.50, '2020-05-17'),
(22, 13, 3, 'GREEN APRON', 23, 46.76, '2020-07-17'),
(23, 14, 2, 'PALOW GOD', 23, 46.76, '2020-07-17'),
(24, 15, 1, 'WHITE NIGHTGOWN', 30.05, 49.95, '2023-04-23'),
(25,2,2,'BAGGY FIT',30.05,49.95,'2023-04-23');

INSERT INTO mida_roba_casa (id_article, llargada, amplada, descripcio, uds) VALUES
(5,24.50,19.80,'llis',3),
(4,23.4,7.65,'llis',4),
(9,24.3,18.7,'Destampat',2),
(19, 35.2, 28.4, 'destampat', 5),
(20, 37.5, 30.8, 'llis', 3),
(21, 40.1, 32.9, 'destampat', 7),
(22, 38.6, 31.7, 'llis', 4),
(23, 39.8, 33.2, 'destampat', 6),
(24, 36.9, 29.5, 'llis', 8);

INSERT INTO talla_adult_inferior (id_article, mida, uds, sexe) VALUES
(1,24,5,'H'),
(2,34,7,'D'),
(11,16,2,'U'),
(7, 36, 5, 'H'),
(8, 38, 7, 'D'),
(9, 40, 9, 'U'),
(13, 42, 3, 'H'),
(14, 44, 6, 'D'),
(15, 46, 8, 'U');

INSERT INTO talla_adult_superior (id_article, mida, uds, sexe) VALUES
(3,'M',6,'H'),
(4,'L',12,'D'),
(12,'M',34,'U'),
(10, 'S', 10, 'H'),
(11, 'M', 12, 'D'),
(12, 'L', 15, 'U'),
(13, 'XL', 8, 'H'),
(14, 'XXL', 5, 'D'),
(15, 'XXXL', 3, 'U');

INSERT INTO talla_nen (id_article, anys, uds, sexe) VALUES
(6,4,4,'H'),
(7,6,3,'D'),
(14,8,2,'H'),
(4, 2, 4, 'H'),
(5, 4, 3, 'D'),
(6, 6, 2, 'U'),
(9, 8, 5, 'H'),
(10, 10, 6, 'D'),
(11, 12, 7, 'U');

INSERT INTO talla_nado (id_article, mesos, uds, sexe) VALUES
(8,1,5,'H'),
(10,3,3,'D'),
(13,4,4,'D'),
(1, 3, 5, 'H'),
(2, 6, 4, 'D'),
(3, 9, 3, 'U'),
(7, 12, 6, 'H'),
(8, 15, 7, 'D'),
(9, 18, 8, 'U');
