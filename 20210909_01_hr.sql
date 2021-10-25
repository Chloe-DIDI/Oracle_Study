SELECT USER
FROM DUAL;


--���� PRIMARY KEY ����--

-- 1. ���̺� ���� �⺻ Ű�� �����Ѵ�.

-- 2. ���̺��� �� ���� �����ϰ� �ĺ��ϴ� �÷� �Ǵ� �÷��� �����̴�.
--    �⺻ Ű�� ���̺� �� �ִ� �ϳ��� �����Ѵ�.
--    �׷��� �ݵ�� �ϳ��� �÷����θ� �����Ǵ� ���� �ƴϴ�.
--    NULL �� �� ����, �̹� ���̺� �����ϰ� �ִ� �����͸�
--    �ٽ� �Է��� �� ������ ó���ȴ�.
--    UNIQUE INDEX �� �ڵ����� �����ȴ�.
--    (����Ŭ�� ��ü������ �����.)

-- 3. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] PRIMARY KEY[(�÷���, ...)] �� ��[]���� ������ ������ ����
                    -->[ ] �̰� ������ ������ �κ��̴�..!
-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��
-- , �÷��� ������Ÿ��
-- , CONSTRAINT CONSTRAINT�� PRIMARY KEY(�÷���, ...) �� CONSTRAINT : ��������

-- 4. CONSTRAINT �߰� �� CONSTRAINT ���� �����ϸ�
--    ����Ŭ ������ �ڵ������� CONSTRAINT ���� �ο��ϰ� �ȴ�. ��  CONSTRAINT���� ���� ���ϸ� ����Ŭ�� 'SYS~~~'�� �ο�, ���Ŀ� ���� �����
--    �Ϲ������� CONSTRAINT ���� �����̺��_�÷���_CONSTRAINT�� �� ������ CONSTRAINT���� �Ű�Ἥ �ۼ��ϰ� �����ؾ� �Ѵ�.
--    �������� ����Ѵ�.


--�� PK ���� �ǽ�(�� �÷� ������ ����)
--���̺� ����
CREATE TABLE TBL_TEST1
(   COL1 NUMBER(5)      PRIMARY KEY
,   COL2 VARCHAR2(30)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

--������ �Է�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1,'TEST');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2,'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(3,NULL);
INSERT INTO TBL_TEST1(COL1) VALUES(4);      --> �̷����ϸ� ���ϴ� ��(COL1)���� �� �ֱ� ����. COL2�� �ڵ����� NULL
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2,'ABCD');     --> �����߻� WHY? PK �� COL1�� 2�� �ߺ�,,
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2,'KKKK');     --> �����߻� WHY? PK �� COL1�� 2�� �ߺ�,,
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(5,'ABCD');    
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(NULL,NULL);    --> �����߻�  PRIMARY KEY �� NULL �ȵȴ�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(NULL,'STUDY'); --> �����߻�  PRIMARY KEY �� NULL �ȵȴ�
INSERT INTO TBL_TEST1(COL2) VALUES('STUDY'); --> �����߻�  ==> COL1�� �����̸Ӹ�Ű�ε� NULL�� �޾ƿͼ�
                                     
--�ڡڡ�  PRIMART KEY �� NULL �� ���� ����!!!!!!�ڡڡ�--        
                                                
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- ������ �Է� �� �Ǿ����� Ȯ��
SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

DESC TBL_TEST1;
--==>>
/*
Ŀ�� �Ϸ�.
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)         �� PK ���� Ȯ�� �Ұ�    
COL2          VARCHAR2(30) 
        ��
        NOT NULL �� ���� Ȯ��
        ��COL1 ��  P.K �����߱� ������      ??????????????�ٽ� ���� ��� ù��°�ð�?????????????? @
*/

--�� �������� Ȯ��
SELECT *
FROM USER_CONSTRAINTS;
--==>>
/*
CTRL + ENTER �ؼ� Ȯ���ϱ�

CONSTRAINTS_TYPE ���� P �� P.K
*/

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='TBL_TEST1';
--==>>
/*
HR	SYS_C007057	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			21/09/09	HR	SYS_C007057		
*/


