SELECT USER
FROM DUAL;

--※ 어제 문제 풀이
SELECT FILENO "파일번호", FILENAME "경로포함파일명", REVERSE(FILENAME) "거꾸로"
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

SELECT FILENO "파일번호", FILENAME "경로포함파일명"
     , SUBSTR(REVERSE(FILENAME), 1, -1) "거꾸로된파일명"
       -----뽑아내야되서        --- ---    
          --        처음부터라서」   ㄴ최초 '\'가 등장하는 위치에서 -1을 하겠다. 
FROM TBL_FILES;

-- 최초 '\'가 등장하는 위치 
INSTR(REVERSE(FILENAME), '\', 1)        -- 마지막 매개변수 1 생략


SELECT FILENO "파일번호", FILENAME "경로포함파일명"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1)-1) "거꾸로된파일명"
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

SELECT FILENO "파일번호"--, FILENAME "경로포함파일명"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1)-1)) "거꾸로된파일명"
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


--○ LPAD()      왼쪽
--> Byte 공간을 확보하여 왼쪽부터 문자로 채우는 기능을 가진 함수
SELECT 'ORACLE' "1"
     , LPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	****ORACLE
--① 1Byte 공간을 확보한다.                    → 두 번째 파라미터 값에 의해...
--② 확보한 공간에 'ORACLE' 문자열을 담는다.   → 첫 번째 파라미터 값에 의해...
--③ 남아잇는 Byte 공간을 왼쪽부터 세 번째 파라미터 값으로 채운다.
--④ 이렇게 구성된 최종 결과값을 반환한다.


--○ RPAD()      오른쪽
--> Byte 공간을 확보하여 오른쪽부터 문자로 채우는 기능을 가진 함수
SELECT 'ORACLE' "1"
     , RPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	ORACLE****
--① 1Byte 공간을 확보한다.                    → 두 번째 파라미터 값에 의해...
--② 확보한 공간에 'ORACLE' 문자열을 담는다.   → 첫 번째 파라미터 값에 의해...
--③ 남아잇는 Byte 공간을 오른쪽부터 세 번째 파라미터 값으로 채운다.
--④ 이렇게 구성된 최종 결과값을 반환한다.


--○ LTRIM()      
SELECT 'ORAORAROACLEROACLE' "1"         --오라 오라 오라클 오라클
     , LTRIM('ORAORAROACLEROACLE', 'ORA') "2"
                                    -----ORA 가 있으면 자르는 것
     , LTRIM('AAAORAORAROACLEROACLE', 'ORA') "3"
                                      ---- 손톱깍기이니,,,,O, R, A 하나씩 확인하면서 삭제....그래서
                                        -- AAA도 O ,R ,A 에서 A 가 있으니 하나씩 삭제되는것,,
     , LTRIM('ORAoRAROACLEROACLE', 'ORA') "4"
     , LTRIM('ORA ORAROACLEROACLE', 'ORA') "5"  -- 공백 인정됨
     , LTRIM('          ORAORAROACLEROACLE', ' ') "6"   -- 왼쪽 공백 삭제됨
     , LTRIM('                       OACLE') "7"        -- 왼쪽 공백 제거 함수로 활용(두 번째 파라미터 생략)
FROM DUAL;                         
--==>> 
/*
ORAORAROACLEROACLE	CLEROACLE	CLEROACLE	oRAROACLEROACLE	 ORAROACLEROACLE	ORAORAROACLEROACLE	OACLE
*/
--> 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
--  왼쪽부터 연속적으로 두 번째 파라미터 값에서 지정한 글자와 같은 글자가 등장할 경우
--  이를 제거한 결과값을 반환한다.
--  단, 완성형으로 처리되지 않는다.

SELECT LTRIM('이김신이김신이이신신김이신신이이김김이신박이김신', '이김신') "TEST"
FROM DUAL;
--==>> 박이김신


