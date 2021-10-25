SELECT USER
FROM DUAL;

--�� ���� ���� Ǯ��
SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�", REVERSE(FILENAME) "�Ųٷ�"
FROM TBL_FILES;
/*
COD.SELAS                   \CCC\BBB\AAA\:C
SLXX.EAMNAP                 \AAA\:C
TPP.HCRESER                 \:D
PWH.YDUTS                   \STNEMUCOD\:C
TXT.LQS                     \PMET\STNEMUCOD\:C
GNP.TSET                    \F\ERAHS\:D
GPJ.GNIRPS                  \OTOHP\ERUTCIP\GNODLIUG\RESU\:C
LQS.TTOCS.10_10901202       \YDUTSELCARO\:C
*/

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, -1) "�Ųٷε����ϸ�"
       -----�̾Ƴ��ߵǼ�        --- ---    
          --        ó�����Ͷ󼭡�   ������ '\'�� �����ϴ� ��ġ���� -1�� �ϰڴ�. 
FROM TBL_FILES;

-- ���� '\'�� �����ϴ� ��ġ 
INSTR(REVERSE(FILENAME), '\', 1)        -- ������ �Ű����� 1 ����


SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1)-1) "�Ųٷε����ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	                COD.SELAS
2	C:\AAA\PANMAE.XXLS	                        SLXX.EAMNAP
3	D:\RESERCH.PPT	                            TPP.HCRESER
4	C:\DOCUMENTS\STUDY.HWP	                    PWH.YDUTS
5	C:\DOCUMENTS\TEMP\SQL.TXT	                TXT.LQS
6	D:\SHARE\F\TEST.PNG	                        GNP.TSET
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG	GPJ.GNIRPS
8	C:\ORACLESTUDY\20210901_01.SCOTT.SQL	    LQS.TTOCS.10_10901202
*/

SELECT FILENO "���Ϲ�ȣ"--, FILENAME "����������ϸ�"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1)-1)) "�Ųٷε����ϸ�"
FROM TBL_FILES;
--==>>
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESERCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210901_01.SCOTT.SQL
*/


--�� LPAD()      ����
--> Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "1"
     , LPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	****ORACLE
--�� 1Byte ������ Ȯ���Ѵ�.                    �� �� ��° �Ķ���� ���� ����...
--�� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.   �� ù ��° �Ķ���� ���� ����...
--�� �����մ� Byte ������ ���ʺ��� �� ��° �Ķ���� ������ ä���.
--�� �̷��� ������ ���� ������� ��ȯ�Ѵ�.


--�� RPAD()      ������
--> Byte ������ Ȯ���Ͽ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "1"
     , RPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	ORACLE****
--�� 1Byte ������ Ȯ���Ѵ�.                    �� �� ��° �Ķ���� ���� ����...
--�� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.   �� ù ��° �Ķ���� ���� ����...
--�� �����մ� Byte ������ �����ʺ��� �� ��° �Ķ���� ������ ä���.
--�� �̷��� ������ ���� ������� ��ȯ�Ѵ�.


--�� LTRIM()      
SELECT 'ORAORAROACLEROACLE' "1"         --���� ���� ����Ŭ ����Ŭ
     , LTRIM('ORAORAROACLEROACLE', 'ORA') "2"
                                    -----ORA �� ������ �ڸ��� ��
     , LTRIM('AAAORAORAROACLEROACLE', 'ORA') "3"
                                      ---- �������̴�,,,,O, R, A �ϳ��� Ȯ���ϸ鼭 ����....�׷���
                                        -- AAA�� O ,R ,A ���� A �� ������ �ϳ��� �����Ǵ°�,,
     , LTRIM('ORAoRAROACLEROACLE', 'ORA') "4"
     , LTRIM('ORA ORAROACLEROACLE', 'ORA') "5"  -- ���� ������
     , LTRIM('          ORAORAROACLEROACLE', ' ') "6"   -- ���� ���� ������
     , LTRIM('                       OACLE') "7"        -- ���� ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;                         
