
�ڡڡڡڨͨΨ� �̰� 20210915_02_scott �� �Դٰ��� �ϸ鼭 Ǫ�� ��!�ڡڡڡ�

SELECT USER
FROM DUAL;
--==>>SCOTT

--���� FUNCTION(�Լ�) ����--

-- 1. �Լ��� �ϳ� �̻��� PL/SQL ������ ������ �����ƾ����
--    �ڵ带 �ٽ� ����� �� �ֵ��� (�Ϲݷ�����)ĸ��ȭ �ϴµ� ���ȴ�.
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�
--    ���� ������ �Լ��� ���� �� �ִ�. (�� ����� ���� �Լ�)
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
--    ���� ���ν���ó�� EXECUTE ���� ���� ������ �� �ִ�.

--2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���
[(
    �Ű�����1 �ڷ���
  , �Ű�����2 �ڷ���
)]
RETURN ������Ÿ��
IS 
    -- �ֿ� ���� ����(���� ����)
BEGIN
    -- ���๮
    ...
    RETURN(��);
    
    [EXCEPTION]
        -- ���� ó�� ����;
END;        
*/


--�� ����� ���� �Լ�(�����̵� �Լ�)��
--   IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�, 
--   FUNCTION �� �ݵ�� ���� ���� ��ȯ�Ѵ�.

--�� TBL_INSA ���̺���
--   �ֹε�Ϲ�ȣ�� ������ ������ ��ȸ�Ѵ�.

SELECT *
FROM TBL_INSA;


SELECT NAME, SSN, DECODE(SUBSTR(SSN, 8 ,1),1,'����',2,'����','Ȯ�κҰ�')"����"
FROM TBL_INSA;

/*
             �� �ֹε�Ϲ�ȣ
            \  /
        ----    ---------
        |               |
        ----------  -----
                 /  \
                  �鼺��
*/  

--�� FUNCTION ����
-- �Լ��� : FN_GENDER()
--                   ��SSN(�ֹε�Ϲ�ȣ) �� 'YYMMDD-NNNNNNN'
--��
CREATE OR REPLACE FUNCTION FN_GENDER --> OR REPALCE (���� �� ��ü�� ������)
( VSSN VARCHAR2     -- �Ű����� : �ڸ���(����) ���� ����
)
RETURN VARCHAR2     -- ��ȯ �ڷ��� : �ڸ���(����) ���� ����
IS 
    -- �ֿ� ���� ����
    VRESULT VARCHAR2(20);
BEGIN
    -- ���� �� ó��
    IF ( SUBSTR(VSSN, 8, 1) IN ('1', '3') )
        THEN VRESULT := '����';
    ELSIF ( SUBSTR(VSSN, 8, 1) IN ('2', '4') )
        THEN VRESULT := '����';
    ELSE    
        VRESULT := '����Ȯ�κҰ�';
    END IF;
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.



--�� ������ ���� �� ���� �Ű�����(�Է� �Ķ����)�� �Ѱܹ޾�
--   A �� B ���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--   �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_GENDER(10, 3)
FROM DUAL;
--==>> 1000
FN_POW(10, 3)
     ---------
        10 * 10 * 10 = 1000
    1 * 10 * 10 * 10 = 1000 
    0 * 10 * 10 * 10 = 0    �� �ʱⰪ�� 0���� �ϸ� �ȵǴ� ����!
*/

--�� ���� Ǭ��   -- �ؿ� ����� Ǯ�� ����!
CREATE OR REPLACE FUNCTION FN_POW
( 
    A NUMBER
,   B NUMBER
)
RETURN NUMBER
IS
    RESULT NUMBER := 1;
    NUM    NUMBER;
BEGIN
    FOR NUM IN 1 .. B LOOP
    RESULT := RESULT * A;
    END LOOP;
    
    RETURN RESULT;
END;



--�� �Բ� Ǯ���� ����

CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER) -- �Ű�����
RETURN NUMBER
IS 
    V_RESULT    NUMBER := 1;        -- ���� ��('1'�� �ʱ�ȭ�ؼ� �ݺ� ���ϱ�)
    V_NUM       NUMBER;
BEGIN
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;
    END LOOP;
    
    RETURN V_RESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�




--�� ����
--   TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
--   �޿��� (�⺻��*12)+���� ������� ������ �����Ѵ�.
--   �Լ��� : FN_PAY(�⺻��, ����)

CREATE OR REPLACE FUNCTION FN_PAY(BASICPAY NUMBER, SUDANG NUMBER)
RETURN NUMBER  
IS 
    V_SALARY      NUMBER;
BEGIN
    V_SALARY := (BASICPAY * 12) + SUDANG;
    RETURN V_SALARY;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.

