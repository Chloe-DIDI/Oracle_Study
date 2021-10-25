SELECT USER
FROM DUAL;
--==>>SCOTT

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

----------------------------------------------------------------------------------------------------

--�� TBL_��ǰ, TBL_�԰� ���̺��� �������...
--   TBL_�԰� ���̺��� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� ��������� �Բ� ������ �� �ִ� ����� ����
--   ���ν����� �ۼ��Ѵ�.
--   ��, �� �������� �԰���ȣ�� �ڵ� ���� ó���Ѵ�.(������ ��� ����)
--   TBL_�԰� ���̺� ���� �÷�
--    �� �԰���ȣ, ��ǰ��ȣ, �԰�����, �԰�����, �԰��ܰ�
--   ���ν��� �� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰�����, �԰��ܰ�)

--�� TBL_�԰� ���̺��� �԰� �̺�Ʈ �߻� �� ...
--   ���� ���̺����� ����Ǿ�� �ϴ� ����
--   0. SELECT �� TBL ��ǰ
--      SELECT �������
--      FROM TBL_��ǰ
--      WHERE ��ǰ�ڵ� = 'C001';
--   1. INSERT �� TBL_�԰�
--      INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰�����, �԰��ܰ�)
--      VALUES (1, 'C001', SYSDATE, 30, 1000);
--   2. UPDATE �� TBL_��ǰ
--      UPDATE TBL_��ǰ
--      SET ������� = ����������� + 20(���԰�����)
--      WHERE ��ǰ�ڵ� = 'C001';


--�� �Բ� Ǯ���� ����
CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�    IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_�԰�����    IN TBL_�԰�.�԰�����%TYPE
, V_�԰��ܰ�    IN TBL_�԰�.�԰��ܰ�%TYPE
)
IS
    -- �Ʒ��� �������� �����ϱ� ���� �ʿ��� ������ ������ ����
    V_�԰���ȣ  TBL_�԰�.�԰���ȣ%TYPE;
BEGIN

    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(�԰���ȣ), 0) INTO V_�԰���ȣ
    FROM TBL_�԰�;
    
    -- ������ ����
    -- �� INSERT �� TBL_�԰�
    INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰��ܰ�)
    VALUES ((V_�԰���ȣ+1), V_��ǰ�ڵ�, V_�԰�����, V_�԰��ܰ�);
       
    -- �� UPDATE �� TBL_��ǰ
    UPDATE TBL_��ǰ
    SET ������� = ������� + V_�԰�����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

    -- Ŀ��
    COMMIT;
    
    -- ���� ó��            -> �����鿡 ������ �ǿ��� ��Ȳ�� �߻��Ѵٸ�
    EXCEPTION 
        WHEN OTHERS THEN ROLLBACK;  --> �ѹ��ض�~~!
        --> �̻������� �ѹ�Ǵ°Ŵϱ� �μ�Ʈ�� �ȵǴ� ���̴�.
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.

COMMIT;

-----------------------------------------------------------
--���� Ǭ�� �� Ʋ��(���غ���)
CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ� IN VARCHAR2(20)
, V_�԰����� IN NUMBER
, V_�԰��ܰ� IN NUMBER
, V_�԰���ȣ NUMBER
)
IS
  V_�԰�����  TBL_�԰�.�԰�����%TYPE;
  V_�������  TBL_�԰�.�������%TYPE;
BEGIN
    SELECT NVL((MAX(��ǰ), 0)+1)
    FROM TBL_��ǰ;
    
    UPDATE TBL_��ǰ
    SET  V_��ǰ�ڵ�, V_�԰�����, V_�԰��ܰ�
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    INSERT INTO TBL_�԰�(��ǰ�ڵ�, �԰�����, �԰��ܰ�)
    VALUES (V_��ǰ�ڵ�, V_�԰�����, V_�԰��ܰ�);
END;
-------------------
 
--�� ������ Ǯ���� ����
CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�    IN TBL_�԰�.��ǰ�ڵ�%TYPE
, V_�԰�����    IN TBL_�԰�.�԰�����%TYPE
, V_�԰��ܰ�    IN TBL_�԰�.�԰��ܰ�%TYPE
)
IS 
    V_�԰���ȣ     TBL_�԰�.�԰���ȣ%TYPE;
