SELECT USER
FROM DUAL;


--■■■ PL/SQL ■■■--

-- 1. PL/SQL(Procedural Language extension to SQL) 은
--    프로그래밍 언어의 특성을 가지는 SQL 의 확장이며,
--    데이터 조작과 질의 문장은 PL/SQL 의 절차적 코드 안에 포함된다.
--    또한 PL/SQL을 사용하면 SQL로 할 수 없는 절차적 작업이 가능하다.
--    여기에서 『절차적』이라는 단어가 가지는 의미는
--    어떤 것이 어떤 과정을 거쳐 어떻게 완료되는지
--    그 방법을 정확하게 코드에 기술한다는 것을 의미한다.

-- 2. PL/SQL 은 절차적으로 표현하기 위해
--    변수를 선언할 수 있는 기능,
--    참과 거짓을 구별할 수 있는 기능,
--    실행 흐름을 컨트롤할 수 있는 기능 등을 제공한다.

-- 3. PL/SQL 은 블럭 구조로 되어 있으며
--    블럭은 선언 부분, 실행 부분, 예외 처리 부분의
--    세 부분으로 구성되어 있다.
--    또한, 반드시 실행 부분은 존재해야 하며, 구조는 다음과 같다.

-- 4. 형식 및 구조
/*
[DECLARE]
    -- 선언문(declarations)
BEGIN
    -- 실행문(statements)
    
    [EXCEPTION]
        -- 예외 처리문(exception handlers)
END;
*/

-- 5. 변수 선언
/*
DECLARE
    INT NUM;        (JAVA)
    NUM    NUMBER;  (Oracle)
    변수명 자료형;
    변수명 자료형 := 초기값;
BEGIN 
    PL/SQL 구문;
END;    
*/
--> 오라클에서의 대입연산자는(②좌측항 대입 := ①우측항) 이다.


--○ BEGIN 의 실행부를 출력하기 위해 환경변수 설정 변경
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.
--> 『DBMS_OUTPUT.PUT_LINE()』을 통해
--  화면에 결과를 출력하기 위한 환경변수 설정


--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE 
    -- 선언부 (연산은 불가능하다)
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(20) := 'Oracle';
BEGIN  
    -- 실행부
    -- cf. System.out.println(); -- JAVA
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>> 
/*
10
HELLO
Oracle

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE
    -- 선언부
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(20) := 'Oracle';
BEGIN
    -- 실행부
    D1 := D1 * 10;                  -- V1 *= 10;
    D2 := D2 || ' 수지';            -- V2 += "수지"
    D3 := D3 || ' World';           --
    
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
    
END;
--==>>
/*
100
HELLO 원영
Oracle World
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



--○ IF문(조건문) --> 괄호로 묶어서 처리해야 조건이 복잡해도 문제가 안 생김 
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL 의 IF 문장은 다른 언어의 IF 조건문과 거의 유사하다.
--    일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.
--    TRUE 이면 THEN 과 ELSE 사이의 문장을 수행하고
--    FALSE 나 NULL 이면 ELSE 와 END IF 사이의 문장을 수행하게 된다.

-- 2. 형식 및 구조
/*
IF 조건
    THEN 처리구문;
ELSIF 
    THEN 처리구문;
ELSE(★THEN이 없음)
    처리구문; 
END IF;
*/

--○ 변수에 들어있는 값에 따라...
--   Excellent, Good, Fail 로 구분하여
--   결과를 출력하는 PL/SQL 구문을 작성한다.

--뼈대부터 작성
DECLARE
BEGIN
END;
--====== 이렇게 작성부터 먼저하고 하나씩 넣으면서 작성하기

DECLARE
    GRADE CHAR;
BEGIN 
    GRADE := 'C';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Fail
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

-->> 위에랑 같은 구문 복붙
DECLARE
    GRADE CHAR;
BEGIN 
    GRADE := 'B';       -->> B로 변경
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Good
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

DECLARE
    GRADE CHAR;
BEGIN 
    GRADE := 'A';       -->> A로 변경
    
    IF (GRADE = 'A')
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF (GRADE = 'B')
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Excellent
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ CASE문 (조건문)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. 형식 및 구조
/*
CASE 변수
    WHEN 값1
        THEN 실행문;
    WHEN 값2
        THEN 실행문;
    ELSE 
        실행문;
END CASE;
*/

--○ 변수에 들어있는 값에 따라...
--   Excellent, Good, Fail 로 구분하여
--   결과를 출력하는 PL/SQL 구문을 작성한다.
--   단, CASE 구문을 활용하여 작성한다.
DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    CASE GRADE 
        WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE 
            DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;
