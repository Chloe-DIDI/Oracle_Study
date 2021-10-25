SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ����  ( ���� ����! 1000~2000��, 2000�� �̻� �� 4000~8000��, 8000�� �̻�) 
-- TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�Ѵ�.

-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

-- ��, ���糪�̴� �ѱ����� ������ ���� ������ �����Ѵ�.
-- ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��(����)��
-- �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
-- �׸���, ���ʽ��� 4000�� �̻� 8000�� �̸� �ٹ��� ����� 
-- �� ����� ���� �޿� ���� 30% ����,
-- 8000�� �̻� �ٹ��� �����
-- �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.


ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

-- TBL_SAWON ���̺� �����ϴ� �������
-- �Ի���(HIREDATE) �÷����� ��, �ϸ� ��ȸ�ϱ�
SELECT SANAME,HIREDATE,TO_CHAR(HIREDATE, 'MM')"��" ,TO_CHAR(HIREDATE, 'DD')"��"
FROM TBL_SAWON;

SELECT SANAME,HIREDATE,TO_CHAR(HIREDATE, 'MM')||'-'||TO_CHAR(HIREDATE, 'DD')"����"
FROM TBL_SAWON;
--==>>
/*
��ҿ�	    2001-01-03	01-03
�̴ٿ�	    2010-11-05	11-05
������ 	    2012-08-16	08-16
�մ���	    1999-02-02	02-02
������	    2013-07-15	07-15
���̰�	    2011-08-17	08-17
���̳�	    1999-11-11	11-11
������	    1999-11-11	11-11
������	    1995-11-11	11-11
����˳�	1995-10-10	10-10
���켱	    2001-10-10	10-10
����	    1998-02-13	02-13
������	    2002-02-13	02-13
������	    2002-02-13	02-13
�賲��	    2015-01-10	01-10
*/

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN �ֹι�ȣ 7��° �ڸ� 1���� 1 �Ǵ� 3 THEN '����'
            WHEN �ֹι�ȣ 7��° �ڸ� 1���� 2 �Ǵ� 4 THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	����
1002	�̴ٿ�	    9510272234567	����
1003	������	    0909014234567	����
1004	�մ���	    9406032234567	����
1005	������	    0406034234567	����
1006	���̰� 	    0202023234567	����
1007	���̳�	    8012122234567	����
1008	������	    8105042234567	����
1009	������	    7209301234567	����
1010	����˳�	7001022234567	����
1011	���켱	    9001022234567	����
1012	����	    8009011234567	����
1013	������	    8203051234567	����
1014	������	    9208091234567	����
*/

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
       ,CASE WHEN 1900��� ���̶��...
             THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899)
                            -----------------------------�¾ �⵵
             WHEN 2000��� ���̶��...
             THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
             ELSE -1
        END "���糪��"
FROM TBL_SAWON;

--////////////////////////


SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
       ,CASE WHEN �ֹι�ȣ 7��° �ڸ� 1���� 1 �Ǵ� 2 
             THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899)
                            -----------------------------�¾ �⵵
             WHEN �ֹι�ȣ 7��° �ڸ� 1���� 3 �Ǵ� 4 
             THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
             ELSE -1
        END "���糪��"
FROM TBL_SAWON;

--///////////////////////////////////

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
       ,CASE WHEN SUBSTR(JUBUN, 7, 1) IN('1','2')
             THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899)
                            -----------------------------�¾ �⵵
             WHEN SUBSTR(JUBUN, 7, 1) IN('3','4') 
             THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
             ELSE -1
        END "���糪��"
FROM TBL_SAWON;

--///////////////////////////////////

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
       ,CASE WHEN SUBSTR(JUBUN, 7, 1) IN('1','2')
             THEN EXTRACT(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUNSTR(JUBUN,1,2))+1899)
--   SYSDATE����⵵���� YYYY �⵵�� �̾ƿ���----�ֹι�ȣ �յ��ڸ��� �̾Ƽ� ��������
             WHEN SUBSTR(JUBUN, 7, 1) IN('3','4') 
             THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
             ELSE -1
        END "���糪��"
FROM TBL_SAWON;



