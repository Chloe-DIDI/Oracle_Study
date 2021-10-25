SELECT USER
FROM DUAL;
--==>> SCOTT


--■■■ UPDATE ■■■--

-- 1. 테이블에서 기존 데이터를 변경하는 구문.

-- 2. 형식 및 구조
-- UPDATE 테이블명
-- SET 컬럼명 = 변경할 값[, 컬럼명 = 변경할 값, 컬럼명 = 변결할 값]
-- [WHERE 조건절]

SELECT *
FROM TBL_SAWON;


-- 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--◆ 순서 
/*
UPDATE      -②
SET         -③        -- 여러가지를 바꾸어야 할 때에   ,    로 구분해준다
WHERE       -①           즉, 중첩된 조건이 아니라, 각각 따로 실행되는 조건이어서 논리연산자가 아닌 (,)로 연결
*/
--○ TBL_SAWON 테이블에서 사원번호 1003번 사원의
--   주민번호를 『9907222234567』로 수정한다.

UPDATE TBL_SAWON
SET JUBUN = '9907222234567'     --> 변경
WHERE SANO = 1003;              --> 조건
--==>> 1 행 이(가) 업데이트되었습니다.

-- 변경되었는지 확인
SELECT *
FROM TBL_SAWON;

-- 업데이트 실행 & 확인 후 완료되었으면 COMMIT 또는 
--                 다시 변경해야된다면  ROLLBACK   반드시 선택적으로 실행
COMMIT;
--==>> 커밋 완료.


--○ TBL_SAWON 테이블에서 1005번 사원의 입사일과 급여를 
--   각각 2018-02-22, 1200 으로 변경한다.
UPDATE TBL_SAWON
SET HIREDATE = '2018-02-22', SAL = '1200'  
WHERE SANO = 1005;      

-- 변경되었는지 확인
SELECT *
FROM TBL_SAWON;

COMMIT;
--==>> 커밋 완료.




--○ TBL_INSA 테이블 복사(데이터만)
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==>> Table TBL_INSABACKUP이(가) 생성되었습니다.


--○ TBL_INSABACKUP 테이블에서
--   직위가 과장과 부장만 수당 10% 인상~!!
SELECT *
FROM TBL_INSABACKUP;

-- UPDATE 전에 실행할 조건 SELECT 로 확인해보기(UPDATE 하면 되돌릴 수 없음)
SELECT NAME, JIKWI, BASICPAY, SUDANG+(SUDANG*0.1)"10% 인상 된 수당" 
FROM TBL_INSABACKUP          --------------------
WHERE JIKWI IN ('과장', '부장');    --SUDANG*1.1 이랑 같음

--==>>
/*
홍길동	부장	200000	220000
이순애	부장	160000	176000
이기자	과장	150000	165000
김종서	부장	130000	143000
이상헌	과장	150000	165000
박문수	과장	165000	181500
김인수	부장	170000	187000
김영길	과장	170000	187000
정정해	과장	124000	136400
지재환	부장	160000	176000
최석규	과장	187000	205700
문길수	과장	150000	165000
허경운	부장	150000	165000
권영미	과장	104000	114400
이미경	부장	160000	176000
*/


-- SELECT 확인 후 UPDATE 로 변경 하기
UPDATE TBL_INSABACKUP   
SET SUDANG = SUDANG*1.1
WHERE JIKWI IN ('과장', '부장');
--==>> 15개 행 이(가) 업데이트되었습니다.

--○ 수당 바뀐거 확인
SELECT *
FROM TBL_INSABACKUP;



--○ TBL_INSABACKUP 테이블에서 전화번호가 016, 017, 018, 019 로 시작하는
--   전화번호인 경우 이를 모두 010 으로 변경한다.
SELECT *
FROM TBL_INSABACKUP;


-----내 풀이
--          이거 붙이고 TEL에서 016- 이렇게 4자리를 떼야되서 ★
            -----                                       ㅣ
SELECT TEL, '010' || SUBSTR(TEL, 4)"변경된전화번호"  -- ↓
FROM TBL_INSABACKUP             --- 여기서 하나만 이렇게 적으면 뭔지,, - 이유 알아냄 ★ 보기
WHERE SUBSTR(TEL,1,3) IN ('016','107','018','019');

