SELECT USER
FROM DUAL;
--==>> SCOTT


SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750        --�μ���ȣ�� 10���� ������� �޿���
20	    10875       --�μ���ȣ�� 20���� ������� �޿���
30	    9400        --�μ���ȣ�� 30���� ������� �޿���
(null)	8000        --�μ���ȣ�� �������� �ʴ� �����(NULL)�� �޿���
(null)  37025       --��� �μ��� ������� �޿���
*/


-- ������ ��ȸ�� ������
/*
10	      8750        --�μ���ȣ�� 10���� ������� �޿���
20	      10875       --�μ���ȣ�� 20���� ������� �޿���
30	      9400        --�μ���ȣ�� 30���� ������� �޿���
����	  8000        --�μ���ȣ�� �������� �ʴ� �����(NULL)�� �޿���
���μ�  37025       --��� �μ��� ������� �޿���
*/
-- �̿� ���� ��ȸ�ϰ��� �Ѵ�.

SELECT CASE DEPTNO WHEN NULL THEN '����'
                   ELSE DEPTNO
       END"�μ���ȣ"
FROM TBL_EMP;
--==>> ���� �߻�
/*
ORA-00932: inconsistent datatypes: expected CHAR got NUMBER
00932. 00000 -  "inconsistent datatypes: expected %s got %s"
*Cause:    
*Action:
30��, 29������ ���� �߻�
*/
--�� ����� ����Ÿ���� �� �¾Ƽ�.


SELECT CASE DEPTNO WHEN NULL THEN '����'
                   ELSE TO_CHAR(DEPTNO)
       END"�μ���ȣ"
FROM TBL_EMP;
--==>>
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
(null)
(null)
(null)
(null)
(null)
*/
--�� ������ �̷����� ���� ��������̹Ƿ� NULL�� ���� �������� �����ϵ��� �ؾ��Ѵ�.

SELECT CASE WHEN DEPTNO IS NULL THEN '����'
            ELSE TO_CHAR(DEPTNO)
       END"�μ���ȣ"
FROM TBL_EMP;
--==>>
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
����
����
����
����
����
*/

SELECT CASE WHEN DEPTNO IS NULL THEN '����'
            ELSE TO_CHAR(DEPTNO)
       END"�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> 
/*
10	    8750
20	    10875
30	    9400
����	8000
����	37025
*/


--�� GROUPING()
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���", GROUPING(DEPTNO)
FROM TBL_EMP
GROUP BY DEPTNO;
--==>>
/*
30	    9400    	0
(null)  8000	    0
20	    10875	0
10	    8750    	0
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���", GROUPING(DEPTNO)
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	     8750	0
20	    10875	0
30	     9400	0
(null) 	 8000	0
(null) 	37025	1
*/
--�� GROUPING  �����ִ� LEVEL�� ��ȯ. ���� ������ �������� �� ī��Ʈ�� �ö󰣴�.


/*
10	      8750        --�μ���ȣ�� 10���� ������� �޿���
20	      10875       --�μ���ȣ�� 20���� ������� �޿���
30	      9400        --�μ���ȣ�� 30���� ������� �޿���
����	  8000        --�μ���ȣ�� �������� �ʴ� �����(NULL)�� �޿���
��� �μ�  37025       --��� �μ��� ������� �޿���
*/

SELECT CASE WHEN GROUPING(DEPTNO) = 1 THEN '��� �μ�'
            WHEN DEPTNO IS NULL THEN '����'
            ELSE TO_CHAR(DEPTNO)
       END"�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);


--------------------------------------------������ Ǯ��

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����')
            ELSE '��� �μ�'
       END"�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
����	    8000
��� �μ�	37025
*/


--�� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
--------------------------
    ����      �޿���
--------------------------
     ��        XXXX
     ��        XXXX
  �����    XXXXX
--------------------------
*/


SELECT CASE GROUPING(T.����) WHEN 0 THEN T.����
                             ELSE '�����'
       END "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN (1,3) THEN '��'
                WHEN SUBSTR(JUBUN,7,1) IN (2,4) THEN '��'
                ELSE '���� Ȯ�κҰ�'
            END "����"
          , SAL "�޿�" 
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	        17000
��	        24000
����� 	41000
*/