--///////////////////////////////////

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
       ,CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','2')
             THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)   --   SYSDATE����⵵���� YYYY �⵵�� �̾ƿ���----�ֹι�ȣ �յ��ڸ��� �̾Ƽ� ��������
             WHEN SUBSTR(JUBUN, 7, 1) IN ('3','4') 
             THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
             ELSE -1
        END "���糪��"
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	����	29
1002	�̴ٿ�	    9510272234567	����	27
1003	������	    0909014234567	����	13
1004	�մ���	    9406032234567	����	28
1005	������	    0406034234567	����	18
1006	���̰�	    0202023234567	����	20
1007	���̳�	    8012122234567	����	42
1008	������ 	    8105042234567	����	41
1009	������	    7209301234567	����	50
1010	����˳�	7001022234567	����	52
*/

SELECT T.�����ȣ, T.����
FROM
(   
    SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�", SAL*12 "����"
    FROM TBL_SAWON
)T;

SELECT T.SANO
FROM TBL_SAWON T;

SELECT SCOTT.TBL_SAWON.SANO
FROM SCOTT.TBL_SAWON;

SELECT TBL_SAWON.SANO, TBL_SAWON.SANAME, TBL_SAWON.SAL
FROM TBL_SAWON;

SELECT S.SANO, S.SANAME, S.SAL
FROM TBL_SAWON S;

SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON;
--/////////////// �����ȿ� ������ ���ִ°� -> �������� -> �ؿ��������� �ζ��κ�
SELECT A.�����ȣ, A.�����, A.�޿�, A.����, A.����*2 "�ι迬��"
FROM                                        --------------------- �̰ǵȴ� ������ �ǰ� �� �̹Ƿ�
(
    SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�", SAL*12 "����"-- ����*2 "�ι迬��" ���⼱�ȵ�
    FROM TBL_SAWON                                                    --WHY? ���� �ٿ������ϱ� ������ ����������°��ƴ϶� ����*2�� �ɼ�����
) A;
-------------------------------------------------------------------------------�ּ��ִ� ����
-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿�
--, ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

-- ��ü ��ȸ SELECT T.* 
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
        -- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿�
        -- ����������
        -- ���������⵵ �� �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��
        -- ���� ���̰�... 58��... 2�� ��        2021 �� 2023
        -- ���� ���̰�... 35��... 2�� ��        2021 �� 2046
        -- ADD_MONTHS(SYSDATE, �������*12)
        --                     ---------
        --                     (60 - ���糪��)
        --                     (60 - ���糪��)*12) 
        -- ADD_MONTHS(SYSDATE, (60 - ���糪��)*12) �� �� ������� �������� �⵵�� �ʿ�
        -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��)*12), 'YYYY') �� �������� �⵵�� ����
        -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��)*12), 'YYYY'||'-'||TO_CHAR(HIREDATE, 'MM-DD')
         , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12), 'YYYY') || '-' || TO_CHAR(T.�Ի���, 'MM-DD')"����������"
        
        --�ٹ��ϼ� = ������ - �Ի���
        , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
        
        -- �����ϼ� �� ���������� - ������
        , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12), 'YYYY') 
          || '-' || TO_CHAR(T.�Ի���, 'MM-DD')) - SYSDATE) "�����ϼ�"
        
        ,T.�޿�
        
        -- ���ʽ�
        -- �ٹ��ϼ��� 4000�� �̻� 8000�� �̸� �� ���� �޿��� 30%
        -- �ٹ��ϼ��� 8000�� �̻�             �� ���� �޿��� 50%
        -- ������ 0
        , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >=8000 THEN T.�޿� * 0.5 
               WHEN TRUNC(SYSDATE - T.�Ի���) >=4000 THEN T.�޿� * 0.3
               ELSE 0
          END "���ʽ�"


FROM 
(   
  
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
               ELSE '����Ȯ�κҰ�'
          END "����"
         ,CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)   --   SYSDATE����⵵���� YYYY �⵵�� �̾ƿ���----�ֹι�ȣ �յ��ڸ��� �̾Ƽ� ��������
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3','4') 
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
               ELSE -1
          END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
    FROM TBL_SAWON
) T;

--/////////////////////////////////���� ����


SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
         , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12), 'YYYY') || '-' || TO_CHAR(T.�Ի���, 'MM-DD')"����������"
         , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
         , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12), 'YYYY') 
          || '-' || TO_CHAR(T.�Ի���, 'MM-DD')) - SYSDATE) "�����ϼ�"
         ,T.�޿�      
         , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >=8000 THEN T.�޿� * 0.5 
               WHEN TRUNC(SYSDATE - T.�Ի���) >=4000 THEN T.�޿� * 0.3
               ELSE 0
           END "���ʽ�"