--○ RTRIM()      
SELECT 'ORAORAROACLEROACLE' "1"         --오라 오라 오라클 오라클
     , RTRIM('ORAORAROACLEROACLE', 'ORA') "2"
                                    -----ORA 가 있으면 자르는 것
     , RTRIM('AAAORAORAROACLEROACLE', 'ORA') "3"
                                      ---- 손톱깍기이니,,,,O, R, A 하나씩 확인하면서 삭제....그래서
                                        -- AAA도 O ,R ,A 에서 A 가 있으니 하나씩 삭제되는것,,
     , RTRIM('ORAoRAROACLEROACLE', 'ORA') "4"
     , RTRIM('ORA ORAROACLEROACLE', 'ORA') "5"  -- 공백 인정됨
     , RTRIM('          ORAORAROACLEROACLE', ' ') "6"   -- 왼쪽 공백 삭제됨
     , RTRIM('ORACLE                   ') "7"        -- 왼쪽 공백 제거 함수로 활용(두 번째 파라미터 생략)
FROM DUAL;      
--==>> 
/*
ORAORAROACLEROACLE	CLEROACLE	CLEROACLE	oRAROACLEROACLE	 ORAROACLEROACLE	ORAORAROACLEROACLE	OACLE
*/
--> 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
--  오른쪽부터 연속적으로 두 번째 파라미터 값에서 지정한 글자와 같은 글자가 등장할 경우
--  이를 제거한 결과값을 반환한다.
--  단, 완성형으로 처리되지 않는다.


--○ TRANSLATE()
--> 1:1 로 바꾸어준다.
SELECT TRANSLATE('MY ORACLE SERVER'                --EX) MY~ 에서 M부터 시작
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'     -- ~LMN~ 에서 M을 찾았다.
                , 'abcdefghijklmnopqrstuvwxyz') "RESULT"  -- lmn에서 m 이걸로 바꾼다
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-8743-7042'
                , '0123456789'
                , '영일이삼사오육칠팔구') "RESULT"
FROM DUAL;
--==>> 영일영-팔칠사삼-칠영사이

--○ REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '오라')
FROM DUAL;
--==>> MY 오라CLE 오라HOME

--------------------------------------------------------------------------------

--○ ROUND() 반올림을 처리해주는 함수
SELECT 48.678 "1" --「  여기서 2는 여기까지 표시해주세요
     , ROUND(48.678,2) "2"  -- 소수점 이하 둘째자리까지 표현 (→ 셋째 자리에서 반올림)
     , ROUND(48.678,2) "3"
     , ROUND(48.678,1) "4"  -- 소수점 이하 첫째자리까지 표현
     , ROUND(48.678,0) "5"  -- 정수로 표현(아래랑 같음)
     , ROUND(48.678) "6"    -- 정수로 표현!!!! 두번째 파라미터 값이 0일 경우 생략가능
     , ROUND(48.678,-1) "7" -- 십의 자리까지 유효하게 표현하라는 것!!! 즉, 48에서 8이 반올림
     , ROUND(48.678,-2) "8"
     , ROUND(48.678,-3) "9"
FROM DUAL;
--==>>  48.678	48.68	48.68	48.7	49	49	50	0	0


--○ TRUNC() 절삭을 처리해주는 함수
SELECT 48.678 "1" --「  여기서 2는 여기까지 표시해주세요
     , TRUNC(48.678,2) "2"  -- 소수점 이하 둘째자리까지 표현 (→ 셋째 자리부터 잘라버리기)
     , TRUNC(48.678,2) "3"
     , TRUNC(48.678,1) "4"  -- 소수점 이하 첫째자리까지 표현
     , TRUNC(48.678,0) "5"  -- 정수로 표현(아래랑 같음)
     , TRUNC(48.678) "6"    -- 정수로 표현!!!! 두번째 파라미터 값이 0일 경우 생략가능
     , TRUNC(48.678,-1) "7" -- 십의 자리까지 유효하게 표현하라는 것!!! 즉, 48에서 8 버리기
     , TRUNC(48.678,-2) "8"
     , TRUNC(48.678,-3) "9"
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0

--○ MOD() 나머지를 반환하는 함수 
SELECT MOD(5,2) "RESULT"
FROM DUAL;
--==>> 1
--> 5를 2로 나눈 나머지 결과값 반환


