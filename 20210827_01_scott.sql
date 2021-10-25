--○ 접속된 사용자 조회
SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT EMPNO, ENAME,JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

--※ 테이블을 조회하는 과정에서 각 컬럼에 별칭(ALIAS)을 부여할 수 있다.

SELECT EMPNO AS "사원번호", ENAME "사원명", JOB 직종, SAL "급   여", DEPTNO"부서번호"     --AS, " " 생략 가능   
FROM EMP
WHERE DEPTNO = 20;

--※ 테이블 조회 시 사용하는 별칭의 기본 구문은 『AS "별칭명"』의 형태로 작성되며
--   이 때, 『AS』는 생략 가능하다.
--   또한, 『""』도 생략 가능하다.
--   하지만, 『""』를 생략할 경우 별칭명에 공백은 사용할 수 없다.
--   공백은 해달 컬럼의 종결을의미하므로 별칭의 이름 내부에 공백을 사용할 경우
--   『""』를 사용하여 별칭을 부여할 수 있도록 처리해야 한다.


--○ EMP 테이블에서 부서번호가 20번과 30번 직원들의 정보 중
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다,
--   , 단, 별칭(ALIAS)을 사용한다.
SELECT *
FROM EMP;


SELECT EMPNO AS "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"       
FROM EMP
WHERE DEPTNO = 20 || DEPTNO = 30;
--==>> 에러 발생

SELECT EMPNO AS "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"       
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;
--==>>
/*
7369	SMITH	CLERK   	800 	20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER 	2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER 	2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK   	1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST 	3000	20
*/


SELECT EMPNO AS "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"       
FROM EMP
WHERE DEPTNO IN(20, 30);    -- 20번과 30번이 (IN)들어있다.
--> IN 연산자를 활용하여 이와 같이 처리할 수도 있으며
--  위의 구무과 같은 결과를 반환하게 된다.


--○ EMP 테이블에서 직종이 CLERK 인 사원들의 정보를 모두 조회한다.

SELECT *
FROM EMP
WHERE JOB = CLERK;  -- X

SELECT *
FROM EMP
WHERE JOB = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	80/12/17	800	    	20
7876	ADAMS	CLERK	7788	87/07/13	1100		20
7900	JAMES	CLERK	7698	81/12/03	950	    	30
7934	MILLER	CLERK	7782	82/01/23	1300		10
*/

SelEct *
FrOm EmP
Where joB = 'CLerk';        -- 값 안나옴

--※ 오라클에서.... 입력된 데이터(값) 만큼은
--   반.드.시 대소문자 구분을 한다.

--○ EMP 테이블에서 직종이 CLERK 인 사원들 중 
--   20번 부서에 근무하는 사원들의
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.

SELECT EMPNO AS "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"       
FROM EMP
WHERE JOB 이 CLERK   DEPTNO 가 20;        ----- X



SELECT EMPNO AS "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"       
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	800 	20
7876	ADAMS	CLERK	1100	20
*/

DESC EMP;

--○ EMP 테이블에서 10번 부서에 근무하는 직원들 중
--   급여가 2500 이상인 직원들의
--   사원명, 직종명, 급여, 부서번호 항목을 조회한다.

SELECT ENAME AS "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"       
FROM EMP
WHERE DEPTNO = 10 AND SAL>=2500;
--==>> KING	PRESIDENT	5000	10



--○ 테이블 복사
--> 내부적으로 대상 테이블 안에 있는데이터 내용만 복사하는 과정

--※ EMP 테이블의 데이터를 확인하여
--   이와 똑같은 데이터가 들어있는 EMPCOPY 테이블을 생성한다.(팀별로...)

SELECT *
FROM EMP;

CREATE TABLE EMPCOPY
( EMPNO     NUMBER(4)    
,ENAME      VARCHAR2(10) 
,JOB        VARCHAR2(9)  
,MGR        NUMBER(4)    
,HIREDATE   DATE         
,SAL        NUMBER(7,2)  
,COMM       NUMBER(7,2)  
,DEPTNO     NUMBER(2)
)                               -- )뒤에 ; 를 안붙였는데 생성됬지만 나중에 실행할때
--==>> CREATE TABLE EMPCOPY         에러날수도있으니 그냥 삭제하고 다시 만들었다.