--==>> 
/*
ORAORAROACLEROACLE	CLEROACLE	CLEROACLE	oRAROACLEROACLE	 ORAROACLEROACLE	ORAORAROACLEROACLE	OACLE
*/
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  ���ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.

SELECT LTRIM('�̱���̱�����̽Žű��̽Ž����̱���̽Ź��̱��', '�̱��') "TEST"
FROM DUAL;
--==>> ���̱��


--�� RTRIM()      
SELECT 'ORAORAROACLEROACLE' "1"         --���� ���� ����Ŭ ����Ŭ
     , RTRIM('ORAORAROACLEROACLE', 'ORA') "2"
                                    -----ORA �� ������ �ڸ��� ��
     , RTRIM('AAAORAORAROACLEROACLE', 'ORA') "3"
                                      ---- �������̴�,,,,O, R, A �ϳ��� Ȯ���ϸ鼭 ����....�׷���
                                        -- AAA�� O ,R ,A ���� A �� ������ �ϳ��� �����Ǵ°�,,
     , RTRIM('ORAoRAROACLEROACLE', 'ORA') "4"
     , RTRIM('ORA ORAROACLEROACLE', 'ORA') "5"  -- ���� ������
     , RTRIM('          ORAORAROACLEROACLE', ' ') "6"   -- ���� ���� ������
     , RTRIM('ORACLE                   ') "7"        -- ���� ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;      
--==>> 
/*
ORAORAROACLEROACLE	CLEROACLE	CLEROACLE	oRAROACLEROACLE	 ORAROACLEROACLE	ORAORAROACLEROACLE	OACLE
*/
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  �����ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.


--�� TRANSLATE()
--> 1:1 �� �ٲپ��ش�.
SELECT TRANSLATE('MY ORACLE SERVER'                --EX) MY~ ���� M���� ����
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'     -- ~LMN~ ���� M�� ã�Ҵ�.
                , 'abcdefghijklmnopqrstuvwxyz') "RESULT"  -- lmn���� m �̰ɷ� �ٲ۴�
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-8743-7042'
                , '0123456789'
                , '�����̻�����ĥ�ȱ�') "RESULT"
FROM DUAL;
--==>> ���Ͽ�-��ĥ���-ĥ������

--�� REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '����')
FROM DUAL;
--==>> MY ����CLE ����HOME

--------------------------------------------------------------------------------

--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "1" --��  ���⼭ 2�� ������� ǥ�����ּ���
     , ROUND(48.678,2) "2"  -- �Ҽ��� ���� ��°�ڸ����� ǥ�� (�� ��° �ڸ����� �ݿø�)
     , ROUND(48.678,2) "3"
     , ROUND(48.678,1) "4"  -- �Ҽ��� ���� ù°�ڸ����� ǥ��
     , ROUND(48.678,0) "5"  -- ������ ǥ��(�Ʒ��� ����)
     , ROUND(48.678) "6"    -- ������ ǥ��!!!! �ι�° �Ķ���� ���� 0�� ��� ��������
     , ROUND(48.678,-1) "7" -- ���� �ڸ����� ��ȿ�ϰ� ǥ���϶�� ��!!! ��, 48���� 8�� �ݿø�
     , ROUND(48.678,-2) "8"
     , ROUND(48.678,-3) "9"
FROM DUAL;
--==>>  48.678	48.68	48.68	48.7	49	49	50	0	0


