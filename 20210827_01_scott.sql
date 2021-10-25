--�� ���ӵ� ����� ��ȸ
SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT EMPNO, ENAME,JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

--�� ���̺��� ��ȸ�ϴ� �������� �� �÷��� ��Ī(ALIAS)�� �ο��� �� �ִ�.

SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB ����, SAL "��   ��", DEPTNO"�μ���ȣ"     --AS, " " ���� ����   
FROM EMP
WHERE DEPTNO = 20;

--�� ���̺� ��ȸ �� ����ϴ� ��Ī�� �⺻ ������ ��AS "��Ī��"���� ���·� �ۼ��Ǹ�
--   �� ��, ��AS���� ���� �����ϴ�.
--   ����, ��""���� ���� �����ϴ�.
--   ������, ��""���� ������ ��� ��Ī�� ������ ����� �� ����.
--   ������ �ش� �÷��� �������ǹ��ϹǷ� ��Ī�� �̸� ���ο� ������ ����� ���
--   ��""���� ����Ͽ� ��Ī�� �ο��� �� �ֵ��� ó���ؾ� �Ѵ�.


--�� EMP ���̺��� �μ���ȣ�� 20���� 30�� �������� ���� ��
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�,
--   , ��, ��Ī(ALIAS)�� ����Ѵ�.
SELECT *
FROM EMP;


SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"       
FROM EMP
WHERE DEPTNO = 20 || DEPTNO = 30;
--==>> ���� �߻�

SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"       
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


SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"       
FROM EMP
WHERE DEPTNO IN(20, 30);    -- 20���� 30���� (IN)����ִ�.
--> IN �����ڸ� Ȱ���Ͽ� �̿� ���� ó���� ���� ������
--  ���� ������ ���� ����� ��ȯ�ϰ� �ȴ�.


--�� EMP ���̺��� ������ CLERK �� ������� ������ ��� ��ȸ�Ѵ�.

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
Where joB = 'CLerk';        -- �� �ȳ���

--�� ����Ŭ����.... �Էµ� ������(��) ��ŭ��
--   ��.��.�� ��ҹ��� ������ �Ѵ�.

--�� EMP ���̺��� ������ CLERK �� ����� �� 
--   20�� �μ��� �ٹ��ϴ� �������
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.

SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"       
FROM EMP
WHERE JOB �� CLERK   DEPTNO �� 20;        ----- X



SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"       
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	800 	20
7876	ADAMS	CLERK	1100	20
*/

DESC EMP;

--�� EMP ���̺��� 10�� �μ��� �ٹ��ϴ� ������ ��
--   �޿��� 2500 �̻��� ��������
--   �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.

SELECT ENAME AS "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"       
FROM EMP
WHERE DEPTNO = 10 AND SAL>=2500;
--==>> KING	PRESIDENT	5000	10



--�� ���̺� ����
--> ���������� ��� ���̺� �ȿ� �ִµ����� ���븸 �����ϴ� ����

--�� EMP ���̺��� �����͸� Ȯ���Ͽ�
--   �̿� �Ȱ��� �����Ͱ� ����ִ� EMPCOPY ���̺��� �����Ѵ�.(������...)

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
)                               -- )�ڿ� ; �� �Ⱥٿ��µ� ���������� ���߿� �����Ҷ�
--==>> CREATE TABLE EMPCOPY         ���������������� �׳� �����ϰ� �ٽ� �������.

SELECT *
FROM EMP;


DROP TABLE EMPCOPY; -- ���̺� ���� ����

-- �ٽû����ϱ�
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
--==>> Table EMP2��(��) �����Ǿ����ϴ�.

SELECT *
FROM EMP2;

DESC EMP2;

--�� ��¥ ���� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

DROP TABLE EMPCOPY;
--==>> Table EMPCOPY��(��) �����Ǿ����ϴ�.

DELETE
FROM EMP2;
--==>> 14�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM EMP2;
--==>> ���̺��� ���������� �����ʹ� ������ �����̹Ƿ� ��ȸ�� �ȴ�.

SELECT *
FROM EMPCOPY;
--==> ���̺� ��ü�� �����߱� ������ ������

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT��(��) �����Ǿ����ϴ�.


--�� ������ ���̺� Ȯ��
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;


--�� ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT * 
FROM USER_TAB_COMMENTS;

--�� ���̺��� Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '�������';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
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
TBL_EMP	TABLE	�������
*/


--�� ���̺� ������ Ŀ��Ʈ ���� �Է�(TBL_DEPT �� �μ�����)
COMMENT ON TABLE TBL_DEPT IS '�μ�����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE   �������
TBL_DEPT   	    TABLE	�μ�����
EMP2	        TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--�� �÷�(COL) ������ Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS;


--�� ������ ����     // ����Ŭ�� �����ϸ� ���������� ���⶧��,,
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.


SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/


--�� ���̺� �Ҽӵ�(���Ե�) �÷� ������ Ŀ��Ʈ ���� �Է�(����)

COMMENT ON COLUMN �÷���

COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ���ȣ';
--==>>Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ���';
--==>>Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ���ġ';
--==>>Comment��(��) �����Ǿ����ϴ�.

--���÷� ������ Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
/*
TBL_DEPT   DEPTNO   �μ���ġ
TBL_DEPT   DNAME   �μ���
TBL_DEPT   LOC       �μ���ġ
*/

DESC TBL_EMP;
/*--> �־����~~~~~~~~!!!!!
EMPNO       NUMBER(4)       -- �����ȣ    
ENAME       VARCHAR2(10)    -- �����
JOB         VARCHAR2(9)     -- ������
MGR         NUMBER(4)       -- �����ڻ����ȣ
HIREDATE    DATE            -- �Ի���
SAL         NUMBER(7,2)     -- �޿�
COMM        NUMBER(7,2)     -- ����
DEPTNO      NUMBER(2)       -- �μ���ȣ
*/

--�� TBL_EMP ���̺� �Ҽӵ�(���Ե�)
--   �÷��� ���� Ŀ��Ʈ ���� �Է�(����)
COMMENT ON COLUMN TBL_EMP.EMPNO  IS '�����ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME  IS '�����';
COMMENT ON COLUMN TBL_EMP.JOB  IS '������';
COMMENT ON COLUMN TBL_EMP.MGR  IS '�����ڻ����ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE  IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL  IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM  IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO  IS '�μ���ȣ';
--==>> Comment��(��) �����Ǿ����ϴ�.


--�� Ŀ��Ʈ ������ �Էµ� ���̺��� �÷� ������ ���� Ȯ��

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
/*
TBL_EMP	EMPNO	    �����ȣ
TBL_EMP	ENAME	    �����
TBL_EMP	JOB 	    ������
TBL_EMP	MGR	        �����ڻ����ȣ
TBL_EMP	HIREDATE    �Ի���
TBL_EMP	SAL	        �޿�
TBL_EMP	COMM	    ����
TBL_EMP	DEPTNO	    �μ���ȣ
*/

--���� �÷� ������ �߰� �� ���� ����--

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ ������ ���� �� �ִ� �÷� �߰�
--   �������� ���泻���� ALTER

ALTER TABLE TBL_EMP;
--//ADD SSN NUMBER(13);
ADD SSN CHAR(13);
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.
--�� �� �տ� 0�� ���� ���ɼ��� �ִ� ���ڰ� ���յ� �����Ͷ��
--   �������� �ƴ� ���������� ������Ÿ���� ó���ؾ� �Ѵ�.    CHECK~!!!!!!!


SELECT 9501052234567
FROM DUAL;
--==>> 9501052234567

SELECT 0501052234567    --// ���ڴ� �տ� 0�� �����´�.
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
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13)            -- Ȯ��
*/

SELECT EMPNO, ENAME, SSN, HIREDATE, SAL, COMM
FROM TBL_EMP;
--> ���̺� ������ �÷��� ������ ���������� �ǹ� ����.

--�� TBL_EMP ���̺��� �߰��� SSN(�ֹε�Ϲ�ȣ) �÷� ����
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT * 
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ���ŵǾ����� Ȯ��
--�� ��ü������ ����Ϸ����ϴµ� ���� ������ ������ ������ ���� Ȯ���ϱ�
SELECT * 
FROM TBL_EMP
WHERE ENAME = 'SMITH';

--�� Ȯ���� ��� ������ ������ �´ٸ� SELECT �� DELETE�� �ٲٸ� ��
--// ���� ���
DELETE
FROM TBL_EMP
WHERE ENAME = 'SMITH';

