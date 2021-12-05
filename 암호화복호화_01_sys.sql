SELECT USER
FROM DUAL;
--==>> SYS


--■■■ 암호화 및 복호화 ■■■

--1. 오라클의 암호화 기능을 사용하기 위해서는
--   DBSM_OBFUSCATION_TOOLKIT 패키지를 이용한다.
--   (관련 패키지를 활용하지 않고 암호화, 복호화 알고리즘을 직접 구현할 수 있다.)

--2. DBMS_OBFUSCATION_TOOLKIT 패키지는
--   기본적(default)으로는 사용할 수 없는 상태로 설정되어 있으므로
--   추가 설치 및 설정 과정이 필요하다.
--   이를 위해
--   dbmsobtk.sql, prvtobtk.plb 파일을 찾아 실행한다.

-->> 봉인되어있던 패키지를 풀어버린것 dbmsobtk, prvtobtk
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\dbmsobtk.sql
--==>>
/*
Library DBMS_OBFUSCATION_LIB이(가) 컴파일되었습니다.
Library CRYPTO_TOOLKIT_LIBRARY이(가) 컴파일되었습니다.
Package DBMS_CRYPTO이(가) 컴파일되었습니다.
SYNONYM DBMS_CRYPTO이(가) 생성되었습니다.
Package DBMS_OBFUSCATION_TOOLKIT이(가) 컴파일되었습니다.
SYNONYM DBMS_OBFUSCATION_TOOLKIT이(가) 생성되었습니다.
Grant을(를) 성공했습니다.
Package DBMS_SQLHASH이(가) 컴파일되었습니다.
SYNONYM DBMS_SQLHASH이(가) 생성되었습니다.
*/

@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\prvtobtk.plb
--==>>
/* 
Package DBMS_CRYPTO_FFI이(가) 컴파일되었습니다.
Package Body DBMS_CRYPTO_FFI이(가) 컴파일되었습니다.
Package Body DBMS_CRYPTO이(가) 컴파일되었습니다.
Package DBMS_OBFUSCATION_TOOLKIT_FFI이(가) 컴파일되었습니다.
Package Body DBMS_OBFUSCATION_TOOLKIT_FFI이(가) 컴파일되었습니다.
Package Body DBMS_OBFUSCATION_TOOLKIT이(가) 컴파일되었습니다.
Package Body DBMS_SQLHASH이(가) 컴파일되었습니다.
*/

--3. 이 패키지는 4개의 프로시저로 이루어져 있다.
--   VARCHAR2 타입을 Encrypt/Decrypt 할 수 있는 2개의 프로시저
--   RAM 타입을 Encrypt/Decrypt 할 수 있는 2개의 프로시저
--   (다른 타입은 지원하지 않기 때문에 NUMBER 인 경우는 TO_CHAR() 이용)

-- ※ RAW, LONG RAW, ROWID 타입
--    그래픽 이미지나 디지털 사운드 등을 저장
--    HEXA-DECIMAL(16진수) 형태로 RETURN
--    이 중 RAW 는 VARCHAR2 와 유사하다.
--    LONG RAW 는 LONG 과 유사하지만 다음과 같은 제한사항이 있다.
--    - 저장과 추출만 가능하고, DATA 를 가공할 수 없다.
--    - LONG RAW 는 LONG 과 같은 제한사항을 갖는다.


--○ 해당 패키지를 사용할 수 있도록 권한 부여
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO SCOTT;
--==>> Grant을(를) 성공했습니다.
--> SCOTT 계정으로 DBMS_OBFUSCATION_TOOLKIT 패키지의
--  프로시저를 사용할 수 있는 권한 부여

GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO PUBLIC;
--==>> Grant을(를) 성공했습니다. 
--> PUBLIC 으로 DBMS_OBFUSCATION_TOOLKIT 패키지의
--  프로시저를 사용할 수 있는 권한 부여