SELECT *
FROM EMP;


DROP TABLE EMPCOPY; -- 테이블 삭제 구문

-- 다시생성하기
CREATE TABLE EMPCOPY
( EMPNO     NUMBER(4)    
,ENAME      VARCHAR2(10) 
,JOB        VARCHAR2(9)  
,MGR        NUMBER(4)    
,HIREDATE   DATE         
,SAL        NUMBER(7,2)  
,COMM       NUMBER(7,2)  
,DEPTNO     NUMBER(2)
);

INSERT INTO EMPCOPY VALUES(7369,'SMITH','CLERK',7902,to_date('80/12/17','yy/mm/dd'),800,NULL,20);
INSERT INTO EMPCOPY VALUES(7499,'ALLEN','SALESMAN',7698,to_date('81/02/20','yy/mm/dd'),1600,300,30);
INSERT INTO EMPCOPY VALUES(7521,'WARD','SALESMAN',7698,to_date('81/02/22','yy/mm/dd'),1250,500,30);
INSERT INTO EMPCOPY VALUES(7566,'JONES','MANAGER',7839,to_date('81/04/02','yy/mm/dd'),2975,NULL,20);
INSERT INTO EMPCOPY VALUES(7654,'MARTIN','SALESMAN',7698,to_date('81/09/28','yy/mm/dd'),1250,1400,30);
INSERT INTO EMPCOPY VALUES(7698,'BLAKE','MANAGER',7839,to_date('81/05/01','yy/mm/dd'),2850,NULL,30);
INSERT INTO EMPCOPY VALUES(7782,'CLARK','MANAGER',7839,to_date('81/06/09','yy/mm/dd'),2450,NULL,10);
INSERT INTO EMPCOPY VALUES(7788,'SCOTT','ANALYST',7566,to_date('87/07/13','yy/mm/dd'),3000,NULL,20);
INSERT INTO EMPCOPY VALUES(7839,'KING','PRESIDENT',NULL,to_date('81/11/17','yy/mm/dd'),5000,NULL,10);
INSERT INTO EMPCOPY VALUES(7844,'TURNER','SALESMAN',7698,to_date('81/09/08','yy/mm/dd'),1500,0,30);
INSERT INTO EMPCOPY VALUES(7876,'ADAMS','CLERK',7788,to_date('87/07/13','yy/mm/dd'),1100,NULL,20);
INSERT INTO EMPCOPY VALUES(7900,'JAMES','CLERK',7698,to_date('81/12/03','yy/mm/dd'),950,NULL,30);
INSERT INTO EMPCOPY VALUES(7902,'FORD','ANALYST',7566,to_date('81/12/03','yy/mm/dd'),3000,NULL,20);
INSERT INTO EMPCOPY VALUES(7934,'MILLER','CLERK',7782,to_date('82/01/23','yy/mm/dd'),1300,NULL,10);

SELECT *
FROM EMPCOPY;

CREATE TABLE EMP2
AS
SELECT *
FROM EMP;
--==>> Table EMP2이(가) 생성되었습니다.

SELECT *
FROM EMP2;

DESC EMP2;

--※ 날짜 관련 형식 세션 정보 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

DROP TABLE EMPCOPY;
--==>> Table EMPCOPY이(가) 삭제되었습니다.

DELETE
FROM EMP2;
--==>> 14개 행 이(가) 삭제되었습니다.

SELECT *
FROM EMP2;
--==>> 테이블은 존재하지만 데이터는 삭제된 상태이므로 조회는 된다.

SELECT *
FROM EMPCOPY;
--==> 테이블 자체를 삭제했기 때문에 에러뜸

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.

CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT이(가) 생성되었습니다.


--○ 복사한 테이블 확인
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;


--○ 테이블의 커멘트 정보 확인
SELECT * 
FROM USER_TAB_COMMENTS;

--○ 테이블의 커멘트 정보 입력
COMMENT ON TABLE TBL_EMP IS '사원정보';
--==>> Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 이후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
DEPT        	TABLE	
EMP	            TABLE	
BONUS       	TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
EMP2	        TABLE	
TBL_DEPT    	TABLE	
TBL_EMP	TABLE	사원정보
*/


