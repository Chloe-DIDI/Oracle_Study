SELECT USER
FROM DUAL;
--==>> SCOTT

--�� �ǽ� ���̺� ����(TBL_TEST2) �� �θ� ���̺�
CREATE TABLE TBL_TEST2
( CODE  NUMBER
, NAME VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(TBL_TEST3) �� �ڽ� ���̺�
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.

--�� ������ �Է�
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1, '�����');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2, '��Ź��');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	�����
2	��Ź��
3	������
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �������Է�
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4, 3, 40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(11, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(12, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(13, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(14, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(54, 3, 20);
--==> 1 �� ��(��) ���ԵǾ����ϴ�. * 15

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	20
2	1	20
3	2	30
4	3	40
5	2	20
6	2	20
7	3	20
8	3	20
9	2	20
10	3	20
11	2	20
12	2	20
13	1	20
14	2	20
54	3	20
*/

SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
--==>>
/*
1	1	�����	20
2	1	�����	20
3	2	��Ź��	30
4	3	������	40
5	2	��Ź��	20
6	2	��Ź��	20
7	3	������	20
8	3	������	20
9	2	��Ź��	20
10	3	������	20
11	2	��Ź��	20
12	2	��Ź��	20
13	1	�����	20
14	2	��Ź��	20
54	3	������	20
*/

-- �θ� ���̺�(TBL_TEST2)���� ����� ����
DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> ���� �߻�  --> �θ� ���̺� 1(�����)�� �ֱ� ����,,
/*
ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found
*/

DELETE
FROM TBL_TEST3
WHERE CODE=1;
--==>> 3�� �� ��(��) �����Ǿ����ϴ�.

SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
--==>> 1��(�����) �� ���� �� --> �ڽ� ���̺� �ִ� 1 �� �� ���� ������
/*
3	2	��Ź��	30
4	3	������	40
5	2	��Ź��	20
6	2	��Ź��	20
7	3	������	20
8	3	������	20
9	2	��Ź��	20
10	3	������	20
11	2	��Ź��	20
12	2	��Ź��	20
14	2	��Ź��	20
54	3	������	20
*/
--==>> ����� �����ʹ� �������� ����
COMMIT;
--==>> Ŀ�� �Ϸ�.

DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2;
--==>> 
/*
2	��Ź��
3	������
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--��� �Ȱ��� ���� .. �θ� ���̺� ������ �����ȵǰ� �ڽ� ���̺� ������ ���� �����ؾ��� �θ����̺� ���� ����!
SELECT *
FROM TBL_TEST2
WHERE CODE=2;
--==>> 2	��Ź��

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found

SELECT *
FROM TBL_TEST2
WHERE CODE=3;
--==>> 3	������

DELETE
FROM TBL_TEST2
WHERE CODE=3;
--==>> ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found
        
        
--�� Ʈ���� �ۼ� ���� �ٽ� �׽�Ʈ

DELETE
FROM TBL_TEST2
WHERE CODE=3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
--> �ڽĵ��� ���� ���� �ع��� ��

SELECT *
FROM TBL_TEST2;

SELECT *
FROM TBL_TEST3;

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2;

SELECT *
FROM TBL_TEST3;


-- AFTER ROW TRIGGER

TRUNCATE TABLE TBL_�԰�;
--==>> Table TBL_�԰���(��) �߷Ƚ��ϴ�.

TRUNCATE TABLE TBL_���;
--==>> Table TBL_�����(��) �߷Ƚ��ϴ�.

UPDATE TBL_��ǰ
SET ������ = 0;
--==>> 21�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;

SELECT *
FROM TBL_�԰�;
--==>> ���� TRUNCATE �� �߶�±� ������ �ƹ��͵� ����.
SELECT *
FROM TBL_���;

SELECT *
FROM TBL_��ǰ;

--�� 29����  AFTER ROW TRIGGER~~~~ �� Ȯ�ο�!!
INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(1, 'C001', SYSDATE, 100, 1800);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * 
FROM TBL_�԰�;
--==>> 1	C001	2021-09-23	100	1800

SELECT * 
FROM TBL_��ǰ;
--==>>
/*
            :
S007	Ȩ����	2000	0
C001	����Ĩ	1800	100   ��  100�� �Է��Ѱ� Ȯ�� �� �� �ִ�.
C002	������	2200	0
            :  
*/


--�ݰ��� 

SELECT *
FROM TBL_�԰�;
--==>> 1	C001	2021-09-23	100	1800


INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(2, 'C002', SYSDATE, 50, 2200);

UPDATE TBL_�԰�
SET �԰���� = 30;

DELETE 
FROM TBL_�԰�
WHERE �԰��ȣ = 2;

SELECT *
FROM TBL_�԰�;
--==>>
/*
1	C001	2021-09-23	30	1800
*/
-------------------------------------------------------------------------
INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, �������, ������, ���ܰ�)
VALUES(2, 'C002', SYSDATE, 10, 2200);

SELECT *
FROM TBL_���;
--==>>
/*
2	C002	2021-09-23	10	2200
*/
SELECT *
FROM TBL_��ǰ;
/*
            :
S007	Ȩ����	2000	0
C001	����Ĩ	1800	30
C002	������	2200	-10     ��   ��� 10�����ϱ� -10
C003	���͸�	1400	0
            :
*/

UPDATE TBL_���
SET ������ = 0;
--==>> ��� ���� �ٽ� 0���� ����� ��



----------------------------------------------------------------------------
--���� PACKAGE(��Ű��) �ǽ�~~~~~~~~~~~~~~!! ����--

SELECT INSA_PACK.FN_GENDER('751212-1234567') "RESULT"
FROM DUAL;
--==>> ����

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN)"����Ȯ��"
FROM TBL_INSA;
--==>>
/*
�̴ٿ�	951027-2234567	����
            :
�ڹ���	780710-1985632	����
������	800304-2741258	����
            :
��ž�	810809-2111111	����
*/



CREATE TABLE LOGIN