FROM 
(   
  
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
               ELSE '����Ȯ�κҰ�'
          END "����"
         ,CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899) 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3','4') 
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
               ELSE -1
          END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
    FROM TBL_SAWON
) T;

--�� ��� ���뿡��... Ư�� �ٹ��ϼ��� ����� Ȯ���ؾ� �Ѵٰų�...
--   Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 ���� �� �ִ�.
--   �̿� ���� ���... �ش� �������� �ٽ� �����ϴ� ���ŷο��� ���� �� �ֵ���
--   ��(VIEW)�� ����� ������ �� �� �ִ�.

CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
         , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12), 'YYYY') || '-' || TO_CHAR(T.�Ի���, 'MM-DD')"����������"
         , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
         , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12), 'YYYY') 
          || '-' || TO_CHAR(T.�Ի���, 'MM-DD')) - SYSDATE) "�����ϼ�"
         ,T.�޿�      
         , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >=8000 THEN T.�޿� * 0.5 
               WHEN TRUNC(SYSDATE - T.�Ի���) >=4000 THEN T.�޿� * 0.3
               ELSE 0
           END "���ʽ�"

FROM 
(   
  
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
               ELSE '����Ȯ�κҰ�'
          END "����"
         ,CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899) 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3','4') 
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
               ELSE -1
          END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>> �����߻�
/* --> ���Ѿ����̶� ����!!!!!!!!!!!!!!!!!!!
ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/
-->>>>>>>>>>>>>>>>>>>>>>>> SYS���� SCOTT���� VIEW ���� ������ �ο��ؾߴ� SYS�� ����!
-- SYS ���� VIEW �������� �ְ� �ٽ� ���ƿ�
-->> �ٽ� ���� �ϸ�
--==>> View VIEW_SAWON��(��) �����Ǿ����ϴ�.

-- VIEW ���� �� �ѹ��� �����ϰ� ������ �� �ִ�.
SELECT *
FROM VIEW_SAWON;

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--==>>
/*
1001	��ҿ�	    9307302234567	����	29	2001-01-03	2052-01-03	7548	11078	3000	900
1002	�̴ٿ�	    9510272234567	����	27	2010-11-05	2054-11-05	3955	12115	2000	0
1003	������	    0909014234567	����	13	2012-08-16	2068-08-16	3305	17148	1000	0
1004	�մ���	    9406032234567	����	28	1999-02-02	2053-02-02	8249	11474	4000	2000
1005	������	    0406034234567	����	18	2013-07-15	2063-07-15	2972	15289	1000	0
1006	���̰�	    0202023234567	����	20	2011-08-17	2061-08-17	3670	14592	2000	0
1007	���̳�	    8012122234567	����	42	1999-11-11	2039-11-11	7967	6642	3000	900
1008	������	    8105042234567	����	41	1999-11-11	2040-11-11	7967	7008	3000	900
1009	������	    7209301234567	����	50	1995-11-11	2031-11-11	9428	3720	3000	1500
1010	����˳�	7001022234567	����	52	1995-10-10	2029-10-10	9460	2958	3000	1500
1011	���켱	    9001022234567	����	32	2001-10-10	2049-10-10	7268	10263	2000	600
1012	����	    8009011234567	����	42	1998-02-13	2039-02-13	8603	6371	4000	2000
1013	������	    8203051234567	����	40	2002-02-13	2041-02-13	7142	7102	3000	900
1014	������	    9208091234567	����	30	2002-02-13	2051-02-13	7142	10754	3000	900
1015	�賲��	    0202023234567	����	20	2015-01-10	2061-01-10	2428	14373	2000	0
*/

--�� TBL_SAWON ��Ƽ���� ��ҿ� ����� �Ի��� �� �޿� ������ ����
--�� ���� TABLE ����  : 1001	��ҿ�	9307302234567	            2001-01-03	3000
--�� ���� �� ����     : 1001	��ҿ�	9307302234567	            2021-09-03	5000
--�� ���� VIEW ����   : 1001	��ҿ�	9307302234567	����	29	2001-01-03	2052-01-03	7548	11078	3000	900
--�� ���� �� ����     : 1001	��ҿ�	9307302234567	����	29	2021-09-03	2052-09-03	0	11322	5000	0