--○ POWER() 제곱의 결과를 반환하는 함수
SELECT POWER(5, 3) "RESULT"
FROM DUAL;
--==>> 125
--> 5의 3승을 결과값으로 반환

--○ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2)
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> 루트 2 에 대한 결과값 반환



--○ LOG() 로그 함수
--   (※ 오라클은 상용로그만 지원하는 반면, MSSQL 은 상용로그, 자연로그 모두 지원한다.)
SELECT LOG(10,100), LOG(10,20)
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677


--○ 삼각 함수
--   싸인, 코싸인, 탄젠트 결과값을 반환한다.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/

--○ 삼각함수의 역함수 (범위 : -1 ~ 1)
--   어싸인, 어코싸인, 어탄젠트 결과값을 반환한다.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805	
0.4636476090008061162142562314612144020295
*/



--○ SIGN()      서명, 부호, 특징
-->  연산 결과값이 양수이면 1, 0 이면 0, 음수이면 -1 을 반환한다.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-8)
FROM DUAL;
--==>> 1	0	-1
--> 양수   0  음수  인지만 구별
--> 매출이나 수지와 관련하여 적자 및 흑자의 개념을 나타낼 때 주로 사용한다.


--○ ASCII(), CHR()  → 서로 상응하는 개념의 함수
SELECT ASCII('A') "RESULT1", CHR(65) "RESULT2"
FROM DUAL;
--==>> 65	A
--> ASCII() : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
--  CHR()   : 매개변수로 넘겨받은 숫잘를 아스키코드 값으로 취하는 문자를 반환한다.

------------------------------------------------------------------------------------

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--※ 날짜 연산의 기본 단위는 DAY(일수)    CHECK~!!!!!

SELECT SYSDATE "1", SYSDATE+1 "2", SYSDATE-2 "3", SYSDATE+3 "4"
FROM DUAL;
--==>>
/*
2021-09-02 10:36:05	        -- 현재
2021-09-03 10:36:05	        -- 1일 후
2021-08-31 10:36:05	        -- 2일 전
2021-09-05 10:36:05         -- 3일 후
*/

--○ 시간 단위 연산
SELECT SYSDATE "1", SYSDATE + 1/24 "2", SYSDATE -2/24 "3"
FROM DUAL;
--==>>
/*
2021-09-02 10:38:10	        -- 현재
2021-09-02 11:38:10	        -- 1시간 후
2021-09-02 08:38:10         -- 2시간 전 
*/

--○ 현재 시간과..... 현재 시간 기준 1일 2시간 3분 4초 후를 조회한다.
/*
--------------------------------------------------------------------------------
             현재 시간                         연산 후 시간
--------------------------------------------------------------------------------
        2021-09-02 10:40:13                 2021-09-03 12:43:17
--------------------------------------------------------------------------------

*/
-- 방법 1.
SELECT SYSDATE "현재 시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "연산 후 시간"
FROM DUAL;                   --  시간 하루60분 시간   하루60초   
--==>> 2021-09-02 11:01:30	2021-09-03 13:04:34

--방법 2  (초단위 계산)
SELECT SYSDATE "현재 시간"
     , SYSDATE + ((24*60*60) + (2*60*60)  + (3*60) + 4) / (24*60*60) "연산 후 시간"
    --                1일        2시간         3분          
FROM DUAL;
--==>> 2021-09-02 11:07:23	2021-09-03 13:10:27