--�� TRUNC() ������ ó�����ִ� �Լ�
SELECT 48.678 "1" --��  ���⼭ 2�� ������� ǥ�����ּ���
     , TRUNC(48.678,2) "2"  -- �Ҽ��� ���� ��°�ڸ����� ǥ�� (�� ��° �ڸ����� �߶������)
     , TRUNC(48.678,2) "3"
     , TRUNC(48.678,1) "4"  -- �Ҽ��� ���� ù°�ڸ����� ǥ��
     , TRUNC(48.678,0) "5"  -- ������ ǥ��(�Ʒ��� ����)
     , TRUNC(48.678) "6"    -- ������ ǥ��!!!! �ι�° �Ķ���� ���� 0�� ��� ��������
     , TRUNC(48.678,-1) "7" -- ���� �ڸ����� ��ȿ�ϰ� ǥ���϶�� ��!!! ��, 48���� 8 ������
     , TRUNC(48.678,-2) "8"
     , TRUNC(48.678,-3) "9"
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0

--�� MOD() �������� ��ȯ�ϴ� �Լ� 
SELECT MOD(5,2) "RESULT"
FROM DUAL;
--==>> 1
--> 5�� 2�� ���� ������ ����� ��ȯ


--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5, 3) "RESULT"
FROM DUAL;
--==>> 125
--> 5�� 3���� ��������� ��ȯ

--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2)
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2 �� ���� ����� ��ȯ



--�� LOG() �α� �Լ�
--   (�� ����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL �� ���α�, �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10,100), LOG(10,20)
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677


--�� �ﰢ �Լ�
--   ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/

--�� �ﰢ�Լ��� ���Լ� (���� : -1 ~ 1)
--   �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805	
0.4636476090008061162142562314612144020295
*/



--�� SIGN()      ����, ��ȣ, Ư¡
-->  ���� ������� ����̸� 1, 0 �̸� 0, �����̸� -1 �� ��ȯ�Ѵ�.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-8)
FROM DUAL;
--==>> 1	0	-1
--> ���   0  ����  ������ ����
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� �ַ� ����Ѵ�.


--�� ASCII(), CHR()  �� ���� �����ϴ� ������ �Լ�
SELECT ASCII('A') "RESULT1", CHR(65) "RESULT2"
FROM DUAL;
--==>> 65	A
--> ASCII() : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
--  CHR()   : �Ű������� �Ѱܹ��� ���߸� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�.

------------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ ������ �⺻ ������ DAY(�ϼ�)    CHECK~!!!!!

SELECT SYSDATE "1", SYSDATE+1 "2", SYSDATE-2 "3", SYSDATE+3 "4"
FROM DUAL;
--==>>
/*
2021-09-02 10:36:05	        -- ����
2021-09-03 10:36:05	        -- 1�� ��
2021-08-31 10:36:05	        -- 2�� ��
2021-09-05 10:36:05         -- 3�� ��
*/

--�� �ð� ���� ����
SELECT SYSDATE "1", SYSDATE + 1/24 "2", SYSDATE -2/24 "3"
FROM DUAL;
--==>>
/*
2021-09-02 10:38:10	        -- ����
2021-09-02 11:38:10	        -- 1�ð� ��
2021-09-02 08:38:10         -- 2�ð� �� 
*/

--�� ���� �ð���..... ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
/*
--------------------------------------------------------------------------------
             ���� �ð�                         ���� �� �ð�
--------------------------------------------------------------------------------
        2021-09-02 10:40:13                 2021-09-03 12:43:17
--------------------------------------------------------------------------------

*/
-- ��� 1.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "���� �� �ð�"
FROM DUAL;                   --  �ð� �Ϸ�60�� �ð�   �Ϸ�60��   
--==>> 2021-09-02 11:01:30	2021-09-03 13:04:34

--��� 2  (�ʴ��� ���)
SELECT SYSDATE "���� �ð�"
     , SYSDATE + ((24*60*60) + (2*60*60)  + (3*60) + 4) / (24*60*60) "���� �� �ð�"
    --                1��        2�ð�         3��          
FROM DUAL;
--==>> 2021-09-02 11:07:23	2021-09-03 13:10:27