--○ 테이블 레벨의 커멘트 정보 입력(TBL_DEPT → 부서정보)
COMMENT ON TABLE TBL_DEPT IS '부서정보';
--==>> Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 이후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE   사원정보
TBL_DEPT   	    TABLE	부서정보
EMP2	        TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--○ 컬럼(COL) 레벨의 커멘트 정보 확인
SELECT *
FROM USER_COL_COMMENTS;


--※ 휴지통 비우기     // 오라클은 삭제하면 휴지통으로 가기때문,,
PURGE RECYCLEBIN;
--==>> RECYCLEBIN이(가) 비워졌습니다.


SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/


--○ 테이블에 소속된(포함된) 컬럼 레벨의 커멘트 정보 입력(설정)

COMMENT ON COLUMN 컬럼명

COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '부서번호';
--==>>Comment이(가) 생성되었습니다.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '부서명';
--==>>Comment이(가) 생성되었습니다.
COMMENT ON COLUMN TBL_DEPT.LOC IS '부서위치';
--==>>Comment이(가) 생성되었습니다.

--○컬럼 레벨의 커멘트 정보 확인
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
/*
TBL_DEPT   DEPTNO   부서위치
TBL_DEPT   DNAME   부서명
TBL_DEPT   LOC       부서위치
*/

DESC TBL_EMP;
/*--> 넣어봐라~~~~~~~~!!!!!
EMPNO       NUMBER(4)       -- 사원번호    
ENAME       VARCHAR2(10)    -- 사원명
JOB         VARCHAR2(9)     -- 직종명
MGR         NUMBER(4)       -- 관리자사원번호
HIREDATE    DATE            -- 입사일
SAL         NUMBER(7,2)     -- 급여
COMM        NUMBER(7,2)     -- 수당
DEPTNO      NUMBER(2)       -- 부서번호
*/

--○ TBL_EMP 테이블에 소속된(포함된)
--   컬럼에 대한 커멘트 정보 입력(설정)
COMMENT ON COLUMN TBL_EMP.EMPNO  IS '사원번호';
COMMENT ON COLUMN TBL_EMP.ENAME  IS '사원명';
COMMENT ON COLUMN TBL_EMP.JOB  IS '직종명';
COMMENT ON COLUMN TBL_EMP.MGR  IS '관리자사원번호';
COMMENT ON COLUMN TBL_EMP.HIREDATE  IS '입사일';
COMMENT ON COLUMN TBL_EMP.SAL  IS '급여';
COMMENT ON COLUMN TBL_EMP.COMM  IS '수당';
COMMENT ON COLUMN TBL_EMP.DEPTNO  IS '부서번호';
--==>> Comment이(가) 생성되었습니다.


--○ 커멘트 정보가 입력된 테이블의 컬럼 레벨의 정보 확인

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
/*
TBL_EMP	EMPNO	    사원번호
TBL_EMP	ENAME	    사원명
TBL_EMP	JOB 	    직종명
TBL_EMP	MGR	        관리자사원번호
TBL_EMP	HIREDATE    입사일
TBL_EMP	SAL	        급여
TBL_EMP	COMM	    수당
TBL_EMP	DEPTNO	    부서번호
*/

--■■■ 컬럼 구조의 추가 및 제거 ■■■--

SELECT *
FROM TBL_EMP;

--○ TBL_EMP 테이블에 주민등록번호 정보를 담을 수 있는 컬럼 추가
--   구조적인 변경내용은 ALTER

ALTER TABLE TBL_EMP;
--//ADD SSN NUMBER(13);
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.
--※ 맨 앞에 0이 들어올 가능성이 있는 숫자가 조합된 데이터라면
--   숫자형이 아닌 문자형으로 데이터타입을 처리해야 한다.    CHECK~!!!!!!!


SELECT 9501052234567
FROM DUAL;
--==>> 9501052234567

SELECT 0501052234567    --// 숫자는 앞에 0이 떼고나온다.
FROM DUAL;
--==>> 501052234567