--○ 날짜 - 날짜 = 일수
-- ex) (2021-12-28) - (2021-09-02)
--        수료일          현재일
SELECT TO_DATE('2021-12-28', 'YYYY-MM-DD') - TO_DATE('2021-09-02', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 117

--○ 데이터 타입이 변환
SELECT TO_DATE('2021-09-02', 'YYYY-MM-DD') "결과"         -- 날짜 형식으로 변환
FROM DUAL;
--==>> 2021-09-02 00:00:00

SELECT TO_DATE('2021-13-02', 'YYYY-MM-DD') "결과"  
FROM DUAL;
--==>> 에러 발생
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month
*/

SELECT TO_DATE('2021-09-31', 'YYYY-MM-DD') "결과"        
FROM DUAL;
--==>> 에러 발생
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month
*/

SELECT TO_DATE('2021-09-31', 'YYYY-MM-DD') "결과"        
FROM DUAL;
--==>> 2020-02-29 00:00:00


--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 진행할 때
--   내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다~!!!

--○ ADD_MONTHS() : 개월 수를 더해주는 함수
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
--> 월을 더하고 빼기

--※ 날짜에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--○ MONTHS_BETWEEN() : 첫 번째 인자값에서 두 번째 인자밗을 뺀 개월 수를 반환
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "결과확인"
FROM DUAL;
--=>> 231.07982788231780167264038231780167264

--> 개월 수의 차이를 반환하는 함수
--※ 결과값의 부호가 『-』로 반환되었을 경우에는
--   첫 번째 인자값에 해당하는 날짜보다
--   두 번째 인자값에 해당하는 날짜가 『미래』라는 의미로 확인할 수 있다.

--> 미래는 결과가 음수로 나옴
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2021-12-28', 'YYYY-MM-DD')) "결과확인"
FROM DUAL;
--==>> -3.82335461469534050179211469534050179211

--○ NEXT_DAY() : 첫 번째 인자값을 기준 날짜로 돌아오는 가장 빠른 요일 반환
SELECT NEXT_DAY(SYSDATE, '토')
FROM DUAL;
--==>> 2021-09-04
--> SYSDATE(오늘날짜) 기준으로 가장 빠르게 다가오는 토요일이 2021-09-04 이다.라는 뜻

SELECT NEXT_DAY(SYSDATE, '토') "결과1", NEXT_DAY(SYSDATE, '월') "결과2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06

--○ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session이(가) 변경되었습니다.

--○ 세션 설정을 변경한 후 위의 쿼리문을 다시 한 번 조회
SELECT NEXT_DAY(SYSDATE, '토') "결과1", NEXT_DAY(SYSDATE, '월') "결과2"
FROM DUAL;
--==>> 에러 발생
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*/

-- 이런경우 어떻게 조회를 해야되나?????????????????
SELECT NEXT_DAY(SYSDATE, 'SAT') "결과1", NEXT_DAY(SYSDATE, 'MON') "결과2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06

-- 이렇게 하면 나온다.

--○ 추가 세션 설정 다시 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN'; 
--==>> Session이(가) 변경되었습니다.

-- ★★★ 그러면 영어로 바꿨을 때가 안돌아가고 초반에꺼는 또 돌아간다.★★★



--○ LAST_DAY() : 해당 날짜가 포함되어 있는 그 달의 마지막 날을 포함한다.
SELECT LAST_DAY(SYSDATE) "결과 확인"
FROM DUAL;    --SYSDATE는 오늘 날짜인 2021-09-02 가 들어가있다.
--==>> 2021-09-30

SELECT LAST_DAY(TO_DATE('2020-02-05', 'YYYY-MM-DD')) "결과 확인"
FROM DUAL;
--==>> 2020-02-29

SELECT LAST_DAY(TO_DATE('2021-02-05', 'YYYY-MM-DD')) "결과 확인"
FROM DUAL;
--==>> 2021-02-28


--○ 오늘부로... 이중호 님이... 군대에 또 끌려(?)간다.
--   복무기간은 22개월로 한다.

-- 1. 전역 일자를 구한다.

SELECT ADD_MONTHS(SYSDATE, 22)
FROM DUAL;
--==>> 2023-07-02

-- 2. 하루 꼬박꼬박 3끼 식사를 해야 한다고 가정하면
--    중호가 몇 끼를 먹어야 집에 보내줄까?

--      복무기간 * 3
--      --------
--      (전역일자 - 현재일자)

--      (전역일자 - 현재일자) * 3
SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) *3
FROM DUAL;
--==>> 2004

--WHY? LASTDAT는 안쓰나? LASTDAY는 결과가 나오는 값인 달의 마지막날을 구하는 것이라 안쓴다
-- EX) 결과값이 2021-08-03 이라면 LASTDAY를 쓰면 2021-08-31 이 나온다. 결과값이 틀리게 나오기 때문에 안쓴다.

