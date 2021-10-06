CREATE DATABASE IF NOT EXISTS participant;

USE participant;

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT,
	name VARCHAR(40) UNIQUE,
	email VARCHAR(40) UNIQUE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	PRIMARY KEY(id)
);

CREATE TABLE posts(
	id BIGINT UNSIGNED AUTO_INCREMENT,
	title VARCHAR(200),
	description LONGTEXT,
	user_id BIGINT UNSIGNED,
	PRIMARY KEY(id),
	FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE NO ACTION
);


-- INSERT

INSERT INTO users(name, email, first_name, last_name)
VALUES("tofikhidayatxyz", "tofik@syntac.co", "tofik", "Hidayat");

INSERT INTO posts (title, description, user_id)
VALUES(
	"How to make money ? FAST",
	"Example post content for creatig money",
	(SELECT id FROM users WHERE name = "tofikhidayatxyz" LIMIT 1)
);



INSERT INTO posts (title, description, user_id)
VALUES(
	"How to be bilioner",
	"Apa ini ?",
	(SELECT id FROM users WHERE name = "tofikhidayatxyz" LIMIT 1)
);

SELECT *,
users.id AS user_id,
users.name AS user_name,
users.email AS user_email
FROM posts
INNER JOIN users
ON posts.user_id = users.id;


UPDATE posts
SET description = "Ntah lah lupa"
WHERE id = LAST_INSERT_ID();



DELETE FROM posts WHERE id = 1;


SELECT *,
users.id AS user_id,
users.name AS user_name,
users.email AS user_email
FROM posts
INNER JOIN users
ON posts.user_id = users.id;