--�� TBL_SAWON ���̺��� ������ ���� ���ɴ뺰 �ο��� ���·�
--   ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
--------------------------
    ���ɴ�     �ο���
--------------------------
     10          X
     20          X
     30          X
     40          X
     50          X
    ��ü        XX
--------------------------
*/

SELECT CASE GROUPING(T2.���ɴ�) WHEN 0 THEN TO_CHAR(T2.���ɴ�)
                                ELSE '��ü'
       END "���ɴ�"
     , COUNT(T2.���ɴ�) "�ο���"

FROM
(
    SELECT CASE WHEN T1.���� < 20 THEN 10
                WHEN T1.���� < 30 THEN 20
                WHEN T1.���� < 40 THEN 30
                WHEN T1.���� < 50 THEN 40
                WHEN T1.���� >= 50 THEN 50
                ELSE 50
           END "���ɴ�"
    FROM
    (
        SELECT CASE WHEN SUBSTR(JUBUN, 7,1) IN ('1', '2') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1,2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7,1) IN ('3', '4') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1,2)) + 1999)
                    ELSE -1
                    END "����"
        FROM TBL_SAWON
    )T1
)T2
GROUP BY ROLLUP(T2.���ɴ�);

----------------------------------------------------������ Ǯ��
-- ��� 1. INLINE VIEW�� �� �� ��ø

SELECT CASE GROUPING(Q.���ɴ�) WHEN 0 THEN TO_CHAR(Q.���ɴ�)
                               ELSE '��ü'
       END "���ɴ�"
     , COUNT(Q.���ɴ�) "�ο���"

FROM
(
    -- ���ɴ�
    SELECT CASE WHEN T.���� >= 50 THEN 50
                WHEN T.���� >= 40 THEN 40
                WHEN T.���� >= 30 THEN 30
                WHEN T.���� >= 20 THEN 20
                WHEN T.���� >= 10 THEN 10
                ELSE 0
           END "���ɴ�"
    FROM
    (
        -- ����
        SELECT CASE WHEN SUBSTR(JUBUN, 7,1) IN ('1', '2') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1,2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7,1) IN ('3', '4') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1,2)) + 1999)
                    ELSE 0
                    END "����"
        FROM TBL_SAWON
    )T
)Q
GROUP BY ROLLUP(Q.���ɴ�);



-- ��� 2. INLINE VIEW�� �� ���� ���
SELECT CASE GROUPING(T.���ɴ�) WHEN 0 THEN TO_CHAR(T.���ɴ�)
                               ELSE '��ü'
       END "���ɴ�"
     , COUNT(T.���ɴ�)
FROM
(
    SELECT TRUNC( CASE WHEN SUBSTR(JUBUN, 7,1) IN ('1', '2') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1,2)) + 1899)
                       WHEN SUBSTR(JUBUN, 7,1) IN ('3', '4') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1,2)) + 1999)
                       ELSE 0 END , -1) "���ɴ�" 
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.���ɴ�);
--==>>
/*
10	    2
20	    5
30	    2
40	    4
50	    2
��ü	    15
*/




--�� ROLLUP Ȱ�� �� CUBE
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>> 
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750        -- 10�� �μ� ��� ������ �޿���
20	    ANALYST     	6000
20      	CLERK	    1900
20	    MANAGER	    2975
20  	    (null)	    10875       -- 20�� �μ� ��� ������ �޿���
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN    	5600
30	    (null)	    9400        -- 30�� �μ� ��� ������ �޿���
(null)	(null)	    29025       -- ��� �μ� ��� ������ �޿���
*/


--�� CUBE() �� ROLLUP() ���� �ڼ��� ����� ��ȯ���� �� �ִ�.
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>> 
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750        -- 10�� �μ� ��� ������ �޿���
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875       -- 20�� �μ� ��� ������ �޿���
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN    	5600
30	    (null)	    9400        -- 30�� �μ� ��� ������ �޿���
(null)	ANALYST	    6000        -- ��� �μ� ANALYST ������ �޿���
(null)	CLERK	    4150        -- ��� �μ� CLERK ������ �޿���
(null)	MANAGER	    8275        -- ��� �μ� MANAGER ������ �޿���
(null)	PRESIDENT	5000        -- ��� �μ� PRESIDENT ������ �޿���
(null)	SALESMAN	    5600        -- ��� �μ� SALESMAN ������ �޿���
(null)	(null)	    29025       -- ��� �μ� ��� ������ �޿���
*/


