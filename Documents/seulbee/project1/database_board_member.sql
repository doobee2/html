CREATE TABLE MEMBER(
	id VARCHAR(16) NOT NULL,
	pw VARCHAR(330) NOT NULL,
	NAME VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	tel VARCHAR(13),
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	POINT INT DEFAULT 0,
	PRIMARY KEY (id)
);
​
DESC member;

INSERT INTO member(id, pw, NAME, email, tel) VALUES('admin', '1234', '관리자', 'admin@grownjoy.com', '010-5556-8522');

CREATE TABLE board(
	bno INT(11) PRIMARY KEY AUTO_INCREMENT,
	boardType INT NOT NULL,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16) NOT NULL,
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0
);

DESC board;

CREATE VIEW boardList AS (SELECT b.bno AS bno, b.boardType AS boardType, b.title AS title, b.content AS content, b.author AS author, b.resdate AS resdate, b.cnt as cnt, m.name AS name FROM board b, member m WHERE b.author=m.id order BY b.bno ASC);