BEGIN
    SELECT MAX(�԰���ȣ)+1 INTO V_�԰���ȣ
    FROM TBL_�԰�;
    
    IF (V_�԰���ȣ IS NULL)
    THEN V_�԰���ȣ := 1;
    END IF;
    
    INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰��ܰ�)
    VALUES(V_�԰���ȣ, V_��ǰ�ڵ�, V_�԰�����, V_�԰��ܰ�);
   
    UPDATE TBL_��ǰ
    SET ������� = ������� + V_�԰�����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ� AND V_�԰���ȣ IS NOT NULL;
    
    COMMIT;
    
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.



--���� ���ν��� �������� ���� ó�� ����--
--�� TBL_MEMBER ���̺��� �����͸� �Է��ϴ� ���ν����� ����
--   ��, �� ���ν����� ���� �����͸� �Է��� ���
--   CITY(����) �׸� '����', '��õ', '���' �� �Է��� �����ϵ��� �����Ѵ�.
--   �� ���� ���� ������ ���ν��� ȣ���� ���� �Է��Ϸ��� �ϴ� ���
--   ���� ó���� �Ϸ��� �Ѵ�.
--   ���ν��� �� : PRC_MEMBER_INSERT(�̸�, ��ȭ��ȣ, ����)

CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- ���� ������ ������ ������ ���� �ʿ��� ������ ���� ����
    V_NUM  TBL_MEMBER.NUM%TYPE;
    
    -- ����� ���� ���ܿ� ���� ���� ���� CHECK~!!!
    USER_DEFINE_ERROR EXCEPTION;  --> ������ [������Ÿ��]
BEGIN
    
    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ����������
    -- �ƴ����� ���θ� ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF (V_CITY NOT IN ('����', '��õ', '���'))
        -- ���� �߻�~!!! CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR;          
    END IF;
    
    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM), 0) INTO V_NUM
    FROM TBL_MEMBER;
    
    -- ������ ����(INSERT)
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- Ŀ��
    COMMIT;
    
    -- ���� ó�� ����
    EXCEPTION 
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20001, '����,��õ,��⸸ �Է� �����մϴ�.');  
                ROLLBACK;
            -->  ���� ���� �޼��� ���� �Լ�(), 20000�� ������ ���� ��ȣ �Է�(������ ����)
        WHEN OTHERS
            THEN ROLLBACK;
            --> ��Ÿ ���� �߻� �� �ѹ�.
END;
--==>> Procedure PRC_MEMBER_INSERT��(��) �����ϵǾ����ϴ�.



--------------------------------------------------------------------------------

--�� TBL_��� ���̺��� ������ �Է� ��(��, ��� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� ��������� �����Ǵ� ���ν����� �ۼ��Ѵ�.
--   ��, �����ȣ�� �԰���ȣ�� ���������� �ڵ� ����.
--   ����, ��� ������ ��� �������� ���� ���...
--   ��� �׼��� ����� �� �ֵ��� ó���Ѵ�. (����� �̷������ �ʵ���...)
--   ���ν��� �� : PRC_���_INSERT(��ǰ�ڵ�, �������, ����ܰ�);


--�� �Բ� Ǯ���� ����
CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�  IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_�������  IN TBL_���.�������%TYPE
, V_����ܰ�  IN TBL_���.����ܰ�%TYPE
)
IS
    -- �ֿ� ���� ����
    V_�����ȣ   TBL_���.�����ȣ%TYPE;
    V_�������   TBL_��ǰ.�������%TYPE;
    
    -- ����� ���� ���� ���� ����
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- ������ ���� ������ ���� ���� Ȯ�� �� ���� ��� Ȯ�� �� ��� ������ ��
    SELECT ������� INTO V_�������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ����� ���������� �������� �������� ���� ���� Ȯ��
    -- (�ľ��� ����������� ��������� ������... ���� �߻�)
    IF (V_������� > V_�������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(�����ȣ) , 0) INTO V_�����ȣ
    FROM TBL_���;
    
    -- ������ ����(INSERT �� TBL_���)
    INSERT INTO TBL_���(�����ȣ, ��ǰ�ڵ�, �������, ����ܰ�)
    VALUES((V_�����ȣ +1), V_��ǰ�ڵ�, V_�������, V_����ܰ�);
    
    -- ������ ����(UPDATE �� TBL_��ǰ)
    UPDATE TBL_��ǰ
    SET ������� = ������� - V_�������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- Ŀ��
    COMMIT;
    
    -- ���� ó�� ����
    EXCEPTION 
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.


