--�� ���ӵ� ����� ���� ��ȸ
SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���̺� ����(DEPT��� �̸��� ���̺��� ����)
CREATE TABLE DEPT
( DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY
, DNAME VARCHAR2(14)
, LOC VARCHAR2(13) 
) ;
--==>> Table DEPT��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(EMP��� �̸��� ���̺��� ����)
CREATE TABLE EMP
( EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
--==>> Table EMP��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(DEPT)
INSERT INTO DEPT VALUES	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES	(40,'OPERATIONS','BOSTON');
//--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4



--�۵����� �Է�(EMP)
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 14



--�� ���̺� ���� (BONUS);
CREATE TABLE BONUS
( ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, SAL NUMBER
, COMM NUMBER
) ;
--==>> Table BONUS��(��) �����Ǿ����ϴ�.

--�� ���̺� ���� (SALGRADE);
CREATE TABLE SALGRADE
( GRADE NUMBER
, LOSAL NUMBER
, HISAL NUMBER 
);
--==>>Table SALGRADE��(��) �����Ǿ����ϴ�.

--�� ������ �Է� (SALGRADE)
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-----------------------------------------------------------------------------------

--�� ���� ������ SCOTT ����Ŭ ���� ����ڰ� �����ϰ� �ִ� ���̺� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
BONUS   	TABLE	
DEPT       	TABLE	
EMP	        TABLE	
SALGRADE	TABLE	
*/

--�� � ���̺������̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS
EMP	        USERS
BONUS	    USERS
SALGRADE	USERS
*/


--�� ���̺� ����(TBL_EXAMPLE1)
CREATE TABLE TBL_EXAMPLE1
( NO    NUMBER
, NAME  VARCHAR2(10)
, ADDR  VARCHAR2(20)
);
--==>> Table TBL_EXAMPLE1��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(TBL_EXAMPLE2)
CREATE TABLE TBL_EXAMPLE2
( NO    NUMBER
, NAME  VARCHAR2(10)
, ADDR  VARCHAR2(20)
)TABLESPACE TBS_EDUA;       
--==>> Table TBL_EXAMPLE2��(��) �����Ǿ����ϴ�.

--�� TBL_EXAMPLE1 �� TBL_EXAMPLE2 ���̺��� 
--   � ���̺� �����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	        USERS
EMP	            USERS
BONUS       	USERS
SALGRADE	    USERS
TBL_EXAMPLE1	USERS
TBL_EXAMPLE2	TBS_EDUA
*/

--------------------------------------------------------------------------------

--���� ������ ������ ���̽� ����--

-- �����͸� ���̺��� ���·� ������� ���� ��
-- �׸��� �̵� �� ���̺��� ���� ���踦 �����ϴ� ��

/*===================================================================
    �ڡڡ� SELECT ���� ó��(PARSING) ���� �ڡڡ�
    
    SELECT �÷���          -- ��
    FROM ���̺���          -- ��
    WHERE ������           -- ��
    GROUP BY ��            -- ��
    HAVING ������          -- ��
    ORDER BY ��            -- ��

=====================================================================*/

--�� ���� ���ӵ� ����Ŭ �����(SCOTT) ������
--   ���̺�(TABLE), ��(VIEW)�� ����� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
BONUS	        TABLE   �� ���ʽ� ���̺�	
DEPT	        TABLE	�� DEPARTMENTS(�μ�) ���̺�
EMP	            TABLE	�� EMPLOYEES(���) ���̺�
SALGRADE	    TABLE	�� �޿�(SAL)�� ��� ���̺�
TBL_EXAMPLE1	TABLE	�� 
TBL_EXAMPLE2	TABLE	��
*/

--�� �� ���̺��� ������ ��ü ��ȸ
SELECT *
FROM BONUS;
--==> �׸���� ����,, ��ȸ ��� ����(�����Ͱ� �������� ����)

SELECT * 
FROM DEPT;
--==>>
/*
�μ���ȣ    �μ��̸�    �μ���ġ
10  	  ACCOUNTING	NEW YORK
20  	  RESEARCH	    DALLAS
30  	  SALES	        CHICAGO
40	      OPERATIONS	BOSTON
*/

SELECT * 
FROM EMP;
--==>>
/*
�����ȣ����̸�  ����  �Ŵ����̸�   �Ի���     �޿�   ����   �μ���ȣ
7369	SMITH	CLERK   	7902	80/12/17	800		        20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300 	30
7521	WARD	SALESMAN	7698	81/02/22	1250	500 	30
7566	JONES	MANAGER	    7839	81/04/02	2975		    20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850	    	30
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10
7788	SCOTT	ANALYST 	7566	87/07/13	3000	    	20
7839	KING	PRESIDENT		    81/11/17	5000	    	10
7844	TURNER	SALESMAN	7698	81/09/08	1500	  0   	30
7876	ADAMS	CLERK     	7788	87/07/13	1100	    	20
7900	JAMES	CLERK	    7698	81/12/03	950	    	    30
7902	FORD	ANALYST	    7566	81/12/03	3000		    20
7934	MILLER	CLERK	    7782	82/01/23	1300		    10
*/

SELECT * 
FROM SALGRADE;
--==>>
/*
���  �����޿� �ְ��޿�
1   	700	    1200            -- �޿� 700~1200�޴� ����� 1���
2	    1201	1400
3   	1401	2000
4   	2001	3000
5	    3001	9999
*/

--�� DEPT ���̺��� �����ϴ� �÷��� ����(����) ��ȸ
DESCRIBE DEPT;
--==>>
/*
�̸�     ��?       ����           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/

--�� �츮�� ���� �� ����Ʈ���� ȸ�� ������ ������ ���
--   �ʼ� �Է� ���װ� ���� �Է� �������ִ�.
--   �ʼ� �Է� �׸��� ID, PW, ����, �ֹι�ȣ, ��ȭ��ȣ, �ּ�, ...
--   ��� ���� �÷��̸�, �� ������ ȸ�� ���� ������ ����
--   �ݵ�� �ʿ���(�����ؾ� �ϴ�, �Է��ؾ� �ϴ�) ���̹Ƿ� NOT NULL �� �Ѵ�.

--   ���� �Է� �׸��� ���, ��ȥ����, ������������, Ư��, ...
--   ��� ���� �÷��̸�, �� ������ ȸ�� ���� ��������
--   �ݵ�� �ʿ��� ���� �ƴϹǷ�(��, �Է����� �ʾƵ� �����ϹǷ�)
--   NULL �̾ ��� ���� ��Ȳ�� �ȴ�.

--   DEPTNO        DNAME           LOC 
--   �μ���ȣ      �μ���          �μ���ġ
--   NOT NULL      (NULL ���)     (NULL ���)     

-- EX)          �λ��      ����       ��   ������ �Է� �Ұ�
--      80                  ��õ       ��   ������ �Է� ����
--      90                             ��   ������ �Է� ����

--���� ����Ŭ�� �ֿ� �ڷ���(DATA TYPE) ����--
/*
cf) MSSQL ������ ���� ǥ�� Ÿ��
    tinyint         0 ~ 255             1byte
    smallint        -32,768 ~ 32767     2byte
    int             -21�� ~ 21��        4byte
    bigint          ��û ŭ             8byte
    
    MSSQL ������ �Ǽ� ǥ�� Ÿ��
    float, real
    
    MSSQL ������ ���� ǥ�� Ÿ��
    decimal, numeric
    
    MSSQL ������ ���� ǥ�� Ÿ��
    char, varchar, Nvarchar
*/

--�� ORACLE ������ ���� ǥ�� Ÿ���� �� ������ ���ϵǾ� �ִ�.
/*
1. ������   NUMBER       ��  -10�� 38��-1 ~ 10�� 38��
            NUMBER(3)    ��  -999 ~ 999                     //(3) 3����Ʈ��� ��
            NUMBER(4)    ��  -9999 ~ 9999
            NUMBER(4,1)  ��  -999.9 ~ 999.9
*/

--�� ORACLE ������ ���� ǥ�� Ÿ��
--   CHAR, NCHAR, VARCHAR2, NVARCHAR2
/*
2. ������ CHAR(n)          - ������ ũ��
          CHAR(10)         �� '���ǽ�' //'���ǽ�'�� 6byte���� CHAR�� 10byte�� ����
                                       //�صξ��⶧���� 10 byte�� �Ҹ�
          CHAR(10)         �� '�������±�' 10 byte
          CHAR(10)         �� 'OH���߼��±�' 12 byte // 10byte �ʰ��ؼ� ���� �� ����. 
          
          VARCHAR2          - ������ ũ��
          VARCHAR2(10)      �� '���ǽ�'          6byte��  6byte �� ����    
          VARCHAR2(10)      �� '������±�'      10 byte
          CHAR(10)          �� 'OH������±�'  12 byte // 10byte �ʰ��ؼ� ���� �� ����. 
          
          NCHAR             - �����ڵ� ��� ������ ũ��(���ڼ�)
          NCHAR(10)         �� 10����
          
          NVARCHAR2         - �����ڵ� ��� ������ ũ��(���ڼ�)
          NVARCHAR2         �� 10����    

*/

/*
3. ��¥��
*/

SELECT SYSDATE
FROM DUAL;
--==>> 21/08/26

SELECT HIREDATE
FROM EMP;
/*
80/12/17
81/02/20
81/02/22
81/04/02 
81/09/28 
81/05/01 
81/06/09 
87/07/13 
81/11/17 
81/09/08 
87/07/13 
81/12/03
81/12/03
82/01/23
*/

--�� ��¥ ���Ŀ� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2021-08-26 17:29:43
/*
1980-12-17 00:00:00
1981-02-20 00:00:00
1981-02-22 00:00:00
1981-04-02 00:00:00
1981-09-28 00:00:00
1981-05-01 00:00:00
1981-06-09 00:00:00
1987-07-13 00:00:00
1981-11-17 00:00:00
1981-09-08 00:00:00
1987-07-13 00:00:00
1981-12-03 00:00:00
1981-12-03 00:00:00
1982-01-23 00:00:00
*/


--�� EMP ���̺����� �����ȣ, �����, �޿�, Ŀ�̼� �׸� ��ȸ
--SELECT �����ȣ, �����, �޿�, Ŀ�̼�
--FROM EMP;
--�� �ϴ� ��� �׸�(*)�� �� ����� �� ��� �Ѵ�.

SELECT *
FROM EMP;

--�� ���;ߵ� ���� �ؼ� ������ �ϱ�
SELECT EMPNO, ENAME, SAL, COMM
FROM EMP;
--==>>
/*
7369	SMITH	800	
7499	ALLEN	1600	300
7521	WARD	1250	500
7566	JONES	2975	
7654	MARTIN	1250	1400
7698	BLAKE	2850	
7782	CLARK	2450	
7788	SCOTT	3000	
7839	KING	5000	
7844	TURNER	1500	0
7876	ADAMS	1100	
7900	JAMES	950	
7902	FORD	3000	
7934	MILLER	1300	
*/
--�� EMP ���̺����� �μ���ȣ�� 20���� �������� ���� ��
--   �����ȣ, �����, ������, �޿�, �μ���ȣ ��ȸ

SELECT EMPNO, ENAME, JOB, SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 20;     
--WHERE DEPTNO == 20;     -- X  ����Ŭ���� == ���ٶ�� ǥ�þƴϰ� ����Ŭ�� = �̰�
--WHERE �μ���ȣ�� 20��;--==>>
/*
7369	SMITH	CLERK	800	20
7566	JONES	MANAGER	2975	20
7788	SCOTT	ANALYST	3000	20
7876	ADAMS	CLERK	1100	20
7902	FORD	ANALYST	3000	20
*/

DESCRIBE EMP;   -- �ؿ����� ���� ��
DESC EMP;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)
*/


SELECT EMPNO, ENAME, JOB, SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 20;   

--�� ���̺��� ��ȸ�ϴ°������� �� �÷��� ��Ī(ALIAS)�� �ο��� �� �ִ�.

