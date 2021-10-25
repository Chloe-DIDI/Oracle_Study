SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT * 
FROM TBL_입고;

--=====================================================================
--○ TBL_입고 테이블에서 입고수량을 수정(변경)하는 프로시저를 작성한다.
--   프로시저 명 : PRC_입고_UPDATE(입고번호, 변경할입고수량);
CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
( V_입고번호   IN TBL_입고.입고번호%TYPE
, V_입고수량   IN TBL_입고.입고수량%TYPE
)
IS
    -- 주요 변수 추가 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    
    -- 주요 변수 추가 선언
    V_이전입고수량  TBL_입고.입고수량%TYPE;
    
    -- 주요 변수 추가 선언
    V_재고수량      TBL_상품.재고수량%TYPE;
    
    -- 사용자 정의 예외 변수 추가 선언
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN    
    -- 상품코드 파악을 위해 쿼리 수행 이전의 내역 확인
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_이전입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
     
    IF (V_재고수량 - V_이전입고수량 + V_입고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR; 
    END IF;  

    -- 수행할 쿼리문 작성
    UPDATE TBL_입고
    SET 입고수량 = V_이전입고수량 + V_입고수량
    WHERE 입고번호 = V_입고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '입고 수량 부족~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


--===============================================================
--○ TBL_출고 테이블에서 출고수량을 삭제하는 프로시저를 작성한다.
--   프로시저 명 : PRC_출고_DELETE(출고번호);  --> 재고가 출고 이전의 상태로 돌아감
CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
( V_출고번호 IN TBL_출고.출고번호%TYPE
)
IS
    V_상품코드  TBL_상품.상품코드%TYPE;
    
    V_출고수량  TBL_출고.출고수량%TYPE;
    
    V_재고수량  TBL_상품.재고수량%TYPE;
    
BEGIN
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- 수행할 쿼리문 작성
    DELETE 
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
        

--===============================================================
--○ TBL_입고 테이블에서 입고수량을 삭제하는 프로시저를 작성한다.
--   프로시저 명 : PRC_입고_DELETE(입고번호);  --> 재고가 입고 이전의 상태로 돌아감
CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
( V_입고번호 IN TBL_입고.입고번호%TYPE
)
IS
    V_상품코드  TBL_상품.상품코드%TYPE;
    
    V_입고수량  TBL_입고.입고수량%TYPE;
    
    V_재고수량  TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    IF (V_재고수량 - V_입고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 수행할 쿼리문 작성
    DELETE 
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    --COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
         THEN RAISE_APPLICATION_ERROR(-20004, '입고 내역을 삭제할 수 없습니다.' );
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;

---------------------------------------------------------------------------------------------------------------------------------
-- 여기서 결과 확인 함!  20210917_02_scott 여기 아님! 여기서!--

                        -->> 뚜껑달려있는 스피링달린 광대
--■■■ CURSOR(커서) ■■■--

-- 1. 오라클에서 하나의 레코드가 아닌 여러 레코드로 구성된
--    작업 영역에서 SQL 문을 실행하고 그 과정에서 발생한 정보를
--    저장하기 위하여 커서(CURSOR)를 사용하며,
--    커서에는 암시적 커서와 명시적 커서가 있다.

-- 2. 암시적 커서는 모든 SQL 문에 존재하며,
--    SQL문 실행 후 오직 하나의 행(ROW)만 출력하게 된다.
--    그러나 SQL문을 실행한 결과물(RESULT SET)이
--    여러 행(ROW)으로 구성된 경우
--    커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다.


--○ 커서 이용 전 상황(단일 행 접근 시)
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
홍길동,011-2356-4528
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 커서 이용 전 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
END;
--==>> 에러 발생~!!
/*
01422. 00000 -  "exact fetch returns more than requested number of rows"
*/

--○ 커서 이용 전 상황(다중 행 접근 시 - 반복문을 활용하는 경우) 
--   V_NUM 이 시리얼 화(순차적) 되어있지 않은 상황에서는 못 씀
--   MIN값(스타트 값, V_NUM := 1001), MAX값(엔드 값, V_NUM >= 1061)을 직접 확인하고 넘겨줘야 쓸 수 있음

--==>>※ 실행했을 때 오류 나면 위에 SET SERVEROUTPUT ON; 이거 하기!
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
홍길동,011-2356-4528
이순신,010-4758-6532
이순애,010-4231-1236
김정훈,019-5236-4221
한석봉,018-5211-3542
이기자,010-3214-5357
        :
        :
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 커서 이용 후 상황(다중 행 접근 시)
--   V_NUM 이 시리얼 화(순차적) 되어있지 않은 상황에서도 쓸 수 있음
--   MIN값(스타트 값, V_NUM := 1001), MAX값(엔드 값, V_NUM >= 1061)을 직접 확인하지 않고 꺼내어 쓸 수 있음

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서 변수 선언(→ 커서 정의)
    CURSOR CUR_INSA_SELECT 
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
        
BEGIN
    
    -- 커서 오픈
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한 행 한 행 끄집어내어 가져오는 행위 → 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
                
    END LOOP;
    
    -- 커서 클로즈 (→ 오라클에 내부적으로 커서를 닫아주는 기능이 있어서 따로 명시하지 않아도 됨, 암시적 커서)
    CLOSE CUR_INSA_SELECT;
    
END;

--○ 커서 이용 후 상황(다중 행 접근 시)
--   V_NUM 이 시리얼 화(순차적) 되어있지 않은 상황에서도 쓸 수 있음
--   MIN값(스타트 값, V_NUM := 1001), MAX값(엔드 값, V_NUM >= 1061)을 직접 확인하지 않고 꺼내어 쓸 수 있음

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서 변수 선언(→ 커서 정의)
    CURSOR CUR_INSA_SELECT 
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
        
BEGIN
    
    -- 커서 오픈
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한 행 한 행 끄집어내어 가져오는 행위 → 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- 반복문을 빠져나가는 조건은...
        -- 커서로부터 아무것도 찾지 못했을 때...
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || ',' || V_TEL);
                
    END LOOP;
    -- 커서 클로즈 (→ 오라클에 내부적으로 커서를 닫아주는 기능이 있어서 따로 명시하지 않아도 됨, 암시적 커서)
    CLOSE CUR_INSA_SELECT;
    
END;
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


-------------------------------------------------------------------------------------------------------------------------------
--■■■ TRIGGER(트리거) ■■■--

-- 사전적인 의미 : 방아쇠, 촉발시키다, 야기하다, 유발하다

-- 1. TRIGGER(트리거)란 DML 작업 즉, INSERT, UPDATE, DELETE 작업이 일어날 때
--    자동적으로 실행되는(유발되는, 촉발되는) 객체로 
--    이와 같은 특징을 강조하여(부각시켜) DML TRIGGER 라고 부르기도 한다.
--    TRIGGER 는 데이터 무결성 뿐 아니라
--    다음과 같은 작업에도 널리 사용된다.

-- 자동으로 파생된 열 값 생성
-- 잘못된 트랜잭션 방지
-- 복잡한 보안 권한 강제 수행
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행
-- 복잡한 업무 규칙 강제 적용
-- 투명한 이벤트 로깅 제공
-- 복잡한 감사 제공
-- 동기 테이블 복제 유지관리
-- 테이블 엑세스 통계 수집


-- 2. TRIGGER 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.


-- 3. 특징 및 종류

-- BEFORE STATEMENT
-- SQL 구문이 실행되기 전에 그 문장에 대해 한 번 실행

-- BEFORE ROW
-- SQL 구문이 실행되기 전에(DML 작업을 수행하기 전에) 
-- 각 행(ROW)에 대해 한 번씩 실행

-- AFTER STATEMENT
-- SQL 구문이 실행된 후 그 문장에 대해 한 번 실행

-- AFTER ROW
-- SQL 구문이 실행된 후에(DML 작업을 수행한 후에)
-- 각 행(ROW)에 대해 한 번씩 실행


-- 4. 형식 및 구조
/*
CREATE [OR REPLACE] TRIGGER 트리거명
    [BEFORE | AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명 
    --> 이벤트 : DML 트리거(INSERT, UPDATE, DELETE) ON 테이블명 : 부비트랩 설치하는 테이블
    [FOR EACH ROW [WHEN TRIGGER 조건]] 
    --> ROW TRIGGER 에만 붙음 cf. STATEMENT TRIGGER
[DECLARE]
    -- 선언 구문;
BEGIN 
    -- 실행 구문;
END;
*/


--■■■ AFTER STATEMENT TRIGEER 상황 실습 ■■■--
--※ DML 작업에 대한 이벤트 기록

--○ TRIGGER(트리거) 생성(TRG_EVENTLOG)
CREATE OR REPLACE TRIGGER TRG_EVNETLOG
            AFTER 
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
DECLARE
BEGIN
    -- 이벤트 종류 구분(조건문을 통한 분기)
    IF (INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('INSERT 쿼리문이 수행되었습니다.');
    ELSIF (UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('UPDATE 쿼리문이 수행되었습니다.');
    ELSIF (DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('DELETE 쿼리문이 수행되었습니다.');
    END IF;
    
    --COMMIT;
    --※ TRIGGER 내에서는 COMMIT 구문 사용 불가~!!!
END;
--==>> Trigger TRG_EVNETLOG이(가) 컴파일되었습니다.





--■■■ BEFORE STATEMENT TRIGEER 상황 실습 ■■■--
--※ DML 작업 수행 전에 작업 가능여부 확인
--   (보안 정책 적용 / 업무 규칙 적용)

--○ TRIGGER(트리거) 작성(TRG_TEST1_DML)
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE 
        INSERT OR UPDATE OR DELETE ON TBL_TEST1  -- 한 테이블에 여러 개의 트리거 장착 가능★
--DECLARE(DECLARE 와 BEGIN 사이에 다른 선언 변수가 없을 때 생략 가능)
BEGIN
    IF ( TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8 
           OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        THEN RAISE_APPLICATION_ERROR(-20003, '작업은 08:00 ~ 18:00 까지 가능합니다.');
    END IF;        
END;
--==>> Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.


--■■■ BEFORE ROW TRIGEER 상황 실습 ■■■--
--※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델

--○ TRIGGER(트리거) 작성(TRG_TEST2_DELETE)
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
          BEFORE
          DELETE ON TBL_TEST2 --> TEST3 는 TEST2를 삭제하기 위해 사전에 삭제되는 것일뿐
          FOR EACH ROW 
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;
--==>> Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.

--※ 『:OLD』
--   참조 전 열의 값
--   (INSERT : 입력하기 이전 자료, DELETE : 삭제하기 이전 자료 즉, 삭제할 자료)

--※ UPDATE → DELETE 그리고 INSERT 가 결합된 형태
--             이 과정에서 UPDATE 하기 이전의 자료는 :OLD
--             이 과정에서 UPDATE 한 후의 자료는 :NEW



DELETE
FROM TBL_TEST2
WHERE CODE = 1;