--�� ���������� ������ �÷� Ȯ��(��ȸ)
SELECT *
FROM USER_CONS_COLUMNS;
--==>>
/*HR	REGION_ID_NN	REGIONS	REGION_ID	
HR	REG_ID_PK	REGIONS	REGION_ID	1
HR	COUNTRY_ID_NN	COUNTRIES	COUNTRY_ID	
HR	COUNTRY_C_ID_PK	COUNTRIES	COUNTRY_ID	1
HR	COUNTR_REG_FK	COUNTRIES	REGION_ID	1
HR	LOC_ID_PK	LOCATIONS	LOCATION_ID	1
HR	LOC_CITY_NN	LOCATIONS	CITY	
HR	LOC_C_ID_FK	LOCATIONS	COUNTRY_ID	1
HR	DEPT_ID_PK	DEPARTMENTS	DEPARTMENT_ID	1
HR	DEPT_NAME_NN	DEPARTMENTS	DEPARTMENT_NAME	
HR	DEPT_MGR_FK	DEPARTMENTS	MANAGER_ID	1
HR	DEPT_LOC_FK	DEPARTMENTS	LOCATION_ID	1
HR	JOB_ID_PK	JOBS	JOB_ID	1
HR	JOB_TITLE_NN	JOBS	JOB_TITLE	
HR	EMP_EMP_ID_PK	EMPLOYEES	EMPLOYEE_ID	1
HR	EMP_LAST_NAME_NN	EMPLOYEES	LAST_NAME	
HR	EMP_EMAIL_NN	EMPLOYEES	EMAIL	
HR	EMP_EMAIL_UK	EMPLOYEES	EMAIL	1
HR	EMP_HIRE_DATE_NN	EMPLOYEES	HIRE_DATE	
HR	EMP_JOB_NN	EMPLOYEES	JOB_ID	
HR	EMP_JOB_FK	EMPLOYEES	JOB_ID	1
HR	EMP_SALARY_MIN	EMPLOYEES	SALARY	
HR	EMP_MANAGER_FK	EMPLOYEES	MANAGER_ID	1
HR	EMP_DEPT_FK	EMPLOYEES	DEPARTMENT_ID	1
HR	JHIST_EMPLOYEE_NN	JOB_HISTORY	EMPLOYEE_ID	
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_EMP_FK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_START_DATE_NN	JOB_HISTORY	START_DATE	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	START_DATE	
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	START_DATE	2
HR	JHIST_END_DATE_NN	JOB_HISTORY	END_DATE	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	END_DATE	
HR	JHIST_JOB_NN	JOB_HISTORY	JOB_ID	
HR	JHIST_JOB_FK	JOB_HISTORY	JOB_ID	1
HR	JHIST_DEPT_FK	JOB_HISTORY	DEPARTMENT_ID	1
HR	SYS_C007057	TBL_TEST1	COL1	1
*/


SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME='TBL_TEST1';
--==>>
/*
HR	SYS_C007057	TBL_TEST1	COL1	1
*/

--�� ���������� ������ ������. �������Ǹ�, ���̺��, ������������, �÷��� �׸� ��ȸ

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007012	TBL_TEST1	P	COL1


--�� PK ���� �ǽ�(�� �÷� ������ ����)
--���̺� ����
CREATE TABLE TBL_TEST2
( COL1  NUMBER(5)       
, COL2  VARCHAR2(30)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST2(COL1) VALUES(4);
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'ABCD'); --> ���� �߻�  unique constraint (��HR.TEST2_COL1_PK) violated
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'KKKK'); --> ���� �߻�                     ---------------(���������� �̸�)
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST1"."COL1")
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻�
INSERT INTO TBL_TEST2(COL2) VALUES ('STUDY');     --> �����߻�  ==> COL1�� �����̸Ӹ�Ű�ε� NULL�� �޾ƿͼ�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/



--�� ���������� ������ ������. �������Ǹ�, ���̺��, ������������, �÷��� �׸� ��ȸ

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST2';
--==>> HR	TEST2_COL1_PK	TBL_TEST2	P	COL1



--�� PK ���� �ǽ�(�� ���� �÷� PK ���� �� ���� �����̸Ӹ� Ű) --> �÷� �����δ� ���� ����(PK�� �ϳ� �̻� �����ϴ� �ǹ̰� �Ǵϱ�)
CREATE TABLE TBL_TEST3
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1, COL2)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.


--(X) �̷��� �ϸ� �ȵȴ�!  �� �̰� ���������� 2�� ����ڴٴ°ǵ� P.K�� �������� 1���� ����!
/*
CREATE TABLE TBL_TEST3
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, CONSTRAINT TEST3_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST3_COL2_PK PRIMARY KEY(COL2)
);
*/



-- ������ �Է�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);  --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL2")
INSERT INTO TBL_TEST3(COL1) VALUES(4);              --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL2")

INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, 'ABCD'); --�� ���� PK�̹Ƿ� ���� ���Ǹ� �����ϸ� �����
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'TEST'); --  
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'KKKK'); --  

INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL1")
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL1")
INSERT INTO TBL_TEST3(COL2) VALUES('TEST'); --> ���� �߻� NULL�� ���ԵǾ��־,,



COMMIT;
--==>> Ŀ�� �Ϸ�

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	KKKK
1	TEST
2	ABCD
2	TEST
3	ABCD
*/


--�� PK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� PK ����)
-- ���̺� ����
CREATE TABLE TBL_TEST4
( COL1      NUMBER(5)
, COL2      VARCHAR2(30)
);
--==>> Table TBL_TEST4��(��) �����Ǿ����ϴ�.

--�� �̹� ������� �ִ� ���̺�
--   �ο��Ϸ��� ���������� ������ �����Ͱ� ���ԵǾ� ���� ���
--   �ش� ���̺� ���������� �߰��ϴ� ���� �Ұ����ϴ�.

