SELECT USER
FROM DUAL;
--==>> SCOTT

--���� UNION / UNION ALL ����--

--�� �ǽ� ���̺� ���� (TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- �ֹ� ���̺� ����
( JUNO      NUMBER                  -- �ֹ� ��ȣ
, JECODE    VARCHAR2(30)            -- �ֹ��� ��ǰ �ڵ�
, JUSU      NUMBER                  -- �ֹ� ����
, JUDAY     DATE DEFAULT SYSDATE    -- �ֹ�����
);
--==>> Table TBL_JUMUN��(��) �����Ǿ����ϴ�.
--> ���� �ֹ��� �߻����� ��� �ֹ� ���뿡 ���� �����Ͱ�
--  �Էµ� �� �ִ� ���̺�

SELECT *
FROM TBL_JUMUN;

INSERT INTO TBL_JUMUN VALUES
(1, 'Ȩ����', 20, TO_DATE('2001-11-01 09:00:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(2, '������', 10, TO_DATE('2001-11-01 09:23:15', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(3, '������', 30, TO_DATE('2001-11-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(4, '��Ĩ', 10, TO_DATE('2001-11-02 15:16:17', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(5, '������', 50, TO_DATE('2001-11-03 10:22:33', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(6, 'Ȩ����', 50, TO_DATE('2001-11-04 11:11:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(7, '��Ĩ', 20, TO_DATE('2001-11-02 19:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(8, '��īĨ', 40, TO_DATE('2001-11-13 09:07:09', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(9, 'Ģ��', 30, TO_DATE('2001-11-15 10:23:34', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(10, '�����', 20, TO_DATE('2001-11-16 14:23:34', 'YYYY-MM-DD HH24:MI:SS'));
--==>1 �� ��(��) ���ԵǾ����ϴ�. * 10


--�� ��¥ ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>Session��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>> 
/*
1	Ȩ����	20	2001-11-01 09:00:10
2	������	10	2001-11-01 09:23:15
3	������	30	2001-11-02 12:00:00
4	��Ĩ	10	2001-11-02 15:16:17
5	������	50	2001-11-03 10:22:33
6	Ȩ����	50	2001-11-04 11:11:11
7	��Ĩ	20	2001-11-02 19:10:10
8	��īĨ	40	2001-11-13 09:07:09
9	Ģ��	30	2001-11-15 10:23:34
10	�����	20	2001-11-16 14:23:34
*/

COMMIT;
--==>> Ŀ�� �Ϸ�

INSERT INTO TBL_JUMUN VALUES(98785, 'Ȩ����', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98786, '������', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98787, 'Ȩ����', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98788, '�����', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98789, '��Ĩ', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98790, '��Ĩ', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98791, '����Ĩ', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98792, '�Ǻ���', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98793, 'Ȩ����', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98794, 'Ȩ����', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>> 
/*
    1	Ȩ����	20	2001-11-01 09:00:10
    2	������	10	2001-11-01 09:23:15
    3	������	30	2001-11-02 12:00:00
    4	��Ĩ	10	2001-11-02 15:16:17
    5	������	50	2001-11-03 10:22:33
    6	Ȩ����	50	2001-11-04 11:11:11
    7	��Ĩ	20	2001-11-02 19:10:10
    8	��īĨ	40	2001-11-13 09:07:09
    9	Ģ��	30	2001-11-15 10:23:34
   10	�����	20	2001-11-16 14:23:34
98785	Ȩ����	10	2021-09-07 14:26:03
98786	������	20	2021-09-07 14:26:05
98787	Ȩ����	20	2021-09-07 14:26:08
98788	�����	20	2021-09-07 14:26:09
98789	��Ĩ	10	2021-09-07 14:26:10
98790	��Ĩ	20	2021-09-07 14:26:39
98791	����Ĩ	20	2021-09-07 14:27:33
98792	�Ǻ���	20	2021-09-07 14:27:46
98793	Ȩ����	30	2021-09-07 14:28:28
98794	Ȩ����	10	2021-09-07 14:28:44
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���ϰ� ���� ���θ� ���...
--   TBL_JUMUN ���̺��� �ʹ� ���ſ��� ��Ȳ
--   ���ʸ����̼ǰ��� �������� ���� �ֹ� ������ �ٸ� ���̺�
--   ����� �� �ֵ��� ����� ���� �Ұ����� ��Ȳ
--   ������ ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ
--   �� ���������... ������� ������ �ֹ� ������ ��
--      ���� �߻��� �ֹ� ������ �����ϰ� �������� �ٸ� ���̺�(TBL_JUMUNBACKUP)��
--      ������ �̰��� ������ ��ȹ


SELECT *
FROM TBL_JUMUN
WHERE ���� �ֹ��� �ƴ� ��;

--  ��

SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');  -- !=, ^=, <> (�� NOT)

--�� ���� ��ȸ ����� TBL_JUMUNBACKUP ���̺� ����
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN 
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') <> TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	Ȩ����	20	2001-11-01 09:00:10
2	������	10	2001-11-01 09:23:15
3	������	30	2001-11-02 12:00:00
4	��Ĩ	10	2001-11-02 15:16:17
5	������	50	2001-11-03 10:22:33
6	Ȩ����	50	2001-11-04 11:11:11
7	��Ĩ	20	2001-11-02 19:10:10
8	��īĨ	40	2001-11-13 09:07:09
9	Ģ��	30	2001-11-15 10:23:34
10	�����	20	2001-11-16 14:23:34
*/

--> TBL_JUMUNBACKUP ���̺��� �����͵� ��
--  ���� �ֹ����� �̿��� �����ʹ� ��� TBL_JUMUNBACKUP ���̺� ����� ��ģ ����.

--�� TBL_JUMUN ���̺��� �����͵� ��
--   ����� ��ģ �����͵� ���� �� ���� �ֹ��� �ƴ� �����͵� ����
--SELECT *  �� �̰� DELETE�� �����ϸ��~~!!
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');  -- !=, ^=, <> (�� NOT)
--==>> 10�� �� ��(��) �����Ǿ����ϴ�. �� 98784 ���� ������ �����Ǿ����� ����...


-- ���� ��ǰ �߼��� �Ϸ���� ���� ���� �ֹ� �����͸� �����ϰ�
-- ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
-- ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>>
/*
98785	Ȩ����	10	2021-09-07 14:26:03
98786	������	20	2021-09-07 14:26:05
98787	Ȩ����	20	2021-09-07 14:26:08
98788	�����	20	2021-09-07 14:26:09
98789	��Ĩ	10	2021-09-07 14:26:10
98790	��Ĩ	20	2021-09-07 14:26:39
98791	����Ĩ	20	2021-09-07 14:27:33
98792	�Ǻ���	20	2021-09-07 14:27:46
98793	Ȩ����	30	2021-09-07 14:28:28
98794	Ȩ����	10	2021-09-07 14:28:44
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �׷��� ���ݱ��� �ֹ����� ������ ���� ������
-- ��ǰ�� �� �ֹ������� ��Ÿ���� �� ��Ȳ�� �߻��ϰ� �Ǿ���.
-- �׷��ٸ�... TBL_JUMUNBACKUP ���̺��� ���ڵ�(��)��
-- TBL_JUMUN ���̺��� ���ڵ�(��)�� ���ļ� �ϳ��� ���̺�����
-- ��ȸ�ϴ� �Ͱ� ���� ����� Ȯ���� �� �ֵ��� ��ȸ�ؾ� �Ѵ�.

-- �÷��� �÷��� ���踦 ����Ͽ� ���̺��� �����ϰ��� �ϴ� ��� JOIN �� ���������
-- ���ڵ�(��)�� ���ڵ�(��)�� �����ϰ��� �ϴ� ��� 
-- UNION / UNION ALL �� ����� �� �ִ�.
-- cf.  UNION(���Ʒ��� �̾����) / JOIN(�翷���� ���ؼ� �̾����)


SELECT *
FROM TBL_JUMUNBACKUP;

SELECT *
FROM TBL_JUMUN;

---------------------------------------------------------
-- UNION �ϰ� �;�!!!!!! ��
SELECT *
FROM TBL_JUMUNBACKUP
UNION               -- ���⿡ UNION �� ���̸� ��!!!!
SELECT *
FROM TBL_JUMUN;

-- UNION ALL�ϰ� �;�!!!!!! ��
SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL               -- ���⿡ UNION �� ���̸� ��!!!!
SELECT *
FROM TBL_JUMUN;

--> ��� �� �Ѵ� �Ȱ���
-------------------------------------------------------------
--  TBL_JUMUNBACKUP �� TBL_JUMUN �ڸ� �ٲ㼭 ������ ����
--UNION �ϰ� �;�!!!!!! ��
SELECT *
FROM TBL_JUMUN
UNION               -- ���⿡ UNION �� ���̸� ��!!!!
SELECT *
FROM TBL_JUMUNBACKUP;

-- UNION ALL�ϰ� �;�!!!!!! ��
SELECT *
FROM TBL_JUMUN
UNION ALL               -- ���⿡ UNION ALL �� ���̸� ��!!!!
SELECT *
FROM TBL_JUMUNBACKUP;
-->> UNION ALL�� ���ı�� �Ӹ� �ƴ϶� �ߺ���ɵ� �ڵ����� ������ �ش�.
------------------------------------------------------------

--�� UNION �� �׻� ������� ù ��° �÷��� �������� 
--   �������� ������ �����Ѵ�.(�� �ý����� ���ϰ� ���� �߻���)
--   UNION ALL(��) �� ���յ� ������� ��ȸ�� ����� ��ȯ�Ѵ�. (������ ����, �� ���� �����)
--   �̷� ���� UNION �� ���ϰ� �� ũ��.
--   ����, UNION �� ��������� �ߺ��� ���� ������ ���
--   �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�Ѵ�.

--��� �� �Ʒ�����,, �Ʒ������� �ߺ����̶�� �������� UNION ALL�� �����ϰ� UNION �� ���������ʴµ� ���� �ٸ���?
-- ANSWER) ������ �ð����� �� ������ ��ü ��� ���̿��� 
--         �Ʒ��� ��ǰ�ڵ�, �ֹ����������� ���̿��⶧����,,
--         ������ �ð����� �´°� ��� �ߺ����� ���� ��!

--�� ���ݱ��� �ֹ����� ��� �����͸� ���� 
--   ��ǰ�� �� �ֹ����� ��ȸ�ϴ� �������� �����Ѵ� (~ 15:41)
/*
-----------------------------------------
    ��ǰ�ڵ�            �� �ֹ���
-----------------------------------------
      ...                   X
      ...                  XXX
      
-----------------------------------------
*/


SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP;
--  � �÷��� �ΰ� ���̿� ���������� �ְ� ����Ǿ��ִ��� Ȯ��!
--> JECODE �� ���� �Ǿ� �ִ�

--> BACKUP(�����ִ���ǰ)�� JUMUN(���� �ֹ��� ��)

--�� Ǯ��
SELECT T.JECODE "��ǰ�ڵ�", SUM(T.JUSU) "�� �ֹ���"
FROM 
(
SELECT * 
FROM TBL_JUMUN 
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP
) T
GROUP BY T.JECODE; --> ��ǰ �ڵ庰�� ���ڴٶ�� ��..!

--�� ���� Ǯ��

SELECT JECODE "��ǰ�ڵ�", SUM(JUSU) "�� �ֹ���"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
GROUP BY JECODE;


--�� UNION�� ����ϸ�ȵ�! WHY? -> �ߺ� ����� �����ع����⶧���� !
SELECT JECODE "��ǰ�ڵ�", SUM(JUSU) "�� �ֹ���"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
GROUP BY JECODE;
--> �� ������ �ذ��ϴ� ���������� UNION �� ����ؼ��� �� �ȴ�.
--  �� JECODE �� JUSU �� ��ȸ�ϴ� �������� �ߺ��� ���� �����ϴ� ��Ȳ �߻�~!!!
--     (Ȩ���� 30�� �ֹ��� �ߺ��Ǿ� ���ŵ�)


--�� INTERSECT(������) / MINUS

-- TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
-- ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� �ุ �����ϰ��� �Ѵ�.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP;
SELECT JECODE, JUSU
FROM TBL_JUMUN;


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT     ------------------------->INTERSECT �����ϸ� ��
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> 
/*
�����	20
��Ĩ	10
��Ĩ	20
Ȩ����	20
*/


--�� TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺��� 
--   ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ�Ѵ�.
--      JUNO,   JECODE  , JUSU      , JUDAY


--�� �Բ� Ǯ���� ����

-- ���1.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT 
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> ������ ��� ��ȸ��

SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT 
SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUN;
--==>> �ƹ��͵� ��ȸ���� ����(JUSU �� JUSDAY ���� �������� �����ʹ� ����)

--�� JOIN �Ⱦ��� ��� (, ���)
SELECT JUNO "�ֹ���ȣ", JECODE "��ǰ�ڵ�", JUSU "�ֹ�����", JUDAY "�ֹ�����" 
FROM 
(       --> ������ �ٸ� ���̺��ο��⼭ �ֹ���ȣ~�ֹ����� ��´�
    SELECT *
    FROM TBL_JUMUNBACKUP 
    UNION ALL   -->> �ߺ��� ���Ű� �ȵǾ�ߵǱ⶧���� UNION�� �ȵǰ� UNION ALL�� ��ߴ�
    SELECT *
    FROM TBL_JUMUN 
)T1,--> ���⼭�� , ������ JOIN �̶� ����~! JOIN �ᵵ ��~!
(       -->��ġ�� �ڵ� ã�°�
    SELECT JECODE "��ǰ�ڵ�", JUSU "�ֹ�����"
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE "��ǰ�ڵ�", JUSU "�ֹ�����"
    FROM TBL_JUMUN 
)T2
WHERE T1.JECODE = T2.��ǰ�ڵ� AND T1.JUSU = T2.�ֹ�����
ORDER BY JUNO;


--�� JOIN ���� ���
SELECT T2.JUNO "�ֹ���ȣ", T1.JECODE "��ǰ�ڵ�", T1.JUSU "�ֹ�����", T2.JUDAY "�ֹ�����"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT 
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE 
AND T1.JUSU = T2.JUSU;
--==>>
/*
    1	Ȩ����	20	2001-11-01 09:00:10
    4	��Ĩ	10	2001-11-02 15:16:17
    7	��Ĩ	20	2001-11-02 19:10:10
   10	�����	20	2001-11-16 14:23:34
98787	Ȩ����	20	2021-09-07 14:26:08
98788	�����	20	2021-09-07 14:26:09
98789	��Ĩ	10	2021-09-07 14:26:10
98790	��Ĩ	20	2021-09-07 14:26:39
*/



-- ���2.

-- Ʋ������
SELECT T.* 
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE JECODE = 'Ȩ����' OR JECODE = '��Ĩ' OR JECODE = '�����'
  AND JUSU = 20 OR JUSU = 10; --> ������ WHERE ���� ���� �����ϴ� ������ ��� ����

-- �� XXXXXXX Ʋ�� ����
--    �ؿ� �� �� ���� ������ �� ������ Ʋ��   WHERE JECODE IN('Ȩ����','��Ĩ','�����')
--    AND JUSU IN(20, 30) --> Ȩ����, ��Ĩ, ������� 10, 20�� �ٳ��ͼ� Ʋ�� �̷��� ������


-- Ǯ��~!!!!!

SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL --> ���� �� ���ִ� UNION
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
--WHERE JECODE IN ('Ȩ����', '��Ĩ', '�����') --@ 10�� Ȩ������ ���͹���..
--  AND JUSU IN (10, 20);
--WHERE JECODE || JUSU IN ('Ȩ����20', '��Ĩ10', '��Ĩ20', '�����20');
--WHERE CONCAT(JECODE, JUSU) IN ('Ȩ����20', '��Ĩ10', '��Ĩ20', '�����20');
WHERE CONCAT(JECODE, JUSU) =ANY ('Ȩ����20', '��Ĩ10', '��Ĩ20', '�����20');

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
�����   20
��Ĩ   10
��Ĩ   20
Ȩ����   20
*/

SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;
--==>>
/*
�����20
��Ĩ10
��Ĩ20
Ȩ����20
*/


SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL --@ ���� �� ���ִ� UNION
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T

WHERE CONCAT(JECODE, JUSU) =ANY (SELECT CONCAT(JECODE, JUSU)
                                 FROM TBL_JUMUNBACKUP
                                 INTERSECT
                                 SELECT CONCAT(JECODE, JUSU)
                                 FROM TBL_JUMUN);
--==>>
/*
     1   Ȩ����   20   2001-11-01 09:00:10
     4   ��Ĩ   10   2001-11-02 15:16:17
     7   ��Ĩ   20   2001-11-06 19:10:10
    10   �����   20   2001-11-16 14:20:00
98787   Ȩ����   20   2021-09-07 14:17:11
98788   �����   20   2021-09-07 14:17:56
98789   ��Ĩ   10   2021-09-07 14:18:53
98790   ��Ĩ   20   2021-09-07 14:20:00
*/
-------------------------



-- MINUS : ������ (�������� ���� ��)
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
�����	20
��Ĩ	10
��Ĩ	20
Ȩ����	20
*/


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> 
/*
������	10
������	50
������	30
Ģ��	30
��īĨ	40
Ȩ����	50
*/

------------------------------------------------------
/*
--�� ������
    A = {10, 20, 30, 40, 50}
    B = {10, 20, 30}
    
    A - B = {40, 50}
*/


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = E.DEPTNO;
--> ���� �����ս��� ������

-- CHECK~!!
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT; 
--> NATURAL JOIN : ���� ����� �־�������, ������ ������ �� �� �� ����


SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN  DEPT
USING(DEPTNO);
--> USING() : DEPTNO �� ������� ã�ƴ޶�.