-----강사님 풀이

SELECT TEL "기존전화번호", '010' || SUBSTR(TEL, 4)"변경된전화번호"
FROM TBL_INSABACKUP
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');

--                        ↓
UPDATE TBL_INSABACKUP
SET TEL = '010' || SUBSTR(TEL, 4)
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');
--==>> 24개 행 이(가) 업데이트되었습니다.

COMMIT;
--==>> 커밋 완료

--○ TBL_SAWON 테이블 백업 (2021-09-10 16:10)
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP이(가) 생성되었습니다.




--○ 확인
SELECT *
FROM TBL_SAWONBACKUP;
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP이(가) 생성되었습니다.
--> TBL_SAWON 테이블의 데이터들만 백업을 수행
--  즉, 다른 이름의 테이블 형태로 저장해 둔 상황.


/*

 실행은 해서 적용 X - 백업을 만들어야 하는 이유
 EX) 이름이 다 똘똘이로 바꼈을 때

UPDATE TBL_SAWON
SET SANAME='똘똘이';

COMMIT;

SELECT *
FROM TBL_SAWON;

ROLLBACK;

SELECT *
FROM TBL_SAWON;
-- 위와 같이... UPDATE 처리 이후에 COMMTIT 을 수행하였기 때문에
-- 백날 해봐야... ROLLBACK 은 불가능한 상황이다.
-- 하지만, TBL_SAWONBACKUP 테이블에 데이터를 백업해 두었다.
-- SANAME 컬럼의 내용만 추출하여 똘똘이 대신 넣어줄 수 있다는 것이다.

*/

--====================

UPDATE TBL_SAWON 
SET SANAME='김소연'
WHERE SANO='1001';

UPDATE TBL_SAWON 
SET SANAME='이다영'
WHERE SANO='1002';

        :

UPDATE TBL_SAWON 
SET ...
WHERE ...;


이름을 바꾸어야 되는데 사원이 150명있으면??????????? 150번 바꿔야되니까 말도 안된다
이럴때 사용한다.

UPDATE TBL_SAWON
SET SANAME=(TBL_SAWONBACKUP 테이블의 1001번 사원의 사원명);

UPDATE TBL_SAWON
SET SANAME=(TBL_SAWONBACKUP 테이블의 각자 자기 사원번호의 사원의 사원명);

--    ↓

--※ 서브 쿼리를 이용하여,,
UPDATE TBL_SAWON
SET SANAME = ( SELECT SANAME
               FROM TBL_SAWONBACKUP
               WHERE SANO = TBL_SAWON.SANO );

UPDATE TBL_SAWON
SET SANAME = ( SELECT SANAME
               FROM TBL_SAWONBACKUP
               WHERE SANO =1001 );        --→ '김소연'

UPDATE TBL_SAWON
SET SANAME = ( SELECT SANAME
               FROM TBL_SAWONBACKUP
               WHERE SANO =1002 );        --→ '이다영'

        ↓

UPDATE TBL_SAWON
SET SANAME = ( SELECT SANAME
               FROM TBL_SAWONBACKUP
               WHERE SANO = TBL_SAWON.SANO );
--==>> 15개 행 이(가) 업데이트되었습니다.


SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	김소연	9307302234567	2021-09-03	5000
1002	이다영	9510272234567	2010-11-05	2000
1003	이지영	9907222234567	2012-08-16	1000
1004	손다정	9406032234567	1999-02-02	4000
1005	이하이	0406034234567	2018-02-22	1200
1006	이이경	0202023234567	2011-08-17	2000
1007	김이나	8012122234567	1999-11-11	3000
1008	아이유	8105042234567	1999-11-11	3000
1009	선동열	7209301234567	1995-11-11	3000
1010	선우옹녀	7001022234567	1995-10-10	3000
1011	선우선	9001022234567	2001-10-10	2000
1012	남진	8009011234567	1998-02-13	4000
1013	남궁현	8203051234567	2002-02-13	3000
1014	남도일	9208091234567	2002-02-13	3000
1015	김남길	0202023234567	2015-01-10	2000
*/

COMMIT;
--==>> 커밋 완료