-- �������� �߰�(����� ������ ���ԾȵǾ� ����)
ALTER TABLE TBL_TEST4 
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4��(��) ����Ǿ����ϴ�.



-- ������ �Է�
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST4(COL1) VALUES(4);
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'ABCD'); --> ���� �߻�  unique constraint (��HR.TEST2_COL1_PK) violated
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'KKKK'); --> ���� �߻�                     ---------------(���������� �̸�)
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST1"."COL1")
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻�
INSERT INTO TBL_TEST4(COL2) VALUES ('STUDY');     --> �����߻�  ==> COL1�� �����̸Ӹ�Ű�ε� NULL�� �޾ƿͼ�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST4;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

--�� �������� Ȯ�ο� ���� ��(VIEW) ����

CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
,      UC.CONSTRAINT_NAME "CONSTARINT_NAME"
,      UC.TABLE_NAME "TABLE_NAME"
,      UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
,      UCC.COLUMN_NAME "COLUMN_NAME"
,      UC.SEARCH_CONDITION "SEARCH_CONDITION"
,      UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK��(��) �����Ǿ����ϴ�.

--�� ������ ��(VIEW)�� ���� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1	



--------------------------------------------------------------------------------


--���� UNIQUE(UK:U) ����--

-- 1. ���̺��� ������ �÷��� �����Ͱ� �ߺ����� �ʰ�(������ ���� ����)
--    ���̺� ������ ������ �� �ֵ��� �����ϴ� ��������.
--    PRIMARY KEY �� ������ ��������������, NULL �� ����Ѵٴ� ���̰� �ִ�.��
--    ���������� PRIMARY KEY �� ���������� UNIQUE INDEX �� �ڵ� �����ȴ�.
--    �ϳ��� ���̺� ������ UNIQUE ���������� ���� �� �����ϴ� ���� �����ϴ�.
--    ��, �ϳ��� ���̺� UNIQUE ���������� ���� �� ����� ����
--    �����ϴٴ� ���̴�.(���� ���� ����)

-- 2. ���� �� ����
--�� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] UNIQUE

--�� ���̺� ������ ����
--  �÷��� ������Ÿ��
--  , �÷��� ������Ÿ��
--  , CONSTRAINT CONSTRAINT�� UNIQUE(�÷���, ...)

--�� UK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST5
( COL1      NUMBER(5)       PRIMARY KEY
, COL2      VARCHAR2(30)    UNIQUE
);
--==>> Table TBL_TEST5��(��) �����Ǿ����ϴ�.


SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST5';
--==>>
/*
HR	SYS_C007061	TBL_TEST5	P	COL1		-> P.K
HR	SYS_C007062	TBL_TEST5	U	COL2		-> ����ũ
*/





-- ������ �Է�
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(3, NULL);      --�� ����ũ�� NULL ������ �� ����!,,UNIQUE�� ������ ���� �����ѵ�,, NULL �� ������ ���� �ƴϴ�.�ٵ��� ������ ������? -> NULL�� �׳� ���°ŷ� ���°��̶�� �׳� ����.
INSERT INTO TBL_TEST5(COL1) VALUES(4);
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(2, 'ABCD'); --> ���� �߻�   �����̸Ӹ�Ű ����
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(2, 'KKKK'); --> ���� �߻�   �����̸Ӹ�Ű ����
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(5, 'ABCD'); --> ���� �߻� unique constraint (HR.SYS_C007062) -> �̸��� �������ߴ�
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST1"."COL1")
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻�
INSERT INTO TBL_TEST5(COL2) VALUES ('STUDY');     --> �����߻�  ==> COL1�� �����̸Ӹ�Ű�ε� NULL�� �޾ƿͼ�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST5;
--==>>
/*
1	TEST
2	ABCD
3	
4	
*/


--�� UK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST6
( COL1     NUMBER(5)
, COL2     VARCHAR2(30)
, CONSTRAINT PK_TEST6_COL1 PRIMARY KEY(COL1)  --> CONSTARINT TEST6_COL1_PK �� ���� 
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
--==>> Table TBL_TEST6��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST6';
--==>>
/*
HR	PK_TEST6_COL1	TBL_TEST6	P	COL1		
HR	TEST6_COL2_UK	TBL_TEST6	U	COL2		
*/


--�� UK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� UK �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_TEST7
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
);
--==>> Table TBL_TEST7��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST7';
--==>> ��ȸ ��� ����(���� �������� �߰� ����)

-- �������� �߰�
ALTER TABLE TBL_TEST7
ADD ( CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST7_COL2_UK UNIQUE(COL2) );
--==>> Table TBL_TEST7��(��) ����Ǿ����ϴ�.

-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST7';
--==>>
/*
HR	TEST7_COL1_PK	TBL_TEST7	P	COL1		
HR	TEST7_COL2_UK	TBL_TEST7	U	COL2		
*/


