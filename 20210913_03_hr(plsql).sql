
SELECT USER
FROM DUAL;
--==>> HR


--○ %TYPE

-- 1. 특정 테이블에 포함되어 있는 컬럼의 자료형을 참조하는 데이터타입

-- 2. 형식 및 구조
-- 변수명 테이블명.컬럼명%TYPE [ :=초기값 ];

--○ BEGIN 의 실행부를 출력하기 위해 환경변수 설정 변경
-->> 이거 안해주면 밑에 구문 Alexander 안 나온다
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.
--> 『DBMS_OUTPUT.PUT_LINE()』을 통해
--  화면에 결과를 출력하기 위한 환경변수 설정

--○ HR.EMPLOYEES 테이블의 특정 데이터를 변수에 저장
DECLARE
    --VNAME   VARCHAR2(20);
    VNAME   EMPLOYEES.FIRST_NAME%TYPE;  -- VARCHAR2(20)
BEGIN 
    SELECT FIRST_NAME INTO VNAME
    FROM EMPLOYEES 
    WHERE EMPLOYEE_ID=103;
    
    DBMS_OUTPUT.PUT_LINE(VNAME);
END;
--==>>
/*
Alexander

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/




-- ○ %ROWTYPE

-- 1. 테이블의 레코드와 같은 구조의 리스트(여러명 별점)

-- 2. 형식과 구조
-- 테이블명 %ROWTYPE;

DESC EMPLOYEES;
-- ==>>
/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)    

*/

-- 직원 전체 조회 -> 결과값이 Alexander 인데 103 번이 맞는지 확인하려구 ㅎㅎ
SELECT * 
FROM EMPLOYEES;

--○ HR.EMPLOYEES 테이블의 데이터 여러 개를 변수에 저장
DECLARE
    --VNAME   VARCHAR2(20)
    --VPHONE  VARCHAR2(20)
    --VEMAIL  VARCHAR2(25)
    
    --VNAME   EMPLOYEES.FIRST_NAME%TYPE;
    --VPHONE  EMPLOYEES.PHONE_NUMBER%TYPE;
    --VEMAIL  EMPLOYEES.EMAIL%TYPE;
    
    VEMP      EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
      INTO VEMP.FIRST_NAME, VEMP.PHONE_NUMBER, VEMP.EMAIL 
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=103;
    
    DBMS_OUTPUT.PUT_LINE(VEMP.FIRST_NAME ||' - '|| VEMP.PHONE_NUMBER ||' - '|| VEMP.EMAIL);
END;
--==>> Alexander - 590.423.4567 - AHUNOLD


--○ HR.EMPLOYEES 테이블의 여러 명 데이터 여러 개를 변수에 저장
--   103번 사원만 골라서 담아내는 것이 아니라
--   전체 사원의 이름, 전화번호, 이메일을 변수에 담아 출력

DECLARE
    VEMP      EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
      INTO VEMP.FIRST_NAME, VEMP.PHONE_NUMBER, VEMP.EMAIL 
    FROM EMPLOYEES;         --> EMPLOYEES 전체 ,,130번만이아니라 전체로 하는것
  
    DBMS_OUTPUT.PUT_LINE(VEMP.FIRST_NAME ||' - '|| VEMP.PHONE_NUMBER ||' - '|| VEMP.EMAIL);
END;

--==>> 에러 발생
/*
ORA-01422: exact fetch returns more than requested number of rows
*/
--> 여러 개의 행(ROWS) 정보를 얻어와 담으려고 하면
--  변수에 저장하는 것 자체가 불가능한 상황...

-- 처리 불가~!!!







