SELECT A.직원ID, A.부서ID, A.이름, B.부서명
FROM 직원 A, 부서 B ;

SELECT 직원.직원ID, 직원.부서ID, 직원.이름, 부서.부서명
FROM 직원 , 부서 ; -- 복잡하고 헷갈린다. 별칭 써야.
-- 위 둘은 카티션조인으로 나온다

SELECT A.직원ID, A.부서ID, A.이름, B.부서명
FROM 직원 A, 부서 B
WHERE A.부서ID = B.부서ID;

--실습문제 1
SELECT *
FROM 직원 A, 부서 B
WHERE A.부서ID = B.부서ID;

--실습문제 2
SELECT *
FROM 직원 A, 직원연락처 B
WHERE A.직원ID = B.직원ID
AND B.연락처 IS NOT NULL
;
--실습문제 3
SELECT A.직원ID, A.이름, B.주소
FROM 직원 A, 직원주소 B
WHERE A.직원ID = B.직원ID
;
-- 1. 정답지엔 왜 NULL 조건이 없는가? : INNER JOIN이라 NULL은 애초에 등장하지 않음. OUTER JOIN 설명 참조
-- 2. 왜 직원이 5명밖에 없는가? : 직원주소 테이블에 5명밖에 등록되지 않음. INNER JOIN이므로 다른 5명은 NULL로 등장하지 않음.

--OUTER JOIN
SELECT A.직원ID, A.부서ID, B.부서명
FROM 직원 A, 부서 B
WHERE A.부서ID = B.부서ID(+); -- 이너조인 문법 뒤에 (+) 기호만 붙이면 문현철씨 등장

SELECT A.직원ID, A.부서ID, B.부서명
FROM 직원 A, 부서 B
WHERE A.부서ID(+) = B.부서ID; --다른 쪽 문법 뒤에 기호 붙이면 인프라서비스부 등장
-- 양쪽 모두에 (+)를 붙이면 오류.

--실습문제 4

SELECT  A.직원ID AS 직원_직원ID, A.성별, A.나이, A.직원ID AS 주소_직원ID, B.구분코드, B.주소
-- 너무 길면 개행해도 상관없으나 쉼표 등 필요한 기호를 빼뜨리지 않도록 주의! 
FROM 직원 A, 직원주소 B
WHERE A.직원ID = B.직원ID
;

--실습문제 5

SELECT  A.직원ID AS 직원_직원ID, A.성별, A.나이, A.직원ID AS 주소_직원ID, B.구분코드, B.주소
FROM 직원 A, 직원주소 B
WHERE A.직원ID = B.직원ID
AND A.직원ID = 'A0007';

--실습문제 6

SELECT A.직원ID AS 직원_직원ID, A. 이름, A. 연봉, B.직원ID AS 주소_직원ID, B. 구분코드, B. 주소
FROM 직원 A, 직원주소 B
WHERE A.직원ID = B.직원ID(+)
;

--실습문제 7

SELECT A.직원ID AS 직원_직원ID, A. 이름, A. 연봉, B.직원ID AS 주소_직원ID, B. 구분코드, B. 주소
FROM 직원 A, 직원주소 B
WHERE A.직원ID = B.직원ID(+)
AND B.직원ID IS NULL
;

--실습문제 8

SELECT A.직원ID, A.이름, A.나이, C.연락처, B.주소
FROM 직원 A, 직원주소 B, 직원연락처 C
WHERE A.직원ID = B.직원ID -- A=B=C 세 개로 연결하면 3항연산인데 데이터베이스는 지원X.
AND B.직원ID = C.직원ID  -- 그래서 A=B AND B=C의 형태로
;

--실습문제 9

SELECT A.직원ID, A.이름, A.입사일시, B.연락처
FROM  직원 A, 직원연락처 B
WHERE A.직원ID = B.직원ID
AND A.직원ID IN('A0001', 'A0002', 'A0003')
--혹은 위 행에서 BETWEEN 'A0001' AND 'A0003'을 써도 된다.
AND B.구분코드 = '휴대폰'
;

--실습문제 10

SELECT A.직원ID, A.이름, A.부서ID, B.부서명
FROM 직원 A, 부서 B
WHERE A.부서ID = B.부서ID(+)
;

--오라클에서 ANSI로의 전환

--이너조인의 경우

SELECT A.직원ID, A.이름, B.주소
FROM 직원 A, 직원주소 B
WHERE A. 직원ID = B.직원ID
;

-- ↓

SELECT A.직원ID, A.이름, B.주소
FROM 직원 A INNER JOIN 직원주소 B
ON (A. 직원ID = B.직원ID)
;

-- 변환이 어렵지 않다. 

-- 아우터 조인의 경우

SELECT A.직원ID, A.이름, B.주소
FROM 직원 A, 직원주소 B
WHERE A.직원ID = B.직원ID(+);

-- ↓

SELECT A.직원ID, A.이름, B.주소
FROM 직원 A LEFT OUTER JOIN 직원주소 B --좌측 테이블이 기준이므로 LEFT OUTER JOIN
ON (A.직원ID = B.직원ID)
;

--양쪽 테이블을 모두 OUTER JOIN을 하고 싶다면 FULL OUTER JOIN 이용(오라클 문법에는 존재X)

SELECT A.직원ID, A.부서ID, B.부서명
FROM 직원 A FULL OUTER JOIN 부서 B
ON (A.부서ID=B.부서ID);

--문제 1

SELECT A.직원ID, A.이름, B.주소
FROM 직원 A, 직원주소 B
WHERE A.직원ID = B.직원ID(+)
AND A.직원ID IN ('A0005', 'A0008');

SELECT A.직원ID, A.이름, B.주소
FROM 직원 A LEFT OUTER JOIN 직원주소 B
ON (A.직원ID = B.직원ID)
WHERE A.직원ID IN ('A0005', 'A0008')
;

--문제 2

SELECT B.직원ID, B.이름, A.주소
FROM 직원주소 A, 직원 B
WHERE A.직원ID(+) = B.직원ID;


SELECT B.직원ID, B.이름, A.주소
FROM 직원주소 A RIGHT OUTER JOIN 직원 B
ON (A.직원ID = B.직원ID)
;
-- SELECT 순서를 통상과 반대로 한 이유 : 테이블의 결과값만 보고 어떤 JOIN인지 오해하지 말라는 의미

-- 문제 3

SELECT A.직원ID, A.이름, A.나이, B.연락처
FROM 직원 A, 직원연락처 B
WHERE A.직원ID = B.직원ID
;

SELECT A.직원ID, A.이름, A.나이, B.연락처
FROM 직원 A INNER JOIN 직원연락처 B
ON (A.직원ID = B.직원ID)
;

-- TIP문제 TIP 3항연산은 데이터베이스에서 지원하지 않음

SELECT A.직원ID, A.이름, A.나이, C.연락처, B.주소 
FROM 직원 A INNER JOIN 직원주소 B
ON (A.직원ID = B.직원ID)
INNER JOIN 직원연락처 C
ON (B.직원ID = C.직원ID);

--두 번째 INNER JOIN 적을 때 다시 다른 테이블을 적어준 뒤 INNER JOIN해야 하는 줄 알고 시행착오함. 
--잘 기억해 두자.