--�� ROLLUP() �� CUBE()�� �׷��� �����ִ� ����� �ٸ���. -- ����

-- ROLLUP(A, B, C)
-- �� (A, B, C) / (A, B) / (A) / ()

-- CUBE(A, B, C)
-- �� (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()


--==>> ���� ó�� ������ �ʹ� ���� ������� ��µǱ� ������
--     ������ ���� ���¸� �� ���� ����Ѵ�.
--     ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸 ��GROUPING SETS��FMF
--     �̿��Ͽ� �����ִ� ����̴�.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
                             ELSE '��ü�μ�' END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
                          ELSE '��ü����' END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
�μ���ȣ    ����        �޿���
----------- ----------- -------
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	    8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����    	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	    5600
30	        ��ü����	    9400
����	    CLERK	    2500
����	    SALESMAN	    5500
����	    ��ü����	    8000
��ü�μ�	    ��ü����	    37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
                             ELSE '��ü�μ�' END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
                          ELSE '��ü����' END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
�μ���ȣ    ����        �޿���
----------- ----------- -------
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����    	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����    	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	    5600
30	        ��ü����	    9400
����	    CLERK	    2500
����	    SALESMAN	    5500
����	    ��ü����    	8000
��ü�μ�	    ANALYST	    6000
��ü�μ�	    CLERK	    6650
��ü�μ�	    MANAGER	    8275
��ü�μ�	    PRESIDENT	5000
��ü�μ�	    SALESMAN	    11100
��ü�μ�	    ��ü����	    37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
                             ELSE '��ü�μ�' END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
                          ELSE '��ü����' END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())             -- ROLLUP()
ORDER BY 1, 2;
--==>>
/*
�μ���ȣ    ����        �޿���
----------- ----------- -------
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����    	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����    	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN    	5600
30	        ��ü����    	9400
����	    CLERK	    2500
����	    SALESMAN	    5500
����	    ��ü����	    8000
��ü�μ�    	��ü����	    37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
                             ELSE '��ü�μ�' END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
                          ELSE '��ü����' END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())     -- CUBE()
ORDER BY 1, 2;
--==>>
/*

�μ���ȣ    ����        �޿���
----------- ----------- -------
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	    8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	    10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	    5600
30	        ��ü����	    9400
����	    CLERK	    2500
����	    SALESMAN	    5500
����	    ��ü����    	8000
��ü�μ�	    ANALYST	    6000
��ü�μ�    	CLERK	    6650
��ü�μ�	    MANAGER	    8275
��ü�μ�    	PRESIDENT	5000
��ü�μ�	    SALESMAN	    11100
��ü�μ�    	��ü����	    37025
*/


--�� TBL_EMP ���̺��� �Ի�⵵�� �ο����� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;
/*
--------------------------
   �Ի�⵵     �ο���
--------------------------
    1980            1
    1981           10 
    1982            1
    1987            2
    2021            5
    ��ü           19
--------------------------
*/


SELECT CASE GROUPING(T.�Ի�⵵) WHEN 0 THEN TO_CHAR(T.�Ի�⵵)
            ELSE '��ü'
       END "�Ի�⵵"
     , COUNT(T.�Ի�⵵) "�ο���"
FROM 
(
    SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
    FROM TBL_EMP
)T
GROUP BY ROLLUP(T.�Ի�⵵)
ORDER BY 1;


-----------------------------������ Ǯ��

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY GROUPING SETS(EXTRACT(YEAR FROM HIREDATE), ())
ORDER BY 1;
--==>> 
/*
1980	     1
1981	10
1982	     1
1987	 2
2021    	 5
(null)  19
*/


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))      --'1980'
ORDER BY 1;


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))      --'1980'
ORDER BY 1;


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY GROUPING SETS(TO_CHAR(HIREDATE, 'YYYY'),())      
ORDER BY 1;


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')     
ORDER BY 1;
--==>> ���� �߻� * 4
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
571��, 26������ ���� �߻�
*/
--�� GROUP BY ���� ���� ��İ� SELECT ���� ó���ϴ� ����� �޶�.
--�� ������ Ÿ�԰��� �ٸ� ����


