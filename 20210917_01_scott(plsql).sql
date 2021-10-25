SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT * 
FROM TBL_�԰�;

--=====================================================================
--�� TBL_�԰� ���̺��� �԰������ ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_�԰�_UPDATE(�԰��ȣ, �������԰����);
CREATE OR REPLACE PROCEDURE PRC_�԰�_UPDATE
( V_�԰��ȣ   IN TBL_�԰�.�԰��ȣ%TYPE
, V_�԰����   IN TBL_�԰�.�԰����%TYPE
)
IS
    -- �ֿ� ���� �߰� ����
    V_��ǰ�ڵ�      TBL_��ǰ.��ǰ�ڵ�%TYPE;
    
    -- �ֿ� ���� �߰� ����
    V_�����԰����  TBL_�԰�.�԰����%TYPE;
    
    -- �ֿ� ���� �߰� ����
    V_������      TBL_��ǰ.������%TYPE;
    
    -- ����� ���� ���� ���� �߰� ����
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN    
    -- ��ǰ�ڵ� �ľ��� ���� ���� ���� ������ ���� Ȯ��
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�����԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
     
    IF (V_������ - V_�����԰���� + V_�԰���� < 0)
        THEN RAISE USER_DEFINE_ERROR; 
    END IF;  

    -- ������ ������ �ۼ�
    UPDATE TBL_�԰�
    SET �԰���� = V_�����԰���� + V_�԰����
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�԰� ���� ����~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


--===============================================================
--�� TBL_��� ���̺��� �������� �����ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_���_DELETE(����ȣ);  --> ��� ��� ������ ���·� ���ư�
CREATE OR REPLACE PROCEDURE PRC_���_DELETE
( V_����ȣ IN TBL_���.����ȣ%TYPE
)
IS
    V_��ǰ�ڵ�  TBL_��ǰ.��ǰ�ڵ�%TYPE;
    
    V_������  TBL_���.������%TYPE;
    
    V_������  TBL_��ǰ.������%TYPE;
    
BEGIN
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ������ ������ �ۼ�
    DELETE 
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
        

--===============================================================
--�� TBL_�԰� ���̺��� �԰������ �����ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_�԰�_DELETE(�԰��ȣ);  --> ��� �԰� ������ ���·� ���ư�
CREATE OR REPLACE PROCEDURE PRC_�԰�_DELETE
( V_�԰��ȣ IN TBL_�԰�.�԰��ȣ%TYPE
)
IS
    V_��ǰ�ڵ�  TBL_��ǰ.��ǰ�ڵ�%TYPE;
    
    V_�԰����  TBL_�԰�.�԰����%TYPE;
    
    V_������  TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF (V_������ - V_�԰���� < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ ������ �ۼ�
    DELETE 
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    --COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
         THEN RAISE_APPLICATION_ERROR(-20004, '�԰� ������ ������ �� �����ϴ�.' );
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;

---------------------------------------------------------------------------------------------------------------------------------
-- ���⼭ ��� Ȯ�� ��!  20210917_02_scott ���� �ƴ�! ���⼭!--

                        -->> �Ѳ��޷��ִ� ���Ǹ��޸� ����
--���� CURSOR(Ŀ��) ����--

-- 1. ����Ŭ���� �ϳ��� ���ڵ尡 �ƴ� ���� ���ڵ�� ������
--    �۾� �������� SQL ���� �����ϰ� �� �������� �߻��� ������
--    �����ϱ� ���Ͽ� Ŀ��(CURSOR)�� ����ϸ�,
--    Ŀ������ �Ͻ��� Ŀ���� ����� Ŀ���� �ִ�.

-- 2. �Ͻ��� Ŀ���� ��� SQL ���� �����ϸ�,
--    SQL�� ���� �� ���� �ϳ��� ��(ROW)�� ����ϰ� �ȴ�.
--    �׷��� SQL���� ������ �����(RESULT SET)��
--    ���� ��(ROW)���� ������ ���
--    Ŀ��(CURSOR)�� ��������� �����ؾ� ���� ��(ROW)�� �ٷ� �� �ִ�.


--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
SET SERVEROUTPUT ON;

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM = 1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
END;
--==>> 
/*
ȫ�浿,011-2356-4528
PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
END;
--==>> ���� �߻�~!!
/*
01422. 00000 -  "exact fetch returns more than requested number of rows"
*/

--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� �� - �ݺ����� Ȱ���ϴ� ���) 
--   V_NUM �� �ø��� ȭ(������) �Ǿ����� ���� ��Ȳ������ �� ��
--   MIN��(��ŸƮ ��, V_NUM := 1001), MAX��(���� ��, V_NUM >= 1061)�� ���� Ȯ���ϰ� �Ѱ���� �� �� ����

--==>>�� �������� �� ���� ���� ���� SET SERVEROUTPUT ON; �̰� �ϱ�!
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM=V_NUM;
    
        DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
        V_NUM := V_NUM +1;
        
        EXIT WHEN V_NUM >= 1061;
    END LOOP;
END;
--==>>
/*
ȫ�浿,011-2356-4528
�̼���,010-4758-6532
�̼���,010-4231-1236
������,019-5236-4221
�Ѽ���,018-5211-3542
�̱���,010-3214-5357
        :
        :
PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
--   V_NUM �� �ø��� ȭ(������) �Ǿ����� ���� ��Ȳ������ �� �� ����
--   MIN��(��ŸƮ ��, V_NUM := 1001), MAX��(���� ��, V_NUM >= 1061)�� ���� Ȯ������ �ʰ� ������ �� �� ����

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- Ŀ�� �̿��� ���� Ŀ�� ���� ����(�� Ŀ�� ����)
    CURSOR CUR_INSA_SELECT 
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
        
BEGIN
    
    -- Ŀ�� ����
    OPEN CUR_INSA_SELECT;
    
    -- Ŀ�� ���� �� ����������� �����͵� ó��(��Ƴ���)
    LOOP
        -- �� �� �� �� ������� �������� ���� �� ��FETCH��
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- ���
        DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
                
    END LOOP;
    
    -- Ŀ�� Ŭ���� (�� ����Ŭ�� ���������� Ŀ���� �ݾ��ִ� ����� �־ ���� ������� �ʾƵ� ��, �Ͻ��� Ŀ��)
    CLOSE CUR_INSA_SELECT;
    
END;

--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
--   V_NUM �� �ø��� ȭ(������) �Ǿ����� ���� ��Ȳ������ �� �� ����
--   MIN��(��ŸƮ ��, V_NUM := 1001), MAX��(���� ��, V_NUM >= 1061)�� ���� Ȯ������ �ʰ� ������ �� �� ����

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- Ŀ�� �̿��� ���� Ŀ�� ���� ����(�� Ŀ�� ����)
    CURSOR CUR_INSA_SELECT 
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
        
BEGIN
    
    -- Ŀ�� ����
    OPEN CUR_INSA_SELECT;
    
    -- Ŀ�� ���� �� ����������� �����͵� ó��(��Ƴ���)
    LOOP
        -- �� �� �� �� ������� �������� ���� �� ��FETCH��
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- �ݺ����� ���������� ������...
        -- Ŀ���κ��� �ƹ��͵� ã�� ������ ��...
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- ���
        DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
                
    END LOOP;
    -- Ŀ�� Ŭ���� (�� ����Ŭ�� ���������� Ŀ���� �ݾ��ִ� ����� �־ ���� ������� �ʾƵ� ��, �Ͻ��� Ŀ��)
    CLOSE CUR_INSA_SELECT;
    
END;
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


-------------------------------------------------------------------------------------------------------------------------------
--���� TRIGGER(Ʈ����) ����--

-- �������� �ǹ� : ��Ƽ�, �˹߽�Ű��, �߱��ϴ�, �����ϴ�

-- 1. TRIGGER(Ʈ����)�� DML �۾� ��, INSERT, UPDATE, DELETE �۾��� �Ͼ ��
--    �ڵ������� ����Ǵ�(���ߵǴ�, �˹ߵǴ�) ��ü�� 
--    �̿� ���� Ư¡�� �����Ͽ�(�ΰ�����) DML TRIGGER ��� �θ��⵵ �Ѵ�.
--    TRIGGER �� ������ ���Ἲ �� �ƴ϶�
--    ������ ���� �۾����� �θ� ���ȴ�.

-- �ڵ����� �Ļ��� �� �� ����
-- �߸��� Ʈ����� ����
-- ������ ���� ���� ���� ����
-- �л� �����ͺ��̽� ��� �󿡼� ���� ���Ἲ ���� ����
-- ������ ���� ��Ģ ���� ����
-- ������ �̺�Ʈ �α� ����
-- ������ ���� ����
-- ���� ���̺� ���� ��������
-- ���̺� ������ ��� ����


-- 2. TRIGGER �������� COMMIT, ROLLBACK ���� ����� �� ����.


-- 3. Ư¡ �� ����

-- BEFORE STATEMENT
-- SQL ������ ����Ǳ� ���� �� ���忡 ���� �� �� ����

-- BEFORE ROW
-- SQL ������ ����Ǳ� ����(DML �۾��� �����ϱ� ����) 
-- �� ��(ROW)�� ���� �� ���� ����

-- AFTER STATEMENT
-- SQL ������ ����� �� �� ���忡 ���� �� �� ����

-- AFTER ROW
-- SQL ������ ����� �Ŀ�(DML �۾��� ������ �Ŀ�)
-- �� ��(ROW)�� ���� �� ���� ����


-- 4. ���� �� ����
/*
CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�
    [BEFORE | AFTER]
    �̺�Ʈ1 [OR �̺�Ʈ2 [OR �̺�Ʈ3]] ON ���̺�� 
    --> �̺�Ʈ : DML Ʈ����(INSERT, UPDATE, DELETE) ON ���̺�� : �κ�Ʈ�� ��ġ�ϴ� ���̺�
    [FOR EACH ROW [WHEN TRIGGER ����]] 
    --> ROW TRIGGER ���� ���� cf. STATEMENT TRIGGER
[DECLARE]
    -- ���� ����;
BEGIN 
    -- ���� ����;
END;
*/