SELECT '0501052234567'
FROM DUAL;
--==>> 0501052234567

SELECT 01044342587
FROM DUAL;
--==>> 1044342587

SELECT '01044342587'
FROM DUAL;
--==>> 01044342587


SELECT *
FROM TBL_EMP;
/*
EMPNO   ENAME   JOB         MGR     HIREDATE    SAL     COMM    DEPTNO    SSN 
-------------------------------------------------------------------------------
7369	SMITH	CLERK	    7902	1980-12-17	800		20	
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30	
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30	
7566	JONES	MANAGER	    7839	1981-04-02	2975		20	
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30	
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30	
7782	CLARK	MANAGER	7839	1981-06-09	2450		10	
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20	
7839	KING	PRESIDENT		1981-11-17	5000		10	
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30	
7876	ADAMS	CLERK	7788	1987-07-13	1100		20	
7900	JAMES	CLERK	7698	1981-12-03	950		30	
7902	FORD	ANALYST	7566	1981-12-03	3000		20	
7934	MILLER	CLERK	7782	1982-01-23	1300		10	
*/


SELECT ENAME, SSN
FROM TBL_EMP;


DESC TBL_EMP;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13)            -- 확인
*/

SELECT EMPNO, ENAME, SSN, HIREDATE, SAL, COMM
FROM TBL_EMP;
--> 테이블 내에서 컬럼의 순서는 구조적으로 의미 없음.

--○ TBL_EMP 테이블에서 추가한 SSN(주민등록번호) 컬럼 제거
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP이(가) 변경되었습니다.

--○ 확인
SELECT * 
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정산적으로 제거되었음을 확인
--① 전체적으로 출력하려고하는데 내가 무엇을 삭제할 것인지 먼저 확인하기
SELECT * 
FROM TBL_EMP
WHERE ENAME = 'SMITH';

--② 확인이 됬고 삭제할 구문이 맞다면 SELECT 를 DELETE로 바꾸면 됨
--// 권장 방법
DELETE
FROM TBL_EMP
WHERE ENAME = 'SMITH';

--// 이 방법도있지만 권장하지 않음!!
DELETE TBL_EMP;

--○ 테이블을 구조적으로 삭제(데이터의 내용 뿐 아니라....테이불 자체를 제거)
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

SELECT * 
FROM TBL_EMP;
--==>> 에러 발생
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
467행, 6열에서 오류 발생
*/

--○ 테이블 다시 생성(복사)
CREATE TABLE TBL_EMP    --②이거랑 
AS                      --   밑에 AS 도 포함해서 FROM EMP까지 4줄 다 블락 또는 커서놨두고 생성한다.
SELECT *        --① 이거랑
FROM EMP;       --이거랑 두개 먼저 블락잡아서 컨트롤+엔터해서 실행해서 실행되는지확인하고

--------------------------------------------------------------------------------------------------------
--○NULL 의 처리
SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 2	12	8	20	5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>> (null) (null) (null) (null) (null) 

--==>> ※ 관찰 결과
--        NULL 은 상태의 값을 의미하며, 실제 존재하지 않는 값이기 때문에
--        이 NULL 이 연산에 포함될 경우... 그 결과는 무조건 NULL 이다.

--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL 인 직원의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.

SELECT 사원명, 직종명, 급여, 커미션       
FROM TBL_EMP
WHERE 커미션 NULL;


SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"       
FROM TBL_EMP
WHERE COMM = NULL;
--==>> 결과없음

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"       
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> 에러 발생 WHY? NULL이 숫자타입인데 저거는 '' 안에있어서 문자열이라서 에러남

DESC TBL_EMP;
--> COMM 컬럼은 숫자형 데이터 타입을 취하고 있음을 확인