--// �� ����������� �������� ����!!
DELETE TBL_EMP;

--�� ���̺��� ���������� ����(�������� ���� �� �ƴ϶�....���̺� ��ü�� ����)
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT * 
FROM TBL_EMP;
--==>> ���� �߻�
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
467��, 6������ ���� �߻�
*/

--�� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP    --���̰Ŷ� 
AS                      --   �ؿ� AS �� �����ؼ� FROM EMP���� 4�� �� ��� �Ǵ� Ŀ�����ΰ� �����Ѵ�.
SELECT *        --�� �̰Ŷ�
FROM EMP;       --�̰Ŷ� �ΰ� ���� �����Ƽ� ��Ʈ��+�����ؼ� �����ؼ� ����Ǵ���Ȯ���ϰ�

--------------------------------------------------------------------------------------------------------
--��NULL �� ó��
SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 2	12	8	20	5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>> (null) (null) (null) (null) (null) 

--==>> �� ���� ���
--        NULL �� ������ ���� �ǹ��ϸ�, ���� �������� �ʴ� ���̱� ������
--        �� NULL �� ���꿡 ���Ե� ���... �� ����� ������ NULL �̴�.

--�� TBL_EMP ���̺��� Ŀ�̼�(COMM, ����)�� NULL �� ������
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.

SELECT �����, ������, �޿�, Ŀ�̼�       
FROM TBL_EMP
WHERE Ŀ�̼� NULL;


SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"       
FROM TBL_EMP
WHERE COMM = NULL;
--==>> �������

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"       
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> ���� �߻� WHY? NULL�� ����Ÿ���ε� ���Ŵ� '' �ȿ��־ ���ڿ��̶� ������

DESC TBL_EMP;
--> COMM �÷��� ������ ������ Ÿ���� ���ϰ� ������ Ȯ��

-- �� NULL �� ���� �������� �ʴ� ���̱� ������ �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����.
--   ��, ������� �� ������ ������ �� ���ٴ� �ǹ��̴�.
--   NULL �� ������� ����� �� ���� �����ڵ�...
--   >=, <=, >, < , !=, ^=, <>

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"       
FROM TBL_EMP
WHERE COMM IS NULL;       -- IS�� �������� ����� ���� ������
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

--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� ��������
--   �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.

SELECT �����, ������, �μ���ȣ 
FROM TBL_EMP
WHERE �μ���ȣ 20�� �ƴ�; 

SELECT �����, ������, �μ���ȣ 
FROM TBL_EMP
WHERE DEPTNO != 20�� �ƴ�; 


SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"       
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

SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"       
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

SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"       
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


SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"       
FROM TBL_EMP
WHERE COMM  20; 

--�� TBL_EMP ���̺��� Ŀ�̼��� NULL �� �ƴ� ��������
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.

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


--�� TBL_EMP ���̺��� ��� �������
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--   ��, �޿�(SAL)�� �ſ� �����Ѵ�.  (�� 1ȸ/��)
--   ����, ����(COMM)�� �ų� �����Ѵ�. (�� 1ȸ/��)

SELECT *
FROM TBL_EMP;
--> 1. ��ü ����ؼ� ���� �׸��ִ��� 

SELECT �����ȣ, �����, �޿�, Ŀ�̼�, ����
FROM TBL_EMP;
--> 2. ���� ������ �־�ߵǴ°��� üũ�ϱ�

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", SAL "����"
FROM TBL_EMP ;
--> 3. �ʿ��� ������ ���

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", (12*SAL) + COMM "����"
FROM TBL_EMP;
--> 4.
--  �̿� ���� ������ �����Ͽ� ��ȸ�� ���
--  ����(COMM)�� NULL �� �������� ���������� NULL �� ����Ǵ� ����
--  Ȯ���� �� �ִ�.
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
-->> WHY? �޿��� �޴µ� ������ NULL �� ������ ���� �ִ°ǰ���?
--        COMM �� NULL �� �ִ� ���� �־ �׷���.
--        NULL �� �ϳ��� ���ԵǸ� ���� ������ NULL �� ���´�.

-- NVL()

