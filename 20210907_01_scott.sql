SELECT USER
FROM DUAL;
--==>>SCOTT

--����JOIN(����)���� ��--1992/1999CODE���� �˾Ƶα�
--==============================================================================
--1. SQL 1992 CODE ����
SELECT *
FROM EMP , DEPT;

--> ���п��� ���ϴ� ��ī��Ʈ �� �� ���̺��� ��ģ(������)  ������� ��
--�� EMP �� DEPT �� ���� ��

-- ��Equi join : ���� ��Ȯ�� ��ġ�ϴ� �����͵鳢�� �����Ű�� ����(���� ���� ��)
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
--==>> ���� ���� ��� ����
*/

--NON EQUI JOIN : �����ȿ� ������ �����͵鳢�� ���� ��Ű�� ����
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

--EQUI JOIN �� ��(+)���� Ȱ���� ���� ���
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
--> �� 12���� �����Ͱ� ���յǾ� ���յ� ��Ȳ
--> ��, �μ���ȣ�� ���� ���� ����
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
8002   ������   CLERK       7566   21/09/04   1000   0            
8001   ������   CLERK       7566   21/09/04   1500   10            
8005   ���μ�   SALESMEN   7698   21/09/06   1000               
8004   �̵���   SALESMEN   7698   21/09/06   2500               
8003   ����     SALESMAN   7698   21/09/06   2000               
*/
--> �� 19���� �����Ͱ� ���յǾ� ���յ� ��Ȳ..! 
--  ��,�μ���ȣ�� ���� ���� ����鵵 ��� ��ȸ��!
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--==>> �� 16���� �����Ͱ� ���յǾ� ���յ� ��Ȳ!!! 
--     �� ,�μ��� �Ҽӵ� ����� �ƹ��� ���� �μ��鵵 ��ȸ��!

--�� (+)�� ���� �� ���̺��� �����͸� ��� �޸𸮿� ������ ��
--   (+)�� �ִ� �� ���̺��� �����͸� �ϳ��ϳ� Ȯ���Ͽ� ���ս�Ű�� ���·�
--==>> �� (+)�� �ִ����� �ŵ��(+)�� ���� ���� ���ΰ��̴�
--   JOIN �� �̷������.

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO(+);
--==>> �����߻�
--  ���� ���� ������ �̷��� ������ JOIN ������ �������� �ʴ´�.


--=============================================================================
--2. SQL 1999 CODE ����-> ��JOIN��Ű���� ���� -> JOIN ���� ���

--                      ���� ������ ��WHERE�� ��� ��ON�� ���                  
--                      ������ 92 �ڵ忡�� WHERE ������/���� �� ������ �Ȱ��� 

-- CROSS JOIN 
SELECT *
FROM EMP CROSS JOIN DEPT;  
--==>> ����� ��ī��Ʈ ���� �Ȱ���(SQL 1992 CODE)

-- INNER JOIN
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


--�� INNER JOIN �� INNER �� ���� ����
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- OUTER JOIN                              
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D --> LEFT/RIGHT �� ������ ������ ���� ���ΰ�(����)!
ON E.DEPTNO = D.DEPTNO;

--�� ������ ������ �� ���̺� (��LEFT) �� �����͸� ��� �޸𸮿� ������  �� 
--   ������ �������� ���� �� ���̺���� �����͸� ���� Ȯ���Ͽ� ���ս�Ű�� ���·�
--   JOIN �� �̷������.

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D 
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D 
ON E.DEPTNO = D.DEPTNO;
--> �μ���ȣ ����(���μ� ���� 5��), �Ҽ��� ����(40, 50���μ�) ���� ��ȸ��

--�� OUTER JOIN ���� OUTER �� ���� ����
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
-- �� �������... ������ CLERK �� ����鸸 ��ȸ...


SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
AND JOB = 'CLERK';
-- �̷��� �������� �����ص� ��ȸ�ϴ� ���� ������ ����.

SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO --> �� ���̺� ���� ������(JOIN ����)
WHERE JOB = 'CLERK';   --> WHERE ������
-- ������, �̿� ���� �����Ͽ� ��ȸ�� �� �ֵ��� �����Ѵ�.

-- cf. SQL 1992 ���� 
SELECT *
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO 
  AND JOB = 'CLERK';


---------------------------------------------------------------------

