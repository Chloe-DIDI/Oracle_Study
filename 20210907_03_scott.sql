SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ UNION / UNION ALL ■■■--

--○ 실습 테이블 생성 (TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- 주문 테이블 생성
( JUNO      NUMBER                  -- 주문 번호
, JECODE    VARCHAR2(30)            -- 주문된 제품 코드
, JUSU      NUMBER                  -- 주문 수량
, JUDAY     DATE DEFAULT SYSDATE    -- 주문일자
);
--==>> Table TBL_JUMUN이(가) 생성되었습니다.
--> 고객의 주문이 발생했을 경우 주문 내용에 대한 데이터가
--  입력될 수 있는 테이블

SELECT *
FROM TBL_JUMUN;

INSERT INTO TBL_JUMUN VALUES
(1, '홈런볼', 20, TO_DATE('2001-11-01 09:00:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(2, '구운파', 10, TO_DATE('2001-11-01 09:23:15', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(3, '빼빼로', 30, TO_DATE('2001-11-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(4, '콘칩', 10, TO_DATE('2001-11-02 15:16:17', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(5, '다이제', 50, TO_DATE('2001-11-03 10:22:33', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(6, '홈런볼', 50, TO_DATE('2001-11-04 11:11:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(7, '콘칩', 20, TO_DATE('2001-11-02 19:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(8, '포카칩', 40, TO_DATE('2001-11-13 09:07:09', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(9, '칙촉', 30, TO_DATE('2001-11-15 10:23:34', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(10, '새우깡', 20, TO_DATE('2001-11-16 14:23:34', 'YYYY-MM-DD HH24:MI:SS'));
--==>1 행 이(가) 삽입되었습니다. * 10


--○ 날짜 세션 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>Session이(가) 변경되었습니다.

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>> 
/*
1	홈런볼	20	2001-11-01 09:00:10
2	구운파	10	2001-11-01 09:23:15
3	빼빼로	30	2001-11-02 12:00:00
4	콘칩	10	2001-11-02 15:16:17
5	다이제	50	2001-11-03 10:22:33
6	홈런볼	50	2001-11-04 11:11:11
7	콘칩	20	2001-11-02 19:10:10
8	포카칩	40	2001-11-13 09:07:09
9	칙촉	30	2001-11-15 10:23:34
10	새우깡	20	2001-11-16 14:23:34
*/

COMMIT;
--==>> 커밋 완료

INSERT INTO TBL_JUMUN VALUES(98785, '홈런볼', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98786, '빼빼로', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98787, '홈런볼', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98788, '새우깡', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98789, '콘칩', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98790, '콘칩', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98791, '꼬북칩', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98792, '뽀빠이', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98793, '홈런볼', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98794, '홈런볼', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>> 
/*
    1	홈런볼	20	2001-11-01 09:00:10
    2	구운파	10	2001-11-01 09:23:15
    3	빼빼로	30	2001-11-02 12:00:00
    4	콘칩	10	2001-11-02 15:16:17
    5	다이제	50	2001-11-03 10:22:33
    6	홈런볼	50	2001-11-04 11:11:11
    7	콘칩	20	2001-11-02 19:10:10
    8	포카칩	40	2001-11-13 09:07:09
    9	칙촉	30	2001-11-15 10:23:34
   10	새우깡	20	2001-11-16 14:23:34
98785	홈런볼	10	2021-09-07 14:26:03
98786	빼빼로	20	2021-09-07 14:26:05
98787	홈런볼	20	2021-09-07 14:26:08
98788	새우깡	20	2021-09-07 14:26:09
98789	콘칩	10	2021-09-07 14:26:10
98790	콘칩	20	2021-09-07 14:26:39
98791	꼬북칩	20	2021-09-07 14:27:33
98792	뽀빠이	20	2021-09-07 14:27:46
98793	홈런볼	30	2021-09-07 14:28:28
98794	홈런볼	10	2021-09-07 14:28:44
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--※ 진하가 과자 쇼핑몰 운영중...
--   TBL_JUMUN 테이블이 너무 무거워진 상황
--   어필리케이션과의 연동으로 인해 주문 내역을 다른 테이블에
--   저장될 수 있도록 만드는 것은 불가능한 상황
--   기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황
--   → 결과적으로... 현재까지 누적된 주문 데이터 중
--      금일 발생한 주문 내역을 제외하고 나머지를 다른 테이블(TBL_JUMUNBACKUP)로
--      데이터 이관을 수행할 계획


SELECT *
FROM TBL_JUMUN
WHERE 금일 주문이 아닌 것;

--  ↓

SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');  -- !=, ^=, <> (논리 NOT)

--○ 위의 조회 결과로 TBL_JUMUNBACKUP 테이블 생성
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN 
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') <> TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP이(가) 생성되었습니다.

--○ 확인
SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	홈런볼	20	2001-11-01 09:00:10
2	구운파	10	2001-11-01 09:23:15
3	빼빼로	30	2001-11-02 12:00:00
4	콘칩	10	2001-11-02 15:16:17
5	다이제	50	2001-11-03 10:22:33
6	홈런볼	50	2001-11-04 11:11:11
7	콘칩	20	2001-11-02 19:10:10
8	포카칩	40	2001-11-13 09:07:09
9	칙촉	30	2001-11-15 10:23:34
10	새우깡	20	2001-11-16 14:23:34
*/

--> TBL_JUMUNBACKUP 테이블의 데이터들 중
--  금일 주문내역 이외의 데이터는 모두 TBL_JUMUNBACKUP 테이블에 백업을 마친 상태.

--○ TBL_JUMUN 테이블의 데이터들 중
--   백업을 마친 데이터들 삭제 → 금일 주문이 아닌 데이터들 제거
--SELECT *  → 이걸 DELETE로 변경하면됨~~!!
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');  -- !=, ^=, <> (논리 NOT)
--==>> 10개 행 이(가) 삭제되었습니다. → 98784 건의 데이터 삭제되었음을 가정...


-- 아직 제품 발송이 완료되지 않은 금일 주문 데이터를 제외하고
-- 이전의 모든 주문 데이터들이 삭제된 상황이므로
-- 테이블은 행(레코드)의 갯수가 줄어들어 매우 가벼워진 상황

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
98785	홈런볼	10	2021-09-07 14:26:03
98786	빼빼로	20	2021-09-07 14:26:05
98787	홈런볼	20	2021-09-07 14:26:08
98788	새우깡	20	2021-09-07 14:26:09
98789	콘칩	10	2021-09-07 14:26:10
98790	콘칩	20	2021-09-07 14:26:39
98791	꼬북칩	20	2021-09-07 14:27:33
98792	뽀빠이	20	2021-09-07 14:27:46
98793	홈런볼	30	2021-09-07 14:28:28
98794	홈런볼	10	2021-09-07 14:28:44
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


-- 그런데 지금까지 주문받은 내역에 대한 정보를
-- 제품별 총 주문량으로 나타내야 할 상황이 발생하게 되었다.
-- 그렇다면... TBL_JUMUNBACKUP 테이블의 레코드(행)과
-- TBL_JUMUN 테이블의 레코드(행)를 합쳐서 하나의 테이블으르
-- 조회하는 것과 같은 결과를 확인할 수 있도록 조회해야 한다.

-- 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우 JOIN 을 사용하지만
-- 레코드(행)과 레코드(행)을 결합하고자 하는 경우 
-- UNION / UNION ALL 을 사용할 수 있다.
-- cf.  UNION(위아래로 이어붙임) / JOIN(양옆으로 비교해서 이어붙임)


SELECT *
FROM TBL_JUMUNBACKUP;

SELECT *
FROM TBL_JUMUN;

---------------------------------------------------------
-- UNION 하고 싶어!!!!!! ▼
SELECT *
FROM TBL_JUMUNBACKUP
UNION               -- 여기에 UNION 만 붙이면 됨!!!!
SELECT *
FROM TBL_JUMUN;

-- UNION ALL하고 싶어!!!!!! ▼
SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL               -- 여기에 UNION 만 붙이면 됨!!!!
SELECT *
FROM TBL_JUMUN;

--> 결과 값 둘다 똑같다
-------------------------------------------------------------
--  TBL_JUMUNBACKUP 랑 TBL_JUMUN 자리 바꿔서 관찰해 보기
--UNION 하고 싶어!!!!!! ▼
SELECT *
FROM TBL_JUMUN
UNION               -- 여기에 UNION 만 붙이면 됨!!!!
SELECT *
FROM TBL_JUMUNBACKUP;

-- UNION ALL하고 싶어!!!!!! ▼
SELECT *
FROM TBL_JUMUN
UNION ALL               -- 여기에 UNION ALL 만 붙이면 됨!!!!
SELECT *
FROM TBL_JUMUNBACKUP;
-->> UNION ALL은 정렬기능 뿐만 아니라 중복기능도 자동으로 삭제해 준다.
------------------------------------------------------------

--※ UNION 은 항상 결과물의 첫 번째 컬럼을 기준으로 
--   오름차순 정렬을 수행한다.(→ 시스템의 부하가 많이 발생함)
--   UNION ALL(★) 은 결합된 순서대로 조회한 결과를 반환한다. (→정렬 없음, 더 많이 사용함)
--   이로 인해 UNION 이 부하가 더 크다.
--   또한, UNION 은 결과물에서 중복된 행이 존재할 경우
--   중복을 제거하고 1개 행만 조회된 결과를 반환한다.

--▲▼ 위 아래에서,, 아래에서는 중복행이라고 지워져서 UNION ALL만 가능하고 UNION 은 가능하지않는데 뭐가 다른거?
-- ANSWER) 위에는 시간까지 다 나오는 전체 출력 행이였고 
--         아래는 제품코드, 주문량만나오는 행이엿기때문에,,
--         위에는 시간까지 맞는게 없어서 중복행이 없는 것!

--○ 지금까지 주문받은 모든 데이터를 통해 
--   제품별 총 주문량을 조회하는 쿼리문을 구성한다 (~ 15:41)
/*
-----------------------------------------
    제품코드            총 주문량
-----------------------------------------
      ...                   X
      ...                  XXX
      
-----------------------------------------
*/


SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP;
--  어떤 컬럼이 두개 사이에 공통적으로 있고 연결되어있는지 확인!
--> JECODE 가 연결 되어 있다

--> BACKUP(원래있던제품)에 JUMUN(새로 주문한 것)

--◆ 풀이
SELECT T.JECODE "제품코드", SUM(T.JUSU) "총 주문량"
FROM 
(
SELECT * 
FROM TBL_JUMUN 
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP
) T
GROUP BY T.JECODE; --> 제품 코드별로 묶겠다라는 뜻..!

--○ 같이 풀이

SELECT JECODE "제품코드", SUM(JUSU) "총 주문량"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
GROUP BY JECODE;


--▼ UNION은 사용하면안됨! WHY? -> 중복 행들을 제거해버리기때문에 !
SELECT JECODE "제품코드", SUM(JUSU) "총 주문량"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
GROUP BY JECODE;
--> 이 문제를 해결하는 과정에서는 UNION 을 사용해서는 안 된다.
--  → JECODE 와 JUSU 를 조회하는 과정에서 중복된 행을 제거하는 상황 발생~!!!
--     (홈런볼 30개 주문이 중복되어 제거됨)


--○ INTERSECT(교집합) / MINUS

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문량의 값이 똑같은 행만 추출하고자 한다.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP;
SELECT JECODE, JUSU
FROM TBL_JUMUN;


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT     ------------------------->INTERSECT 삽입하면 됨
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> 
/*
새우깡	20
콘칩	10
콘칩	20
홈런볼	20
*/


--○ TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서 
--   제품코드와 주문량의 값이 똑같은 행의 정보를
--   주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회한다.
--      JUNO,   JECODE  , JUSU      , JUDAY


--○ 함께 풀이한 내용

-- 방법1.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT 
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> 교집합 결과 조회됨

SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT 
SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUN;
--==>> 아무것도 조회되지 않음(JUSU 와 JUSDAY 까지 교집합인 데이터는 없음)

--○ JOIN 안쓰는 방법 (, 사용)
SELECT JUNO "주문번호", JECODE "제품코드", JUSU "주문수량", JUDAY "주문일자" 
FROM 
(       --> 조인한 다른 테이블인여기서 주문번호~주문일자 얻는다
    SELECT *
    FROM TBL_JUMUNBACKUP 
    UNION ALL   -->> 중복행 제거가 안되어야되기때문에 UNION은 안되고 UNION ALL을 써야댐
    SELECT *
    FROM TBL_JUMUN 
)T1,--> 여기서는 , 이지만 JOIN 이랑 같다~! JOIN 써도 됨~!
(       -->겹치는 코드 찾는거
    SELECT JECODE "제품코드", JUSU "주문수량"
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE "제품코드", JUSU "주문수량"
    FROM TBL_JUMUN 
)T2
WHERE T1.JECODE = T2.제품코드 AND T1.JUSU = T2.주문수량
ORDER BY JUNO;


--○ JOIN 쓰는 방법
SELECT T2.JUNO "주문번호", T1.JECODE "제품코드", T1.JUSU "주문수량", T2.JUDAY "주문일자"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT 
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE 
AND T1.JUSU = T2.JUSU;
--==>>
/*
    1	홈런볼	20	2001-11-01 09:00:10
    4	콘칩	10	2001-11-02 15:16:17
    7	콘칩	20	2001-11-02 19:10:10
   10	새우깡	20	2001-11-16 14:23:34
98787	홈런볼	20	2021-09-07 14:26:08
98788	새우깡	20	2021-09-07 14:26:09
98789	콘칩	10	2021-09-07 14:26:10
98790	콘칩	20	2021-09-07 14:26:39
*/



-- 방법2.

-- 틀린예시
SELECT T.* 
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE JECODE = '홈런볼' OR JECODE = '콘칩' OR JECODE = '새우깡'
  AND JUSU = 20 OR JUSU = 10; --> 각각의 WHERE 조건 절을 만족하는 데이터 모두 나옴

-- ▲ XXXXXXX 틀린 구절
--    밑에 두 줄 같은 구절인 줄 알지만 틀림   WHERE JECODE IN('홈런볼','콘칩','새우깡')
--    AND JUSU IN(20, 30) --> 홈런볼, 콘칩, 새우깡인 10, 20이 다나와서 틀림 이렇게 적으면


-- 풀이~!!!!!

SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL --> 내용 다 들어가있는 UNION
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
--WHERE JECODE IN ('홈런볼', '콘칩', '새우깡') --@ 10개 홈런볼이 나와버림..
--  AND JUSU IN (10, 20);
--WHERE JECODE || JUSU IN ('홈런볼20', '콘칩10', '콘칩20', '새우깡20');
--WHERE CONCAT(JECODE, JUSU) IN ('홈런볼20', '콘칩10', '콘칩20', '새우깡20');
WHERE CONCAT(JECODE, JUSU) =ANY ('홈런볼20', '콘칩10', '콘칩20', '새우깡20');

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
새우깡   20
콘칩   10
콘칩   20
홈런볼   20
*/

SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;
--==>>
/*
새우깡20
콘칩10
콘칩20
홈런볼20
*/


SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL --@ 내용 다 들어가있는 UNION
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T

WHERE CONCAT(JECODE, JUSU) =ANY (SELECT CONCAT(JECODE, JUSU)
                                 FROM TBL_JUMUNBACKUP
                                 INTERSECT
                                 SELECT CONCAT(JECODE, JUSU)
                                 FROM TBL_JUMUN);
--==>>
/*
     1   홈런볼   20   2001-11-01 09:00:10
     4   콘칩   10   2001-11-02 15:16:17
     7   콘칩   20   2001-11-06 19:10:10
    10   새우깡   20   2001-11-16 14:20:00
98787   홈런볼   20   2021-09-07 14:17:11
98788   새우깡   20   2021-09-07 14:17:56
98789   콘칩   10   2021-09-07 14:18:53
98790   콘칩   20   2021-09-07 14:20:00
*/
-------------------------



-- MINUS : 차집합 (교집합을 빼준 합)
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
새우깡	20
콘칩	10
콘칩	20
홈런볼	20
*/


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> 
/*
구운파	10
다이제	50
빼빼로	30
칙촉	30
포카칩	40
홈런볼	50
*/

------------------------------------------------------
/*
--○ 차집합
    A = {10, 20, 30, 40, 50}
    B = {10, 20, 30}
    
    A - B = {40, 50}
*/


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = E.DEPTNO;
--> 가장 퍼포먼스가 좋음★

-- CHECK~!!
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT; 
--> NATURAL JOIN : 실행 결과는 최악이지만, 빠르게 결합할 때 쓸 수 있음


SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN  DEPT
USING(DEPTNO);
--> USING() : DEPTNO 를 연결고리로 찾아달라.






