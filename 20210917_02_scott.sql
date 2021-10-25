SELECT USER
FROM DUAL;
--==>> SCOTT


--○ TBL_입고 테이블에서 입고수량을 수정(변경)하는 프로시저를 작성한다.
--   프로시저 명 : PRC_입고_UPDATE(입고번호, 변경할입고수량);

--○ TBL_출고 테이블에서 출고수량을 삭제하는 프로시저를 작성한다.
--   프로시저 명 : PRC_출고_DELETE(출고번호);  --> 재고가 출고 이전의 상태로 돌아감

--○ TBL_입고 테이블에서 입고수량을 삭제하는 프로시저를 작성한다.
--   프로시저 명 : PRC_입고_DELETE(입고번호);  --> 재고가 입고 이전의 상태로 돌아감

EXEC PRC_입고_UPDATE(1, 30);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_입고;
--==>>
/*
1	C002	2021-09-16	230	1000
2	E003	2021-09-16	50	1100
3	S002	2021-09-16	100	1000
4	E003	2021-09-16	30	1100
*/
SELECT *
FROM TBL_출고;
--==>> 1	C002	2021-09-16	200	1800

EXEC PRC_출고_DELETE(2);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
SELECT *
FROM TBL_상품;
--==>>
/*
S001	고래밥	1000	0
S002	꼬북칩	1200	100
S003	감자깡	1000	0
S004	콰삭칩	1100	0
S005	포카칩	1600	0
S006	치토스	1500	0
S007	홈런볼	2000	0
C001	초코칩	1800	0
C002	다이제	2200	30
C003	버터링	1400	0
C004	에이스	1200	0
C005	치익촉	1900	0
C006	오레오	2100	0
C007	사브레	1300	0
E001	마이쮸	1000	0
E002	멘토스	130	    0
E003	비틀즈	1200	80
E004	엠엔엠	1300	0
*/

EXEC PRC_입고_DELETE(2);
EXEC PRC_입고_DELETE(3);
EXEC PRC_입고_DELETE(11); -> 이거 에러나야되는데 안남;;;;;;;;;;;;;;;;;;;;;확인필수
--==>> 입고 내역을 삭제할 수 없습니다.

SELECT *
FROM TBL_입고;
--==>>
/*
1	C002	2021-09-16	230	1000
4	E003	2021-09-16	30	1100
*/
--=========================================================================================
----------------------------------------------------------------------------------------
--◎ 과제 ◎--
--■■■ AFTER STATEMENT TRIGEER 상황 실습 ■■■--
--※ DML 작업에 대한 이벤트 기록

--○ 실습 테이블 생성(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.

--○ 생성된 테이블에 제약조건 추가
--   ID 컬럼에 PK 제약조건 지정
ALTER TABLE TBL_TEST1
ADD CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID);
--==>> Table TBL_TEST1이(가) 변경되었습니다.

--○ 실습 테이블 생성(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, ILJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG이(가) 생성되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

SELECT *
FROM TBL_EVENTLOG;
--==>> 조회 결과 없음



--○ 날짜 세션 정보 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ TBL_TEST1 테이블에 데이터 입력
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '이찬호', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '장민지', '010-2222-2222');
--==>> 1 행 이(가) 삽입되었습니다.

--○ TBL_TEST1 테이블의 데이터 수정
UPDATE TBL_TEST1 
SET NAME = '차노'
WHERE ID = 1;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ TBL_TEST1 테이블의 데이터 삭제
DELETE
FROM TBL_TEST1
WHERE ID = 1;
--==>> 1 행 이(가) 삭제되었습니다.

DELETE 
FROM TBL_TEST1
WHERE ID = 2;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 확인
SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음


--○ 커밋
COMMIT;
--==>> 커밋 완료.


SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT 쿼리문이 수행되었습니다.	2021-09-17 17:19:29
INSERT 쿼리문이 수행되었습니다.	2021-09-17 17:19:31
UPDATE 쿼리문이 수행되었습니다.	2021-09-17 17:20:27
DELETE 쿼리문이 수행되었습니다.	2021-09-17 17:21:03
DELETE 쿼리문이 수행되었습니다.	2021-09-17 17:21:32
*/






SELECT TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))"결과확인"
FROM DUAL;
--==>> 17 → 숫자 타입






--○ 테스트 
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(3, '윤유동', '010-3333-3333');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(4, '김진령', '010-4444-4444');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET NAME = '정효진'
WHERE ID = 4;
--==>> 1 행 이(가) 업데이트되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID = 4;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 확인
SELECT *
FROM TBL_TEST1;
--==>> 3	윤유동	010-3333-3333

--○ 커밋
COMMIT;
--==>> 커밋 완료.


-- 오라클 서버의 시간을 21시 대로 변경(→ 작업표시줄 → 날짜/시간조정)

--시간이 변경된 상태에서 데이터 수정
INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(5,'서승균','010-5555-5555');
--==>> 에러 발생
/*
오류 보고 -
ORA-20003: 작업은 08:00 ~ 18:00 까지 가능합니다.
*/

--시간이 변경된 상태에서 데이터 수정
UPDATE TBL_TEST1
SET NAME='서승균'
WHERE ID=3;
--==>> 에러 발생
/*
오류 보고 -
ORA-20003: 작업은 08:00 ~ 18:00 까지 가능합니다.
*/

--시간이 변경된 상태에서 데이터 수정
DELETE
FROM TBL_TEST1
WHERE TD=3;
--==>> 에러 발생
/*
오류 보고 -
ORA-20003: 작업은 08:00 ~ 18:00 까지 가능합니다.
*/

--○ 진짜 변경 안됬는지 확인
SELECT *
FROM TBL_TEST1;