----------------------------------------------------------------------------------------------------------

--���� CHECK(CK:C) ����--

-- 1. �÷����� ��� ������ �������� ������ ������ �����ϱ� ���� ��������
--    �÷��� �ԷµǴ� �����͸� �˻��Ͽ� ���ǿ� �´� �����͸� �Էµ� �� �ֵ��� ó���ϸ�, 
--    �����Ǵ� ������ ���� �˻��Ͽ� ���ǿ� �´� �����ͷ� �����Ǵ� �͸� ����ϴ� ����� 
--    �����ϰ� �ȴ�.

-- 2. ���� �� ����
--�� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] CHECK (�÷� ����)

--�� ���̺� ������ ����
--  �÷��� ������Ÿ��
--  , �÷��� ������Ÿ��
--  , CONSTRAINT CONSTARINT�� CHECK (�÷� ����)

--�� NUMBER(38)      ����...
--   CHAR(2000)      ����...
--   VARCHAR2(4000)  ����...
--   NCHAR(1000)     ����...
--   NVARCHAR2(2000) ����...




--�� CK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST8
( COL1      NUMBER(5)      PRIMARY KEY
, COL2      VARCHAR2(30)   
, COL3      NUMBER(3)      CHECK (COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST8��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(1, '�±�', 100);
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(2, '����', 101); --> ���� �߻� check constraint (HR.SYS_C007022) violated
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(3, '����', -1);  --> ���� �߻� check constraint (HR.SYS_C007022) violated
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(4, '����', 80);

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST8;
--==>>
/*
1	�±�	100
4	����	80
*/

-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST8';
--==>> 
/*
HR	SYS_C007067	TBL_TEST8	C	COL3	COL3 BETWEEN 0 AND 100	
HR	SYS_C007068	TBL_TEST8	P	COL1		 ----------------- �̰� Ȯ��
*/


 CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1)
--�� CK ���� �ǽ�(�� ���̺� ������ ����)
CREATE TABLE TBL_TEST9
( COL1      NUMBER(3)
, COL2      VARCHAR2(30)
, COL3      NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_UK CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(1, '�±�', 100);
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(2, '����', 101); --> ���� �߻� check constraint (HR.SYS_C007022) violated
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(3, '����', -1);  --> ���� �߻� check constraint (HR.SYS_C007022) violated
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(4, '����', 80);

SELECT *
FROM TBL_TEST9;
--==>>
/*
1	�±�	100
4	����	80
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST9';
--==>>
/*  
    �������� �ٸ���! �̰� ���´�
    ------
HR	TEST9_COL3_UK	TBL_TEST9	C	COL3	COL3 BETWEEN 0 AND 100	
HR	TEST9_COL1_PK	TBL_TEST9	P	COL1	----  -----------------
                                         �� �÷���   �� ��������
*/



--�� CK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� CK �������� �߰�)
CREATE TABLE TBL_TEST10
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, COL3  NUMBER(3)
);
--==>> Table TBL_TEST10��(��) �����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>> ��ȸ ��� ���� �� ������ �������� ����

-- �������� �߰�
ALTER TABLE TBL_TEST10
ADD ( CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST10_COL3_PK CHECK(COL3 BETWEEN 0 AND 100) );
--==>> Table TBL_TEST10��(��) ����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>>
/*
HR	TEST10_COL1_PK	TBL_TEST10	P	COL1		
HR	TEST10_COL3_PK	TBL_TEST10	C	COL3	COL3 BETWEEN 0 AND 100	
*/



--�� �ǽ� ����
-- ������ ���� TBL_TESTMEMBER ���̺��� �����Ͽ�
-- SSN �÷�(�ֹι�ȣ �÷�)���� 
-- ������ �Է� �� ������ ��ȿ�� �����͸� �Էµ� �� �ֵ���
-- üũ ���������� �߰��� �� �ֵ��� �Ѵ�.
-- �� �ֹι�ȣ Ư�� �ڸ��� �Է� ������ �����ͷ� 1, 2, 3, 4 �� ����
-- ����, SID �÷����� PRIMARY KEY ���������� ������ �� �ֵ��� �Ѵ�.

-- ���� ���⼭ ��� �ִ��� Ȯ�� -> ������ ���� ���������ִ�.
SELECT *
FROM TBL_TESTMEMBER;

DESC TBL_TESTMEMBER;

-- ���̺� ����
CREATE TABLE TBL_TESTMEMBER
( SID      NUMBER
, NAME     VARCHAR2(30)     --                      | 8��° �ڸ��� �Ű��ߵ�
, SSN      CHAR(14)         -- �Է� ���� �� 'YYMMDD-NNNNNNN'
, TEL      VARCHAR2(40)
);
--==>> Table TBL_TESTMEMBER��(��) �����Ǿ����ϴ�.