-- ※ NULL 은 실제 존재하지 않는 값이기 때문에 일반적인 연산자를 활용하여 비교할 수 없다.
--   즉, 산술적인 비교 연산을 수행할 수 없다는 의미이다.
--   NULL 을 대상으로 사용할 수 없는 연산자들...
--   >=, <=, >, < , !=, ^=, <>

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"       
FROM TBL_EMP
WHERE COMM IS NULL;       -- IS는 논리적으로 결과를 얻어내는 연산자
--==>>
/*
SMITH	CLERK   	800	
JONES	MANAGER	    2975	
BLAKE	MANAGER 	2850	
CLARK	MANAGER	    2450	
SCOTT	ANALYST	    3000	
KING	PRESIDENT	5000	
ADAMS	CLERK   	1100	
JAMES	CLERK	    950	
FORD	ANALYST	    3000	
MILLER	CLERK	    1300	
*/

--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 직원들의
--   사원명, 직종명, 부서번호 항목을 조회한다.

SELECT 사원명, 직종명, 부서번호 
FROM TBL_EMP
WHERE 부서번호 20이 아닌; 

SELECT 사원명, 직종명, 부서번호 
FROM TBL_EMP
WHERE DEPTNO != 20이 아닌; 


SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"       
FROM TBL_EMP
WHERE DEPTNO != 20; 
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER 	30
CLARK	MANAGER 	10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK   	10
*/

SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"       
FROM TBL_EMP
WHERE DEPTNO ^= 20; 
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER 	30
CLARK	MANAGER 	10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK   	10
*/

SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"       
FROM TBL_EMP
WHERE DEPTNO <> 20; 
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER 	30
CLARK	MANAGER 	10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK   	10
*/


SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"       
FROM TBL_EMP
WHERE COMM  20; 

--○ TBL_EMP 테이블에서 커미션이 NULL 이 아닌 직원들의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP 
WHERE COMM IS NOT NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP 
WHERE NOT COMM IS NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/


--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)은 매월 지급한다.  (→ 1회/월)
--   또한, 수당(COMM)은 매년 지급한다. (→ 1회/연)

SELECT *
FROM TBL_EMP;
--> 1. 전체 출력해서 무슨 항목있는지 

SELECT 사원번호, 사원명, 급여, 커미션, 연봉
FROM TBL_EMP;
--> 2. 무슨 구문을 넣어야되는건지 체크하기

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션", SAL "연봉"
FROM TBL_EMP ;
--> 3. 필요한 구문만 출력

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션", (12*SAL) + COMM "연봉"
FROM TBL_EMP;
--> 4.
--  이와 같이 연봉을 연산하여 조회할 경우
--  수당(COMM)이 NULL 인 직원들은 연봉까지도 NULL 로 연산되는 것을
--  확인할 수 있다.
--==>>
/*
7369	SMITH	800		
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975		
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		
7782	CLARK	2450		
7788	SCOTT	3000		
7839	KING	5000		
7844	TURNER	1500	 0	    18000
7876	ADAMS	1100		
*/
-->> WHY? 급여를 받는데 연봉이 NULL 이 나오는 값이 있는건가요?
--        COMM 에 NULL 이 있는 값이 있어서 그렇다.
--        NULL 이 하나라도 포함되면 값은 무조건 NULL 이 나온다.

-- NVL()

SELECT NULL "1", NVL(NULL, 10) "2", NVL(10,20) "3"
FROM DUAL;
--==>> (null)	10	10
--> 첫 번째 파라미터 값이 NULL 이면, 두 번째 파라미터 값을 반환한다.
--  첫 번째 파라미터 값이 NULL 이 아니면, 그 값(첫 번째 파라미터)을 그대로 반환한다.

--관찰
SELECT *
FROM EMP
WHERE EMPNO =7369;
--==>> 7369	SMITH	CLERK	7902	1980-12-17	800		20

SELECT ENAME, COMM
FROM EMP
WHERE EMPNO = 7369;
--==>> SMITH    (null)	

SELECT ENAME, NVL(COMM, 0)
FROM EMP
WHERE EMPNO = 7369;
--==>> SMITH	0

SELECT ENAME "사원명", COMM"수당", NVL(COMM, -1) "함수호출결과"
FROM TBL_EMP;
--==>>
/*
SMITH   (null)  -1
ALLEN	300	    300
WARD	500	    500
JONES	(null)	-1
MARTIN	1400	1400
BLAKE	(null)	-1
CLARK   (null)	-1
SCOTT	(null) 	-1
KING	(null)	-1
TURNER	0	    0
ADAMS	(null)	-1
JAMES	(null)	-1
FORD	(null)	-1
*/

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", NVL(COMM, 0) "커미션"
    , SAL*12+NVL(COMM, 0) "연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800	    0	    9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975	0	    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	    34200
