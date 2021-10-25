SELECT USER
FROM DUAL;
--==>>SCOTT

SELECT *
FROM TBL_EMP;


--○ 문제 
--   TBL_EMP 테이블에서 입사일이 1981년9월28일입사한 직원의
--   사원명,직종명,입사일 항목을 조회한다

--<문제 틀>
--SELECT 사원명,직종명,입사일 항목
--FROM TBL_EMP
--WHERE 입사일이 1981년9월28일입사한 직원

SELECT ENAME"사원명",JOB"직종명",HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';      --결과는 나오지만 틀린구문이다 : 문자열이기 때문이다
                                    --오라클에서 날짜를자동형변환
--==>>사원명    직종명        입사일
--    MARTIN       SALESMAN       81/09/28

--○ TO_DATE() 함수 _ 날짜 변환
SELECT ENAME"사원명",JOB"직종명",HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM--DD');
--==>>사원명       직종명        입사일
--    MARTIN       SALESMAN       81/09/28

--※ 날짜 형식에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session이(가) 변경되었습니다.

SELECT ENAME"사원명",JOB"직종명",HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM--DD');
--==>>MARTIN   SALESMAN   1981-09-28

--○  문제 
--    TBL_EMP테이블에서 입사일이 1981년 9월28일이후 (해당일 포함)로 입사한 직원의
--    사원명,직종명,입사일 항목을 조회합니다

-- 전체 테이블 확인하기
        --SELECT ENAME"사원명",JOB"직종명",HIREDATE"입사일"
        --FROM TBL_EMP;
        --WHERE 1981년 9월28일이후 (해당일 포함)로 입사한 직원
--해결
SELECT ENAME"사원명",JOB"직종명",HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28 ', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
*/
--※ 오라클에서는 날짜 데이터의 크기 비교가 가능하다.
--   오라클에서 날짜 데이터에 대한 크기 비교 시
--   과거보다 미래를 더 큰 값으로 간주하여 처리하게 된다.




