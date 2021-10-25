SELECT USER
FROM DUAL;
--==> HR


--○ EMPLOYEES 테이블에서 SALARY 를 
--   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance →10%
--   Executive → 15%
--   Accounting → 20%
--   (쿼리문 구성 및 결과 확인 후 ROLLBACK)

--   나머지 SALARY → 0%


SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;


--○ 함께 풀이한 내용
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

-- ① 틀 만들기
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'의 부서아이디)
                                THEN SALARY * 1.1
                                WHEN ('Executive'의 부서아이디)
                                THEN SALARY * 1.15
                                WHEN ('Accounting'의 부서아이디)
                                THEN SALARY * 1.2
                                ELSE SALARY
                            END;
--WHERE  DEPARTMENT_ID IN ('Finance'의 부서아이디, 'Executive'의 부서아이디,'Accounting'의 부서아이디);              
--↑ 이건 있어도 되고 없어도 된다. WHY? CASE조건절에서 해당하는것만 걸러줘서

-- ② 조건 만들기
                            
-- ('Finance'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';
--==>> 100


-- ('Executive'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';
--==>> 90


-- ('Accounting'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';
--==>> 110


-- ①에 ② 집어 넣기
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance')
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Executive')
                                THEN SALARY * 1.15
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Accounting')
                                THEN SALARY * 1.2
                                ELSE SALARY
             END;
--==>> 107개 행 이(가) 업데이트되었습니다.
/*
-->◎ 이거 없어도 결과 값 잘 나온다~! 없어도 됨
WHERE DEPARTMENT_ID IN ((SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'Finance')
                       ,(SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'Executive')
                       ,(SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'Accounting'));
================================================================
위에 ◎ 이거랑 같은 구문!

WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME IN ('Finance', 'Executive','Accounting'));
--==>> 11개 행 이(가) 업데이트되었습니다.                         
*/


-- 업데이트 완료됬는지 확인

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (90,100,110);

--==>>
/*
100	Steven	        King	    SKING	    515.123.4567	03/06/17	AD_PRES	27600		    	90
101	Neena	        Kochhar	    NKOCHHAR	515.123.4568	05/09/21	AD_VP	19550		    100	90
102	Lex 	        De Haan	    LDEHAAN	    515.123.4569	01/01/13	AD_VP	19550		    100	90
108	Nancy	        Greenberg	NGREENBE	515.124.4569	02/08/17	FI_MGR	13208.8		    101	100
109	Daniel      	Faviet	    DFAVIET 	515.124.4169	02/08/16	FI_ACCOUNT	9900		108	100
110	John	        Chen	    JCHEN	    515.124.4269	05/09/28	FI_ACCOUNT	9020		108	100
111	Ismael  	    Sciarra	    ISCIARRA	515.124.4369	05/09/30	FI_ACCOUNT	8470		108	100
112	Jose Manuel	    Urman	    JMURMAN	    515.124.4469	06/03/07	FI_ACCOUNT	8580		108	100
113	Luis	        Popp	    LPOPP	    515.124.4567	07/12/07	FI_ACCOUNT	7590		108	100
205	Shelley 	    Higgins	    SHIGGINS	515.123.8080	02/06/07	AC_MGR	14409.6		    101	110
206	William	        Gietz	    WGIETZ	    515.123.8181	02/06/07	AC_ACCOUNT	9960		205	110
*/
-----------------------------------------------------------------------------------
 
--■■■ DELETE ■■■--

-- 1. 테이블에서 지정된 행(레코드)을 삭제하는 데 사용하는 구문.

-- 2. 형식 및 구조
-- DELETE [FROM] 테이블명
-- [WHERE 조건절];

-- ① 내가 삭제하고 싶은 부분 찾기
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;
--==>> 198	Donald	OConnell	DOCONNEL	650.507.9833	07/06/21	SH_CLERK	2600		124	50


-- ② 찾았으면 SELECT 구문을 DELETE 로 바꾼다.
DELETE
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>> 롤백 완료.


--============================================================
--○ EMPLOYEES 테이블에서 직원들의 정보를 삭제한다.
--   단, 부서명이 'IT'인 경우로 한정한다.

--※ 실제로는 EMPLOYEES 테이블의 데이터가(삭제하고자 하는 대상)
--   다른 테이블(혹은 자기 자신 테이블)에 의해 참조당하는 경우
--   삭제되지 않을 수 있다는 사실을 염두해야 하며...
--   그에 대한 이유도 알아야 한다.

--◇ 내가 푼 것

SELECT *
FROM DEPARTMENTS;


--▼ SELECT 를 DELETE 로 바꾸기
DELETE
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='IT';
--==>> 오류 난다 왜지??????????????
--=========================================

--○ 강사님 풀이

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID=('IT'의 부서번호);
 
 
-- ('IT'의 부서번호)

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='IT';
--=>> 60




SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS 
                       WHERE DEPARTMENT_NAME = 'IT');

DELETE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS 
                       WHERE DEPARTMENT_NAME = 'IT');
--==>> 에러 발생
/*
오류 보고 -
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/

--------------------------------------------------------------------------------


--■■■ 뷰(VIEW) ■■■--

-- 1. 뷰(VIEW)란 이미 특정한 데이터베이스 내에 존재하는
--    하나 이상의 테이블에서 사용자가 얻기 원하는 데이터들만을 
--    정확하고 편하게 가져오기 위하여 사전에 원하는 컬럼들만 모아서
--    만들어놓은 가상의 테이블로 편의성 및 보안에 목적이 있다.

--    가상의 테이블이란 뷰가 실제로 존재하는 테이블(객체)이 아니라
--    하나 이상의 테이블에서 파생된 또 다른 정보를 볼 수 있는 방법이며
--    그 정보를 추출해내는 SQL 문장이라고 볼 수 있다는 것이다.

-- 2. 형식 및 구조
-- CREATE [OR REPLACE] VIEW 뷰이름
-- [(ALIAS[, ALIAS, ...])]
-- AS 
-- 서브쿼리(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY];


--○ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS      -->>↓ SELECT ~ ; 까지 드래그해서 실행했을때 나와야지  CREATE 붙여도 실행 된다
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+) 
  AND C.REGION_ID = R.REGION_ID(+);
--==>> View VIEW_EMPLOYEES이(가) 생성되었습니다.

--○ 뷰 조회
SELECT *
FROM VIEW_EMPLOYEES;


--○ 뷰(VIEW) 구조 확인
DESC VIEW_EMPLOYEES;
--==>>
/*
View VIEW_EMPLOYEES이(가) 생성되었습니다.
이름              널?       유형           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/


--○ 뷰(VIEW) 소스 확인 -- CHECK~!!!
SELECT VIEW_NAME, TEXT "소스"           -- TEXT(소스가 있는 곳)
FROM USER_VIEWS                         -- USER_VIEWS
WHERE VIEW_NAME='VIEW_EMPLOYEES';
--==>> 어떤 뷰인지 확인할 수 있음
/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+) 
  AND C.REGION_ID = R.REGION_ID(+)"
*/