--�� 
SELECT * 
FROM TBL_SAWON;

--��
SELECT * 
FROM VIEW_SAWON;

--��
UPDATE TBL_SAWON
SET HIREDATE=SYSDATE, SAL=5000
WHERE SANO=1001;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� ��
SELECT *
FROM TBL_SAWON
WHERE SANO=1001;
--==>> 1001	��ҿ�	9307302234567	2021-09-03	5000


COMMIT;
--==>> Ŀ�� �Ϸ�.

-- ���� Ȯ��
SELECT *
FROM VIEW_SAWON;


--�� ���� 
-- ���������� Ȱ���Ͽ� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
-------------------------------------------------
  �����   ����    ���糪��   �޿�   ���̺��ʽ�
-------------------------------------------------

��, ���̺��ʽ��� ���� ���̰� 40�� �̻��̸� �޿��� 70%
    30�� �̻� 40�� �̸��̸� �޿��� 50%
    20�� �̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�.
    
����, �ϼ��� ��ȸ ������ �������
VIEW_SAWON2 ��� �̸��� ��(VIEW)�� �����Ѵ�.
*/

-- ���̺��ʽ� �� ���糪�̶� �޿�
-- �����, ����, ���糪��, �޿�
SELECT T.*
      --�� 
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
            ELSE 0
        END "���̺��ʽ�"
FROM
(
    -- �� ������� �ۼ� ����
    SELECT SANAME "�����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'--// ���� ����
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'--//���� ����
                ELSE 'Ȯ�κҰ�'--// ����, ���� �����̰� Ȯ�κҰ��� ���ڶ� ����
           END "����"
    -- �� 
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE 0  --// ����� ���� ó�� 'Ȯ�κҰ�' �ȵȴ�. ���� �ڷ����� �ƴϸ� ����!

           END "���糪��"
         , SAL "�޿�"
    FROM TBL_SAWON
) T;
--FROM (   ) �ζ��κ� �ȿ� �մ� �̳�������� ������--> ���⼭ �����Ƽ� ����������� ����ǿ���
--                                                     �ȵǸ� ��ü �� ������

/*  //��� ���//
CREATE USER MIHWA
CREATE TABLE ���̺��
CREATE INDEX �ε�����
CREATE VIEW ���     ->  �ȴ��Ӥ���
*/

CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.*
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
            ELSE 0
        END "���̺��ʽ�"
FROM
( 
       SELECT SANAME "�����"
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
                ELSE 'Ȯ�κҰ�'
            END "����"
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE 0
           END "���糪��"
         , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON2��(��) �����Ǿ����ϴ�.

--�� ������ �� ��ȸ(Ȯ��)
SELECT *
FROM VIEW_SAWON2;
--==>>
/*
��ҿ�	    ����	29	5000	1500
�̴ٿ� 	    ����	27	2000	600
������ 	    ����	13	1000	0
�մ���	    ����	28	4000	1200
������	    ����	18	1000	0
���̰�	    ����	20	2000	600
���̳�	    ����	42	3000	2100
������	    ����	41	3000	2100
������	    ����	50	3000	2100
����˳�	����	52	3000	2100
���켱	    ����	32	2000	1000
����	    ����	42	4000	2800
������	    ����	40	3000	2100
������	    ����	30	3000	1500
�賲��	    ����	20	2000	600
*/

--------------------------------------------------------------------------------

--�� RANK()  ���(����)�� ��ȯ �ϴ� �Լ�
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
7934	MILLER	10	1300	9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	950	    13
7369	SMITH	20	800	    14
*/


SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1	1
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7698	BLAKE	30	2850	1	5
7782	CLARK	10	2450	2	6
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7934	MILLER	10	1300	3	9
7521	WARD	30	1250	4	10
7654	MARTIN	30	1250	4	10
*/

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP
ORDER BY 3, 4 DESC;   -- 3.�μ���ȣ�� �������� / 4.��ü �޿������� ��������
--==>>
/*
7839	KING	10	5000	 1	 1
7782	CLARK	10	2450	 2	 6
7934	MILLER	10	1300	 3	 9
7902	FORD	20	3000	 1	 2
7788	SCOTT	20	3000	 1	 2
7566	JONES	20	2975	 3	 4
7876	ADAMS	20	1100	 4	12
7369	SMITH	20	800	     5	14
7698	BLAKE	30	2850	 1	 5
7499	ALLEN	30	1600	 2	 7
7844	TURNER	30	1500	 3	 8
7654	MARTIN	30	1250	 4	10
7521	WARD	30	1250	 4	10
7900	JAMES	30	950	     6  13
*/

--�� DENSE_RANK() �� ������ ��ȯ�ϴ� �Լ� (����� ������ �־ ���� ������ �ǳʶپ����� �ʰ� �̾��� EX. 2�� 3��, 3�� 2��..)
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP
ORDER BY 3, 4 DESC;
--==>>
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	5
7934	MILLER	10	1300	3	8
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	2	3
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800	    4	12
7698	BLAKE	30	2850	1	4
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7654	MARTIN	30	1250	4	9
7521	WARD	30	1250	4	9
7900	JAMES	30	950	    5	11
*/

--�� EMP ���̺��� ��� ������
--   �����, �μ���ȣ, ����, �μ��� ��������, ��ü �������� �׸����� ��ȸ�Ѵ�.


SELECT T.*
     , RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC) "�μ��� ��������"
     , RANK() OVER(ORDER BY T.���� DESC) "��ü ��������"