7782	CLARK	2450	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0   	13200
7900	JAMES	950	    0	    11400
7902	FORD	3000	0	    36000
*/

--○ NVL2()
--> 첫 번째 파라미터 값이 NULL 이 아닌 경우, 두 번째 파라미터 값을 반환하고
--  첫 번째 파라미터 값이 NULL 인 경우, 세 번째 파라미터 값을 반환한다.

SELECT ENAME, COMM, NVL2(COMM, '청기올려', '백기올려') "확인여부"
FROM TBL_EMP;
--==>>
/*
SMITH	(null)  백기올려
ALLEN	   300	청기올려
WARD	   500  청기올려
JONES	(null)  백기올려
MARTIN	1400	청기올려
BLAKE   (null)  백기올려
CLARK	(null)	백기올려
SCOTT	(null)	백기올려
KING	(null)	백기올려
TURNER	    0	청기올려
ADAMS	(null)	백기올려
JAMES	(null)	백기올려
FORD	(null)	백기올려
MILLER	(null)	백기올려
*/

--○ NVL2() 활용~ 연봉 조회
-- COMM 이 NULL 이 아니면... SAL*12+COMM
-- COMM 이 NULL 이면........ SAL*12

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", NVL(COMM, 0) "커미션"
    , NVL2(COMM, SAL*12+COMM, SAL*12) "연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800	    0	    9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975	0	    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	    34200
7782	CLARK	2450	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0	    13200
7900	JAMES	950 	0	    11400
7902	FORD	3000	0	    36000
7934	MILLER	1300	0	    15600
*/

--○ COALESCE()
--> 매개변수 제한이 없는 형태로 인지하고 활용한다.
--  맨 앞에 있는 매개변수부터 차례로 NULL 인지 아닌지 확인하여
--  NULL 이 아닐 경우 적용(반환, 처리)하고,
--  NULL 인 경우에는 그 다음 매개변수의 값으로 적용(반환, 처리)한다.
--  NVL 나 NVL2 에 비해... 모든~~~~~~든 경우의 수를 고려하여 처리할 수 있는 특징을 갖고 있다.

SELECT NULL "기본확인"
    , COALESCE(NULL, NULL, NULL, NULL, 30) "함수확인1"
FROM DUAL;
--==>> (null)	30

SELECT NULL "기본확인",
    COALESCE(NULL, NULL, NULL, NULL, 30) "함수확인1",
    COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "함수확인2"
FROM DUAL;
--==>> (null)	30      100
      
--○ 실습을 위한 데이터 추가 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '송해덕', 'SALESMAN', 7839, SYSDATE, 10);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, COMM, DEPTNO)
VALUES(8001, '이다영', 'SALESMAN', 7839, SYSDATE, 100, 10);
--==>> 1 행 이(가) 삽입되었습니다.

/*---->>  이다영 8000번으로 송해덕과 겹치게 입력해서 이다영 데이터 행만 삭제
DELETE 
FROM TBL_EMP
WHERE ENAME = '이다영';
*/

SELECT * 
FROM TBL_EMP;

COMMIT;
--==>> 커밋 완료.



--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)는 매월 지급한다. (→ 1회/연)
--   또한, 수당(COMM)은 매년 지급한다. (→ 1회/연)
--   ※ COALESCE() 함수를 활용한다.

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션",
    COALESCE(SAL*12+COMM, SAL*12, COMM, 0)"연봉"
FROM TBL_EMP;
--==>>
/*
7782	CLARK	2450	(null)	29400
7788	SCOTT	3000	(null)	36000
7839	KING	5000	(null)	60000
7844	TURNER	1500	 0	    18000
7876	ADAMS	1100	(null)	13200
7900	JAMES	950		(null)  11400
7902	FORD	3000	(null)	36000
7934	MILLER	1300	(null)	15600
8000	송해덕	(null)	(null)	0
8001	이다영	(null)	100	    100
*/

