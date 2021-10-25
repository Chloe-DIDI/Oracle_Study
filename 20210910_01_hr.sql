SELECT USER
FROM DUAL;

--���� DAFAULT ǥ���� ����--

-- 1. INSERT �� UPDATE ������
--    ����ڰ� �����ϴ� Ư�� ���� �ƴ�
--    �⺻ ���� �Է��ϵ��� ó���� �� �ִ�.

-- 2. ���� �� ����
-- �÷��� ������Ÿ�� DEFAULT �⺻��

-- 3. INSERT ��� �� �ش� �÷��� �Էµ� ���� �Ҵ����� �ʰų�,
--    DEFAULT Ű���带 Ȱ���Ͽ� �⺻ ���� �Է��ϵ��� �� �� �ִ�.

-- 4. DEFAULT Ű����� �ٸ� ����(NOT NULL ��) ǥ�Ⱑ ���� ���� ���
--    DEFAULT Ű���带 ���� ǥ��(�ۼ�)�� ���� �����Ѵ�.


--�� DEFAULT ǥ���� �ǽ�
-- ���̺� ����
CREATE TABLE TBL_BOARD                  -- �Խ��� ���̺� ����
( SID        NUMBER         PRIMARY KEY -- �Խù� ��ȣ �� �ĺ���(�ڵ�����)
, NAME       VARCHAR2(30)               -- �Խù� �ۼ���
, CONTENTS   VARCHAR2(2000)             -- �Խù� ����
, WRITEDAY   DATE       DEFAULT SYSDATE -- �Խù� �ۼ���(���� ����� �ú���,,�� ���� ��¥ �ڵ� �Է�)
, COMMENTS   NUMBER     DEFAULT 0       -- �Խù��� ��� ����(�⺻�� 0)
, COUNTS     NUMBER     DEFAULT 0       -- �Խù� ��ȸ��(�⺻�� 0)
);

--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.
--�� SID �� �ڵ� ���� ������ ��Ϸ��� ������ ��ü�� �ʿ��ϴ�.
--   �ڵ����� �ԷµǴ� �÷��� ����ڰ� �Է��ؾ� �ϴ� �׸񿡼�
--   ���ܽ�ų �� �ִ�.


-- ������ ����
CREATE SEQUENCE SEQ_BOARD
NOCACHE;
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.



-- ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.






--�Խù� �ۼ�
INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '�մ���', '����Ŭ���� DEAULT ǥ������ �ǽ����Դϴ�.'
, TO_DATE('2021-08-30 14:26:26', 'YYYY-MM-DD HH24:MI:SS'), 0, 0);
                                                          --  --
--                                                      ���  ��ȸ��                                                                    
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '������', '��� �׽�Ʈ���Դϴ�.', SYSDATE, 0, 0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '������', '��� �׽�Ʈ���Դϴ�.', SYSDATE, 0, 0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, 'ä����', '���� �׽�Ʈ���Դϴ�.', DEFAULT, DEFAULT, DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS)
VALUES(SEQ_BOARD.NEXTVAL, '������', '�׽�Ʈ ������');
--   ���� �Է� �� �� ���� NULL ���� �ڵ� �Էµȴ�.
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�մ���	����Ŭ���� DEAULT ǥ������ �ǽ����Դϴ�.	2021-08-30 14:26:26	0	0
2	������	��� �׽�Ʈ���Դϴ�.	                    2021-09-10 14:28:44	0	0
3	ä����	���� �׽�Ʈ���Դϴ�.	                    2021-09-10 14:31:19	0	0
4	������	�׽�Ʈ ������                         	    2021-09-10 14:33:00	0	0
*/


--�� DAFAULT ǥ���� Ȯ��(��ȸ)

SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME='TBL_BOARD';
--==>>
/*
TBL_BOARD	SID	            NUMBER			    22			N	1													                                                    NO	NO		0		    NO	YES	NONE
TBL_BOARD	NAME	        VARCHAR2			30			Y	2							                                                        CHAR_CS	    30	    NO	NO		30	    B	NO	YES	NONE
TBL_BOARD	CONTENTS	    VARCHAR2			2000		Y	3						                                                        	CHAR_CS	    2000	NO	NO		2000	B	NO	YES	NONE
TBL_BOARD	WRITEDAY	    DATE			    7			Y	4	92	    "SYSDATE -- �Խù� �ۼ���(���� ����� �ú���,,�� ���� ��¥ �ڵ� �Է�)"					    NO	NO		0		    NO	YES	NONE
TBL_BOARD	COMMENTS	    NUMBER			    22			Y	5	51	    "0       -- �Խù��� ��� ����(�⺻�� 0)"		                                            NO	NO		0		    NO	YES	NONE
TBL_BOARD	COUNTS	        NUMBER			    22			Y	6	44	    "0       -- �Խù� ��ȸ��(�⺻�� 0)"		                                                NO	NO		0		    NO	YES	NONE
*/


--�� ���̺� ���� ���� DEFAULT ǥ���� �߰� / ����
ALTER TABLE ���̺��
MODIFY �÷��� [�ڷ���] DEFAULT �⺻��;
------
-- �����Ϸ��� MODIFY  --> DEFAULT �� ADD , DROP �ȵ� �׷��� MODIFY �˷��ִ� ��


--�� ������ DEFAULT ǥ���� ����(����)
ALTER TABLE ���̺��
MODIFY �÷��� [�ڷ���] DEFAULT NULL;