SELECT NULL "1", NVL(NULL, 10) "2", NVL(10,20) "3"
FROM DUAL;
--==>> (null)	10	10
--> ù ��° �Ķ���� ���� NULL �̸�, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.
--  ù ��° �Ķ���� ���� NULL �� �ƴϸ�, �� ��(ù ��° �Ķ����)�� �״�� ��ȯ�Ѵ�.

--����
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

SELECT ENAME "�����", COMM"����", NVL(COMM, -1) "�Լ�ȣ����"
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

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", NVL(COMM, 0) "Ŀ�̼�"
    , SAL*12+NVL(COMM, 0) "����"
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

--�� NVL2()
--> ù ��° �Ķ���� ���� NULL �� �ƴ� ���, �� ��° �Ķ���� ���� ��ȯ�ϰ�
--  ù ��° �Ķ���� ���� NULL �� ���, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.

SELECT ENAME, COMM, NVL2(COMM, 'û��÷�', '���÷�') "Ȯ�ο���"
FROM TBL_EMP;
--==>>
/*
SMITH	(null)  ���÷�
ALLEN	   300	û��÷�
WARD	   500  û��÷�
JONES	(null)  ���÷�
MARTIN	1400	û��÷�
BLAKE   (null)  ���÷�
CLARK	(null)	���÷�
SCOTT	(null)	���÷�
KING	(null)	���÷�
TURNER	    0	û��÷�
ADAMS	(null)	���÷�
JAMES	(null)	���÷�
FORD	(null)	���÷�
MILLER	(null)	���÷�
*/

--�� NVL2() Ȱ��~ ���� ��ȸ
-- COMM �� NULL �� �ƴϸ�... SAL*12+COMM
-- COMM �� NULL �̸�........ SAL*12

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", NVL(COMM, 0) "Ŀ�̼�"
    , NVL2(COMM, SAL*12+COMM, SAL*12) "����"
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

--�� COALESCE()
--> �Ű����� ������ ���� ���·� �����ϰ� Ȱ���Ѵ�.
--  �� �տ� �ִ� �Ű��������� ���ʷ� NULL ���� �ƴ��� Ȯ���Ͽ�
--  NULL �� �ƴ� ��� ����(��ȯ, ó��)�ϰ�,
--  NULL �� ��쿡�� �� ���� �Ű������� ������ ����(��ȯ, ó��)�Ѵ�.
--  NVL �� NVL2 �� ����... ���~~~~~~�� ����� ���� ����Ͽ� ó���� �� �ִ� Ư¡�� ���� �ִ�.

SELECT NULL "�⺻Ȯ��"
    , COALESCE(NULL, NULL, NULL, NULL, 30) "�Լ�Ȯ��1"
FROM DUAL;
--==>> (null)	30

SELECT NULL "�⺻Ȯ��",
    COALESCE(NULL, NULL, NULL, NULL, 30) "�Լ�Ȯ��1",
    COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "�Լ�Ȯ��2"
FROM DUAL;
--==>> (null)	30      100
      