--�� ��¥ - ��¥ = �ϼ�
-- ex) (2021-12-28) - (2021-09-02)
--        ������          ������
SELECT TO_DATE('2021-12-28', 'YYYY-MM-DD') - TO_DATE('2021-09-02', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 117

--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2021-09-02', 'YYYY-MM-DD') "���"         -- ��¥ �������� ��ȯ
FROM DUAL;
--==>> 2021-09-02 00:00:00

SELECT TO_DATE('2021-13-02', 'YYYY-MM-DD') "���"  
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month
*/

SELECT TO_DATE('2021-09-31', 'YYYY-MM-DD') "���"        
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month
*/

SELECT TO_DATE('2021-09-31', 'YYYY-MM-DD') "���"        
FROM DUAL;
--==>> 2020-02-29 00:00:00


--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ ��
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������~!!!

--�� ADD_MONTHS() : ���� ���� �����ִ� �Լ�
SELECT SYSDATE "1"
     , ADD_MONTHS(SYSDATE,2) "2"
     , ADD_MONTHS(SYSDATE,3) "3"
     , ADD_MONTHS(SYSDATE,-2) "4"
     , ADD_MONTHS(SYSDATE,-3) "5"
FROM DUAL;
/*
2021-09-02 11:20:18	
2021-11-02 11:20:18	
2021-12-02 11:20:18	
2021-07-02 11:20:18	
2021-06-02 11:20:18
*/
--> ���� ���ϰ� ����

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� MONTHS_BETWEEN() : ù ��° ���ڰ����� �� ��° ���ڹ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--=>> 231.07982788231780167264038231780167264

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--�� ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
--   ù ��° ���ڰ��� �ش��ϴ� ��¥����
--   �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ���� �� �ִ�.

--> �̷��� ����� ������ ����
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2021-12-28', 'YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--==>> -3.82335461469534050179211469534050179211

--�� NEXT_DAY() : ù ��° ���ڰ��� ���� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> 2021-09-04
--> SYSDATE(���ó�¥) �������� ���� ������ �ٰ����� ������� 2021-09-04 �̴�.��� ��

SELECT NEXT_DAY(SYSDATE, '��') "���1", NEXT_DAY(SYSDATE, '��') "���2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ������ ������ �� ���� �������� �ٽ� �� �� ��ȸ
SELECT NEXT_DAY(SYSDATE, '��') "���1", NEXT_DAY(SYSDATE, '��') "���2"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*/

-- �̷���� ��� ��ȸ�� �ؾߵǳ�?????????????????
SELECT NEXT_DAY(SYSDATE, 'SAT') "���1", NEXT_DAY(SYSDATE, 'MON') "���2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06

-- �̷��� �ϸ� ���´�.

--�� �߰� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN'; 
--==>> Session��(��) ����Ǿ����ϴ�.

-- �ڡڡ� �׷��� ����� �ٲ��� ���� �ȵ��ư��� �ʹݿ����� �� ���ư���.�ڡڡ�



--�� LAST_DAY() : �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� �����Ѵ�.
SELECT LAST_DAY(SYSDATE) "��� Ȯ��"
FROM DUAL;    --SYSDATE�� ���� ��¥�� 2021-09-02 �� ���ִ�.
--==>> 2021-09-30

SELECT LAST_DAY(TO_DATE('2020-02-05', 'YYYY-MM-DD')) "��� Ȯ��"
FROM DUAL;
--==>> 2020-02-29

SELECT LAST_DAY(TO_DATE('2021-02-05', 'YYYY-MM-DD')) "��� Ȯ��"
FROM DUAL;
--==>> 2021-02-28


--�� ���úη�... ����ȣ ����... ���뿡 �� ����(?)����.
--   �����Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.

SELECT ADD_MONTHS(SYSDATE, 22)
FROM DUAL;
--==>> 2023-07-02

-- 2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �ؾ� �Ѵٰ� �����ϸ�
--    ��ȣ�� �� ���� �Ծ�� ���� �����ٱ�?

--      �����Ⱓ * 3
--      --------
--      (�������� - ��������)

--      (�������� - ��������) * 3
SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) *3
FROM DUAL;
--==>> 2004