--���� AFTER STATEMENT TRIGEER ��Ȳ �ǽ� ����--
--�� DML �۾��� ���� �̺�Ʈ ���

--�� TRIGGER(Ʈ����) ����(TRG_EVENTLOG)
CREATE OR REPLACE TRIGGER TRG_EVNETLOG
            AFTER 
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
DECLARE
BEGIN
    -- �̺�Ʈ ���� ����(���ǹ��� ���� �б�)
    IF (INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('INSERT �������� ����Ǿ����ϴ�.');
    ELSIF (UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('UPDATE �������� ����Ǿ����ϴ�.');
    ELSIF (DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('DELETE �������� ����Ǿ����ϴ�.');
    END IF;
    
    --COMMIT;
    --�� TRIGGER �������� COMMIT ���� ��� �Ұ�~!!!
END;
--==>> Trigger TRG_EVNETLOG��(��) �����ϵǾ����ϴ�.





--���� BEFORE STATEMENT TRIGEER ��Ȳ �ǽ� ����--
--�� DML �۾� ���� ���� �۾� ���ɿ��� Ȯ��
--   (���� ��å ���� / ���� ��Ģ ����)

--�� TRIGGER(Ʈ����) �ۼ�(TRG_TEST1_DML)
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE 
        INSERT OR UPDATE OR DELETE ON TBL_TEST1  -- �� ���̺� ���� ���� Ʈ���� ���� ���ɡ�
--DECLARE(DECLARE �� BEGIN ���̿� �ٸ� ���� ������ ���� �� ���� ����)
BEGIN
    IF ( TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8 
           OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        THEN RAISE_APPLICATION_ERROR(-20003, '�۾��� 08:00 ~ 18:00 ���� �����մϴ�.');
    END IF;        
END;
--==>> Trigger TRG_TEST1_DML��(��) �����ϵǾ����ϴ�.


--���� BEFORE ROW TRIGEER ��Ȳ �ǽ� ����--
--�� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��

--�� TRIGGER(Ʈ����) �ۼ�(TRG_TEST2_DELETE)
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
          BEFORE
          DELETE ON TBL_TEST2 --> TEST3 �� TEST2�� �����ϱ� ���� ������ �����Ǵ� ���ϻ�
          FOR EACH ROW 
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;
--==>> Trigger TRG_TEST2_DELETE��(��) �����ϵǾ����ϴ�.

--�� ��:OLD��
--   ���� �� ���� ��
--   (INSERT : �Է��ϱ� ���� �ڷ�, DELETE : �����ϱ� ���� �ڷ� ��, ������ �ڷ�)

--�� UPDATE �� DELETE �׸��� INSERT �� ���յ� ����
--             �� �������� UPDATE �ϱ� ������ �ڷ�� :OLD
--             �� �������� UPDATE �� ���� �ڷ�� :NEW



DELETE
FROM TBL_TEST2
WHERE CODE = 1;