FROM    -- ()�ȿ� SELECT ~"����"���� �ϳ��� ���̺�
(
        SELECT ENAME "�����", DEPTNO "�μ���ȣ"
             , SAL*12+NVL(COMM,0) "����"
FROM EMP
) T
ORDER BY 2, 3 DESC;
--==>>
/*
KING	10	60000	1	 1
CLARK	10	29400	2	 6
MILLER	10	15600	3	10
FORD	20	36000	1	 2
SCOTT	20	36000	1	 2
JONES	20	35700	3	 4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	 5
ALLEN	30	19500	2	 7
TURNER	30	18000	3	 8
MARTIN	30	16400	4	 9
WARD	30	15500	5	11
JAMES	30	11400	6	13
*/

--�� EMP ���̺��� ��ü ���� ������ 1����� 5�� ������...
--   �����, �μ���ȣ, ����, ��ü�������� �׸����� ��ȸ�Ѵ�.

-- ���� Ǭ ��
SELECT T.*
FROM
(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ"
         , SAL*12+NVL(COMM,0) "����"
         , DENSE_RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
    FROM EMP
) T
WHERE T.��ü�������� <=5 ;

-- �Բ� Ǯ���� ����~!!!!!
SELECT �����, �μ���ȣ, ����, ��ü��������
FROM EMP
WHERE ��ü ���� ������ 1����� 5��;

SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
FROM EMP
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)  <= 5;
--==>> �����߻�
/*
ORA-30483: window  functions are not allowed here
30483. 00000 -  "window  functions are not allowed here"
*Cause:    Window functions are allowed only in the SELECT list of a query.
           And, window function cannot be an argument to another window or group
           function.
*/

--�� ���� ������ RANK() OVER() �Լ��� WHERE ���������� ����� ����̸�
--   �� �Լ��� WHERE ���������� ����� �� ���� ������ �߻��ϴ� �����̴�.
--   �� ���, �츮�� INLINE VIEW(���� ����) �� Ȱ���Ͽ� Ǯ���ؾ� �Ѵ�.
--   RANK() OVER() : �����Լ�, �м��Լ�, ������ �Լ� �� WHERE������ �� �� ����. �� �������� ����ؼ� �����ذ� �ؾ���

-------�� ���� Ǯ��
SELECT T.*
FROM
(
SELECT ENAME "�����", DEPTNO "�����ȣ", SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "��ü ��������"  
FROM EMP
) T 
WHERE T."��ü ��������" <=5;



-- ���������� 2�� �ᵵ�ǳ���? ����~!!!!! �ѹ� �Ẹ��~!
SELECT T2.*
FROM
( 
    SELECT T1.*
        ,RANK() OVER(ORDER BY T1.���� DESC) "��ü ��������"  
    FROM
    (
        SELECT ENAME "�����", DEPTNO "�����ȣ", SAL*12+NVL(COMM,0) "����"
        FROM EMP
    ) T1
)T2
WHERE T2."��ü ��������" <=5;
--==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/


