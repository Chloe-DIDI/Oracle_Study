
--1�� �ּ��� ó��(������ �ּ��� ó��)

/*
������
(������)
�ּ���
ó��
*/

--�� ���� ����Ŭ ������ ������ �ڽ��� ���� ��ȸ
show user;  -- ���� ���� ���õ� ���¿��� ctrl + enter �ϸ� �ؿ� �������
--==>> USER��(��) "SYS"�Դϴ�.
--> sqlplus ������ �� ����ϴ� ��ɾ�

select user
from dual;
--==>> SYS

SELECT USER
FROM DUAL;
--==>> SYS

SELECT 1+2
FROM DUAL;
--==>> 3

SELECT �ֿ밭��F������
FROM DUAL;
--==>> ���� �߻�
/*
ORA-00904: "�ֿ밭��F������": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
28��, 8������ ���� �߻�
*/

SELECT "�ֿ밭��F������"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-00904: "�ֿ밭��F������": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
39��, 8������ ���� �߻�
*/

SELECT '�ֿ밭��F������'
FROM DUAL;
--==>> �ֿ밭��F������

SELECT '������ ������ ����Ŭ ����'
FROM DUAL;
--==>> ������ ������ ����Ŭ ����

SELECT 3.14 + 1.36
FROM DUAL;
--==>> 4.5          �Ǽ���� ����

SELECT 1.234 + 2.345
FROM DUAL;
--==>> 3.579

SELECT 10 * 5
FROM DUAL;
--==>> 50

SELECT 1000/23
FROM DUAL;
--������ �Ǽ�������� �ȴ�==>> 43.47826086956521739130434782608695652174

SELECT 100 - 23
DUAL;
--==>> 77

SELECT 100 - 5.5
FROM DUAL;
--==>> 94.5

SELECT '����ȭ' + 'ä����'
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

--�� ���� ����Ŭ ������ �����ϴ� ����� ���� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS 
FROM DBA_USERS;
--==>>
/*
SYS	                OPEN
SYSTEM              OPEN
ANONYMOUS	        OPEN
HR	                OPEN
APEX_PUBLIC_USER	LOCKED
FLOWS_FILES	        LOCKED
APEX_040000     	LOCKED
OUTLN           	EXPIRED & LOCKED
DIP	                EXPIRED & LOCKED
ORACLE_OCM	        EXPIRED & LOCKED
XS$NULL	            EXPIRED & LOCKED
MDSYS            	EXPIRED & LOCKED
CTXSYS	            EXPIRED & LOCKED
DBSNMP	            EXPIRED & LOCKED
XDB	                EXPIRED & LOCKED
APPQOSSYS       	EXPIRED & LOCKED
*/

SELECT USERNAME, USER_ID, ACCOUNT_STATUS, PASSWORD, LOCK_DATE
FROM DBA_USERS;
--==>>
/*
SYS	                0	        OPEN		
SYSTEM            	5        	OPEN		
ANONYMOUS	        35	        OPEN		
HR	                43	        OPEN		
APEX_PUBLIC_USER	45	        LOCKED		            14/05/29
FLOWS_FILES	        44	        LOCKED		            14/05/29
APEX_040000	        47      	LOCKED	             	14/05/29
OUTLN             	9	        EXPIRED & LOCKED		21/08/24
DIP	                14	        EXPIRED & LOCKED		14/05/29
ORACLE_OCM	        21      	EXPIRED & LOCKED		14/05/29
XS$NULL	            2147483638	EXPIRED & LOCKED		14/05/29
MDSYS	            42	        EXPIRED & LOCKED		14/05/29
CTXSYS	            32	        EXPIRED & LOCKED		21/08/24
DBSNMP	            29	        EXPIRED & LOCKED		14/05/29
XDB	                34	        EXPIRED & LOCKED		14/05/29
APPQOSSYS	        30	        EXPIRED & LOCKED		14/05/29
*/
--==>> ��DBA_���� �����ϴ� Oracle Data Dictionary View ��
--      ������ ������ �������� �������� ��쿡�� ��ȸ�� �����ϴ�.
--      ������ ������ ��ųʸ� ������ ���� ���ص� �������.


--�� ��HR������� ������ ��� ���·� ����
ALTER USER HR ACCOUNT LOCK;
--==>> User HR��(��) ����Ǿ����ϴ�.

--�� �ٽ� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS 
FROM DBA_USERS;
--==>>
/*
        :
    HR	  LOCKED
        :
*/

--�ۡ�HR������� ���� ��� ����
ALTER USER HR ACCOUNT UNLOCK;
--==>> User HR��(��) ����Ǿ����ϴ�.