--�� �ǽ��� ���� ������ �߰� �Է�
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '���ش�', 'SALESMAN', 7839, SYSDATE, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, COMM, DEPTNO)
VALUES(8001, '�̴ٿ�', 'SALESMAN', 7839, SYSDATE, 100, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

/*---->>  �̴ٿ� 8000������ ���ش��� ��ġ�� �Է��ؼ� �̴ٿ� ������ �ุ ����
DELETE 
FROM TBL_EMP
WHERE ENAME = '�̴ٿ�';
*/

SELECT * 
FROM TBL_EMP;

COMMIT;
--==>> Ŀ�� �Ϸ�.



--�� TBL_EMP ���̺��� ��� �������
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--   ��, �޿�(SAL)�� �ſ� �����Ѵ�. (�� 1ȸ/��)
--   ����, ����(COMM)�� �ų� �����Ѵ�. (�� 1ȸ/��)
--   �� COALESCE() �Լ��� Ȱ���Ѵ�.

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�",
    COALESCE(SAL*12+COMM, SAL*12, COMM, 0)"����"
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
8000	���ش�	(null)	(null)	0
8001	�̴ٿ�	(null)	100	    100
*/

------------------------------------------------------------------------------------

-- �� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.



--�� ���� ��¥ �� �ð��� ��ȯ�ϴ� �Լ�
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;                      ----------------���� �߾���
--==>>
/*
2021-08-27 16:33:25	
2021-08-27 16:33:25	
21/08/27 16:33:25.000000000
*/

--�� ��¥�� ���� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� �÷��� �÷��� ����(����)
--   ����Ÿ�԰� ����Ÿ���� ����
--   ��+�� �����ڸ� ���� ���� ���� �Ұ��� �� ��||��


SELECT 1+1
FROM DUAL;
--==>> 2

SELECT '���ش�' + '�̴ٿ�'
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT '���ش�', '�̴ٿ�'
FROM DUAL;
--==>> ���ش�	�̴ٿ�
--     ������ Į���� �и��� ä�� ���´�

SELECT '���ش�' || '�̴ٿ�'
FROM DUAL;
--==>> ���ش��̴ٿ�
--     ���ڿ��� �������� ���´�

SELECT EMPNO, ENAME
FROM TBL_EMP;
--==> �ؿ� ����� ���ڿ� �̸��� ���� Į���� ���� ��� �������� ��µȴ�.
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
8000���ش�
8001�̴ٿ�
*/

-- �ڡڡڡڡڡڡڡڡڡڡڡڲ� �߿��� ���� �ڡڡڡڡڡڡڡڡڡڡڡ�

--      ����Ÿ��  ��¥Ÿ��  ����Ÿ��  ����Ÿ��  ����Ÿ��
--      --------   -------  ---------  -----  ------------
SELECT '�ش��̴�', SYSDATE, '�� ����', 500, '���� ���Ѵ�.' --5���� Į��
FROM DUAL;

--      ����Ÿ��  ��¥Ÿ��    ����Ÿ��  ����Ÿ��  ����Ÿ��
--      --------   -------    ---------  -----  ------------
SELECT '�ش��̴�'|| SYSDATE || '�� ����'|| 500 || '���� ���Ѵ�.' --5���� Į��
FROM DUAL;
--==>> �ش��̴�2021-08-27�� ����500���� ���Ѵ�.

--�� ����Ŭ������ ���� Ÿ���� ���·� �� ��ȯ�ϴ� ������ ���� ����
--   ������ ó���� ���� ó�� ��||���� �������ָ� ������ �÷��� �÷���
--   (��, ���� �ٸ� ������ �����͵���) �����ϴ� ���� �����ϴ�.
--   MSSQL ���������� ��� �����͸� ���� Ÿ������ CONVERT �ؾ� �Ѵ�.     


--�� TBL_EMP ���̺��� ������ Ȱ���Ͽ�
--   ��� �������� �����Ϳ� ���ؼ�
--   ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.
--   ��������� ���翬��*2

--   SMITH�� ���� ������ 9600 �ε� ��� ������ 19200 �̴�.
--   ALLER�� ���� ������ 19500 �ε� ��� ������ 39000 �̴�.
--                          :

-- ������ ���ش��� �̴ٿ��� ����Ų��.
DELETE
FROM TBL_EMP
WHERE EMPNO IN(8000,8001);
--==>> 2�� �� ��(��) �����Ǿ����ϴ�.

-->> ����� ����(���) ���״��� Ȯ��.
SELECT *
FROM TBL_EMP;

-- NVL ����
SELECT ENAME|| '�� ���� ������ ' || NVL(SAL*12+COMM, SAL*12)   
        || '�ε� ��� ������'|| NVL(SAL*12+COMM, SAL*12)*2 || '�̴�'
FROM TBL_EMP;


-- NVL2 ����
SELECT ENAME|| '�� ���� ������ ' || NVL2(COMM, SAL*12+COMM, SAL*12)   
        || '�ε� ��� ������'|| NVL2(COMM, SAL*12+COMM, SAL*12)*2 || '�̴�'
FROM TBL_EMP;


--COALESCE ����
SELECT ENAME|| '�� ���� ������ ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)   
        || '�ε� ��� ������'|| COALESCE(SAL*12+COMM, SAL*12, COMM, 0)*2 || '�̴�'
FROM TBL_EMP;

--==>> �� �� ��� �Ȱ��� ����
/*
SMITH�� ���� ������ 9600�ε� ��� ������19200�̴�
ALLEN�� ���� ������ 19500�ε� ��� ������39000�̴�
WARD�� ���� ������ 15500�ε� ��� ������31000�̴�
JONES�� ���� ������ 35700�ε� ��� ������71400�̴�
MARTIN�� ���� ������ 16400�ε� ��� ������32800�̴�
BLAKE�� ���� ������ 34200�ε� ��� ������68400�̴�
CLARK�� ���� ������ 29400�ε� ��� ������58800�̴�
SCOTT�� ���� ������ 36000�ε� ��� ������72000�̴�
KING�� ���� ������ 60000�ε� ��� ������120000�̴�
TURNER�� ���� ������ 18000�ε� ��� ������36000�̴�
ADAMS�� ���� ������ 13200�ε� ��� ������26400�̴�
JAMES�� ���� ������ 11400�ε� ��� ������22800�̴�
FORD�� ���� ������ 36000�ε� ��� ������72000�̴�
MILLER�� ���� ������ 15600�ε� ��� ������31200�̴�
*/

SELECT *
FROM TBL_EMP;
-- SMITH's �Ի����� 1980-12-17�̴�. �׸��� �޿��� 800�̴�.
-- ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


SELECT ENAME|| '''s �� �Ի����� ' || HIREDATE 
        || '�̴�. �׸��� �޿���'|| SAL || '�̴�'
FROM TBL_EMP;
--�� ���ڿ��� ��Ÿ���� Ȭ����ǥ ���̿���(���۰� ��)
--   Ȭ����ǥ �� ���� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�.
--   ���������...
--   Ȭ����ǥ �ϳ� ��'���� ���ڿ��� ������ ��Ÿ����
--   Ȭ����ǥ �� �� ��''���� ���ڿ� ���� �ȿ��� ���۽�Ʈ���Ǹ� ��Ÿ����
--   �ٽ� �����ϴ� Ȭ����ȿ �ϳ� ��'���� ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.

--==>
/* -> �̸�'s �� '''
SMITH's �� �Ի����� 1980-12-17�̴�. �׸��� �޿���800�̴�
ALLEN's �� �Ի����� 1981-02-20�̴�. �׸��� �޿���1600�̴�
WARD's �� �Ի����� 1981-02-22�̴�. �׸��� �޿���1250�̴�
JONES's �� �Ի����� 1981-04-02�̴�. �׸��� �޿���2975�̴�
MARTIN's �� �Ի����� 1981-09-28�̴�. �׸��� �޿���1250�̴�
BLAKE's �� �Ի����� 1981-05-01�̴�. �׸��� �޿���2850�̴�
CLARK's �� �Ի����� 1981-06-09�̴�. �׸��� �޿���2450�̴�
SCOTT's �� �Ի����� 1987-07-13�̴�. �׸��� �޿���3000�̴�
KING's �� �Ի����� 1981-11-17�̴�. �׸��� �޿���5000�̴�
TURNER's �� �Ի����� 1981-09-08�̴�. �׸��� �޿���1500�̴�
ADAMS's �� �Ի����� 1987-07-13�̴�. �׸��� �޿���1100�̴�
JAMES's �� �Ի����� 1981-12-03�̴�. �׸��� �޿���950�̴�
FORD's �� �Ի����� 1981-12-03�̴�. �׸��� �޿���3000�̴�
MILLER's �� �Ի����� 1982-01-23�̴�. �׸��� �޿���1300�̴�
*/


SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';
--==>> ��ȸ ��� ����

--�� UPPER(), LOWER(), INITCAP()

SELECT 'oRacLE' "1", UPPER('oRacLE') "2", LOWER('oRacLE') "3", INITCAP('oRacLE') "4"
FROM DUAL;
--==>> oRacLE	ORACLE	oracle	Oracle
--> UPPER() �� ��� �빮�ڷ� ��ȯ�Ͽ� ��ȯ
--  LOWER() �� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
--  INITCAP()�� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ

SELECT *
FROM TBL_EMP
WHERE JOB = (�Է°�);


SELECT *
FROM TBL_EMP
WHERE JOB = UPPER('salEsmAn');

SELECT *
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('salEsmAn');   --UPPER, LOWER. INITCAP �Ѵ� �����ϸ��

COMMIT;
--==>> Ŀ�� �Ϸ�.