SELECT 소속반, COUNT(*)
FROM 수강생정보
GROUP BY 소속반;

SELECT * 
FROM 성적표;

SELECT 학생ID, COUNT(성적)
FROM 성적표
GROUP BY 학생ID; --NULL값인 6번 학생은 0으로 집계됨

SELECT 학생ID, COUNT(*)
FROM 성적표
GROUP BY 학생ID; --NULL값도 세어줌. *는 컬럼 안의 내용을 불문하므로. 이 차이 시험에 자주 나온다!

--연습문제 1

SELECT 학생ID, ROUND(AVG(성적),1) AS 평균성적
FROM 성적표
GROUP BY 학생ID ;

--집계함수와 일반 컬럼은 함께 사용할 수가 없으나 그룹화를 한 기준 컬럼은 집계함수와 함께 쓸 수 있다.

--연습문제 2

SELECT MAX(연봉) AS 최고연봉, MIN(연봉)AS 최저연봉
FROM 직원;

--연습문제 3

SELECT 소속반, COUNT(학생ID) AS 반별인원수
FROM 수강생정보
GROUP BY 소속반;

--연습문제 4

SELECT 학생ID, AVG(성적) AS 수학제외한평균
FROM 성적표
WHERE 과목 IN ('국어', '영어') --조건을 붙일 때는 WHERE 절 -- IN 대신 !=수학으로 써도 된다. NOT IN 수학도 가능
GROUP BY 학생ID
;

--연습문제 5

SELECT A.부서ID, SUM(A.연봉) AS 부서별연봉합계
FROM 직원 A, 부서 B
WHERE A.부서ID = B.부서ID
GROUP BY A.부서ID
; 

--연습문제 6

SELECT A.직원ID, COUNT(B.연락처)AS 연락처개수
FROM 직원 A LEFT OUTER JOIN 직원연락처 B
ON (A.직원ID = B.직원ID)
GROUP BY A.직원ID
;
---

SELECT 학생ID, ROUND(AVG(성적),1) AS 평균성적
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) <= 75;

--HAVING 문제

SELECT 소속반, COUNT(학생ID) AS 인원수
FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(학생ID)>2; --반 별 인원수가 3명 이상이라는 것은 반 별 인원수라는 것에 조건을 주는 것이므로 
                        --WHERE절이 아닌 HAVING 절에 조건 줘야 한다
-- 문제 2

SELECT 부서ID, MAX(연봉) 
FROM 직원
GROUP BY 부서ID
HAVING MAX(연봉)=7500; 

-- 문제 3

SELECT 학생ID, ROUND(AVG(성적),1) AS 평균성적 --노란색 줄 : 주의. 집계함수(AVG)는 컴퓨터가 실행 전이라 그걸 인식하지 못하기에 경고를 주는 것.
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) IS NOT NULL
;
