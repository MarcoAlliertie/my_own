-- 첫번째 SQL DEVELOPER
-- 인사담당자

SELECT 직원ID, 이름, 연봉
FROM 직원
WHERE 직원ID='A0005';

UPDATE 직원 SET 연봉 = 연봉 + 1000  -- 산술연산자 +=, -= 같은 건 오라클에선 안 쓰인다.
WHERE 직원ID='A0005';
COMMIT;

-- 별도의 세션으로 나눠서 실습

-- 두번째 SQL DEVELOPER
-- 일개 직원(문현철(A0005))

SELECT 직원ID, 이름, 연봉
FROM 직원
WHERE 직원ID='A0005'; 

-- COMMIT 쓰기 전까진 인사담당자 측 세션에서 변경한 데이터 반영이 안 된다.

SELECT *
FROM 직원;

-- 튜플들 옆에 임시로 부여되는 번호가 ROWNUM

SELECT ROWNUM AS RN, 직원ID, 이름
FROM 직원
WHERE ROWNUM<= 3;

--인라인 뷰
SELECT *
FROM (SELECT ROWNUM AS RN, 직원ID, 이름
FROM 직원)
WHERE RN = 3;

--연봉 상위 5명을 뽑고 싶은 경우 :

SELECT *
FROM 직원
WHERE 연봉 IS NOT NULL
-- AND ROWNUM<=5
ORDER BY 연봉 DESC;

-- ORDER BY보다 WHERE 절이 먼저 실행되므로 의도한 결과 발생 X
-- 정렬한 후에 5개의 값을 가져오면 되겠군 - TOP-N 기술

-- 위 SQL문 자체를 테이블로 설정하여 이를 SQL문으로 다시 가져온다!

SELECT *
FROM (SELECT *
      FROM 직원
      WHERE 연봉 IS NOT NULL
      -- AND ROWNUM<=5
      ORDER BY 연봉 DESC)
WHERE ROWNUM <=5;

-- 이게 바로 TOP-N 기술

SELECT * 
FROM (
      SELECT *  --띄어쓰기는 가시성을 위해서일 뿐임.
      FROM 직원
      WHERE 연봉 IS NOT NULL
      ORDER BY 연봉
      )
WHERE ROWNUM <= 3;

SELECT *
FROM (
      SELECT *
      FROM 직원
      WHERE 입사일시 IS NOT NULL
      ORDER BY 입사일시 DESC
      ) --날짜를 내림차순 정렬하면 가장 최근 날짜가 위에 온다. (숫자가 크므로)
WHERE ROWNUM<=3;

-- 아래는 게시판 테이블 만드는 SQL문

CREATE TABLE 게시판 ( 
게시판번호 NUMBER(9) PRIMARY KEY , 
작성자       VARCHAR2(50) NOT NULL , 
게시물내용 VARCHAR2(4000) NOT NULL  , 
작성일시 DATE   NOT NULL 
) ;

INSERT INTO 게시판
SELECT LEVEL                                -- 게시판번호
        , '아이디' || MOD(LEVEL , 10000)     -- 작성자 
        , '아이디' || 
           MOD(LEVEL , 10000) || 
           '님이 작성하신 게시물입니다. 이 게시물은 게시판 번호가 ' 
           || LEVEL 
           || '입니다'                       -- 게시물내용 
      , TO_DATE('20000101') + LEVEL         --2022년 1월1일부터 하루씩 게시물이 입력되는 것
  FROM DUAL
CONNECT BY LEVEL <=1000000;                 --100만건의 데이터 입력 

COMMIT; 

--


SELECT *
FROM 게시판;


SELECT *
FROM (
      SELECT * 
      FROM 게시판
      ORDER BY 작성일시 DESC
      )
WHERE ROWNUM<=20;

SELECT *
FROM(
      SELECT ROWNUM AS RN, A.*
      FROM(       
          SELECT *
          FROM 게시판
          ORDER BY 작성일시 DESC
          ) A
      WHERE ROWNUM <=40
      ORDER BY 작성일시
      )
WHERE ROWNUM<=20
ORDER BY 작성일시 DESC;


SELECT *
FROM(
      SELECT ROWNUM AS RN, A.*
      FROM(       
          SELECT *
          FROM 게시판
          ORDER BY 작성일시 DESC
          ) A
      WHERE ROWNUM <=60
      ORDER BY 작성일시
      )
WHERE RN>=41;


