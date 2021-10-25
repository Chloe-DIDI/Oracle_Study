
--1줄 주석문 처리(단일행 주석문 처리)

/*
여러줄
(다중행)
주석문
처리
*/

--○ 현재 오라클 서버에 접속한 자신의 계정 조회
show user;  -- 여기 줄이 선택된 상태에서 ctrl + enter 하면 밑에 결과나옴
--==>> USER이(가) "SYS"입니다.
--> sqlplus 상태일 때 사용하는 명령어

select user
from dual;
--==>> SYS

SELECT USER
FROM DUAL;
--==>> SYS

SELECT 1+2
FROM DUAL;
--==>> 3

SELECT 쌍용강북F강의장
FROM DUAL;
--==>> 에러 발생
/*
ORA-00904: "쌍용강북F강의장": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
28행, 8열에서 오류 발생
*/

SELECT "쌍용강북F강의장"
FROM DUAL;
--==>> 에러 발생
/*
ORA-00904: "쌍용강북F강의장": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
39행, 8열에서 오류 발생
*/

SELECT '쌍용강북F강의장'
FROM DUAL;
--==>> 쌍용강북F강의장

SELECT '아직은 지루한 오라클 수업'
FROM DUAL;
--==>> 아직은 지루한 오라클 수업

SELECT 3.14 + 1.36
FROM DUAL;
--==>> 4.5          실수기반 연산

SELECT 1.234 + 2.345
FROM DUAL;
--==>> 3.579

SELECT 10 * 5
FROM DUAL;
--==>> 50

SELECT 1000/23
FROM DUAL;
--연산은 실수기반으로 된다==>> 43.47826086956521739130434782608695652174

SELECT 100 - 23
DUAL;
--==>> 77

SELECT 100 - 5.5
FROM DUAL;
--==>> 94.5

SELECT '정미화' + '채지윤'
FROM DUAL;
--==>> 에러 발샘
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

--○ 현재 오라클 서버에 존재하는 사용자 계정 정보 상태 조회
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
--==>> 『DBA_』로 시작하는 Oracle Data Dictionary View 는
--      오로지 관리자 권한으로 접속했을 경우에만 조회가 가능하다.
--      아직은 데이터 딕셔너리 개념을 잡지 못해도 상관없다.


--○ 『HR』사용자 계정을 잠금 상태로 설정
ALTER USER HR ACCOUNT LOCK;
--==>> User HR이(가) 변경되었습니다.

--○ 다시 사용자 계정 상태 조회
SELECT USERNAME, ACCOUNT_STATUS 
FROM DBA_USERS;
--==>>
/*
        :
    HR	  LOCKED
        :
*/

--○『HR』사용자 계정 잠금 해제
ALTER USER HR ACCOUNT UNLOCK;
--==>> User HR이(가) 변경되었습니다.

--○ 다시 사용자 계정 상태 조회
SELECT USERNAME, ACCOUNT_STATUS 
FROM DBA_USERS;
--==>>
/*
        :
    HR	   OPEN
        :
*/

--------------------------------------------------------------------------------

--○ TABLESPACE 생성

--※ TABLESPACE란?
--   세그먼트(테이블, 인덱스,...)를 담아두는(저장해두는)
--   오라클의 논리적인 저장 구조를 의미한다.


--『INSERT』 데이터를 새로만들때
--『CREATE』 구조적 기능적인것을 새로만들때

-- 오타쟁이~!!!
--CREAT TABLESPACE TBS_EDUA                   --CREAT 유형 개체명 → 생성
CREATE TABLESPACE TBS_EDUA                   --CREAT 유형 개체명 → 생성
--DATAFILE 'D:\TESTORADATA\TBS_EDUA01.DBF'    -- 물리적으로 연결되는 데이터 파일
DATAFILE 'C:\TESTORADATA\TBS_EDUA01.DBF'    -- 물리적으로 연결되는 데이터 파일
SIZE 4M                                     -- 물리적 데이터 파일의 용량
EXTENT MANAGEMENT LOCAL                     -- 오라클 서버가 세그먼트를 알아서 관리
SEGMENT SPACE MANAGEMENT AUTO;              -- 세그먼트 공간 관리도 자동으로 오라클 서버에 위임

--※ 테이블스페이스 생성 구문을 실행하기 전에
--   물리적인 경로에 디렉터리 생성할 것.
--==>> TABLESPACE TBS_EDUA이(가) 생성되었습니다.

--○ 생성된 테이블스페이스(TBS_EDUA) 조회
--SELECT 이런항목, 저런항목, 그런항목
SELECT *        --*은 모든항목
FROM DBA_TABLESPACES;   
--==>>
/*
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
*/

--○ 물리적인 파일 이름 조회
SELECT *
FROM DBA_DATA_FILES;
--==>>
/*
C:\TESTORADATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO
*/

--○ 오라클 사용자 계정 생성(sdj)
CREATE USER sdj IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> sdj 라는 사용자 꼐정을 만들겠다.(생성하겠다.)
-- 이 계정의 패스워드는 java006$ 로 구성하겠다.(설정하겠다.)
-- 이 계정을 통해 접속해서 생성하는 오라클 객체는(세그먼트들은)
-- 기본적으로 TBS_EDUA 라는 테이블스페이르스를 활용할 수 있도록 설정하겠다.
--(이 테이블스페이스에 생성 될 수 있도록 설정하겟다.)
--==>> User SDJ이(가) 생성되었습니다.


--※ 생성된 오라클 사용자 계정(sdj)을 통해
--   오라클에 접속을 시도해 보았으니...접속 불가.
--   → 상태: 실패 -테스트 실패: ORA-01045: user SDJ lacks CREATE SESSION privilege; logon denied
--> create session 권한이 없기 때문에...

--○ 생성된 오라클 사용자 계정(sdj)에 
--   서버 접속이 가능할 수 있도록 create session 권한 부여 →

GRANT CREATE SESSION TO sdj;
--==>> Grant을(를) 성공했습니다.

--※ 생성된 오라클 사용자 계정(sdj)을 통해 오라클 접속 가능~!!!!!!!
--   하지만, 테이블 생성 불가(→ 권한 불충분)

--○ 생성된 오라클 사용자 계정(sdj)의
--   시스템 관련 권한 조회
SELECT *
FROM DBA_SYS_PRIVS;
/*
          :
     SDJ	CREATE SESSION	NO
          :
*/
-- 생성된 오라클 사용자 계정(sdj)에
-- 테이블 생성이 가능할 수 있도록 CREATE TABLE 권한 부여
GRANT CREATE TABLE TO sdj;
--==>> Grant을(를) 성공했습니다.


--○ 생성된 오라클 사용자 계정(sdj)에
--   테이블 스페이스(TBS_EDUA)에서 사용할 수 있는 공간(할당량)
--   의 크기를 무제한으로 지정.

ALTER USER sdj
QUOTA UNLIMITED ON TBS_EDUA;    --할당랼 2메가 하고싶으면 언리미티드 자리에 2M 하면됨
--==> User SDJ이(가) 변경되었습니다.

