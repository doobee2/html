CREATE DATABASE gnj;

USE gnj;

-- 슬비 프로젝트
-- qno title content author resdate cnt lev par secret
-- boolean TYPE (비밀글여부)

-- 회원(member) 테이블 생성
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
-- 회원 테이블 구조 보기
DESC MEMBER;
​
-- 더미 데이터 추가
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES('admin', '1234', '관리자', 'admin@edu.com', '010-1004-1004');
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES('kim', '4321', '최상민', 'kim@edu.com', '010-1004-1004');
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES('lee', '2345', '황교진', 'lee@edu.com', '010-1004-1004');
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES('park', '5432', '이슬비', 'park@edu.com', '010-1004-1004');
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES('choi', '3456', '김이호', 'choi@edu.com', '010-1004-1004');
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES('shin', '6543', '박나연', 'shin@edu.com', '010-5555-5555');

USE gnj;

-- Qna 테이블 구조 보기
DESC qna;

SELECT * FROM qna;

-- Qna 테이블 형성
CREATE TABLE qna(
qno INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
content VARCHAR(1000) NOT NULL,
author VARCHAR(16),
resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
cnt INT DEFAULT 0,
lev INT DEFAULT 0, -- 질문(0), 답변(1)
par INT,	-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
secret BOOLEAN DEFAULT 0,	-- 비밀글 유무
FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);



select a.qno as qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, secret AS secret, b.name as name from qna a, member b where a.author = b.id order by a.qno ASC;


-- VIEW 생성 qnalist

CREATE VIEW qnalist AS 
(select a.qno as qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, 
secret AS secret, b.name as name from qna a, member b where a.author = b.id order by a.qno ASC);


SELECT * FROM qnalist WHERE qno=?;




-- 기존 테이블 삭제 시 현재 테이블을 참조하는 테이블도 삭제
DROP TABLE IF EXISTS qna;




-- 더미 데이터 작성
-- lev가 0이면 질문 / lev가 1이면 답변
-- par : 질문의 글번호

-- 질문
INSERT INTO qna(title, content, author, lev) VALUES('초3 대상 자기주도학습 과정 추천문의', '테스트 중입니다 질문질문','lee',0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev) VALUES('그로우앤조이 뜻이 무엇인가요?', '테스트 중입니다 질문질문','park',0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

-- 답변
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문1에 대한 답변', 'http://www.milkt.co.kr/ 가정에서 학습 가능한 천재교육의 밀크T가 있습니다.','admin',1,1);

INSERT INTO qna(title, content, author, lev, par) VALUES ('질문2에 대한 답변', 'Grow&Joy는 학생들의 성장과 개발(Grow)을 도모하면서도 즐거움(Joy)과 긍정적인 에너지를 함께 전달하는 교육 회사를 의미합니다.','admin',1,2);




SELECT * FROM MEMBER;

SELECT * FROM qna;

SELECT * FROM qnalist;


COMMIT;
COMMIT;
COMMIT;
COMMIT;




SELECT * FROM qna ORDER BY par DESC, lev ASC, qno ASC ;



-- 부모글(질문) + 답변 그룹화
SELECT 컬럼 FROM 테이블 WHERE 조건식 GROUP BY 그룹화할 컬럼;

GROUP BY 