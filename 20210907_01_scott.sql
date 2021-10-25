SELECT USER
FROM DUAL;
--==>>SCOTT

--■■■JOIN(조인)■■■ ★--1992/1999CODE유형 알아두기
--==============================================================================
--1. SQL 1992 CODE 유형
SELECT *
FROM EMP , DEPT;

--> 수학에서 말하는 데카르트 곱 두 테이블을 합친(결합한)  모든경우의 수
--▶ EMP 와 DEPT 를 곱한 것

-- ★Equi join : 서로 정확히 일치하는 데이터들끼리 연결시키는 결합(가장 많이 씀)
SELECT COUNT(*)
FROM EMP , DEPT;
--==>>56

SELECT *
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
/*
7782   CLARK   MANAGER       7839   81/06/09   2450      10   10   ACCOUNTING   NEW YORK
7839   KING   PRESIDENT          81/11/17    5000      10   10   ACCOUNTING   NEW YORK
7934   MILLER   CLERK       7782   82/01/23   1300      10   10   ACCOUNTING   NEW YORK
7566   JONES   MANAGER       7839   81/04/02   2975      20   20   RESEARCH   DALLAS
7902   FORD   ANALYST       7566   81/12/03   3000      20   20   RESEARCH   DALLAS
7876   ADAMS   CLERK       7788   87/07/13   1100      20   20   RESEARCH   DALLAS
7369   SMITH   CLERK       7902   80/12/17   800      20   20   RESEARCH   DALLAS
7788   SCOTT   ANALYST       7566   87/07/13   3000      20   20   RESEARCH   DALLAS
7521   WARD   SALESMAN   7698   81/02/22   1250   500   30   30   SALES   CHICAGO
7844   TURNER   SALESMAN   7698   81/09/08   1500   0   30   30   SALES   CHICAGO
7499   ALLEN   SALESMAN   7698   81/02/20   1600   300   30   30   SALES   CHICAGO
7900   JAMES   CLERK       7698   81/12/03   950      30   30   SALES   CHICAGO
7698   BLAKE   MANAGER       7839   81/05/01   2850      30   30   SALES   CHICAGO
7654   MARTIN   SALESMAN   7698   81/09/28   1250   1400   30   30   SALES   CHICAGO
*/

SELECT *
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO;
/*
7782   CLARK   MANAGER       7839   81/06/09   2450      10   10   ACCOUNTING   NEW YORK
7839   KING   PRESIDENT          81/11/17    5000      10   10   ACCOUNTING   NEW YORK
7934   MILLER   CLERK       7782   82/01/23   1300      10   10   ACCOUNTING   NEW YORK
7566   JONES   MANAGER       7839   81/04/02   2975      20   20   RESEARCH   DALLAS
7902   FORD   ANALYST       7566   81/12/03   3000      20   20   RESEARCH   DALLAS
7876   ADAMS   CLERK       7788   87/07/13   1100      20   20   RESEARCH   DALLAS
7369   SMITH   CLERK       7902   80/12/17   800          20   20   RESEARCH   DALLAS
7788   SCOTT   ANALYST       7566   87/07/13   3000      20   20   RESEARCH   DALLAS
7521   WARD   SALESMAN   7698   81/02/22   1250   500   30   30   SALES   CHICAGO
7844   TURNER   SALESMAN   7698   81/09/08   1500   0   30   30   SALES   CHICAGO
7499   ALLEN   SALESMAN   7698   81/02/20   1600   300   30   30   SALES   CHICAGO
7900   JAMES   CLERK       7698   81/12/03   950          30   30   SALES   CHICAGO
7698   BLAKE   MANAGER       7839   81/05/01   2850      30   30   SALES   CHICAGO
7654   MARTIN   SALESMAN   7698   81/09/28   1250   1400   30   30   SALES   CHICAGO
--==>> 위랑 같은 결과 나옴
*/

--NON EQUI JOIN : 범위안에 적합한 데이터들끼리 연결 시키는 결합
SELECT *
FROM SALGRADE;
SELECT *
FROM EMP;


SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
/*
7566   JONES   MANAGER   7839   81/04/02   2975      20   4   2001   3000
7698   BLAKE   MANAGER   7839   81/05/01   2850      30   4   2001   3000
7782   CLARK   MANAGER   7839   81/06/09   2450      10   4   2001   3000
7788   SCOTT   ANALYST   7566   87/07/13   3000      20   4   2001   3000
7902   FORD   ANALYST   7566   81/12/03   3000      20   4   2001   3000
*/

--EQUI JOIN 시 『(+)』를 활용한 결합 방법
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
/*
20   20
30   30
30   30
20   20
30   30
30   30
10   10
20   20
10   10
30   30
20   20
30   30
20   20
10   10
--> 총 12건의 데이터가 결합되어 조합된 상황
--> 즉, 부서번호를 가지 못한 상태
*/
SELECT *
FROM TBL_EMP;
SELECT *
FROM TBL_DEPT;

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
/*
7934   MILLER   CLERK       7782   82/01/23   1300      10   10   ACCOUNTING   NEW YORK
7839   KING   PRESIDENT          81/11/17   5000      10   10   ACCOUNTING   NEW YORK
7782   CLARK   MANAGER       7839   81/06/09   2450      10   10   ACCOUNTING   NEW YORK
7902   FORD   ANALYST       7566   81/12/03   3000      20   20   RESEARCH   DALLAS
7876   ADAMS   CLERK       7788   87/07/13   1100      20   20   RESEARCH   DALLAS
7788   SCOTT   ANALYST       7566   87/07/13   3000      20   20   RESEARCH   DALLAS
7566   JONES   MANAGER       7839   81/04/02   2975      20   20   RESEARCH   DALLAS
7369   SMITH   CLERK       7902   80/12/17   800      20   20   RESEARCH   DALLAS
7900   JAMES   CLERK       7698   81/12/03   950      30   30   SALES   CHICAGO
7844   TURNER   SALESMAN   7698   81/09/08   1500   0   30   30   SALES   CHICAGO
7698   BLAKE   MANAGER       7839   81/05/01   2850      30   30   SALES   CHICAGO
7654   MARTIN   SALESMAN   7698   81/09/28   1250   1400   30   30   SALES   CHICAGO
7521   WARD   SALESMAN   7698   81/02/22   1250   500   30   30   SALES   CHICAGO
7499   ALLEN   SALESMAN   7698   81/02/20   1600   300   30   30   SALES   CHICAGO
8002   서강준   CLERK       7566   21/09/04   1000   0            
8001   차은우   CLERK       7566   21/09/04   1500   10            
8005   조인성   SALESMEN   7698   21/09/06   1000               
8004   이동욱   SALESMEN   7698   21/09/06   2500               
8003   공유     SALESMAN   7698   21/09/06   2000               
*/
--> 총 19건의 데이터가 결합되어 조합된 상황..! 
--  즉,부서번호를 갖지 못한 사원들도 모두 조회됨!
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--==>> 총 16건의 데이터가 결합되어 조합된 상황!!! 
--     즉 ,부서에 소속된 사원이 아무도 없는 부서들도 조회됨!

--★ (+)가 없는 쪽 테이블의 데이터를 모두 메모리에 적재한 후
--   (+)가 있는 쪽 테이블의 데이터를 하나하나 확인하여 결합시키는 형태로
--==>> 즉 (+)가 있는쪽은 거들뿐(+)가 없는 쪽이 주인공이다
--   JOIN 이 이루어진다.

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO(+);
--==>> 에러발생
--  위와 같은 이유로 이러한 형식의 JOIN 구문은 존재하지 않는다.


--=============================================================================
--2. SQL 1999 CODE 유형-> 『JOIN』키워드 등장 -> JOIN 유형 명시

--                      결합 조건은 『WHERE』 대신 『ON』 사용                  
--                      이전의 92 코드에서 WHERE 조건절/결합 의 구분이 안간다 