ALTER TABLE TBL_TESTMEMBER 
ADD( CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
   , CONSTRAINT TESTMEMBER_SSN_CK CHECK(�ֹι�ȣ 8��° �ڸ� 1���� '1' �Ǵ� '2' �Ǵ� '3' �Ǵ� '4')
);

/*ALTER TABLE TBL_TESTMEMBER 
ADD( CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
   , CONSTRAINT TESTMEMBER_SSN_CK CHECK ((SUBSTR(SSN, 8, 1) IN ('1', '2', '3', '4'))
                                        AND (SSN LIKE 'YYMMDD-NNNNNN'))
);*/-->Ʋ��


ALTER TABLE TBL_TESTMEMBER
ADD ( CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT TESTMEMBER_SSN_CK CHECK(SUBSTR(SSN, 8, 1) IN ('1', '2', '3', '4')) );


--<<�������� �߸��Է��ؼ� �����ϴ� ����>>
--�� CK ���� ����        
ALTER TABLE TBL_TESTMEMBER
    DROP CONSTRAINT TESTMEMBER_SSN_CK;

        --==WHY?????? �ؿ� �ٸ� �� �� �Է��ߴµ� �� PK ���� �����ؾߵǳ�?   
               --�� ALTER~; ���⿡ PK �� CK �Ѵ� �����־ CK�� �����ϸ� PK �� �״�� �����ֱ⶧����
--                          �ߺ����� PK(�̸��� �Ȱ���) �� �Է� �� �� ���� ������ ������
--                          �̷��� PK ���� �����ϰ� �� �ѹ��� �ٽ� �Է��ϴ°� ���ϴ�
--                          ���� �Ƿº������� CK�� �Է��ϴ� ������ �����ھ ������ ���.
--�� PK ���� ����        
ALTER TABLE TBL_TESTMEMBER
    DROP CONSTRAINT TESTMEMBER_SID_PK; 


-- ���� ���� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMBER';




-- �Է� �׽�Ʈ
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(1, '��ȿ��', '980611-2234567', '010-1111-1111');

INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(2, '�մ���', '940603-2234567', '010-2222-2222');

INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(3, '����ȣ', '941108-1234567', '010-3333-3333'); 
--1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(4, '�չ���', '960816-5234567', '010-4444-4444'); 
-->
/*
����� 639 �࿡�� �����ϴ� �� ���� �߻� -
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(4, '�չ���', '960816-5234567', '010-4444-4444')
���� ���� -
ORA-02290: check constraint (HR.TBL_TESTMEMBER_SSN_CK) violated
*/ 

INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(5, '�̴ٿ�', '951027-9234567', '010-0000-0000'); 
--> 
/*
����� 650 �࿡�� �����ϴ� �� ���� �߻� -
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(5, '�̴ٿ�', '951027-9234567', '010-0000-0000')
���� ���� -
ORA-02290: check constraint (HR.TBL_TESTMEMBER_SSN_CK) violated
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TESTMEMBER;
/*
1   ��ȿ��   980611-1234567   010-1111-1111
2   �մ���   940603-2234567   010-2222-2222
3   ����ȣ   941108-1234567   010-3333-3333
*/

------------------------------------------------------------------------------------

--���� FOREIGN KEY(FK:F:R) ����--

-- 1. ���� Ű �Ǵ� �ܷ� Ű(FK)�� 
--    �� ���̺��� ������ �� ������ �����ϰ�
--    ���� �����Ű�µ� ���Ǵ� ���̴�.
--    �� ���̺��� �⺻ Ű ���� �ִ� ����
--    �ٸ� ���̺� �߰��ϸ� ���̺� �� ������ ������ �� �ִ�.
--    �� ��, �� ��° ���̺� �߰��Ǵ� ���� �ܷ� Ű�� �ȴ�.

-- 2. �θ� ���̺�(�����޴� �÷��� ���Ե� ���̺�)�� ���� ������ �� 
--    �ڽ� ���̺�(�����ϴ� �÷��� ���Ե� ���̺�)�� �����Ǿ�� �Ѵ�.
--    �� ��, �ڽ� ���̺� FOREIGN KEY ���������� �����ȴ�.

-- 3. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��]
--                   REFERENCES ���� ���̺��(���� �÷���)
--                   [ON DELETE CASCADE | ON DELETE SET NULL]


-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��
-- , �÷��� ������Ÿ��
-- , CONSTRAINT CONSTRAINT�� FOREIGN KEY(�÷���)
--            REFERECES �������̺��(�����÷���)
--            [ON DELETE CASCADE | ON DELETE SET NULL]

--�� FOREIGN KEY ���������� �����ϴ� �ǽ��� �����ϱ� ���ؼ���
--   �������� �ϳ��� ���̺��� �����Ͽ� ó���ϴ� ���� �ƴ϶�
--   �θ� ���̺� ���� �۾��� ���� �����ؾ� �Ѵ�.
--   �׸��� �� ��, �θ� ���̺��� �ݵ�� PK �Ǵ� UK ����������
--   ������ �÷��� �����ؾ� �Ѵ�.