--�� �ٽ� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS 
FROM DBA_USERS;
--==>>
/*
        :
    HR	   OPEN
        :
*/

--------------------------------------------------------------------------------

--�� TABLESPACE ����

--�� TABLESPACE��?
--   ���׸�Ʈ(���̺�, �ε���,...)�� ��Ƶδ�(�����صδ�)
--   ����Ŭ�� ������ ���� ������ �ǹ��Ѵ�.


--��INSERT�� �����͸� ���θ��鶧
--��CREATE�� ������ ������ΰ��� ���θ��鶧

-- ��Ÿ����~!!!
--CREAT TABLESPACE TBS_EDUA                   --CREAT ���� ��ü�� �� ����
CREATE TABLESPACE TBS_EDUA                   --CREAT ���� ��ü�� �� ����
--DATAFILE 'D:\TESTORADATA\TBS_EDUA01.DBF'    -- ���������� ����Ǵ� ������ ����
DATAFILE 'C:\TESTORADATA\TBS_EDUA01.DBF'    -- ���������� ����Ǵ� ������ ����
SIZE 4M                                     -- ������ ������ ������ �뷮
EXTENT MANAGEMENT LOCAL                     -- ����Ŭ ������ ���׸�Ʈ�� �˾Ƽ� ����
SEGMENT SPACE MANAGEMENT AUTO;              -- ���׸�Ʈ ���� ������ �ڵ����� ����Ŭ ������ ����

--�� ���̺����̽� ���� ������ �����ϱ� ����
--   �������� ��ο� ���͸� ������ ��.
--==>> TABLESPACE TBS_EDUA��(��) �����Ǿ����ϴ�.

--�� ������ ���̺����̽�(TBS_EDUA) ��ȸ
--SELECT �̷��׸�, �����׸�, �׷��׸�
SELECT *        --*�� ����׸�
FROM DBA_TABLESPACES;   
--==>>
/*
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
*/

--�� �������� ���� �̸� ��ȸ
SELECT *
FROM DBA_DATA_FILES;
--==>>
/*
C:\TESTORADATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO
*/

--�� ����Ŭ ����� ���� ����(sdj)
CREATE USER sdj IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> sdj ��� ����� ������ ����ڴ�.(�����ϰڴ�.)
-- �� ������ �н������ java006$ �� �����ϰڴ�.(�����ϰڴ�.)
-- �� ������ ���� �����ؼ� �����ϴ� ����Ŭ ��ü��(���׸�Ʈ����)
-- �⺻������ TBS_EDUA ��� ���̺����̸����� Ȱ���� �� �ֵ��� �����ϰڴ�.
--(�� ���̺����̽��� ���� �� �� �ֵ��� �����ϰٴ�.)
--==>> User SDJ��(��) �����Ǿ����ϴ�.


--�� ������ ����Ŭ ����� ����(sdj)�� ����
--   ����Ŭ�� ������ �õ��� ��������...���� �Ұ�.
--   �� ����: ���� -�׽�Ʈ ����: ORA-01045: user SDJ lacks CREATE SESSION privilege; logon denied
--> create session ������ ���� ������...

--�� ������ ����Ŭ ����� ����(sdj)�� 
--   ���� ������ ������ �� �ֵ��� create session ���� �ο� ��

GRANT CREATE SESSION TO sdj;
--==>> Grant��(��) �����߽��ϴ�.

--�� ������ ����Ŭ ����� ����(sdj)�� ���� ����Ŭ ���� ����~!!!!!!!
--   ������, ���̺� ���� �Ұ�(�� ���� �����)

--�� ������ ����Ŭ ����� ����(sdj)��
--   �ý��� ���� ���� ��ȸ
SELECT *
FROM DBA_SYS_PRIVS;
/*
          :
     SDJ	CREATE SESSION	NO
          :
*/
-- ������ ����Ŭ ����� ����(sdj)��
-- ���̺� ������ ������ �� �ֵ��� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO sdj;
--==>> Grant��(��) �����߽��ϴ�.


--�� ������ ����Ŭ ����� ����(sdj)��
--   ���̺� �����̽�(TBS_EDUA)���� ����� �� �ִ� ����(�Ҵ緮)
--   �� ũ�⸦ ���������� ����.

ALTER USER sdj
QUOTA UNLIMITED ON TBS_EDUA;    --�Ҵ�U 2�ް� �ϰ������ �𸮹�Ƽ�� �ڸ��� 2M �ϸ��
--==> User SDJ��(��) ����Ǿ����ϴ�.