-- CROSS JOIN 
SELECT *
FROM EMP CROSS JOIN DEPT;  
--==>> 결과는 데카르트 곱과 똑같음(SQL 1992 CODE)

-- INNER JOIN
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


--※ INNER JOIN 시 INNER 는 생략 가능
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- OUTER JOIN                              
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D --> LEFT/RIGHT 로 방향이 지정된 쪽이 주인공(기준)!
ON E.DEPTNO = D.DEPTNO;

--※ 방향이 지정된 쪽 테이블 (→LEFT) 의 데이터를 모두 메모리에 적재한  후 
--   방향이 지정되지 않은 쪽 테이블들의 데이터를 각각 확인하여 결합시키는 형태로
--   JOIN 이 이루어진다.

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D 
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D 
ON E.DEPTNO = D.DEPTNO;
--> 부서번호 없고(조인성 이하 5명), 소속이 없는(40, 50번부서) 전부 조회됨

--※ OUTER JOIN 에서 OUTER 는 생략 가능
SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D     -- OUTER JOIN  
WHERE E.DETPNO = D.DEPTNO(+);

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D    -- OUTER JOIN 
WHERE E.DETPNO = D.DEPTNO(+);

SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D     -- OUTER JOIN 
WHERE E.DETPNO = D.DEPTNO(+);


SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D      -- INNER JOIN 
WHERE E.DETPNO = D.DEPTNO;


-------------------------------------------------------------

SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;
-- 이 결과에서... 직종이 CLERK 인 사원들만 조회...


SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
AND JOB = 'CLERK';
-- 이렇게 쿼리문을 구성해도 조회하는 데는 문제가 없다.

SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO --> 두 테이블 결합 조건절(JOIN 관련)
WHERE JOB = 'CLERK';   --> WHERE 조건절
-- 하지만, 이와 같이 구성하여 조회할 수 있도록 권장한다.

-- cf. SQL 1992 기준 
SELECT *
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO 
  AND JOB = 'CLERK';


---------------------------------------------------------------------

--○ EMP 테이블과 DEPT 테이블을 대상으로
--   직종이 MANAGER 와 CLERK 인 사원들만
--   부서번호, 부서명, 사원명, 직종명, 급여 항목을 조회한다.
--   --------  ------  ------  ------  -----
--    DEPTNO    DNAME   ENAME   JOB     SAL
--   --------  ------  ------  ------  -----
--     E, D      D       E       E       E 

--<<
SELECT *
FROM EMP;

SELECT *
FROM DEPT;
-->> << >> 사이에 드래그해서 ▶ 누르면 두개의 결과값이 뜬다
--   보면 DEPT 에는 10,20,30,40 이런식으로 나오고 EMP는 10 10 10 ,,, 20 ,,20 ,,~ 40 이렇게 나오는데
--   작게 나오는 것이 상위(부모) 개념이므로 DEPT가 부모 EMP 가 자식이라고 개념이해하면 될 것 이다.
--   318 줄에도 설명 나온다.


--◇내가 푼 풀이 -- 에러 뜸
SELECT D.DEPTNO, D.DNAME, E.DEPTNO, E.ENAME, E.JOB, E.SAL
FROM EMP E JOIN DEPT D
WHERE E.JOB IN (MANAGER, CLERK);

--◆ 선생님 풀이
SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> 에러 발생
/*
ORA-00904: "DANME": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
721행, 16열에서 오류 발생
*/
--> 두 테이블 간 중복되는 컬럼에 대한 소속 테이블(→ DEPTNO)을
--  부모 테이블로 정해줘야(명시해줘야)(→ D.DEPTNO) 한다.