-- �θ� ���̺� ���� 
CREATE TABLE TBL_JOBS
( JIKWI_ID      NUMBER
, JIKWI_NAME    VARCHAR2(30)
, CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
);
--==>> Table TBL_JOBS��(��) �����Ǿ����ϴ�.

-- �θ� ���̺� ������ �Է�
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(1, '���');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(2, '�븮');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(3, '����');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(4, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

---------------------------------------->>>>>>>>>> �θ����̺� �غ� �Ϸ�!


--�� FK ���� �ǽ�(�� �÷� ������ ����)
CREATE TABLE TBL_EMP1
( SID       NUMBER          PRIMARY KEY
, NAME      VARCHAR2(30)    
, JIKWI_ID  NUMBER          REFERENCES TBL_JOBS(JIKWI_ID) -- ��FOREIGN KEY �ۼ� ����(� ���̺��� �����ϳİ� �� �߿���)
);
--==>> Table TBL_EMP1��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	SYS_C007078	TBL_EMP1	P	SID			
HR	SYS_C007079	TBL_EMP1	R	JIKWI_ID		NO ACTION(��)  
                                                -------------
                                                
*/

-- ������ �Է�
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (1, '������', 1);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (2, '�ּ���', 2);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (3, '������', 3);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (4, '�̴ٿ�', 4);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (5, '�չ���', 5); --> ���� �߻� integrity constraint (HR.SYS_C007037) violated - parent key not found
                           --�����̸� �̷��� ��ġ�� ���� ��        -- �θ��÷����� 4�����ۿ����µ� 5����ؼ� �������� ����
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (5, '�չ���', 1);                                                                
INSERT INTO TBL_EMP1(SID, NAME) VALUES (6, '��ȿ��');          --> �����ȳ� WHY? NULL�� ������ ���ļ� �����ȳ�!
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (7, '�մ���', NULL); --> ����  ȿ���̶� ���� ����


SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ּ���	2
3	������	3
4	�̴ٿ�	4
6	��ȿ��	
7	�մ���	
*/

COMMIT;




--�� FK ���� �ǽ�(�� ���̺� ������ ����)
CREATE TABLE TBL_EMP2
( SID           NUMBER
, NAME          VARCHAR2(30)
, JIKWI_ID      NUMBER
, CONSTRAINT EMP2_SID_PK PRIMARY KEY(SID)
, CONSTRAINT EMP2_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>> Table TBL_EMP2��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP2';
--==>>
/*
HR	EMP2_SID_PK	        TBL_EMP2	P	SID		
HR	EMP2_JIKWI_ID_FK	TBL_EMP2	R	JIKWI_ID		NO ACTION
*/

--�� FK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� FK �������� �߰�)
-- ���̺� ���� (�θ� ���̺� �ϳ��� �ڽ� ���̺� ������ ���� �� ���� �� TBL_JOBS / TBL_EMP1, TBL_EMP2, TBL_EMP3)
CREATE TABLE TBL_EMP3
( SID           NUMBER
, NAME          VARCHAR2(30)
, JIKWI_ID      NUMBER
);
--==>> Table TBL_EMP3��(��) �����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> ��ȸ ��� ����


-- �������� �߰� 
ALTER TABLE TBL_EMP3
ADD ( CONSTRAINT EMP3_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                    REFERENCES TBL_JOBS(JIKWI_ID) );
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>>
/*
HR	EMP3_SID_PK	TBL_EMP3	    P	SID		
HR	EMP3_JIK_ID_FK	TBL_EMP3	R	JIKWI_ID		NO ACTION
*/



-- 4. FOREIGN KEY ���� �� ���ǻ���
--    �����ϰ��� �ϴ� �θ� ���̺��� ���� �����ؾ� �Ѵ�.
--    �����ϰ��� �ϴ� �÷��� PRIMARY KEY �� UNIQUE ���������� �־�� �Ѵ�.
--    ���̺� ���̿� PRIMARY KEY �� FOREIGN KEY �� ���ǵǾ� ������
--    PRIMARY KEY ���������� ������ �÷����� ������ ���� �� ���
--    ���� FOREIGN KEY �÷��� �� ���� �ԷµǾ� �ִ� ��� �������� �ʴ´�.
--    (��, FK ���� �������� ��ON DELETE CASCADE���� 
--     ��ON DELETE SET NULL�� �ɼ��� ����Ͽ� ������ ��쿡��
--     ������ �����ϴ�.)
--    �θ� ���̺��� �����ϱ� ���ؼ��� �ڽ� ���̺��� ���� �����ؾ� �Ѵ�.
/*
�θ����̺��� �����ÿ� �����Ϳ� �ִ� �ܷ�Ű ���� �����Ǵ� �� �ƴ϶�..... 
���ڵ� ��ü�� �����Ǵ� �ǰ���???      -- YES ���ڵ�(��) ��ü�� �����Ǵ°�,,

*/

-- �θ� ���̺� ��ȸ
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/

-- �ڽ� ���̺� ��ȸ
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ּ���	2
3	������	3
4	�̴ٿ�	4   �� ����!!(WHY?   4���� �����̶�)
5	�չ���	1
6	��ȿ��	
7	�մ���		
*/

-- �̴ٿ� ������ ������ ������� ����
UPDATE TBL_EMP1
SET JIKWI_ID=1
WHERE SID=4;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- �ٽ� �ڽ� ���̺� ��ȸ
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ּ���	2
3	������	3
4	�̴ٿ�	1
5	�չ���	1
6	��ȿ��	
7	�մ���	
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �θ����̺�(TBL_JOBS)�� ���� �����͸� �����ϰ� �ִ�
-- �ڽ����̺�(TBL_EMP1)�� �����Ͱ� �������� �ʴ� ��Ȳ.

-- �̿� ���� ��Ȳ���� �θ����̺�(TBL_JOBS)�� 
-- ���� ������ ����


DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
*/

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.




-- �θ����̺�(TBL_JOBS)�� ��� �����͸� �����ϰ� �ִ� 
-- �ڽ����̺�(TBL_EMP1)�� �����Ͱ� 3�� �����ϴ� ��Ȳ.

-- �̿� ���� ��Ȳ���� �θ����̺�(TBL_JOBS)��
-- ��� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> ���� �߻�
/*
����� 952 �࿡�� �����ϴ� �� ���� �߻� -
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1
���� ���� -
ORA-02292: integrity constraint (HR.SYS_C007037) violated - child record found
*/


-- �θ� ���̺�(TBL_JOBS) ����
DROP TABLE TBL_JOBS;
--==>> ���� �߻�
/*

����� 952 �࿡�� �����ϴ� �� ���� �߻� -
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1
���� ���� -
ORA-02292: integrity constraint (HR.SYS_C007037) violated - child record found  ------??????????????????????????? @
*/


-- �θ� ���̺�(TBL_JOBS) ����
DROP TABLE TBL_JOBS;
--==>> ���� �߻�
/*
����� 966 �࿡�� �����ϴ� �� ���� �߻� -
DROP TABLE TBL_JOBS
���� ���� -
ORA-02449: unique/primary keys in table referenced by foreign keys
02449. 00000 -  "unique/primary keys in table referenced by foreign keys"
*Cause:    An attempt was made to drop a table with unique or
           primary keys referenced by foreign keys in another table.
*Action:   Before performing the above operations the table, drop the
           foreign key constraints in other tables. You can see what
           constraints are referencing a table by issuing the following
           command:
           SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "tabnam";
*/

--�� �θ� ���̺��� �����͸� �����Ӱ� �����ϱ� ���ؼ���
--   ��ON DELETE CASCADE�� �ɼ� ������ �ʿ��ϴ�.

--   TBL_EMP1 ���̺�(�ڽ����̺�)���� FK ���������� ������ ��
--   CASCADE �ɼ��� �����Ͽ� �ٽ� FK ���������� �����Ѵ�.



--�� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
--==>>
/*
    ������� �� �̸� �˾ƾߴ�!
    ------------
HR	SYS_C007078	TBL_EMP1	P	SID		
HR	SYS_C007079	TBL_EMP1	R	JIKWI_ID		NO ACTION
    ------------
*/


--�� �������� ����
ALTER TABLE TBL_EMP1
DROP CONSTRAINT SYS_C007079;
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.


--�� �������� ���� ���� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
--==>> HR	SYS_C007078	TBL_EMP1	P	SID		



--�� ��ON DELETE CASCADE�� �ɼ��� ���Ե� �������� �������� ������
ALTER TABLE TBL_EMP1
ADD CONSTRAINT EMP1_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
               REFERENCES TBL_JOBS(JIKWI_ID)
               ON DELETE CASCADE;
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.


--�� �������� ������ ���� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';      
--==>>
/*
HR	SYS_C007078	TBL_EMP1	P	SID		
HR	EMP1_JIKWI_ID_FK	TBL_EMP1	R	JIKWI_ID		CASCADE
*/

--> CASCADE �ɼ��� ������ �Ŀ���
--  �����ް� �ִ� �θ� ���̺��� �����͸�
--  �������� �����Ӱ� �����ϴ� ���� �����ϴ�.
--  ��, ... ... ... �θ� ���̺��� �����Ͱ� ������ ���
--  �̸� �����ϴ� �ڽ� ���̺��� �����͵� ��~~~~~~~~~~~~~~�� �Բ� �����ȴ�.
--  CHECK~!!!



-- �θ� ���̺�
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
*/

-- �ڽ� ���̺�
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ּ���	2
3	������	3
4	�̴ٿ�	1
5	�չ���	1
6	��ȿ��	
7	�մ���	
*/

--�� TBL_JOBS(�θ����̺�)�� ��� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.(���(1) ����)

-- �θ� ���̺� 
SELECT *
FROM TBL_JOBS;
--==>> ���(1) ������
/*
2	�븮
3	����
*/

-- �ڽ� ���̺�
SELECT * 
FROM TBL_EMP1;
--==>> ���(1) �� ��� ������
/*
2	�ּ���	2
3	������	3
6	��ȿ��	
7	�մ���	
*/

-------------------------------------------------------------------------------------------------------------------------------


--���� NOT NULL(NN:CK:C) ����--

-- 1. ���̺��� ������ �÷��� �����Ͱ� NULL �� ���� ���ϵ��� �ϴ� �������� 

-- 2. ���� �� ����
-- �� �÷� ������ ���ġ�
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] NOT NULL

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� CHECK(�÷��� IS NOT NULL)