--�� EMP ���̺�� DEPT ���̺��� �������
--   ������ MANAGER �� CLERK �� ����鸸
--   �μ���ȣ, �μ���, �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
--   --------  ------  ------  ------  -----
--    DEPTNO    DNAME   ENAME   JOB     SAL
--   --------  ------  ------  ------  -----
--     E, D      D       E       E       E 

--<<
SELECT *
FROM EMP;

SELECT *
FROM DEPT;
-->> << >> ���̿� �巡���ؼ� �� ������ �ΰ��� ������� ���
--   ���� DEPT ���� 10,20,30,40 �̷������� ������ EMP�� 10 10 10 ,,, 20 ,,20 ,,~ 40 �̷��� �����µ�
--   �۰� ������ ���� ����(�θ�) �����̹Ƿ� DEPT�� �θ� EMP �� �ڽ��̶�� ���������ϸ� �� �� �̴�.
--   318 �ٿ��� ���� ���´�.


--�޳��� Ǭ Ǯ�� -- ���� ��
SELECT D.DEPTNO, D.DNAME, E.DEPTNO, E.ENAME, E.JOB, E.SAL
FROM EMP E JOIN DEPT D
WHERE E.JOB IN (MANAGER, CLERK);

--�� ������ Ǯ��
SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> ���� �߻�
/*
ORA-00904: "DANME": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
721��, 16������ ���� �߻�
*/
--> �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺�(�� DEPTNO)��
--  �θ� ���̺�� �������(��������)(�� D.DEPTNO) �Ѵ�.


SELECT DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� ���̺� �� �ߺ��Ǵ� �÷��� �������� �ʴ� ��ȸ ������
--  ���� �߻����� �ʴ´�.
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
--> �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--  �μ�(DEPT), ���(EMP) �� � ���̺��� �����ص� 
--  ������ ���࿡ ���� ��� ��ȯ�� ������ ����.

--�� ������...
--   �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--   �θ� ���̺��� �÷��� ������ �� �ֵ��� �ؾ� �Ѵ�.

SELECT * 
FROM DEPT;      -- �θ� ���̺�(���� �μ���ȣ�� �ϳ��� ��µ�)

SELECT *
FROM EMP;       -- �ڽ� ���̺�(���� �μ���ȣ�� ���� �� ��µ�)


-- Ȥ��!!!!! �� ���̺� ��� �� �Ѱ��� �ۿ� ���ٸ� �� �� �ƹ��ų� �ᵵ �ȴ�.

--�� �θ� �ڽ� ���̺� ���踦 ��Ȯ�� ������ �� �ֵ��� �Ѵ�.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO;
--> �� ���̺� �� �ߺ��� �÷��� �ƴϴ���...
--  �Ҽ� ���̺��� ����� �� �ֵ��� �����Ѵ�.


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

---
--<<
-- D �θ� ���̺�� ����
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--> �θ����̺� ���� 40�� �μ� ��ȸ��(�ҼӵǾ� �ִ� ���� ��� NULL)

-- E �ڽ� ���̺�� ����
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-->>
--> �ڽ����̺� �����ϹǷ� 40�� �μ� NULL�� ��ȸ��


--�� SELF JOIN (�ڱ� ����)

-- EMP ���̺��� ������ ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*  
    E        E       E        E           E          E
  EMPNO    ENAME    JOB      MGR
                            EMPNO       ENAME       JOB
-------------------------------------------------------------
�����ȣ  �����  ������  �����ڹ�ȣ  �����ڸ�  ������������
-------------------------------------------------------------
7369      SMITH   CLERK     7902        FORD     ANALYST

 EMP        EMP     EMP     EMP          
 ------------------------------- ��
                            EMP         EMP       EMP
                            -------------------------- ��
                           
-------------------------------------------------------------
*/
--�� ���� Ǯ���� ����
SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E1.MGR "�����ڹ�ȣ", E2.ENAME "�����ڸ�"
     , E2.JOB "������������"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO
ORDER BY 2;

---------------------------------------------------------------
--�� �Բ� Ǯ���� ����
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E2.EMPNO "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB"������������"
FROM EMP E1 LEFT JOIN EMP E2  --> KING �� MGR(������)�� �����Ƿ� ������ �Ǵ� E1 �� LEFT JOIN�ؼ� ��ȸ��
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