--==>>
/*
Excellent
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 외부 입력 처리

-- 1. ACCEPT 문 
-- ACCEPT 변수명 PROMPT '메세지';
-- 외부 변수로부터 입력받은 데이터를 내부 변수에 전달할 때
-- 『&외부변수명』 형태로 접근하게 된다.

--○ 정수 2개를 외부로부터(사용자로부터) 입력받아
--   이들의 덧셈 결과를 출력하는 PL/SQL 구문을 작성한다.
--<<
ACCEPT N1 PROMPT '첫 번째 정수를 입력하세요.';
ACCEPT N2 PROMPT '두 번째 정수를 입력하세요.';
-->> 위에 두 줄 드래그 해서 실행하면 "바인딩 창"이 뜬다.

DECLARE
    -- 주요 변수 선언 및 초기화
    NUM1    NUMBER := &N1;    
    NUM2    NUMBER := &N2;
    TOTAL   NUMBER := 0;
BEGIN
    -- 연산 및 처리
    TOTAL := NUM1 + NUM2;
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || TOTAL);
    
END;
--==>>
/*
10 + 20 = 30

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 사용자로부터 입력받은 금액을 화폐 단위로 출력하는 프로그램을 작성한다.
--   단, 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
/*
실행 예)
바인딩 변수 입력 대화창 → 금액 입력 : [    890 ]  

입력받은 금액 총액 : 890원
화폐단위 : 오백원 1, 백원 3, 오십원 1, 십원 4
*/
--○ 내가 풀이한 내용       --> 에러 뜸
ACCEPT N PROMPT '금액 입력 : [      ]';

DECLARE
-- 주요 변수 선언 및 초기화
    MONEY     NUMBER := &N;
    OBACKWON  NUMBER;
    BACKWON   NUMBER; 
    OSIBWON   NUMBER;
    SIBWON    NUMBER;
    TOTAL     NUMBER := &N;
BEGIN
    OBACKWON := TRUNC(MONEY/500);
    MONEY := MONEY-OBACKWON*500;
    BACKWON := TRUNC(MONEY/100);
    MONEY := MONEY-BACKWON*100;
    OSIBWON := TRUNC(MONEY/50);
    MONEY := MONEY-OSIBWON*50;
    SIBWON := TRUNC(MONEY/10);

    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || TOTAL || '원');
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 오백원 '|| OBACKWON || ', 백원 '|| BACKWON || ', 오십원 '|| OSIBWON || ', 십원 ' || SIBWON);
END;
--==>>
/*
입력받은 금액 총액 : 890원
화폐단위 : 오백원 1, 백원 3, 오십원 1, 십원 4
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 함께 풀이한 내용

ACCEPT INPUT PROMPT '금액 입력 : ';

DECLARE 
    --○ 주요 변수 선언 및 초기화
    MONEY   NUMBER := &INPUT;    -- 연산을 위해 담아둔 변수
    MONEY2  NUMBER := &INPUT;    -- 출력을 위해 담아둔 변수(연산 과정에서 값이 변하기 때문에...)
    M500    NUMBER;              -- 500원 짜리 갯수를 담아둘 변수
    M100    NUMBER;              -- 100원 짜리 갯수를 담아둘 변수
    M50     NUMBER;              --  50원 짜리 갯수를 담아둘 변수
    M10     NUMBER;              --  10원 짜리 갯수를 담아둘 변수
BEGIN
    --○ 연산 및 처리
    -- MONEY 를 500으로 나눠서 몫을 취하고 나머지는 버린다. → 500원의 갯수
    M500 := TRUNC(MONEY/500);
    
    -- MONEY 를 500으로 나눠서 몫은 버리고 나머지는 취한다. 
    -- 이 결과를 다시 MONEY 에 담아낸다.
    MONEY := MOD(MONEY, 500);
    
    --  MONEY 를 100으로 나눠서 몫을 취하고 나머지는 버린다. → 100원의 갯수
    M100 := TRUNC(MONEY/100);
    
    -- MONEY 를 100으로 나눠서 몫은 버리고 나머지는 취한다. 
    -- 이 결과를 다시 MONEY 에 담아낸다.
    MONEY := MOD(MONEY, 100);
    
    -- MONEY 를 50으로 나눠서 몫을 취하고 나머지는 버린다. → 50원의 갯수
    M50 := TRUNC(MONEY/50);
    
    -- MONEY 를 50으로 나눠서 몫은 버리고 나머지는 취한다. 
    -- 이 결과를 다시 MONEY 에 담아낸다.
    MONEY := MOD(MONEY, 50);
    
    -- MONEY 를 10으로 나눠서 몫을 취하고 나머지는 버린다. → 10원의 갯수
    M10 := TRUNC(MONEY/10);
    
    --○ 결과 출력
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || MONEY2 || '원');
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 오백원 '|| M500 || ', 백원 '|| M100 || ', 오십원 '|| M50 || ', 십원 ' || M10); 
    
END;
--> 바인딩 변수 입력 대화창에 870원 입력
/*
입력받은 금액 총액 : 870원
화폐단위 : 오백원 1, 백원 3, 오십원 1, 십원 2


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



--○ 기본 반복문
-- LOOP ~ END LOOP;

-- 1. 별도의 조건과 상관없이 무조건 반복하는 구문.

-- 2. 형식 및 구조
/*
LOOP
    -- 실행문;
   
    [EXIT WHEN 조건;]      -- 조건이 참인 경우 반복문을 빠져나간다. 

END LOOP
*/