--WHY? LASTDAT�� �Ⱦ���? LASTDAY�� ����� ������ ���� ���� ���������� ���ϴ� ���̶� �Ⱦ���
-- EX) ������� 2021-08-03 �̶�� LASTDAY�� ���� 2021-08-31 �� ���´�. ������� Ʋ���� ������ ������ �Ⱦ���.

--�� ���� ��¥ �� �������κ���... ������(2021-12-28 18:00:00)����
--   ���� �Ⱓ��... ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
--------------------------------------------------------------------------------
����ð�               | ������                |   ��   |  �ð�  |  ��  |  ��
--------------------------------------------------------------------------------
2021-09-02 12:08:23    | 2021-12-28 18:00:00  |   116   |   15   |  2  |  37
--------------------------------------------------------------------------------
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--========= ������ Ǯ��

--��1�� 2�ð� 3�� 4�ʡ���... ���ʡ��� ȯ���ϸ�...
SELECT (1��) + (2�ð�) + (3��) + (4��)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>> 93784

-- 61�� �� 1�� 1��
SELECT MOD(61, 60)
FROM DUAL;
--==>> 1

--��93784���ʸ� �ٽ� ��, �ð�, ��, �ʷ� ȯ���ϸ�...
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;
--==>> 1	2	3	4

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����)  ��  ���� : �ϼ�
SELECT �������� - ��������
FROM DUAL;

--��������
SELECT TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 2021-12-28 18:00:00      �� ��¥ ����

--��������
SELECT SYSDATE
FROM DUAL;
--==>> 2021-09-02 16:50:26      �� ��¥ ����

SELECT TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 117.047662037037037037037037037037037037 �� ���� : �ϼ�   �� ���� ����
--> �����ϱ��� ���� �Ͻ�

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : ��
SELECT (�����ϱ��� ���� �ϼ�) * (�Ϸ縦 �����ϴ� ��ü ��)
FROM DUAL;

SELECT (�����ϱ��� ���� �ϼ�) * (24*60*60)
FROM DUAL;