--○ 현재 날짜 및 시작으로부터... 수료일(2021-12-28 18:00:00)까지
--   남은 기간을... 다음과 같은 형태로 조회할 수 있도록 한다.
/*
--------------------------------------------------------------------------------
현재시각               | 수료일                |   일   |  시간  |  분  |  초
--------------------------------------------------------------------------------
2021-09-02 12:08:23    | 2021-12-28 18:00:00  |   116   |   15   |  2  |  37
--------------------------------------------------------------------------------
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--========= 선생님 풀이

--『1일 2시간 3분 4초』를... 『초』로 환산하면...
SELECT (1일) + (2시간) + (3분) + (4초)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>> 93784

-- 61초 → 1분 1초
SELECT MOD(61, 60)
FROM DUAL;
--==>> 1

--『93784』초를 다시 일, 시간, 분, 초로 환산하면...
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;
--==>> 1	2	3	4

-- 수료일까지 남은 기간 확인(날짜 기준)  →  단위 : 일수
SELECT 수료일자 - 현재일자
FROM DUAL;

--수료일자
SELECT TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 2021-12-28 18:00:00      → 날짜 형식

--현재일자
SELECT SYSDATE
FROM DUAL;
--==>> 2021-09-02 16:50:26      → 날짜 형식

SELECT TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 117.047662037037037037037037037037037037 → 단위 : 일수   → 숫자 형식
--> 수료일까지 남은 일스

-- 수료일까지 남은 기간 확인(날짜 기준) → 단위 : 초
SELECT (수료일까지 남은 일수) * (하루를 구성하는 전체 초)
FROM DUAL;

SELECT (수료일까지 남은 일수) * (24*60*60)
FROM DUAL;

SELECT (TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 10112759.99999999999999999999999999999997    →  단위 : 초  → 숫자 형식
--> 수료일까지 남은 초

--위에꺼 뽀려옴 복붙!//
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;

-- 93784를 (TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60) 로 복붙한다.

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) "시간"
     , MOD(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "분"
     , MOD((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60) "초"
FROM DUAL;

-- 현재 시각, 수료일자 추가
SELECT SYSDATE "현재시각"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일자"
     , TRUNC(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) "시간"
     , MOD(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "분"
     , MOD((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60) "초"
FROM DUAL;

-- 결과값이 소수점까지 나오니까 절삭을 해준다.??????!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT SYSDATE "현재시각"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일자"
     , TRUNC(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) "시간"
     , MOD(TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "분"
     , TRUNC(MOD((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)) "초"
FROM DUAL;

--==>> 최종~!!!!!!!!!!!!!!!!!!!
/*
--------------------------------------------------------------------------------
현재시각               | 수료일                |   일   |  시간  |  분  |  초
--------------------------------------------------------------------------------
2021-09-02	             2021-12-28	              117	     0	    22	   32
*/


--=======내가 푼 풀이