-- 3. ������ �����Ǿ� �ִ� ���̺� NOT NULL ���������� �߰��� ���
--    ADD ���� MODIFY ������ �� ���� ���ȴ�.

--    ALTER TABLE ���̺��
--    MODIFY �÷��� ������Ÿ�� NOT NULL;

-- 4. ���� ���̺� �����Ͱ� �̹� ������� ���� �÷�(�� NULL �� ����)��
--    NOT NULL ���������� ���Բ� �����ϴ� ��쿡�� ���� �߻��Ѵ�.


--�� NOT NULL ���� �ǽ�(�� �÷� ������ ����)
-- ��ü ���̺� ��ȸ
SELECT *
FROM TAB;

CREATE TABLE TBL_TEST11
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR2(30)    NOT NULL
);
--==>> Table TBL_TEST11��(��) �����Ǿ����ϴ�.

-- ������ �Է� 
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(3, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST11"."COL2")
INSERT INTO TBL_TEST11(COL1) VALUES(4); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST11"."COL2")

-- Ȯ��
SELECT *
FROM TBL_TEST11;
--==>>
/*
1	TEST
2	ABCD
*/

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST11';  
--==>>
/*
HR	SYS_C007085	TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007086	TBL_TEST11	P	COL1		
*/


--�� NOT NULL ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST12
( COL1      NUMBER(5)
, COL2      VARCHAR2(30)
, CONSTRAINT TEST12_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST12_COL2_NN CHECK(COL2 IS NOT NULL)
);
--==>> Table TBL_TEST12��(��) �����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST12';  
--==>>
/*
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1				
*/
-----> ���⼭ ���ߵ� ���� �ִµ� ������ �ϸ鼭 �� �� �ֵ��� ���ܵΰڴ�.........


--�� NOT NULL ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� NN �������� �߰�)
CREATE TABLE TBL_TEST13
( COL1      NUMBER(5)
, COL2      VARCHAR2(30)
);
--==>> Table TBL_TEST13��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>> ��ȸ ��� ���� �� ���������� �������� ����

-- �������� �߰�
ALTER TABLE TBL_TEST13
ADD ( CONSTRAINT TEST13_COL1_PK PRIMARY KEY(COL1)
     ,CONSTRAINT TEST13_COL2_NN CHECK(COL2 IS NOT NULL) );
--==>> Table TBL_TEST13��(��) ����Ǿ����ϴ�.

DESC TBL_TEST13;

-- �ٽ� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>>
/*
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
*/



--�� NOT NULL �������Ǹ� TBL_TEST13 ���̺��� COL2 �� �߰��ϴ� ���
--   ������ ���� ����� �����ϴ�.
ALTER TABLE TBL_TEST13
MODIFY COL2 NOT NULL;
--==>> Table TBL_TEST13��(��) ����Ǿ����ϴ�.

-- �÷� �������� NOT NULL ���������� ������ ���̺� ���� Ȯ��
DESC TBL_TEST11;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/
--> DESC �� ���� COL2 �÷��� NOT NULL �� ������ Ȯ�εǴ� ��Ȳ

-- ���̺� �������� NOT NULL ���������� ������ ���̺� ���� Ȯ��
DESC TBL_TEST12;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2          VARCHAR2(30) ��
*/
--> DESC �� ���� COL2 �÷��� NOT NULL �� ������ Ȯ�ε��� �ʴ� ��Ȳ



-- ���̺� ���� ���� ADD �� ���� NOT NULL ���������� �߰��Ͽ�����
-- ����, MODIFY ���� ���� NOT NULL ���������� �ٽ� �߰��� ���̺� ���� Ȯ��
DESC TBL_TEST13;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/
--> DESC �� ���� COL2 �÷��� NOT NULL �� ������ Ȯ�εǴ� ��Ȳ


-- �������� Ȯ�� ���� ��(VIEW) ��ȸ
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME IN ('TBL_TEST11', 'TBL_TEST12', 'TBL_TEST13');
--==>>
/*
HR	SYS_C007085	    TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007086	    TBL_TEST11	P	COL1	------ "" �ִ°�	
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1	-----"" ���� ��	
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
HR	SYS_C007091	    TBL_TEST13	C	COL2	"COL2" IS NOT NULL	
*/













