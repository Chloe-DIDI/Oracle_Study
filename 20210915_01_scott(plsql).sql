
★★★★ⓐⓑⓒ 이거 20210915_02_scott 랑 왔다갔다 하면서 푸는 것!★★★★

SELECT USER
FROM DUAL;
--==>>SCOTT

--■■■ FUNCTION(함수) ■■■--

-- 1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로
--    코드를 다시 사용할 수 있도록 (일반론적인)캡슐화 하는데 사용된다.
--    오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나
--    직접 스토어드 함수를 만들 수 있다. (→ 사용자 정의 함수)
--    이 사용자 정의 함수는 시스템 함수처럼 쿼리에서 호출하거나
--    저장 프로시저처럼 EXECUTE 문을 통해 실행할 수 있다.

--2. 형식 및 구조
/*
CREATE [OR REPLACE] FUNCTION 함수명
[(
    매개변수1 자료형
  , 매개변수2 자료형
)]
RETURN 데이터타입
IS 
    -- 주요 변수 선언(지역 변수)
BEGIN
    -- 실행문
    ...
    RETURN(값);
    
    [EXCEPTION]
        -- 예외 처리 구문;
END;        
*/


--※ 사용자 정의 함수(스토이드 함수)는
--   IN 파라미터(입력 매개변수)만 사용할 수 있으며
--   반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고, 
--   FUNCTION 은 반드시 단일 값만 반환한다.

--○ TBL_INSA 테이블에서
--   주민등록번호를 가지고 성별을 조회한다.

SELECT *
FROM TBL_INSA;


SELECT NAME, SSN, DECODE(SUBSTR(SSN, 8 ,1),1,'남자',2,'여자','확인불가')"성별"
FROM TBL_INSA;

/*
             ↓ 주민등록번호
            \  /
        ----    ---------
        |               |
        ----------  -----
                 /  \
                  ↓성별
*/  

--○ FUNCTION 생성
-- 함수명 : FN_GENDER()
--                   ↑SSN(주민등록번호) → 'YYMMDD-NNNNNNN'
--ⓐ
CREATE OR REPLACE FUNCTION FN_GENDER --> OR REPALCE (수정 및 대체가 가능함)
( VSSN VARCHAR2     -- 매개변수 : 자릿수(길이) 지정 안함
)
RETURN VARCHAR2     -- 반환 자료형 : 자릿수(길이) 지정 안함
IS 
    -- 주요 변수 선언
    VRESULT VARCHAR2(20);
BEGIN
    -- 연산 및 처리
    IF ( SUBSTR(VSSN, 8, 1) IN ('1', '3') )
        THEN VRESULT := '남자';
    ELSIF ( SUBSTR(VSSN, 8, 1) IN ('2', '4') )
        THEN VRESULT := '여자';
    ELSE    
        VRESULT := '성별확인불가';
    END IF;
    
    -- 최종 결과값 반환
    RETURN VRESULT;
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.



--○ 임의의 정수 두 개를 매개변수(입력 파라미터)로 넘겨받아
--   A 의 B 승의 값을 반환하는 사용자 정의 함수를 작성한다.
--   함수명 : FN_POW()
/*
사용 예)
SELECT FN_GENDER(10, 3)
FROM DUAL;
--==>> 1000
FN_POW(10, 3)
     ---------
        10 * 10 * 10 = 1000
    1 * 10 * 10 * 10 = 1000 
    0 * 10 * 10 * 10 = 0    → 초기값을 0으로 하면 안되는 이유!
*/

--ⓑ 내가 푼것   -- 밑에 강사님 풀이 있음!
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



--○ 함께 풀이한 내용

CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER) -- 매개변수
RETURN NUMBER
IS 
    V_RESULT    NUMBER := 1;        -- 누적 곱('1'로 초기화해서 반복 곱하기)
    V_NUM       NUMBER;
BEGIN
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;
    END LOOP;
    
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다




--○ 과제
--   TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.
--   급여는 (기본급*12)+수당 기반으로 연산을 수행한다.
--   함수명 : FN_PAY(기본급, 수당)