SELECT SYSDATE "현재 시각"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS')  "수료일자"
     , TRUNC(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"
     , TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24) 
        - TRUNC(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24 "시간"
     , TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) 
        - TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 )*60 "분"
     , TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60 *60) 
        - TRUNC((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) *60 "초"
FROM DUAL;
--==>> 
/*
현재시각               | 수료일                |   일   |  시간  |  분  |  초
--------------------------------------------------------------------------------
2021-09-02 15:26:29	    2021-12-28 18:00:00	      117	    2	    33	   30
*/

--==>> 한가지 의문!!!!!   ROUND 는 왜안되나요????????
--                   답~~~~  시간이 반올림되서 나옴~! 시간이 반올림되면 정확하지 않으니까~!^^
-- 오답! ▼
/*
SELECT SYSDATE "현재 시각"
     , TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS')  "수료일자"
     , ROUND(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"
     , ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24) 
       - ROUND(TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24 "시간"
     , ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) 
       - ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 )*60 "분"
     , ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60 *60) 
       - ROUND((TO_DATE('2021-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * 24 *60) *60 "초"
FROM DUAL;
*/


--○문제
-- 본인이 태어나서 현재까지...
-- 얼마만큼 일, 시간, 분, 초를 살았는지...(살도있는지...)
-- 조회하는 쿼리문을 구성한다.
/*
--------------------------------------------------------------------------------
현재시각               | 태어난 시각           |   일   |  시간  |  분  |  초
--------------------------------------------------------------------------------
2021-09-02 15:44:38   | 1994-06-03 09:00:00  |    ?    |   ?    |  ?   |  ?
--------------------------------------------------------------------------------
*/


SELECT SYSDATE "현재시각"
     , TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS') "태어난 시각" 
     , TRUNC(TRUNC(TRUNC((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60)/60), 24) "시간"
     , MOD(TRUNC((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60), 60) "분"
     , TRUNC(MOD((SYSDATE - TO_DATE('1994-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60), 60)) "초"
FROM DUAL;
--==>>
/*
--------------------------------------------------------------------------------
현재시각               | 태어난 시각           |   일   |  시간  |  분  |  초
--------------------------------------------------------------------------------
2021-09-02 15:33:20    | 1994-06-03 09:00:00  |   9953  |   6    |  44  |  38
--------------------------------------------------------------------------------
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--※ 날짜 데이터를 대상으로 반올림, 정삭을 수행할 수 있다.

--○ 날짜 반올림
SELECT SYSDATE "1"                  -- 2021-09-02   → 기본 현재 날짜
     , ROUND(SYSDATE, 'YEAR') "2"   -- 2022-01-01   → 년도까지 유효한 데이터(상반기, 하반기 기준으로 올림)
     , ROUND(SYSDATE, 'MONTH') "3"  -- 2021-09-01   → 월까지 유효한 데이터(15일 기준으로 올림)
     , ROUND(SYSDATE, 'DD') "4"     -- 2021-09-03   → 날짜까지 유효한 데이터(정오 기준으로 올림)
     , ROUND(SYSDATE, 'DAY') "5"    -- 2021-09-05   → 날짜까지 유효한 데이터(수요일 기준으로 올림)
FROM DUAL;

--○ 날짜 절삭
SELECT SYSDATE "1"                  -- 2021-09-02   → 기본 현재 날짜
     , TRUNC(SYSDATE, 'YEAR') "2"   -- 2022-01-01   → 년도까지 유효한 데이터
     , TRUNC(SYSDATE, 'MONTH') "3"  -- 2021-09-01   → 월까지 유효한 데이터
     , TRUNC(SYSDATE, 'DD') "4"     -- 2021-09-02   → 날짜까지 유효한 데이터
     , TRUNC(SYSDATE, 'DAY') "5"    -- 2021-08-29   → 날짜까지 유효한 데이터(전 주 일요일)
FROM DUAL;

--------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

-- TO_CHAR()     : 숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수
-- TO_DATE()     : 문자 데이터(날짜 형식)를 날짜 타입으로 변환시켜주는 함수
-- TO_NUMBER()   : 문자 데이터(숫자 형식)를 숫자 타입으로 변환시켜주는 함수

--※ 날짜나 통화 형식이 맞지 않을 경우
--   세션 설정값을 통해 설정을 변경할 수 있다.
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.

ALTER SESSION SET NLS_CURRENCY = '\';   --원(￦)
--==>> Session이(가) 변경되었습니다.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')   -- 2021-09-02   //날짜 처럼 보여지지만 알고보면 문자!!!!!!
     , TO_CHAR(SYSDATE, 'YYYY')         -- 2021
     , TO_CHAR(SYSDATE, 'YEAR')         -- TWENTY TWENTY-ONE
     , TO_CHAR(SYSDATE, 'MM')           -- 09
     , TO_CHAR(SYSDATE, 'MONTH')        -- 9월 
     , TO_CHAR(SYSDATE, 'MON')          -- 9월 
     , TO_CHAR(SYSDATE, 'DD')           -- 02
     , TO_CHAR(SYSDATE, 'DAY')          -- 목요일
     , TO_CHAR(SYSDATE, 'DY')           -- 목
     , TO_CHAR(SYSDATE, 'HH24')         -- 16
     , TO_CHAR(SYSDATE, 'HH')           -- 04
     , TO_CHAR(SYSDATE, 'HH AM')        -- 04 오후
     , TO_CHAR(SYSDATE, 'HH PM')        -- 04 오후
     , TO_CHAR(SYSDATE, 'MI')           -- 22
     , TO_CHAR(SYSDATE, 'SS')           -- 46
     , TO_CHAR(SYSDATE, 'SSSSS')        -- 58966            →  금일 흘러온 전체 초
     , TO_CHAR(SYSDATE, 'Q')            -- 3                 →  분기
FROM DUAL;

SELECT 2021 "1", '2021' "2"
FROM DUAL;

SELECT '23' "1", TO_NUMBER('23') "2"
FROM DUAL;


--○ EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "1"      -- 2021  → 연도를 추출하여 문자 타입으로...
     , TO_CHAR(SYSDATE, 'MM') "2"       -- 09    → 월을 추출하여 문자 타입으로...
     , TO_CHAR(SYSDATE, 'DD') "2"       -- 02    → 일을 추출하여 문자 타입으로...
     , EXTRACT(YEAR FROM SYSDATE) "4"   -- 2021  → 연도를 추출하여 숫자 타입으로...
     , EXTRACT(MONTH FROM SYSDATE) "4"  -- 9     → 월을 추출하여 숫자 타입으로...
     , EXTRACT(DAY FROM SYSDATE) "4"    -- 2     → 일을 추출하여 숫자 타입으로...
FROM DUAL;
--> 연, 월, 일 이하 다른 것은 불가

--○ TO_CHAR() 활용 → 형식 맞춤 표기 결과값 반환
SELECT 60000 "1"
     , TO_CHAR(60000, '99,999') "2"
     , TO_CHAR(60000, '$99,999') "3"
     , TO_CHAR(60000, 'L99,999') "4"
     , LTRIM(TO_CHAR(60000, 'L99,999')) "5" --> LTRIM 은 공백 없애줌
FROM DUAL;
--==>>  60000	    60,000	      $60,000	      \60,000


--○ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
SELECT SYSDATE "현재시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60*60)) + (4/(24*60*60)) "1일2시간3분4초후"
FROM DUAL;
--==>>
/*
2021-09-02 17:03:05	
2021-09-03 19:03:12
*/

--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "현재 시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "연산 결과"
FROM DUAL;
--==>>
/*
2021-09-02 17:06:20	
2022-11-05 21:11:26
*/

--------------------------------------------------------------------------------

--○ CASE 구문 (조건문, 분기문)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2는 몰라요' END "결과 확인"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2는 몰라요' END "결과 확인"
FROM DUAL;
--==>> 5+2는 몰라요

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '몰라요'
        END "결과 확인"
FROM DUAL;
--==>> 1+1=2

--○ DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2는 몰라요') "결과 확인"
FROM DUAL;
--==>> 5-2=3

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '비교불가'
        END "결과 확인"
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 THEN '범석만세'
            WHEN 5>2 OR 2=3 THEN '지윤만세'
            ELSE '현정만세'
        END "결과 확인"
FROM DUAL;
--==>> 범석만세
/*
SELECT CASE WHEN T THEN '범석만세'  --> 젤 위에 범석만세가 TRUE 니까 밑에껀 수행 안함!
            WHEN T THEN '지윤만세'
            ELSE '현정만세'
        END "결과 확인"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '해덕만세'
            WHEN 5<2 AND 2=3 THEN '지영만세'
            ELSE '진하만세'
        END "결과 확인"
FROM DUAL;
--==>> 해덕만세
/*
SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '해덕만세'
            WHEN 5<2 AND 2=3 THEN '지영만세'
            ELSE '진하만세'
        END "결과 확인"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '해덕만세'
            WHEN 5<2 AND 2=3 THEN '지영만세'
            ELSE '진하만세'
        END "결과 확인"
FROM DUAL;
--==>> 진하만세
/*
SELECT CASE WHEN F THEN '해덕만세'
            WHEN F THEN '지영만세'
            ELSE '진하만세'
        END "결과 확인"
FROM DUAL;
*/