--�� ����
--   TBL_INSA ���̺��� �Ի����� ��������
--   ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
--   �Լ��� : FN_WORKYEAR(�Ի���)

CREATE OR REPLACE FUNCTION FN_WORKYEAR(IBSADATE DATE)
RETURN NUMBER
IS 
    V_WORKYEAR NUMBER;
BEGIN
    V_WORKYEAR := TRUNC((SYSDATE - IBSADATE)/365, 1);
    RETURN V_WORKYEAR;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------

--�� ����

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK �� �ʿ��ϴ�.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)
-- ����ó���� �Ǹ� COMMIT, �׷��� ������ ROLLBACK(���ణ ������ü ���� ���ø���)

-- ���� PL/SQL�� �� DML��, TCL���� ��� �����ϴ�.
-- ���� PL/SQL�� �� DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.

--------------------------------------------------------------------------------


--���� PROCEDURE(���ν���) ����--

-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����
--    �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--    �̸� �ۼ��Ͽ� �����ͺ��̽� ���� �����صξ��ٰ�
--    �ʿ��� ������ ȣ���Ͽ� ������ �� �ֵ��� ó�����ִ� �����̴�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[(
    �Ű����� IN ������Ÿ��
  , �Ű����� OUT ������Ÿ��
  , �Ű����� INOUT ������Ÿ��
)]
IS
    [-- �ֿ� ���� ����;]
BEGIN
    -- ���� ����;
    ...
    [EXCEPTION
        -- ���� ó�� ����;]
END;        
*/

--�� FUNCTION �� ������ ��...
--   ��RETURN ��ȯ�ڷ������κ��� �������� ������
--   ��RETURN���� ��ü�� �������� ������,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN, OUT, INOUT ���� ���еȴ�.

-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν����� [(�μ�1, �μ�2, ...)];
*/



--�� FUNCTION �� ������ ��...
--   ��RETURN ��ȯ�ڷ������κ��� �������� ������
--   ��RETURN���� ��ü�� �������� ������,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN, OUT, INOUT ���� ���еȴ�.

-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν����� [(�μ�1, �μ�2, ...)];
*/



--�� INSERT ���� ������ ���ν����� �ۼ� ( �� INSERT ���ν���) 
--   ( ���� ���� ���ν��� : INSERT, UPDATE, DELETE )


--��
-- ���ν��� ����(�ۼ�) --> ������ �Է� �� ��������, ���Ἲ ������ �� ������
CREATE OR REPLACE PROCEDURE PRC_STUDNETS_INSERT
  -- �Ű����� ����
( V_ID IN TBL_IDPW.ID%TYPE
, V_PW IN TBL_IDPW.PW%TYPE
, V_NAME IN TBL_STUDENTS.NAME%TYPE
, V_TEL IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS 
BEGIN
    -- TBL_IDPW ���̺� ������ �Է� 
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDNETS ���̺� ������ �Է�
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- Ŀ�� --> DML ����̹Ƿ�
    COMMIT;
    
END;
--==>> Procedure PRC_STUDNETS_INSERT��(��) �����ϵǾ����ϴ�.


--==============================================================================
�ڡڡڡ�   �� �̰� 20210915_02_scott �� �Դٰ��� �ϸ鼭 Ǫ�� ��!�ڡڡڡ�

--�� TBL_SUNGJUK ���̺� ������ �Է� ��
--   Ư�� �׸��� ������(�й�, �̸�, ��������, ��������, �������� ) �� �Է��ϸ�
--   ���������� ����, ���, ��� �׸��� �Բ� �Է� ó���� �� �ֵ��� �ϴ�
--   ���ν����� �����Ѵ�.
--   ���ν��� �� : PRC_SUNGJUK_INSERT()
/*
���� ��)
EXEC PRC_SUNGJUK_INSERT(1, '������', 90,  80, 70);
���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������  ��������   ��������   ����  ���  ���
1    ������    90        80         70       240   80     B
*/

--�� 1(����). ����� Ǯ��
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
(   �й�        IN    �������̺��� ������ �ִ� �й��������� ������ Ÿ���� ��ġ�ϰ�
,   �̸�        IN    �̸� ~ ��ġ�ϰ�
,   ��������    IN    �������� ~ ������ Ÿ�� ��ġ�ϰ�
,   ��������    IN    �������� ~ 
,   ��������    IN    �������� ~
)

IS  --2(����). �Ʒ��� INSERT �������� �����ϴµ� �ʿ��� �ֿ� ���� ����
    
  V_TOT     TBL_SUNGJUK.TOT%TYPE;
  V_AVG     TBL_SUNGJUK.AVG%TYPE;
  V_GRADE   TBL_SUNGJUK.GRADE%TYPE;       


BEGIN       --3(����)
    --��INSERT ������ �����
    
--�� 3-2
--   �Ʒ��� INSERT �������� �����ϱ� ���ؼ��� 
--   ������ ������ �����鿡 ���� ��Ƴ��� �Ѵ�.
V_TOT := V_KOR + V.ENG + V_MAT;
V_AVG := V_TOT / 3;
        -- GRADE�� �б��ؾߵȴ� �� �������� �ٸ��� ����,,IF ������ () ����� �������̴� ������ 
          V_TOT := V_KOR + V_ENG + V_MAT;
          V_AVG := TRUNC(V_TOT / 3); 
          IF (V_AVG>= 90) 
            THEN V_GRADE := 'A';
          ELSIF (V_AVG>=80)
            THEN V_GRADE := 'B';
          ELSIF (V_AVG>=70)
            THEN V_GRADE := 'C';
          ELSIF (V_AVG>=60)
            THEN V_GRADE := 'D';
          ELSE V_GRADE := 'F';
          END IF; 
  
    
--    INSERT INTO TBL_SUNGJUK(�÷�����)
--    INSERT INTO TBL_SUNGJUK((HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
                                                          ----------------
--                                                   �����Ͱ� �����Ű�鼭 �߰��� �� 
-- �� �̷��� ���� 3-1
--  4(3-1 �ؿ� ������ �ۼ��ϰ� 4���� ���� ������ �°Ե̴��� Ȯ�� ����). ���� �Ϸ��� ���� �� ���� ��Ƴ� �����
--  INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);

    --Ŀ��
    COMMIT;

END;

-->> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.
--�� 20210915_02_scott ���� �ۼ�~!

--============
--�� �� Ǯ��
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS 
  V_TOT     TBL_SUNGJUK.TOT%TYPE;
  V_AVG     TBL_SUNGJUK.AVG%TYPE;
  V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- ���� �� ó��
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := TRUNC(V_TOT / 3);

        IF (V_AVG>= 90) THEN V_GRADE := 'A';
        ELSIF (V_AVG>=80) THEN V_GRADE := 'B';
        ELSIF (V_AVG>=70) THEN V_GRADE := 'C';
        ELSIF (V_AVG>=60) THEN V_GRADE := 'D';
        ELSE V_GRADE := 'F';
       END IF; 
  
  -- INSERT ������ �����Է� 
  INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
  VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
  -- Ŀ��
  COMMIT;
END;       
-->> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.
--�� 20210915_02_scott ���� �ۼ�~!
-----------------------------------

--�� TBL_SUNGJUK ���̺���
--   Ư�� �л��� ����(�й�, ����, ����, ����)
--   ������ ���� �� ����, ���, ��ޱ��� �����ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(2, 100, 100, 100);

�й�  �̸�  ��������  ��������   ��������   ����  ���  ���
2    ��ҿ�   100       100        100       300   100     A
*/

--�۰���� Ǯ��
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
  -- UPDATE ���� �� �ʿ��� �����͸� ���� �ֿ� ���� ���� 
  V_TOT     TBL_SUNGJUK.TOT%TYPE;
  V_AVG     TBL_SUNGJUK.AVG%TYPE;
  V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN
  -- �Ʒ��� ������ ������ ���ؼ��� 
  -- ������ �����鿡 ���� ��Ƴ��� �Ѵ�.
  V_TOT := V_KOR + V_ENG + V_MAT;
  V_AVG := TRUNC(V_TOT / 3); 
  IF (V_AVG>= 90) 
    THEN V_GRADE := 'A';
  ELSIF (V_AVG>=80)
    THEN V_GRADE := 'B';
  ELSIF (V_AVG>=70)
    THEN V_GRADE := 'C';
  ELSIF (V_AVG>=60)
    THEN V_GRADE := 'D';
  ELSE V_GRADE := 'F';
  END IF; 
  
  -- UPDATE ������ ����
  UPDATE TBL_SUNGJUK
  SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT, TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
  WHERE HAKBUN = V_HAKBUN;
  
  -- Ŀ��
  COMMIT;

END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.
--=================
--�� �� Ǯ��
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
  V_TOT     TBL_SUNGJUK.TOT%TYPE;
  V_AVG     TBL_SUNGJUK.AVG%TYPE;
  V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN
  -- ���� �� ó��
  V_TOT := V_KOR + V_ENG + V_MAT;
  V_AVG := TRUNC(V_TOT/3);
  V_GRADE := (CASE (V_AVG/10) WHEN 9 THEN 'A'
                              WHEN 8 THEN 'B'
                              WHEN 7 THEN 'C'
                              WHEN 6 THEN 'D'
                              ELSE 'F'
                              END);

  -- TBL_SUNGJUK ������Ʈ ���� ���� ����
  UPDATE TBL_SUNGJUK
  SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT, AVG = V_AVG, GRADE = V_GRADE
  WHERE HAKBUN = V_HAKBUN;
  
  -- Ŀ��
  COMMIT;

END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.

--�� �� �� �Է����� �� ���ν��� �����ϴ� ���� �� �����ϰ� �ٽ� �ۼ�
DROP PROCEDURE PRC_SUNGJUK_UPDATE;

--------------------------------------------------------------------------------
�ڡڡڡ�   �� �̰� 20210915_02_scott �� �Դٰ��� �ϸ鼭 Ǫ�� ��!�ڡڡڡ�

--�� TBL_STUDENTS ���̺���
--   ��ȭ��ȣ �ּ� �����͸� �����ϴ�(�����ϴ�) ���ν����� �ۼ��Ѵ�.
--   ��, ID�� PW �� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �Ѵ�. �� ���̵��ϰ� �н����尡 ��ġ�� ������ ����!!!!!
--   ���ν��� �� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '��õ');
�� ���̵� �н����� ��ġ�ϱ� ������ �� ���
���ν��� ȣ��� ó���� ���
superman  �չ���   010-9999-9999   ��õ
*/

--�� ����� Ǯ��

CREATE OR REPLACE PROCEDURE PRC_STUDNETS_UPDATE
( V_ID      IN N TBL_STUDENTS.TEL%TYPE   --TBL_IDPW.PW%TYPE �� �ص���~! 
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- UPDATE ������ ����
    UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
             FROM TBL_IDPW I JOIN TBL_STUDENTS S
             ON I.ID = S.ID ) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID AND T.PW = V_PW;

    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_STUDNETS_UPDATE��(��) �����ϵǾ����ϴ�.


--�� ���� Ǭ �� ===============================
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID   IN TBL_STUDENTS.ID%TYPE
, V_PW   IN TBL_IDPW.PW%TYPE
, V_TEL  IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR IN  TBL_STUDENTS.ADDR%TYPE
)
IS 
BEGIN
  UPDATE TBL_STUDENTS
  SET TEL = V_TEL, ADDR = V_ADDR
  WHERE ID = (SELECT ID
              FROM TBL_IDPW
              WHERE ID = V_ID
              AND PW = V_PW);
  COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--��20210916_01_scott ���� ���� Ǯ�� ���,,

