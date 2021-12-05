select user
from dual;
--==>> scott

--■■■ 암호화 복호화 확인 실습 ■■■--
CREATE TABLE TBL_EXAM
( ID    NUMBER    
, PW    VARCHAR2(20)   
);
--==>> Table TBL_EXAM이(가) 생성되었습니다.

--INSERT INTO TBL_EXAM(ID, PW) VALUES(1,'java006$');
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, CRYPTPACK.ENCRYPT('java006$', '1234'));
--==>> 1 행 이(가) 삽입되었습니다.



--○ 데이터 조회
SELECT * 
FROM TBL_EXAM;
--==>> 1	j??s

--○ 데이터 조회
SELECT ID, CRYPTPACK.DECRYPT(PW, '1111')
FROM TBL_EXAM;
--==>> 1	???

--○ 데이터 조회
SELECT ID, CRYPTPACK.DECRYPT(PW, '2222')
FROM TBL_EXAM;
--==>> 1	??D?

--○ 데이터 조회 ( 올바른 비밀번호 '1234' 입력했을 경우)
SELECT ID, CRYPTPACK.DECRYPT(PW, '1234')
FROM TBL_EXAM; 
--==>> 1	java006$