--�� ���� Ǯ��
CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�    IN TBL_���.��ǰ�ڵ�%TYPE
, V_�������    IN TBL_���.�������%TYPE
, V_����ܰ�    IN TBL_���.����ܰ�%TYPE
)
IS
    -- ���� ������ ������ ������ ���� �ʿ��� ������ ���� ����
    V_�����ȣ    TBL_���.�����ȣ%TYPE;
    V_�������    TBL_��ǰ.�������%TYPE;
  
    -- ����� ���� ���ܿ� ���� ���� ���� CHECK~!!!
    USER_DEFINE_ERROR EXCEPTION; 
BEGIN
     -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(�����ȣ), 0) +1 INTO V_�����ȣ
    FROM TBL_���;
    
    SELECT ������� INTO V_�������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ� ;
    
    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ����������
    -- �ƴ����� ���θ� ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF (V_������� > V_�������)
        -- ���� �߻�~!!! CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR; 
    END IF;
    
    -- ������ ����(INSERT)
    INSERT INTO TBL_���(�����ȣ, ��ǰ�ڵ�, �������, ����ܰ�)
    VALUES (V_�����ȣ, V_��ǰ�ڵ�, V_�������, V_����ܰ�);
    
    -- ������Ʈ
    UPDATE TBL_��ǰ
    SET ������� = ������� - V_�������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- Ŀ��
    COMMIT;
    
    -- ���� ó�� ����
    EXCEPTION 
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20001, '��������� ����������� ���� �Է��ؾ� �մϴ�.');  
                ROLLBACK;
            -->  ���� ���� �޼��� ���� �Լ�(), 20000�� ������ ���� ��ȣ �Է�(������ ����)
        WHEN OTHERS
            THEN ROLLBACK;
            --> ��Ÿ ���� �߻� �� �ѹ�.
END;



--------------------------------------
--Q. ������ �������... TBL_��� > TBL_��ǰ ������ �������ֽø鼭... ���������� �̷��� ������ �ؾ� �Ѵٰ� �ϼ̴� �� ������... �� �� ó�� ������ �ٲٸ� ������ ������??
    -- ���ÿ� �Ͼ�� ���̱� ������ ,,,, ��������
--�� TBL_��� ���̺����� ��� ������ ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_���_UPDATE(�����ȣ, ������ ����);

--�� �Բ� Ǯ���� ���� 
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
(
--�� �Ű����� ����
    V_�����ȣ IN TBL_���.�����ȣ%TYPE
,   V_������� IN TBL_���.�������%TYPE
)
IS 
    --�� �ֿ� ���� �߰� ����
    V_��ǰ�ڵ�    TBL_��ǰ.��ǰ�ڵ�%TYPE;
    
    --�� �ֿ� ���� �߰� ����
    V_����������� TBL_���.�������%TYPE;
    
    --�� �ֿ� ���� �߰� ����
    V_�������     TBL_��ǰ.�������%TYPE;
    
    --�� �ֿ� ����(����� ���� ����) �߰� ����
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN

    --�� ��ǰ�ڵ�, ����������� �ľ��� ���� ���� ������ ��� ���� Ȯ��
    SELECT ��ǰ�ڵ�, ������� INTO V_��ǰ�ڵ�, V_�����������       --> ���� �߿�!
    FROM TBL_���
    WHERE �����ȣ = V_�����ȣ;  
    
    --�� ����� ���������� �����ؾ� �ϴ����� ���� �Ǵ� �ʿ�
    --   ���� ������ ������� �� ������ ������� Ȯ��
    SELECT ������� INTO V_�������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    --�� �ľ��� ��������� ���� ������ ���� �ǽ� ���� �Ǵ�
    --   (���������+����������� < ��������������� ��Ȳ�̶��... ����� ���� ���� �߻�)
    IF ((V_������� + V_�����������) < V_�������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    --�� ����� ������ üũ(UPDATE �� TBL_��� / UPDATE �� TBL_��ǰ)
    UPDATE TBL_���
    SET ������� = V_�������
    WHERE �����ȣ = V_�����ȣ;
    
    UPDATE TBL_��ǰ
    SET ������� = ������� + V_����������� - V_�������  -- ������� + V_����������� : �����������, V_������� : �����������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    --�� Ŀ��
    COMMIT;
    
    --�� ���� ó�� 
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
END;

--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.