------------------------------------------------------------------------------------

-- ※ 날짜에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.



--○ 현재 날짜 및 시간을 반환하는 함수
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;                      ----------------제일 잘쓰임
--==>>
/*
2021-08-27 16:33:25	
2021-08-27 16:33:25	
21/08/27 16:33:25.000000000
*/

--※ 날짜에 대한 세션 설정 다시 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ 컬럼과 컬럼의 연결(결합)
--   문자타입과 문자타입의 연결
--   『+』 연산자를 통한 결합 수행 불가능 → 『||』


SELECT 1+1
FROM DUAL;
--==>> 2

SELECT '송해덕' + '이다영'
FROM DUAL;
--==>> 에러 발생
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT '송해덕', '이다영'
FROM DUAL;
--==>> 송해덕	이다영
--     각각의 칼럼이 분리된 채로 나온다

SELECT '송해덕' || '이다영'
FROM DUAL;
--==>> 송해덕이다영
--     문자열이 합쳐져서 나온다

SELECT EMPNO, ENAME
FROM TBL_EMP;
--==> 밑에 결과가 숫자와 이름이 각각 칼럼에 따로 담긴 형식으로 출력된다.
SELECT EMPNO || ENAME
FROM TBL_EMP;
--==>>
/*
7369SMITH
7499ALLEN
7521WARD
7566JONES
7654MARTIN
7698BLAKE
7782CLARK
7788SCOTT
7839KING
7844TURNER
7876ADAMS
7900JAMES
7902FORD
7934MILLER
8000송해덕
8001이다영
*/

-- ★★★★★★★★★★★★꽤 중요한 내용 ★★★★★★★★★★★★

--      문자타입  날짜타입  문자타입  숫자타입  문자타입
--      --------   -------  ---------  -----  ------------
SELECT '해덕이는', SYSDATE, '에 연봉', 500, '억을 원한다.' --5개의 칼럼
FROM DUAL;

--      문자타입  날짜타입    문자타입  숫자타입  문자타입
--      --------   -------    ---------  -----  ------------
SELECT '해덕이는'|| SYSDATE || '에 연봉'|| 500 || '억을 원한다.' --5개의 칼럼
FROM DUAL;
--==>> 해덕이는2021-08-27에 연봉500억을 원한다.

--※ 오라클에서는 문자 타입의 형태로 형 변환하는 별도의 과정 없이
--   위에서 처리한 내용 처럼 『||』만 삽입해주면 간당히 컬럼과 컬럼을
--   (즉, 서로 다른 종류의 데이터들을) 결합하는 것이 가능하다.
--   MSSQL 서버에서는 모든 데이터를 문자 타입으로 CONVERT 해야 한다.     


--○ TBL_EMP 테이블의 정보를 활용하여
--   모든 직원들의 데이터에 대해서
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
--   희망연봉은 현재연봉*2

--   SMITH의 현재 연봉은 9600 인데 희망 연봉은 19200 이다.
--   ALLER의 현재 연봉은 19500 인데 희망 연봉은 39000 이다.
--                          :

-- 그전에 송해덕과 이다영은 퇴사시킨다.
DELETE
FROM TBL_EMP
WHERE EMPNO IN(8000,8001);
--==>> 2개 행 이(가) 삭제되었습니다.

-->> 제대로 삭제(퇴사) 시켰는지 확인.
SELECT *
FROM TBL_EMP;

-- NVL 버전
SELECT ENAME|| '의 현재 연봉은 ' || NVL(SAL*12+COMM, SAL*12)   
        || '인데 희망 연봉은'|| NVL(SAL*12+COMM, SAL*12)*2 || '이다'
FROM TBL_EMP;


-- NVL2 버전
SELECT ENAME|| '의 현재 연봉은 ' || NVL2(COMM, SAL*12+COMM, SAL*12)   
        || '인데 희망 연봉은'|| NVL2(COMM, SAL*12+COMM, SAL*12)*2 || '이다'
FROM TBL_EMP;


--COALESCE 버전
SELECT ENAME|| '의 현재 연봉은 ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)   
        || '인데 희망 연봉은'|| COALESCE(SAL*12+COMM, SAL*12, COMM, 0)*2 || '이다'