SELECT DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 두 테이블 간 중복되는 컬럼이 존재하지 않는 조회 구문은
--  에러 발생하지 않는다.
--==>>
/*
RESEARCH	SMITH	CLERK	     800
SALES	    ALLEN	SALESMAN	1600
SALES	    WARD	SALESMAN	1250
RESEARCH	JONES	MANAGER	    2975
SALES	    MARTIN	SALESMAN	1250
SALES	    BLAKE	MANAGER	    2850
ACCOUNTING	CLARK	MANAGER	    2450
RESEARCH	SCOTT	ANALYST	    3000
ACCOUNTING	KING	PRESIDENT	5000
SALES	    TURNER	SALESMAN	1500
RESEARCH	ADAMS	CLERK	    1100
SALES	    JAMES	CLERK	     950
RESEARCH	FORD	ANALYST	    3000
ACCOUNTING	MILLER	CLERK	    1300
*/

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
-- SELECT E.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우
--  부서(DEPT), 사원(EMP) 중 어떤 테이블을 지정해도 
--  쿼리문 수행에 대한 결과 반환에 문제가 없다.

--※ 하지만...
--   두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우
--   부모 테이블의 컬럼을 참조할 수 있도록 해야 한다.

SELECT * 
FROM DEPT;      -- 부모 테이블(같은 부서번호가 하나만 출력됨)

SELECT *
FROM EMP;       -- 자식 테이블(같은 부서번호가 여러 개 출력됨)


-- 혹시!!!!! 두 테이블 모두 다 한개씩 밖에 없다면 둘 중 아무거나 써도 된다.

--※ 부모 자식 테이블 관계를 명확히 정리할 수 있도록 한다.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO;
--> 두 테이블 간 중복된 컬럼이 아니더라도...
--  소속 테이블을 명시할 수 있도록 권장한다.


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

---
--<<
-- D 부모 테이블로 참조
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--> 부모테이블 참조 40번 부서 조회됨(소속되어 있는 직원 없어서 NULL)

-- E 자식 테이블로 참조
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-->>
--> 자식테이블 참조하므로 40번 부서 NULL로 조회됨


--○ SELF JOIN (자기 조인)

-- EMP 테이블의 정보를 다음과 같이 조회할 수 있도록 한다.
/*  
    E        E       E        E           E          E
  EMPNO    ENAME    JOB      MGR
                            EMPNO       ENAME       JOB
-------------------------------------------------------------
사원번호  사원명  직종명  관리자번호  관리자명  관리자직종명
-------------------------------------------------------------
7369      SMITH   CLERK     7902        FORD     ANALYST

 EMP        EMP     EMP     EMP          
 ------------------------------- ①
                            EMP         EMP       EMP
                            -------------------------- ②
                           
-------------------------------------------------------------
*/
--◇ 내가 풀이한 내용
SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E1.MGR "관리자번호", E2.ENAME "관리자명"
     , E2.JOB "관리자직종명"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO
ORDER BY 2;

---------------------------------------------------------------
--○ 함께 풀이한 내용
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호", E2.ENAME "관리자명", E2.JOB"관리자직종명"
FROM EMP E1 LEFT JOIN EMP E2  --> KING 은 MGR(관리자)에 없으므로 기준이 되는 E1 을 LEFT JOIN해서 조회함
ON E1.MGR = E2.EMPNO;
--==>>
/*
7902	FORD	ANALYST	    7566	JONES	MANAGER
7788	SCOTT	ANALYST	    7566	JONES	MANAGER
7900	JAMES	CLERK	    7698	BLAKE	MANAGER
7844	TURNER	SALESMAN	7698	BLAKE	MANAGER
7654	MARTIN	SALESMAN	7698	BLAKE	MANAGER
7521	WARD	SALESMAN	7698	BLAKE	MANAGER
7499	ALLEN	SALESMAN	7698	BLAKE	MANAGER
7934	MILLER	CLERK	    7782	CLARK	MANAGER
7876	ADAMS	CLERK	    7788	SCOTT	ANALYST
7782	CLARK	MANAGER	    7839	KING	PRESIDENT
7698	BLAKE	MANAGER	    7839	KING	PRESIDENT
7566	JONES	MANAGER	    7839	KING	PRESIDENT
7369	SMITH	CLERK	    7902	FORD	ANALYST
7839	KING	PRESIDENT			
*/