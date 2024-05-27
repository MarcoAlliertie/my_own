SELECT *
FROM 직원
WHERE 연봉 IN (
              SELECT MAX(연봉)
              FROM 직원
              GROUP BY 부서ID
              );
-- 중첩 서브쿼리를 밖으로 꺼내면
SELECT MAX(연봉)
FROM 직원
GROUP BY 부서ID;
--즉 최상단의 메인쿼리는 아래의 메인쿼리와 같다
SELECT *
FROM 직원
WHERE 연봉 IN (7500,6000,9000,7500,6200,9300);    
--왜 일일이 입력하지 않고 서브쿼리를....? 애초에 중첩 서브쿼리 내부값을 모르니까! 그래서 쿼리를 써서 물어보는 것.

SELECT 직원ID, 연봉
FROM 직원
WHERE 연봉<= ALL(5000,6500,2800);

-- 쿼리에 따라 최소값이나 최대값 중 하나를 선택해 그를 기준으로 값을 출력


--실습문제 1

SELECT 이름, 연봉
FROM 직원
WHERE 연봉 IN (
             SELECT 연봉
             FROM 직원
             WHERE 직원ID = 'A0006');

--중첩 서브쿼리에서 값이 하나만 나올 때는 IN 대신 =를 써도 된다.
--그러나 실무에선 중첩 서브쿼리 내부의 값이 몇 개인지 알 수 없는 경우가 많으므로
--등호 대신 IN을 많이 쓴다.

--실습문제 2

SELECT 직원ID, 이름, 연봉
FROM 직원
WHERE 연봉> ALL
            (SELECT 연봉
             FROM 직원
             WHERE 직원ID BETWEEN 'A0003' AND 'A0006');

SELECT 직원ID, 이름
FROM 직원 A
WHERE EXISTS(
             SELECT 1 --1은 True/False 에서 True값 의미
             FROM 직원연락처
             WHERE 직원ID = A.직원ID
             );