FROM TBL_EMP;

--==>> 셋 다 결과 똑같이 나옴
/*
SMITH의 현재 연봉은 9600인데 희망 연봉은19200이다
ALLEN의 현재 연봉은 19500인데 희망 연봉은39000이다
WARD의 현재 연봉은 15500인데 희망 연봉은31000이다
JONES의 현재 연봉은 35700인데 희망 연봉은71400이다
MARTIN의 현재 연봉은 16400인데 희망 연봉은32800이다
BLAKE의 현재 연봉은 34200인데 희망 연봉은68400이다
CLARK의 현재 연봉은 29400인데 희망 연봉은58800이다
SCOTT의 현재 연봉은 36000인데 희망 연봉은72000이다
KING의 현재 연봉은 60000인데 희망 연봉은120000이다
TURNER의 현재 연봉은 18000인데 희망 연봉은36000이다
ADAMS의 현재 연봉은 13200인데 희망 연봉은26400이다
JAMES의 현재 연봉은 11400인데 희망 연봉은22800이다
FORD의 현재 연봉은 36000인데 희망 연봉은72000이다
MILLER의 현재 연봉은 15600인데 희망 연봉은31200이다
*/

SELECT *
FROM TBL_EMP;
-- SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.
-- ALLEN's 입사일은 1981-02-20이다. 그리고 급여는 1600이다.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


SELECT ENAME|| '''s 의 입사일은 ' || HIREDATE 
        || '이다. 그리고 급여는'|| SAL || '이다'
FROM TBL_EMP;
--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)
--   홑따옴표 두 개가 홑따옴표 하나(어퍼스트로피)를 의미한다.
--   결과적으로...
--   홑따옴표 하나 『'』는 문자열의 시작을 나타내고
--   홑따옴표 두 개 『''』는 문자열 영역 안에서 어퍼스트로피를 나타내며
--   다시 등장하는 홑따옴효 하나 『'』가 문자열 영역의 종료를 의미하게 되는 것이다.

--==>
/* -> 이름's 는 '''
SMITH's 의 입사일은 1980-12-17이다. 그리고 급여는800이다
ALLEN's 의 입사일은 1981-02-20이다. 그리고 급여는1600이다
WARD's 의 입사일은 1981-02-22이다. 그리고 급여는1250이다
JONES's 의 입사일은 1981-04-02이다. 그리고 급여는2975이다
MARTIN's 의 입사일은 1981-09-28이다. 그리고 급여는1250이다
BLAKE's 의 입사일은 1981-05-01이다. 그리고 급여는2850이다
CLARK's 의 입사일은 1981-06-09이다. 그리고 급여는2450이다
SCOTT's 의 입사일은 1987-07-13이다. 그리고 급여는3000이다
KING's 의 입사일은 1981-11-17이다. 그리고 급여는5000이다
TURNER's 의 입사일은 1981-09-08이다. 그리고 급여는1500이다
ADAMS's 의 입사일은 1987-07-13이다. 그리고 급여는1100이다
JAMES's 의 입사일은 1981-12-03이다. 그리고 급여는950이다
FORD's 의 입사일은 1981-12-03이다. 그리고 급여는3000이다
MILLER's 의 입사일은 1982-01-23이다. 그리고 급여는1300이다
*/


SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';
--==>> 조회 결과 없음

--○ UPPER(), LOWER(), INITCAP()

SELECT 'oRacLE' "1", UPPER('oRacLE') "2", LOWER('oRacLE') "3", INITCAP('oRacLE') "4"
FROM DUAL;
--==>> oRacLE	ORACLE	oracle	Oracle
--> UPPER() 는 모두 대문자로 변환하여 반환
--  LOWER() 는 모두 소문자로 변환하여 반환
--  INITCAP()는 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환

SELECT *
FROM TBL_EMP
WHERE JOB = (입력값);


SELECT *
FROM TBL_EMP
WHERE JOB = UPPER('salEsmAn');

SELECT *
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('salEsmAn');   --UPPER, LOWER. INITCAP 둘다 설정하면됨

COMMIT;
--==>> 커밋 완료.