CREATE OR REPLACE FUNCTION FN_PAY(BASICPAY NUMBER, SUDANG NUMBER)
RETURN NUMBER  
IS 
    V_SALARY      NUMBER;
BEGIN
    V_SALARY := (BASICPAY * 12) + SUDANG;
    RETURN V_SALARY;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.

--○ 과제
--   TBL_INSA 테이블의 입사일을 기준으로
--   현재까지의 근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
--   함수명 : FN_WORKYEAR(입사일)

CREATE OR REPLACE FUNCTION FN_WORKYEAR(IBSADATE DATE)
RETURN NUMBER
IS 
    V_WORKYEAR NUMBER;
BEGIN
    V_WORKYEAR := TRUNC((SYSDATE - IBSADATE)/365, 1);
    RETURN V_WORKYEAR;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------

--※ 참고

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK 이 필요하다.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)
-- 정상처리가 되면 COMMIT, 그렇지 않으면 ROLLBACK(은행간 계좌이체 예시 떠올리기)

-- 정적 PL/SQL문 → DML문, TCL문만 사용 가능하다.
-- 동적 PL/SQL문 → DML문, DDL문, DCL문, TCL문 사용 가능하다.

--------------------------------------------------------------------------------


--■■■ PROCEDURE(프로시저) ■■■--

-- 1. PL/SQL 에서 가장 대표적인 구조인 스토어드 프로시저는
--    개발자가 자주 작성해야 하는 업무의 흐름을
--    미리 작성하여 데이터베이스 내에 저장해두었다가
--    필요할 때마다 호출하여 실행할 수 있도록 처리해주는 구문이다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] PROCEDURE 프로시저명
[(
    매개변수 IN 데이터타입
  , 매개변수 OUT 데이터타입
  , 매개변수 INOUT 데이터타입
)]
IS
    [-- 주요 변수 선언;]
BEGIN
    -- 실행 구문;
    ...
    [EXCEPTION
        -- 예외 처리 구문;]
END;        
*/

--※ FUNCTION 과 비교했을 때...
--   『RETURN 반환자료형』부분이 존재하지 않으며
--   『RETURN』문 자체도 존재하지 않으며,
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
--   IN, OUT, INOUT 으로 구분된다.

-- 3. 실행(호출)
/*
EXEC[UTE] 프로시저명 [(인수1, 인수2, ...)];
*/



--※ FUNCTION 과 비교했을 때...
--   『RETURN 반환자료형』부분이 존재하지 않으며
--   『RETURN』문 자체도 존재하지 않으며,
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
--   IN, OUT, INOUT 으로 구분된다.

-- 3. 실행(호출)
/*
EXEC[UTE] 프로시저명 [(인수1, 인수2, ...)];
*/



--○ INSERT 쿼리 실행을 프로시저로 작성 ( → INSERT 프로시저) 
--   ( 사용빈도 높은 프로시저 : INSERT, UPDATE, DELETE )


--ⓒ
-- 프로시저 생성(작성) --> 데이터 입력 중 참조관계, 무결성 유지할 수 있음★
CREATE OR REPLACE PROCEDURE PRC_STUDNETS_INSERT
  -- 매개변수 선언
