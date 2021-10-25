--�� ���ӵ� ����� Ȯ��
SELECT USER
FROM DUAL;
--==>> SDJ


--�� ���̺� ����(���̺�� : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO            NUMBER(10)   --(2) 2�ڸ����� ���� ex 99�������� 100�� �Ұ��� Int   
, NAME          VARCHAR2(30)    -- 30���ڱ��� ���� String
);

/*
( �׸�1       
, �׸�2
);
*/
--==>> ���� �߻�
/* ���� ����� ����!!

ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/
-- ���� sdj ������ CREATE SESSION ���Ѹ� ���� ������
-- ���̺��� ������ �� �ִ� ������ ���� ���� ���� �����̴�.
-- �׷��Ƿ� �����ڷκ��� ���̺� ���� ������ �ο��޾ƾ� �Ѵ�.

--��SYS�κ���... CREATE SESSION ������ �ο����� ����
-- ���̺� ����(���̺�� : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO            NUMBER(10)   --(2) 2�ڸ����� ���� ex 99�������� 100�� �Ұ��� Int   
, NAME          VARCHAR2(30)    -- 30���ڱ��� ���� String
);
--==>> ���� �߻� (���ʹ� ���� �ٸ� ����)
/*
���� ���� -
ORA-01950: no privileges on tablespace 'TBS_EDUA'
01950. 00000 -  "no privileges on tablespace '%s'"
*Cause:    User does not have privileges to allocate an extent in the
           specified tablespace.
*Action:   Grant the user the appropriate system privileges or grant the user
           space resource on the tablespace.
*/
--> ���̺� ���� ���ѱ��� �ο����� ��Ȳ������
--  sdj ����� ������ �⺻ ���̺����̽�(DEFAULT TABLESPACE)��
--  ��TBS_EDUA���̸�, �� ������ ���� �Ҵ緮�� �ο����� ���� ����,
--  �׷��Ƿ� �� ���̺����̽��� ����� ������ ���ٴ� �����޼�����
--  ����Ŭ�� ������ְ��ִ� ��Ȳ

--��SYS�κ���... ���̺� �����̽�(TBS_EDUA) ������ �ο����� ����
-- ���̺� ����(���̺�� : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO            NUMBER(10)   --(2) 2�ڸ����� ���� ex 99�������� 100�� �Ұ��� Int   
, NAME          VARCHAR2(30)    -- 30���ڱ��� ���� String
);
--==>> Table TBL_ORAUSERTEST��(��) �����Ǿ����ϴ�.

--�� �ڽſ��� �ο��Ǿ��� �Ҵ緮 ��ȸ
SELECT *
FROM USER_TS_QUOTAS;
--==>> TBS_EDUA	65536	-1	8	-1	NO  -- -1�� �������� ����


--�� ������ ���̺�(TBL_ORAUSERTEST)�� 
--   � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>> TBL_ORAUSERTEST	TBS_EDUA