--�� EMP ���̺��� �� �μ����� ���� ����� 1�� ���� 2�� ������ ��ȸ.
--   �����, �μ���ȣ, ����, �μ����������, ��ü������� �׸��� ��ȸ�� �� �ֵ��� �Ѵ�.

SELECT T.*
FROM
(
SELECT ENAME "�����", DEPTNO "�μ���ȣ", (SAL*12+NVL(COMM,0)) "����"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM,0)) DESC)"�μ����������"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"��ü�������"
FROM EMP
) T
WHERE T.�μ���������� < 3 ;


-- ���������� 2�� �ᵵ�ǳ���? ����~!!!!! �ѹ� �Ẹ��~!
SELECT T2.*
FROM
( 
    SELECT T1.*
        , RANK() OVER(PARTITION BY T1.�μ���ȣ ORDER BY T1.���� DESC)"�μ����������"
        , RANK() OVER(ORDER BY T1.���� DESC)"��ü�������" 
    FROM
    (
        SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
        FROM EMP
    ) T1
)T2
WHERE T2.�μ���������� =1 OR T2.�μ���������� =2
ORDER BY 2 ASC, 4 ASC;


--------------------------------------------------------------------------------

--���� �׷� �Լ� ����--

-- SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�,
-- VARIANCE() �л�, STDDEV() ǥ������

--�� �׷� �Լ��� ���� ū Ư¡��
--   ó���ؾ� �� �����͵� �� NULL �� �����ϸ�
--   �� NULL �� �����ϰ� ������ �����Ѵٴ� ���̴�.

-- SUM()
-- EMP ���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�.
SELECT SUM(SAL)  -- 800+1600+1250+2975+1250+...+1300
FROM EMP;
--==>> 29025

SELECT SUM(COMM)  -- 300+500+1400+0
FROM EMP;
--==>> 2200


-- COUNT()
-- ���� ���� ��ȸ�Ͽ� ����� ��ȯ
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(SAL)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)  -- COMM �÷��� ���� ���� ��ȸ �� NULL �� ����~!!!
FROM EMP;
--==>> 4

SELECT COUNT(*)  -- ��ü �÷��� ���� ���� ��ȸ
FROM EMP;
--==>> 14


-- AVG()
-- ��� ��ȯ
SELECT SUM(SAL) / COUNT(SAL), AVG(SAL)
FROM EMP;
--==>> 
/*
2073.214285714285714285714285714285714286	
2073.214285714285714285714285714285714286
*/

SELECT AVG(COMM)
FROM EMP;
--==>> 550

SELECT SUM(COMM) / 14
FROM EMP;
--==>> 157.142857142857142857142857142857142857

SELECT SUM(COMM) / COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857


SELECT SUM(COMM) / COUNT(COMM), AVG(COMM)
FROM EMP;
--==>> 550	550 (�� �� Ʋ�� ��, ��� ���� �� NULL ���Կ��� ������ �߿�!)


--�� ǥ�������� ������ �л�
--   �л��� �������� ǥ������
SELECT AVG(SAL), VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
1398313.87362637362637362637362637362637	
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL), 2), VARIANCE(SAL) 
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL)
FROM EMP;
--==>> 
/*
1182.503223516271699458653359613061928508	
1182.503223516271699458653359613061928508
*/


-- MAX() / MIN()
-- �ִ밪 / �ּҰ� ��ȯ
SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--==>> 5000	800
--> ����Ŭ�� NULL �� �ִ밪���� ����, MSSQL�� NULL �� �ּҰ����� ����


--�� ����
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> ���� �߻� (14�� ���ڵ�, ���� ���ڵ�)
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
578��, 8������ ���� �߻�
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> ���� ���� ���� �߻�
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
589��, 8������ ���� �߻�
*/


--�� �μ��� �޿��� ��ȸ
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>
/*
10	8750
20	10875
30	9400
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	29025
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

SELECT *
FROM TBL_EMP;

--�� ������ �Է�
INSERT INTO TBL_EMP VALUES
(8001, '������', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--                       ������ ���糯¥�Ի�
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES 
(8002, '������', 'CLERK', 7566, SYSDATE, 1000, 0, NULL);
--                                       �޿� Ŀ�̼� ����(NULL�� �μ� ����)
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;