SELECT TO_CHAR(HIREDATE, 'YYYY')  "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')     
ORDER BY 1;
--==>> 
/*
1980	    1
1981	10
1982    	1
1987	2
2021	    5
*/


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>> ���� �߻�
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
624��, 26������ ���� �߻�
*/
--�� ������ Ÿ���� ����������, ����.
--�� ������ Ÿ���� ������ �ƴ϶�! ���� ����� ��ġ�ؾ��Ѵ�.


SELECT TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))  "�Ի�⵵"
       , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))     
ORDER BY 1;
--==>>
/*
1980	    1
1981	10
1982    	1
1987	2
2021	    5
*/

--------------------------------------------------------------------------------

--���� HAVING ����

--�� EMP ���̺��� �μ���ȣ�� 20, 30�� �μ��� �������
--   �μ��� �� �޿��� 10000 ���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.

SELECT DEPTNO "�μ���ȣ"
     , SUM(SAL) "�μ��� �� �޿�"
FROM EMP
WHERE DEPTNO IN (20, 30)
      AND SUM(SAL) < 10000
GROUP BY DEPTNO;


SELECT *
FROM EMP;

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
/*
30	9400
*/


SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO IN (20,30)
    AND SUM(SAL) <10000;
/*
30	9400
*/

--------------------------------------------------------------------------------

--���� ��ø �׷��Լ� / �м��Լ� ����--

-- �׷� �Լ� 2 LEVEL ���� ��ø�ؼ� ����� �� �ִ�.
-- �̸�����... MSQL �� �Ұ����ϴ�.
SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>> 
/*
9400
10875
8750
*/
--���Լ��� �ΰ��� ��ø�ۿ� �ȵȴ�....MAX, SUM �̷��� �� �� ����  
SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

--RANK()        ��� ���� ����
--DENSE_RANK()  ����
--> ORACLE 9i ���� ����...MSSQL 2005 ���� ����...

--�� ���� ���������� RANK() �� DENSE_RANK() �� ����� �� ���� ������ 
--   �̸� ��ü�Ͽ� ������ ������ �� �ִ� ����� �����ؾ� �Ѵ�.

-- ���� ���, �޿��� ������ ���ϰ��� �Ѵٸ�,,,
-- �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� ��
-- Ȯ���� ���ڿ� +1�� �߰� �������ָ� �װ��� �� ����� �ȴ�,.

-- 80 90 10 50 �� 2 + 1 �� 3
--          -- 

SELECT ENAME, SAL, 1
FROM EMP;
--==>> �̷��� ��ȸ���� �� 1 ���� ����� ������ ���ڴٴ�! SMITH �� 14 ALLER �� 7 �̷���,,�� ��

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;
--==>> 14 �� SMITH �� �޿� ���

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;
--==>> 7 �� ALLER �� �޿� ���

--�� ���� ���� ó�� �� ������
SELECT ENAME, SAL, RANK() OVER(ORDER BY SAL DESC)
FROM EMP;


--�� ���� ��� ����(��� ���� ����)
-- ���� ������ �ִ� ���̺��� �÷���
-- ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
-- �츮�� �� �������� ���� ��� ���� ��� �θ���.

SELECT ENAME"�����", SAL"�޿�", 1"�޿����"
FROM EMP;

SELECT ENAME"�����", SAL"�޿�", (SELECT COUNT(8) +1 
                                  FROM EMP 
                                  WHERE SAL > 800)"�޿����"
FROM EMP;
--==>> �޿������ ���� �� 14 �� ���


SELECT ENAME"�����", SAL"�޿�", (SELECT COUNT(8) +1 
                                  FROM EMP E2   --E2�� ����? EMP ���̺��� ���� �ʿ信 ���� ���� �����ߵǼ�    
                                  WHERE E2.SAL > E1.SAL)"�޿����"
--                                      ------   -------
--                             ���ϰ� ���� ��  
FROM EMP E1;
--==>> 
/*
SMITH	800	14
ALLEN	1600	7
WARD	1250	10
JONES	2975	4
MARTIN	1250	10
BLAKE	2850	5
CLARK	2450	6
SCOTT	3000	2
KING	5000	1
TURNER	1500	8
ADAMS	1100	12
JAMES	950	13
FORD	3000	2
*/