--○ 1 부터 10 까지의 수 출력 (LOOP 활용)

DECLARE
    N   NUMBER;
BEGIN
    N := 1;       --> 1부터 시작~!
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        EXIT WHEN N>=10;            -- N이 10 이면 밑에 N+1때문에 11이므로 11일때 빠져나가라,, 이 뜻이다.
        N := N + 1;        -- N++;      N+=1;  이거랑 같은 뜻이다
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



--○ WHILE 반복문
-- WHILE LOOP ~ END LOOP;   => 자바의 WHILE 과 비슷

--1. 제어 조건이 TRUE 인 동안 일련의 문장을 반복하기 위해
--   WHILE LOOP 문장을 사용하게 된다.
--   조건은 반복이 시작될 때 체크하게 되어
--   LOOP 내의 문장이 한 번도 수행되지 않을 수도 있다.
--   LOOP 를 시작할 때 조건이 FALSE 이면 반복 문장을 탈출하게 된다.

--2. 형식 및 구조
/*
WHILE 조건 LOOP       -- 조건이 참인 경우에 반복 수행
    -- 실행문;
    
END LOOP;

*/


--○ 1 부터 10 까지의 수 출력 (WHILE LOOP 활용)
DECLARE
    N   NUMBER;
BEGIN 
    N := 0;
    WHILE N<10 LOOP
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;

--==>>
/*
1
2
3
4
5
6
7
8
9
10

PL/SQL 프로시저가 성공적으로 완료되었습니다.

*/



--○ FOR 반복문(JAVA의 'FOR EACH' 향상된 FOR문과 비슷)
-- FOR LOOP ~ END LOOP;

-- 1. 『시작 수』에서 1씩 증가하여
--    『끝냄 수』가 될 때까지 반복 수행한다.

-- 2. 형식 및 구조
/*
FOR 카운터 in [REVERSE] 시작수 .. 끝냄수 LOOP
    -- 실행문
END LOOP;
*/

--○ 1 부터 10 까지의 수 출력 (FOR LOOP 활용)

DECLARE
    N   NUMBER;  --> N이라는 변수를 NUMBER 타입으로 선언했다
BEGIN
    FOR N IN 1 .. 10 LOOP       -->> .. 이것만 실행 가능하다,, 다른거는 에러 뜸
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

-- REVERSE 사용한다면 ? 이렇게 나온다
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN REVERSE 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
10
9
8
7
6
5
4
3
2
1
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/




--○ 사용자로부터 임의의 단(구구단)을 입력받아
--   해당 단수의 구구단을 출력하는 PL/SQL 구문을 작성한다.
/*
실행 예)
바인딩 변수 입력 대화창 → 단을 입력하세요 : [     2 ]
2 * 1 = 2
2 * 2 = 4
  :
2 * 9 = 18
*/
SET SERVEROUTPUT ON;
--1. LOOP 문의 경우

ACCEPT NUM PROMPT '단을 입력하세요 : ';

DECLARE
    DAN  NUMBER := &NUM;
    N    NUMBER;
BEGIN
    N := 1;
    LOOP 
        DBMS_OUTPUT.PUT_LINE(DAN|| '*' ||N||'='||(DAN*N));
        EXIT WHEN N >= 9;
        N := N + 1;
    END LOOP;
END;
--==>>
/* 1 넣고 3 넣고
1*1=1
1*2=2
1*3=3
1*4=4
1*5=5
1*6=6
1*7=7
1*8=8
1*9=9


PL/SQL 프로시저가 성공적으로 완료되었습니다.

*/

--2. WHILE LOOP 문의 경우

ACCEPT NUM PROMPT '단을 입력하세요 : ';

DECLARE
    DAN  NUMBER := &NUM;
    N    NUMBER;
BEGIN
    N := 0;
    WHILE N<9 LOOP
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(DAN|| '*' ||N||'='||(DAN*N));
    END LOOP;
END;
--==>>
/*
4*1=4
4*2=8
4*3=12
4*4=16
4*5=20
4*6=24
4*7=28
4*8=32
4*9=36


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--3. FOR LOOP 문의 경우

ACCEPT NUM PROMPT '단을 입력하세요 : ';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN 
    FOR N IN 1 .. 9 LOOP
       DBMS_OUTPUT.PUT_LINE(DAN || '*' || N || '=' || (DAN*N));
    END LOOP;
END;














