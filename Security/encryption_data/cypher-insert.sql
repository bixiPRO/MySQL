DROP DATABASE IF EXISTS cypher;
CREATE DATABASE IF NOT EXISTS cypher;
USE cypher;

CREATE TABLE users (
	id_user INT PRIMARY KEY auto_increment,
	nom_user VARCHAR(20),
	password VARCHAR(8),
	dataCreacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(nom_user,password) VALUES 
('user1',SUBSTRING(MD5(FLOOR(RAND()*10000000)),1,8)),
('user2',SUBSTRING(MD5(FLOOR(RAND()*10000000)),1,8)),
('user3',SUBSTRING(MD5(FLOOR(RAND()*10000000)),1,8)),
('user4',SUBSTRING(MD5(FLOOR(RAND()*10000000)),1,8)),
('user5',SUBSTRING(MD5(FLOOR(RAND()*10000000)),1,8));

CREATE TABLE users_aes (
	id_user INT PRIMARY KEY auto_increment,
	nom_user VARCHAR(20),
	password VARBINARY(100),
	dataCreacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users_aes(nom_user,password) VALUES 
('user1',HEX(AES_ENCRYPT(FLOOR(RAND()*100000000),'clau'))),
('user2',HEX(AES_ENCRYPT(FLOOR(RAND()*100000000),'clau'))),
('user3',HEX(AES_ENCRYPT(FLOOR(RAND()*100000000),'clau'))),
('user4',HEX(AES_ENCRYPT(FLOOR(RAND()*100000000),'clau'))),
('user5',HEX(AES_ENCRYPT(FLOOR(RAND()*100000000),'clau')));

select * from users;
select * from users_aes;
select nom_user, CAST(AES_DECRYPT(UNHEX(password),'clau')as CHAR) AS password from users_aes;