--�� EMP ���̺��� ������� 
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK() �Լ��� ������� �ʰ�, ��� ���� ������ Ȱ���� �� �ֵ��� �Ѵ�.


-- ���� Ǭ Ǯ�� ,, Ʋ������������
SELECT ENAME "�����", SAL"�޿�", DEPTNO"�μ���ȣ", (SELECT COUNT(*) + 1
                                                      FROM EMP E2 
                                                      WHERE DEPTNO=E1.DEPTNO AND E1.SAL> E2.SAL)"�μ����޿����",
                                                     (SELECT COUNT(*) + 1
                                                      FROM EMP 
                                                      WHERE SAL > E1.SAL)"��ü�޿����"
FROM EMP E1
ORDER BY SAL DESC;

-----------------------------------------
SELECT ENAME "�����", SAL"�޿�", DEPTNO"�μ���ȣ"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 
        WHERE E2.SAL> E1.SAL AND E2.DEPTNO = E1.DEPTNO)"�μ����޿����",
       (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.SAL > E1.SAL)"��ü�޿����"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.SAL DESC;

-- üũ�ϸ鼭 Ǭ�ٰ� �̷� �ĵ� ������ .. ���� ������!!
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL> 1600 AND DEPTNO = 30
ORDER BY DEPTNO;            -->> 2

SELECT ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO;

SELECT *
FROM EMP
ORDER BY DEPTNO;

-->> ������ ������ ��
/*
KING	5000	10	1	1
CLARK	2450	10	2	6
MILLER	1300	10	3	9
SCOTT	3000	20	1	2
FORD	3000	20	1	2
JONES	2975	20	3	4
ADAMS	1100	20	4	12
SMITH	800	20	5	14
BLAKE	2850	30	1	5
ALLEN	1600	30	2	7
TURNER	1500	30	3	8
MARTIN	1250	30	4	10
*/





--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
--------------------------------------------------------------------------------
  �����     �μ���ȣ      �Ի���        �޿�        �μ����Ի纰�޿�����
--------------------------------------------------------------------------------
  CLERK         10       1981-06-09      2450               2450
  KING          10       1981-11-17      5000               7450
  MILLER        10       1982-01-23      1300               8750
  SMITH         20       1980-12-17       800                800
*/

--�� �� Ǯ��

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.HIREDATE <= E1.HIREDATE)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

--�� ������ Ǯ��

SELECT ENAME"�����", DEPTNO"�μ���ȣ", HIREDATE"�Ի���",SAL"�޿�"  
     , (1)"�μ����Ի纰�޿�����"
FROM EMP
ORDER BY 2, 3;


SELECT ENAME"�����", DEPTNO"�μ���ȣ", HIREDATE"�Ի���",SAL"�޿�"  
     , (SELECT SUM(SAL)
        FROM EMP E2)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;


SELECT ENAME"�����", DEPTNO"�μ���ȣ", HIREDATE"�Ի���",SAL"�޿�"  
     , (SELECT SUM(SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
          AND E2.HIREDATE <= E1.HIREDATE)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;
--==>>
/*
CLARK	10	81/06/09	2450	2450
KING	10	81/11/17	5000	7450
MILLER	10	82/01/23	1300	8750
SMITH	20	80/12/17	 800	800
JONES	20	81/04/02	2975	3775
FORD	20	81/12/03	3000	6775
SCOTT	20	87/07/13	3000	10875   --> 1987-07-13 ���� ��¥ �Ի��̱⿡ ..
ADAMS	20	87/07/13	1100	10875   --
ALLEN	30	81/02/20	1600	1600
WARD	30	81/02/22	1250	2850
BLAKE	30	81/05/01	2850	5700
TURNER	30	81/09/08	1500	7200
MARTIN	30	81/09/28	1250	8450
JAMES	30	81/12/03	 950	9400
*/

--�� TBL_EMP ���̺��� �Ի��� ����� ���� ���� ������ ���� 
--   �Ի����� �ο����� ��ȸ�� �� �ִ� �������� �����Ѵ�.
/*
-----------------------------------
    �Ի���         �ο���
-----------------------------------
    XXXX-XX             X
-----------------------------------    
*/

SELECT ENAME, HIREDATE
FROM TBL_EMP
ORDER BY 2 ;


--�� �Բ� Ǯ���� ����
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 5; --> �׷� �Լ��� �����̱� ������ WHERE���� �ƴ� HAVING���� ��
--==>> 2021-09	5

SELECT COUNT(*)
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');

SELECT MAX(COUNT(*))  --> �׷� �Լ��� 2LEVEL ��ø���� ����
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 5

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))  
                   FROM TBL_EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>> 2021-09	5


SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))  
                   FROM EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>> 
/*
1981-12	2
1981-09	2
1981-02	2
1987-07	2
*/



--------------------------------------------------------------------------------

--���� ROW_NUMBER() ����--    -> ���� ���ʿ� ��ȣ 1 2 3 4 ...

SELECT ENAME"�����", SAL"�޿�", HIREDATE"�Ի���"
FROM EMP;

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC)"�׽�Ʈ"
     , ENAME"�����", SAL"�޿�", HIREDATE"�Ի���"
FROM EMP;


--�� �Խ����� �Խù� ��ȣ�� SEQUENCE �� IDENTITY �� ����ϰ� �Ǹ�
--   �Խù��� �������� ���, ������ �Խù��� �ڸ��� ���� ��ȣ�� ����
--   �̴� ���� ���鿡����... �̰����� ���鿡����... �ٶ������� ���� ��Ȳ�� �� �ֱ� ������
--   ROW_NUMBER() �� ����� ����� �� �� �ִ�.
--   ������ �������� ����� ������ SEQUENCE �� IDENTITY �� ���������
--   �ܼ��� �Խù��� ���ȭ�Ͽ� ����ڿ��� ����Ʈ �������� ������ ������
--   ������� �ʴ� ���� ����.


--�� ����
CREATE TABLE TBL_AAA
( NO        NUMBER
, NAME      VARCHAR2(30)
, GRADE     CHAR(10)
);
--==>> Table TBL_AAA��(��) �����Ǿ����ϴ�.

INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (1, '�չ���', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (2, '���ش�', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (3, '������', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (4, '�ּ���', 'D');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (5, '���±�', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (6, '����ȭ', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (7, '�չ���', 'A');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7

SELECT *
FROM TBL_AAA;

COMMIT;

UPDATE TBL_AAA
SET NAME='���ش�'
WHERE GRADE='A';        --> GRADE �� A �� ���� �̸��� �� ���ش����� �ٲ� �� �̴�.


UPDATE TBL_AAA
SET GRADE=B
WHERE NAME='�չ���';
-->> �ȵ�


--�� SEQUENCE (������ : �ֹ���ȣ) ����
--   �� �������� �ǹ� : 1.(�Ϸ���) �������� ��ǵ�  2.(���,�ൿ ����) ����

CREATE SEQUENCE SEQ_BOARD   -- ������ ���� �⺻ ����(MSSQL �� INDENTITY �� ������ ����)
START WITH 1                -- ���۰� : 1������ ���� �����ϰٴ�
INCREMENT BY 1              -- ������ :1 �� �����ϰ� �ϰٴ�
NOMAXVALUE                  -- �ִ밪 ���� ����! �ִ밪 ������ ���ϰٴ�
NOCACHE;                    -- ĳ�� ��� ����(����)
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.


--�� ���̺� ����(TBL_BOARD)
CREATE TABLE TBL_BOARD              -- TBL BOARD �̸��� ���̺� ���� �� �Խ���
( NO        NUMBER                  -- �Խù� ��ȣ       -- ��
, TITLE     VARCHAR2(50)            -- �Խù� ����       -- ��
, CONTENTS  VARCHAR2(2000)          -- �Խù� ����       -- ��
, NAME       VARCHAR2(20)           -- �Խù� �ۼ���     -- ��  (���� �޴� ��쵵 �ְ� �ƴ� ��쵵 �ִ�.)
, PW        VARCHAR2(20)            -- �Խù� �н�����   -- ��  (���� �޴� ��쵵 �ְ� �ƴ� ��쵵 �ִ�.)ex)��������
, CREATED   DATE DEFAULT SYSDATE    -- �Խù� �ۼ���     -- ��
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.


--�� ������ �Է� �� �Խ��ǿ� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ѽ�~1��', '���� 1��������', '����ȣ', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ǰ�����', '�ٵ� �ǰ� ì��ô�', '������', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���� �� ����', '�մ���', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���ڱ� �� ����', '������', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ϰ������', '�ڲ� ������', '��ȿ��', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����', '������� ��� �ϳ���', '������', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����', '������ �����', '��ȿ��', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ѽ�~1��	    ���� 1��������	        ����ȣ	JAVA006$	21/09/06
2	�ǰ�����    	�ٵ� �ǰ� ì��ô�	    ������	JAVA006$	21/09/06
3	������	        ���� �� ����	        �մ���	JAVA006$	21/09/06
4	������	        ���ڱ� �� ����	    ������	JAVA006$	21/09/06
5	�����ϰ������	�ڲ� ������	            ��ȿ��	JAVA006$	21/09/06
6	����	        ������� ��� �ϳ���	������	JAVA006$	21/09/06
7	����	        ������ �����	    ��ȿ��	JAVA006$	21/09/06
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �Խù� ����

DELETE
FROM TBL_BOARD
WHERE NO=5;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '�� �׳� �߷���', '������', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ѽ�~1��	���� 1��������	        ����ȣ	JAVA006$	21/09/06
2	�ǰ�����	�ٵ� �ǰ� ì��ô�	    ������	JAVA006$	21/09/06
3	������	    ���� �� ����	        �մ���	JAVA006$	21/09/06
4	������	    ���ڱ� �� ����	    ������	JAVA006$	21/09/06
6	����	    ������� ��� �ϳ���	������	JAVA006$	21/09/06
7	����	    ������ �����	    ��ȿ��	JAVA006$	21/09/06
8	������	    �� �׳� �߷���	        ������	JAVA006$	21/09/06
*/

DELETE
FROM TBL_BOARD
WHERE NO=2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_BOARD
WHERE NO=7;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


DELETE
FROM TBL_BOARD
WHERE NO=8;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ѽ�~1��	���� 1��������	        ����ȣ	JAVA006$	21/09/06
3	������	    ���� �� ����	        �մ���	JAVA006$	21/09/06
4	������	    ���ڱ� �� ����	    ������	JAVA006$	21/09/06
6	����	    ������� ��� �ϳ���	������	JAVA006$	21/09/06
*/

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���¿�', '�� ������ �־��', '������', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�


--�� Ŀ��
COMMIT;
-->> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ѽ�~1��	���� 1��������	        ����ȣ	JAVA006$	21/09/06
3	������	    ���� �� ����	        �մ���	JAVA006$	21/09/06
4	������	    ���ڱ� �� ����	    ������	JAVA006$	21/09/06
6	����	    ������� ��� �ϳ���	������	JAVA006$	21/09/06
9	���¿�	    �� ������ �־��	    ������	JAVA006$	21/09/06
*/

SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"�۹�ȣ"
     , TITLE"����", NAME"�ۼ���", CREATED"�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
5	���¿�	    ������	21/09/06
4	����	    ������	21/09/06
3	������	    ������	21/09/06
2	������	    �մ���	21/09/06
1	�ѽ�~1��	����ȣ	21/09/06
*/

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���� ����', '����ȣ', 'JAVA006$', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�

--�� Ŀ��
COMMIT;
-->> Ŀ�� �Ϸ�.

SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"�۹�ȣ"
     , TITLE"����", NAME"�ۼ���", CREATED"�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
6	������	    ����ȣ	21/09/06
5	���¿�	    ������	21/09/06
4	����	    ������	21/09/06
3	������	    ������	21/09/06
2	������	    �մ���	21/09/06
1	�ѽ�~1��	����ȣ	21/09/06
*/


DELETE
FROM TBL_BOARD
WHERE NO=3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

COMMIT; 

SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"�۹�ȣ"
     , TITLE"����", NAME"�ۼ���", CREATED"�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
5	������	    ����ȣ	21/09/06
4	���¿�	    ������	21/09/06
3	����	    ������	21/09/06
2	������	    ������	21/09/06
1	�ѽ�~1��	����ȣ	21/09/06
*/


