SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 실습 테이블 생성(TBL_TEST2) → 부모 테이블
CREATE TABLE TBL_TEST2
( CODE  NUMBER
, NAME VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2이(가) 생성되었습니다.

--○ 실습 테이블 생성(TBL_TEST3) → 자식 테이블
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1, '냉장고');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2, '세탁기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3, '건조기');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	냉장고
2	세탁기
3	건조기
*/

COMMIT;
--==>> 커밋 완료.

--○ 데이터입력
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4, 3, 40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(11, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(12, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(13, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(14, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(54, 3, 20);
--==> 1 행 이(가) 삽입되었습니다. * 15

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	20
2	1	20
3	2	30
4	3	40
5	2	20
6	2	20
7	3	20
8	3	20
9	2	20
10	3	20
11	2	20
12	2	20
13	1	20
14	2	20
54	3	20
*/

SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
--==>>
/*
1	1	냉장고	20
2	1	냉장고	20
3	2	세탁기	30
4	3	건조기	40
5	2	세탁기	20
6	2	세탁기	20
7	3	건조기	20
8	3	건조기	20
9	2	세탁기	20
10	3	건조기	20
11	2	세탁기	20
12	2	세탁기	20
13	1	냉장고	20
14	2	세탁기	20
54	3	건조기	20
*/

-- 부모 테이블(TBL_TEST2)에서 냉장고 삭제
DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 에러 발생  --> 부모 테이블에 1(냉장고)가 있기 때문,,
/*
ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found
*/

DELETE
FROM TBL_TEST3
WHERE CODE=1;
--==>> 3개 행 이(가) 삭제되었습니다.

SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
--==>> 1번(냉장고) 다 삭제 됨 --> 자식 테이블에 있는 1 번 다 먼저 삭제함
/*
3	2	세탁기	30
4	3	건조기	40
5	2	세탁기	20
6	2	세탁기	20
7	3	건조기	20
8	3	건조기	20
9	2	세탁기	20
10	3	건조기	20
11	2	세탁기	20
12	2	세탁기	20
14	2	세탁기	20
54	3	건조기	20
*/
--==>> 냉장고 데이터는 존재하지 않음
COMMIT;
--==>> 커밋 완료.

DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST2;
--==>> 
/*
2	세탁기
3	건조기
*/

COMMIT;
--==>> 커밋 완료.


--▼다 똑같은 구문 .. 부모 테이블에 있으면 삭제안되고 자식 테이블 데이터 부터 삭제해야지 부모테이블 삭제 가능!
SELECT *
FROM TBL_TEST2
WHERE CODE=2;
--==>> 2	세탁기

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found

SELECT *
FROM TBL_TEST2
WHERE CODE=3;
--==>> 3	건조기

DELETE
FROM TBL_TEST2
WHERE CODE=3;
--==>> ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found
        
        
--○ 트리거 작성 이후 다시 테스트

DELETE
FROM TBL_TEST2
WHERE CODE=3;
--==>> 1 행 이(가) 삭제되었습니다.
--> 자식들을 먼저 제거 해버린 것

SELECT *
FROM TBL_TEST2;

SELECT *
FROM TBL_TEST3;

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST2;

SELECT *
FROM TBL_TEST3;


-- AFTER ROW TRIGGER

TRUNCATE TABLE TBL_입고;
--==>> Table TBL_입고이(가) 잘렸습니다.

TRUNCATE TABLE TBL_출고;
--==>> Table TBL_출고이(가) 잘렸습니다.

UPDATE TBL_상품
SET 재고수량 = 0;
--==>> 21개 행 이(가) 업데이트되었습니다.

COMMIT;

SELECT *
FROM TBL_입고;
--==>> 위에 TRUNCATE 로 잘라냈기 때문에 아무것도 없다.
SELECT *
FROM TBL_출고;

SELECT *
FROM TBL_상품;

--◎ 29열의  AFTER ROW TRIGGER~~~~ 의 확인용!!
INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(1, 'C001', SYSDATE, 100, 1800);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT * 
FROM TBL_입고;
--==>> 1	C001	2021-09-23	100	1800

SELECT * 
FROM TBL_상품;
--==>>
/*
            :
S007	홈런볼	2000	0
C001	초코칩	1800	100   →  100개 입력한거 확인 할 수 있다.
C002	다이제	2200	0
            :  
*/


--◎과제 

SELECT *
FROM TBL_입고;
--==>> 1	C001	2021-09-23	100	1800


INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(2, 'C002', SYSDATE, 50, 2200);

UPDATE TBL_입고
SET 입고수량 = 30;

DELETE 
FROM TBL_입고
WHERE 입고번호 = 2;

SELECT *
FROM TBL_입고;
--==>>
/*
1	C001	2021-09-23	30	1800
*/
-------------------------------------------------------------------------
INSERT INTO TBL_출고(출고번호, 상품코드, 출고일자, 출고수량, 출고단가)
VALUES(2, 'C002', SYSDATE, 10, 2200);

SELECT *
FROM TBL_출고;
--==>>
/*
2	C002	2021-09-23	10	2200
*/
SELECT *
FROM TBL_상품;
/*
            :
S007	홈런볼	2000	0
C001	초코칩	1800	30
C002	다이제	2200	-10     →   출고 10했으니까 -10
C003	버터링	1400	0
            :
*/

UPDATE TBL_출고
SET 출고수량 = 0;
--==>> 출고 수량 다시 0으로 만들어 줌



----------------------------------------------------------------------------
--■■■ PACKAGE(패키지) 실습~~~~~~~~~~~~~~!! ■■■--

SELECT INSA_PACK.FN_GENDER('751212-1234567') "RESULT"
FROM DUAL;
--==>> 남자

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN)"성별확인"
FROM TBL_INSA;
--==>>
/*
이다영	951027-2234567	여자
            :
박문수	780710-1985632	남자
유영희	800304-2741258	여자
            :
김신애	810809-2111111	여자
*/



CREATE TABLE LOGIN