--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
-- NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
-- ������ ���� �ִ� ��� ���̺� ������ �Է� ��
-- NUM �÷�(�����ȣ)�� ���� 
-- ���� �ο��� �����ȣ ������ ��ȣ�� �� ���� ��ȣ�� �ڵ�����
-- �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.
-- ���ν��� �� : PRC_INSA_INSERT(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG);

/*
���� ��)
EXEC PRC_INSA_INSERT(�̴ٿ�, '951027-2234567',SYSDATE, '����', '010-4113-2353', '������', '�븮', 10000000, 2000000); -- õ��, �̹鸸

���ν��� ȣ��� ó���� ���)
1061  �̴ٿ�  951027-2234567  SYSDATE  ����  010-4113-2353  ������  �븮  10000000  2000000
*/
--�� ���� Ǭ Ǯ��

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSA.NAME%TYPE
, V_SSN         IN TBL_INSA.SSN%TYPE
, V_IBSADATE    IN TBL_INSA.IBSADATE%TYPE
, V_CITY        IN TBL_INSA.CITY%TYPE
, V_TEL         IN TBL_INSA.TEL%TYPE
, V_BUSEO       IN TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSA.SUDANG%TYPE
)
IS 
    V_NUM      TBL_INSA.NUM%TYPE;
BEGIN
    SELECT MAX(NUM)+1 INTO V_NUM
    FROM TBL_INSA;
            
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
END;

--�� �� �� �Է����� �� ���ν��� �����ϴ� ���� �� �����ϰ� �ٽ� �ۼ�
DROP PROCEDURE PRC_INSA_INSERT;

--�� ����� Ǯ��

--�Ű����� ���� ��
CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSA.NAME%TYPE
, V_SSN         IN TBL_INSA.SSN%TYPE
, V_IBSADATE    IN TBL_INSA.IBSADATE%TYPE
, V_CITY        IN TBL_INSA.CITY%TYPE
, V_TEL         IN TBL_INSA.TEL%TYPE
, V_BUSEO       IN TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSA.SUDANG%TYPE
)
IS --INSERT �������� ���࿡ �ʿ��� ���� �߰� ���� ��
    V_NUM      TBL_INSA.NUM%TYPE;
BEGIN   
    -- ������ ������ �� ��Ƴ��� ��
    SELECT MAX(NUM)+1 INTO V_NUM
    FROM TBL_INSA;
    --INSERT ������ ����   ��
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
          -------
--           ��
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.