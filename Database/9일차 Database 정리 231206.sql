SELECT A.직원ID, A.연봉, 
A.부서ID,(
        SELECT 부서명
        FROM 부서
        WHERE 부서ID = A.부서ID
        ) AS 부서명
FROM 직원 A
WHERE 직원ID BETWEEN 'A0001' AND 'A0006';

-- 오라클 조인

SELECT A.직원ID, A.연봉, A.부서ID, B.부서명
FROM 직원 A, 부서 B
WHERE A.부서ID = B.부서ID(+)
AND A.직원ID BETWEEN 'A0001' AND 'A0006' ;

--ANSI 조인

SELECT A.직원ID, A.연봉, A.부서ID, B.부서명
FROM 직원 A LEFT OUTER JOIN 부서 B
ON (A.부서ID = B.부서ID)
WHERE A.직원ID BETWEEN 'A0001' AND 'A0006';

/* 
SELECT A.직원ID, A.연봉, 
A.부서ID,(
        SELECT 부서명
        FROM 부서
        WHERE 부서ID = 부서ID
        ) AS 부서명
FROM 직원 A
WHERE 직원ID BETWEEN 'A0001' AND 'A0006'; 

직원 테이블에서 나온 부서ID인지 부서 테이블에서 나온 부서ID인지 구분이 안 되어 
하나의 튜플에 여섯 개의 값이 들어가는 꼴이 됨. 오류!

SELECT A.직원ID, A.연봉, 
A.부서ID,(
        SELECT 부서ID, 부서명
        FROM 부서
        WHERE 부서ID = A.부서ID
        ) AS 부서명
FROM 직원 A
WHERE 직원ID BETWEEN 'A0001' AND 'A0006';

스칼라 서브쿼리에서 복수의 컬럼을 뽑으려고 하므로 오류!
복수의 컬럼을 스칼라 서브쿼리로 뽑으려고 하면 해당 컬럼마다 스칼라 서브쿼리로 작성해 줘야
*/

SELECT A.직원ID, A.연봉, A.부서ID,
      (
       SELECT 부서명
       FROM 부서
       WHERE 부서ID = A.부서ID
       )AS 부서명
FROM 직원 A
WHERE A.직원ID BETWEEN 'A0001' AND 'A0006';

SELECT A.직원ID, A.이름, A.주민등록번호,
    (
    SELECT 연락처
    FROM 직원연락처 
    WHERE 구분코드 = '휴대폰'
    AND 직원ID = A.직원ID
    ) AS 휴대폰번호
FROM 직원 A 
WHERE A.직원ID BETWEEN 'A0006' AND 'A0010'
ORDER BY A.직원ID 
;



-- 2번째 문제 아우터 조인으로

SELECT A.직원ID, A.이름, A.주민등록번호, B.연락처 AS 휴대폰번호
FROM 직원 A, 직원연락처 B
WHERE (B.구분코드 = '휴대폰' OR B.구분코드 IS NULL)
AND A.직원ID BETWEEN 'A0006' AND 'A0010'
AND A.직원ID = B.직원ID(+)
ORDER BY A.직원ID
;

--NULL 부분 조건을 괄호 없이 밖에 내주면 (+)기호와 NULL값은 동시에 사용될 수 없다는 오류가 뜬다.
--그래서 괄호로 묶어주는 것.
--ANSI 조인으로 바꾸면 (+)기호가 없어지므로 문제가 해결이 됨.

SELECT *
FROM (
      SELECT *
      FROM 직원
      ORDER BY 나이
      )
WHERE ROWNUM<=3;



SELECT *
FROM (
      SELECT *
      FROM 직원
      ORDER BY 나이 DESC
      )
WHERE ROWNUM<=3;

/* 나이를 내림차순으로 정렬했는데 왜 NULL값이..?
오라클에서는 NULL값을 가장 큰 값으로 봄. MAX 명령어에서는 NULL값이 안 나오지만 그건 MAX의 특징. 정렬 땐 NULL이 가장 큼 
다른 데이터베이스에선 NULL값을 가장 작은 값으로 봄 */


SELECT *
FROM 직원
WHERE 연봉>=(SELECT AVG(연봉)
            FROM 직원);
            
-- 상관 서브쿼리

SELECT *
FROM 직원 A
WHERE 연봉 = (SELECT MIN(연봉)
             FROM 직원
             WHERE 부서ID = A.부서ID);
             

--위 상관 서브쿼리 예제는 부서별 최저연봉자 뽑는 쿼리. GROUP BY로 하면?

SELECT MIN(연봉), 부서ID
FROM 직원
GROUP BY 부서ID;             

--GROUP BY에서는 볼 수 있는 컬럼이 제한적이라는 단점이 있다.
             
-- 비상관 서브쿼리
SELECT *
FROM 직원
WHERE 연봉 >= (SELECT AVG(연봉)
             FROM 직원);

SELECT *
FROM 직원 A
WHERE A.연봉 = (SELECT MAX(연봉)
             FROM 직원
             WHERE 부서ID = A.부서ID);  
      
SELECT *
FROM 직원 A
WHERE A.입사일시 = (SELECT MAX(입사일시) 
                   FROM 직원);
                   
SELECT *
FROM 직원
WHERE 연봉 = (SELECT MAX(연봉)
             FROM 직원);