SELECT (TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 10112759.99999999999999999999999999999997    ��  ���� : ��  �� ���� ����
--> �����ϱ��� ���� ��

--������ �Ƿ��� ����!//
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;

-- 93784�� (TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60) �� �����Ѵ�.

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) "�ð�"
     , MOD(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "��"
     , MOD((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60) "��"
FROM DUAL;

-- ���� �ð�, �������� �߰�
SELECT SYSDATE "����ð�"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "��������"
     , TRUNC(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) "�ð�"
     , MOD(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "��"
     , MOD((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60) "��"
FROM DUAL;

-- ������� �Ҽ������� �����ϱ� ������ ���ش�.??????!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT SYSDATE "����ð�"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "��������"
     , TRUNC(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) "�ð�"
     , MOD(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "��"
     , TRUNC(MOD((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)) "��"
FROM DUAL;

--==>> ����~!!!!!!!!!!!!!!!!!!!
/*
--------------------------------------------------------------------------------
����ð�               | ������                |   ��   |  �ð�  |  ��  |  ��
--------------------------------------------------------------------------------
2021-09-02	             2021-12-28	              117	     0	    22	   32
*/


--=======���� Ǭ Ǯ��

SELECT SYSDATE "���� �ð�"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS')  "��������"
     , TRUNC(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "��"
     , TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24) 
        - TRUNC(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24 "�ð�"
     , TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) 
        - TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 )*60 "��"
     , TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60 *60) 
        - TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) *60 "��"
FROM DUAL;
--==>> 
/*
����ð�               | ������                |   ��   |  �ð�  |  ��  |  ��
--------------------------------------------------------------------------------
2021-09-02 15:26:29	    2021-12-28 18:00:00	      117	    2	    33	   30
*/

--==>> �Ѱ��� �ǹ�!!!!!   ROUND �� �־ȵǳ���????????
--                   ��~~~~  �ð��� �ݿø��Ǽ� ����~! �ð��� �ݿø��Ǹ� ��Ȯ���� �����ϱ�~!^^
-- ����! ��
/*
SELECT SYSDATE "���� �ð�"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS')  "��������"
     , ROUND(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "��"
     , ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24) 
       - ROUND(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24 "�ð�"
     , ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) 
       - ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 )*60 "��"
     , ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60 *60) 
       - ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) *60 "��"
FROM DUAL;
*/


--�۹���
-- ������ �¾�� �������...
-- �󸶸�ŭ ��, �ð�, ��, �ʸ� ��Ҵ���...(�쵵�ִ���...)
-- ��ȸ�ϴ� �������� �����Ѵ�.
/*
--------------------------------------------------------------------------------
����ð�               | �¾ �ð�           |   ��   |  �ð�  |  ��  |  ��
--------------------------------------------------------------------------------
2021-09-02 15:44:38   | 1994-06-03 09:00:00  |    ?    |   ?    |  ?   |  ?
--------------------------------------------------------------------------------
*/


SELECT SYSDATE "����ð�"
     , TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS') "�¾ �ð�" 
     , TRUNC(TRUNC(TRUNC((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60)/60), 24) "�ð�"
     , MOD(TRUNC((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60), 60) "��"
     , TRUNC(MOD((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60), 60)) "��"
FROM DUAL;
--==>>
/*
--------------------------------------------------------------------------------
����ð�               | �¾ �ð�           |   ��   |  �ð�  |  ��  |  ��
--------------------------------------------------------------------------------
2021-09-02 15:33:20    | 1994-06-03 09:00:00  |   9953  |   6    |  44  |  38
--------------------------------------------------------------------------------
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "1"                  -- 2021-09-02   �� �⺻ ���� ��¥
     , ROUND(SYSDATE, 'YEAR') "2"   -- 2022-01-01   �� �⵵���� ��ȿ�� ������(��ݱ�, �Ϲݱ� �������� �ø�)
     , ROUND(SYSDATE, 'MONTH') "3"  -- 2021-09-01   �� ������ ��ȿ�� ������(15�� �������� �ø�)
     , ROUND(SYSDATE, 'DD') "4"     -- 2021-09-03   �� ��¥���� ��ȿ�� ������(���� �������� �ø�)
     , ROUND(SYSDATE, 'DAY') "5"    -- 2021-09-05   �� ��¥���� ��ȿ�� ������(������ �������� �ø�)
FROM DUAL;

--�� ��¥ ����
SELECT SYSDATE "1"                  -- 2021-09-02   �� �⺻ ���� ��¥
     , TRUNC(SYSDATE, 'YEAR') "2"   -- 2022-01-01   �� �⵵���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'MONTH') "3"  -- 2021-09-01   �� ������ ��ȿ�� ������
     , TRUNC(SYSDATE, 'DD') "4"     -- 2021-09-02   �� ��¥���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'DAY') "5"    -- 2021-08-29   �� ��¥���� ��ȿ�� ������(�� �� �Ͽ���)
FROM DUAL;

--------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()     : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_DATE()     : ���� ������(��¥ ����)�� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER()   : ���� ������(���� ����)�� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���
--   ���� �������� ���� ������ ������ �� �ִ�.
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_CURRENCY = '\';   --��(��)
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')   -- 2021-09-02   //��¥ ó�� ���������� �˰��� ����!!!!!!
     , TO_CHAR(SYSDATE, 'YYYY')         -- 2021
     , TO_CHAR(SYSDATE, 'YEAR')         -- TWENTY TWENTY-ONE
     , TO_CHAR(SYSDATE, 'MM')           -- 09
     , TO_CHAR(SYSDATE, 'MONTH')        -- 9�� 
     , TO_CHAR(SYSDATE, 'MON')          -- 9�� 
     , TO_CHAR(SYSDATE, 'DD')           -- 02
     , TO_CHAR(SYSDATE, 'DAY')          -- �����
     , TO_CHAR(SYSDATE, 'DY')           -- ��
     , TO_CHAR(SYSDATE, 'HH24')         -- 16
     , TO_CHAR(SYSDATE, 'HH')           -- 04
     , TO_CHAR(SYSDATE, 'HH AM')        -- 04 ����
     , TO_CHAR(SYSDATE, 'HH PM')        -- 04 ����
     , TO_CHAR(SYSDATE, 'MI')           -- 22
     , TO_CHAR(SYSDATE, 'SS')           -- 46
     , TO_CHAR(SYSDATE, 'SSSSS')        -- 58966            ��  ���� �귯�� ��ü ��
     , TO_CHAR(SYSDATE, 'Q')            -- 3                 ��  �б�
FROM DUAL;

SELECT 2021 "1", '2021' "2"
FROM DUAL;

SELECT '23' "1", TO_NUMBER('23') "2"
FROM DUAL;


--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "1"      -- 2021  �� ������ �����Ͽ� ���� Ÿ������...
     , TO_CHAR(SYSDATE, 'MM') "2"       -- 09    �� ���� �����Ͽ� ���� Ÿ������...
     , TO_CHAR(SYSDATE, 'DD') "2"       -- 02    �� ���� �����Ͽ� ���� Ÿ������...
     , EXTRACT(YEAR FROM SYSDATE) "4"   -- 2021  �� ������ �����Ͽ� ���� Ÿ������...
     , EXTRACT(MONTH FROM SYSDATE) "4"  -- 9     �� ���� �����Ͽ� ���� Ÿ������...
     , EXTRACT(DAY FROM SYSDATE) "4"    -- 2     �� ���� �����Ͽ� ���� Ÿ������...
FROM DUAL;
--> ��, ��, �� ���� �ٸ� ���� �Ұ�

--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "1"
     , TO_CHAR(60000, '99,999') "2"
     , TO_CHAR(60000, '$99,999') "3"
     , TO_CHAR(60000, 'L99,999') "4"
     , LTRIM(TO_CHAR(60000, 'L99,999')) "5" --> LTRIM �� ���� ������
FROM DUAL;
--==>>  60000	    60,000	      $60,000	      \60,000


--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE "����ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60*60)) + (4/(24*60*60)) "1��2�ð�3��4����"
FROM DUAL;
--==>>
/*
2021-09-02 17:03:05	
2021-09-03 19:03:12
*/

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "���� ���"
FROM DUAL;
--==>>
/*
2021-09-02 17:06:20	
2022-11-05 21:11:26
*/

--------------------------------------------------------------------------------

--�� CASE ���� (���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�� �����' END "��� Ȯ��"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2�� �����' END "��� Ȯ��"
FROM DUAL;
--==>> 5+2�� �����

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '�����'
        END "��� Ȯ��"
FROM DUAL;
--==>> 1+1=2

--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�� �����') "��� Ȯ��"
FROM DUAL;
--==>> 5-2=3

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '�񱳺Ұ�'
        END "��� Ȯ��"
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE '��������'
        END "��� Ȯ��"
FROM DUAL;
--==>> ��������
/*
SELECT CASE WHEN T THEN '��������'  --> �� ���� ���������� TRUE �ϱ� �ؿ��� ���� ����!
            WHEN T THEN '��������'
            ELSE '��������'
        END "��� Ȯ��"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '�ش�����'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���'
        END "��� Ȯ��"
FROM DUAL;
--==>> �ش�����
/*
SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '�ش�����'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���'
        END "��� Ȯ��"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '�ش�����'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���'
        END "��� Ȯ��"
FROM DUAL;
--==>> ���ϸ���
/*
SELECT CASE WHEN F THEN '�ش�����'
            WHEN F THEN '��������'
            ELSE '���ϸ���'
        END "��� Ȯ��"
FROM DUAL;
*/