( V_ID IN TBL_IDPW.ID%TYPE
, V_PW IN TBL_IDPW.PW%TYPE
, V_NAME IN TBL_STUDENTS.NAME%TYPE
, V_TEL IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS 
BEGIN
    -- TBL_IDPW 테이블에 데이터 입력 
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDNETS 테이블에 데이터 입력
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- 커밋 --> DML 언어이므로
    COMMIT;
    
END;
--==>> Procedure PRC_STUDNETS_INSERT이(가) 컴파일되었습니다.


--==============================================================================
★★★★   ⒜ 이거 20210915_02_scott 랑 왔다갔다 하면서 푸는 것!★★★★

--○ TBL_SUNGJUK 테이블에 데이터 입력 시
--   특정 항목의 데이터(학번, 이름, 국어점수, 영어점수, 수학점수 ) 만 입력하면
--   내부적으로 총점, 평균, 등급 항목이 함께 입력 처리될 수 있도록 하는
--   프로시저를 생성한다.
--   프로시저 명 : PRC_SUNGJUK_INSERT()
/*
실행 예)
EXEC PRC_SUNGJUK_INSERT(1, '김진희', 90,  80, 70);
프로시저 호출로 처리된 결과)
학번  이름  국어점수  영어점수   수학점수   총점  평균  등급
1    김진희    90        80         70       240   80     B
*/

--○ 1(순서). 강사님 풀이
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
(   학번        IN    성적테이블이 가지고 있는 학번데이터의 데이터 타입이 일치하게
,   이름        IN    이름 ~ 일치하게
,   국어점수    IN    국어점수 ~ 데이터 타입 일치하게
,   영어점수    IN    영어점수 ~ 
,   수학점수    IN    수학점수 ~
)

IS  --2(순서). 아래의 INSERT 쿼리문을 수행하는데 필요한 주요 변수 선언
    
  V_TOT     TBL_SUNGJUK.TOT%TYPE;
  V_AVG     TBL_SUNGJUK.AVG%TYPE;
  V_GRADE   TBL_SUNGJUK.GRADE%TYPE;       


BEGIN       --3(순서)
    --◎INSERT 쿼리문 실행◎
    
--▼ 3-2
--   아래의 INSERT 쿼리문을 수행하기 위해서는 
--   위에서 선언한 변수들에 값을 담아내야 한다.
V_TOT := V_KOR + V.ENG + V_MAT;
V_AVG := V_TOT / 3;
        -- GRADE는 분기해야된다 각 범위마다 다르기 때문,,IF 다음에 () 씌우면 안정적이니 씌워라 
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
  
    
--    INSERT INTO TBL_SUNGJUK(컬럼값들)
--    INSERT INTO TBL_SUNGJUK((HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
                                                          ----------------
--                                                   데이터값 변경시키면서 추가한 것 
-- ▼ 이렇게 나옴 3-1
--  4(3-1 밑에 쿼리문 작성하고 4번은 위의 과정이 맞게됫는지 확인 절차). 위의 일련의 과정 을 통해 담아낸 값들로
--  INSERT 쿼리문 실행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);

    --커밋
    COMMIT;

END;

-->> Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.
--▶ 20210915_02_scott 가서 작성~!

--============
--○ 내 풀이
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
    -- 연산 및 처리
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := TRUNC(V_TOT / 3);

        IF (V_AVG>= 90) THEN V_GRADE := 'A';
        ELSIF (V_AVG>=80) THEN V_GRADE := 'B';
        ELSIF (V_AVG>=70) THEN V_GRADE := 'C';
        ELSIF (V_AVG>=60) THEN V_GRADE := 'D';
        ELSE V_GRADE := 'F';
       END IF; 
  
  -- INSERT 쿼리문 실행입력 
  INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
  VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
  -- 커밋
  COMMIT;
END;       
-->> Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.
--▶ 20210915_02_scott 가서 작성~!
-----------------------------------

--○ TBL_SUNGJUK 테이블에서
--   특정 학생의 점수(학번, 국어, 영어, 수학)
--   데이터 수정 시 총점, 평균, 등급까지 수정하는 프로시저를 작성한다.
--   프로시저 명 : PRC_SUNGJUK_UPDATE()
/*
실행 예)
EXEC PRC_SUNGJUK_UPDATE(2, 100, 100, 100);

학번  이름  국어점수  영어점수   수학점수   총점  평균  등급
2    김소연   100       100        100       300   100     A
*/

--○강사님 풀이
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
  -- UPDATE 진행 시 필요한 데이터를 담을 주요 변수 선언 
  V_TOT     TBL_SUNGJUK.TOT%TYPE;
  V_AVG     TBL_SUNGJUK.AVG%TYPE;
  V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN
  -- 아래의 쿼리문 실행을 위해서는 
  -- 선언한 변수들에 값을 담아내야 한다.
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
  
  -- UPDATE 쿼리문 수행
  UPDATE TBL_SUNGJUK
  SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT, TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
  WHERE HAKBUN = V_HAKBUN;
  
  -- 커밋
  COMMIT;

END;
--==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.
--=================
--○ 내 풀이
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
  -- 연산 및 처리
  V_TOT := V_KOR + V_ENG + V_MAT;
  V_AVG := TRUNC(V_TOT/3);
  V_GRADE := (CASE (V_AVG/10) WHEN 9 THEN 'A'
                              WHEN 8 THEN 'B'
                              WHEN 7 THEN 'C'
                              WHEN 6 THEN 'D'
                              ELSE 'F'
                              END);

  -- TBL_SUNGJUK 업데이트 쿼리 구문 실행
  UPDATE TBL_SUNGJUK
  SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT, AVG = V_AVG, GRADE = V_GRADE
  WHERE HAKBUN = V_HAKBUN;
  
  -- 커밋
  COMMIT;

END;
--==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.

--○ 잘 못 입력했을 때 프로시저 삭제하는 구문 → 삭제하고 다시 작성
DROP PROCEDURE PRC_SUNGJUK_UPDATE;

--------------------------------------------------------------------------------
★★★★   ⒝ 이거 20210915_02_scott 랑 왔다갔다 하면서 푸는 것!★★★★

--○ TBL_STUDENTS 테이블에서
--   전화번호 주소 데이터를 수정하는(변경하는) 프로시저를 작성한다.
--   단, ID와 PW 가 일치하는 경우에만 수정을 진행할 수 있도록 한다. → 아이디하고 패스워드가 일치할 때에만 수정!!!!!
--   프로시저 명 : PRC_STUDENTS_UPDATE()
/*
실행 예)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '인천');
→ 아이디 패스워드 일치하기 때문에 ▼ 결과
프로시저 호출로 처리된 결과
superman  손범석   010-9999-9999   인천
*/

--○ 강사님 풀이

CREATE OR REPLACE PROCEDURE PRC_STUDNETS_UPDATE
( V_ID      IN N TBL_STUDENTS.TEL%TYPE   --TBL_IDPW.PW%TYPE 로 해도됨~! 
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- UPDATE 쿼리문 구성
    UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
             FROM TBL_IDPW I JOIN TBL_STUDENTS S
             ON I.ID = S.ID ) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID AND T.PW = V_PW;

    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_STUDNETS_UPDATE이(가) 컴파일되었습니다.


--◇ 내가 푼 것 ===============================
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
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--●20210916_01_scott 에서 문제 풀이 계속,,

--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
-- NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
-- 구조를 갖고 있는 대상 테이블에 데이터 입력 시
-- NUM 컬럼(사원번호)의 값은 
-- 기존 부여된 사원번호 마지막 번호의 그 다음 번호를 자동으로
-- 입력 처리할 수 있는 프로시저로 구성한다.
-- 프로시저 명 : PRC_INSA_INSERT(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG);

/*
실행 예)
EXEC PRC_INSA_INSERT(이다영, '951027-2234567',SYSDATE, '서울', '010-4113-2353', '영업부', '대리', 10000000, 2000000); -- 천만, 이백만

프로시저 호출로 처리된 결과)
1061  이다영  951027-2234567  SYSDATE  서울  010-4113-2353  영업부  대리  10000000  2000000
*/
--○ 내가 푼 풀이

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

--○ 잘 못 입력했을 때 프로시저 삭제하는 구문 → 삭제하고 다시 작성
DROP PROCEDURE PRC_INSA_INSERT;

--○ 강사님 풀이

--매개변수 선언 ①
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
IS --INSERT 쿼리문에 수행에 필요한 변수 추가 선언 ③
    V_NUM      TBL_INSA.NUM%TYPE;
BEGIN   
    -- 선언한 변수에 값 담아내기 ④
    SELECT MAX(NUM)+1 INTO V_NUM
    FROM TBL_INSA;
    --INSERT 쿼리문 구성   ②
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
          -------
--           ⑤
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.