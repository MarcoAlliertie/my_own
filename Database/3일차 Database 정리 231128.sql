*(Asterisk)는 다른 칼럼과 함께 사용하는 것이 불가능하다
Select 직원id, 성별, 연봉, decode(성별, '남', '남성입니다','여성입니다')as 남녀확인 from 직원;
SELECT 직원ID, 성별, 연봉, DECODE(성별, '남', '남성입니다','여성입니다')AS 남녀확인 FROM 직원;

왜 명령어를 대문자로 쓰는지?
SQL 디벨로퍼가 나온 게 겨우 2년 전. 그 전에는 CMD 창과 비슷한 개발환경에서 개발해야 했고 그 때는 
글자색을 바꾼다든가 할 수 없어서 명령어와 다른 것들을 구별하기 어려웠기 때문에 명령어는 대문자로 
입력하는 게 확립된 것. 지금은 소문자로 써도 되지만 실상 알고리즘 속에서 소문자 명령어를 대문자 명령어로
바꾸는 알고리즘을 한 번 거치는 것임. 그러니까 왠만하면 대문자 써라.

내장형 함수 - ROUND, SYSDATE : 필수적으로 알아야 할 함수
            SUBSTR, CEIL, FLOOR, TRUNC, ABS, REPLACE : 시험에 나올 가능성 있음
SELECT 주민등록번호, REPLACE(주민등록번호,'-','') FROM 직원;

실습 문제

/*SELECT 직원ID, 주민등록번호, SUBSTR(주민등록번호,1,6)AS 생년월일 FROM 직원;
SELECT 직원ID, 구분코드,연락처,REPLACE(연락처,'-','')AS 연락처번호만 FROM 직원연락처;*/

SELECT 연봉, MOD(연봉,1000) FROM 직원;
SELECT ROUND(1.452,2), ROUND(1.452,1) FROM DUAL;
SELECT ROUND(3.141592, 4) FROM DUAL; --특정한 소수점 자리까지 반올림
-- DUAL : 숫자 계산할 때 사용하는 더미 테이블. 실제 테이블이 아니다.

SELECT CEIL(3.141592) FROM DUAL; -- 올림
SELECT FLOOR(3.141592) FROM DUAL;  --버림
SELECT TRUNC(3.141592, 4) FROM DUAL; --특정한 반올림 자리까지 버림
SELECT ABS(-3.14) FROM DUAL;

SELECT ROUND(42.195,2), CEIL(42.195), FLOOR(42.195), TRUNC(42.195,1), ABS(-42.195) FROM DUAL;

SELECT SYSDATE 
FROM DUAL;
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
SELECT 직원ID, 입사일시, ADD_MONTHS(입사일시, 60) 
FROM 직원;

SELECT '100' + 1000 FROM DUAL;
-- 파이썬에서는 문자와 숫자의 합산이 되지 않는다.
--데이터베이스에서는 내부적으로 형변환 발생
--다만 문자가 숫자의 형태일 때 가능할 뿐 예컨대 '백'이라고 써도 형변환 발생하지 않음.
--형변환 우선순위 날숫문

SELECT * FROM 직원 WHERE 부서ID='D001';
--SQL문 해석 : 실행 순서에 따라(위의 경우 FROM->WHERE-SELECT 순)
--순서에 따라 어떤 절을 입력할지 표시해 놓는 습관 들이면 문제 푸는 데 좋다

SELECT 직원ID, 이름, 나이, 입사일시 FROM 직원 WHERE 연봉>9000;
SELECT * FROM 직원 WHERE 이름 = '이현정';
SELECT * FROM 직원연락처 WHERE 연락처 = '010-1231-1234';
SELECT 부서명 FROM 부서 WHERE 근무지='서울';
SELECT 주소 FROM 직원주소 WHERE 직원ID='A0007';

--쌍따옴표는 데이터베이스에서 지원하지 않는다.

--비교조건과 논리조건 : WHERE 절을 한 문장에 두 번 사용하는 것은 불가능하다. AND나 OR를 사용해야

SELECT 연락처 FROM 직원연락처 WHERE 직원ID='A0001' AND 구분코드='집전화';

SELECT * 
FROM 직원 
WHERE 부서ID='D003' 
AND 나이>=30 
AND 성별='여';--문제풀 때 이 부분 빼먹었음. 항상 조건들 빼놓지 않도록 주의할 것.

SELECT * 
FROM 직원 
WHERE 직원ID='A0001' 
OR 직원ID='A0005' 
OR 직원ID='A0007';

SELECT *
FROM 직원
WHERE( 부서ID = 'D001'
OR 부서ID = 'D002')
AND 이름 = '강홍수';
--AND와 OR 중에 AND를 먼저 실행하고 그 뒤에 OR를 실행하므로 결과값이 세 개
--연산의 우선순위를 따로 정하고 싶은 경우 괄호를 쓰면 된다.

--SQL 연산자. 매우 중요.
--복잡하고 특별한 계산이 필요할 때.

--IN 연산자는 등호 대신에 사용된다. 등호는 1:1 비교할 때, IN은 1:N 비교할 때 쓰는 것.

SELECT *
FROM 직원
WHERE 직원ID IN ('A0001','A0005','A0007');

SELECT *
FROM 직원
WHERE 직원ID NOT IN('A0001','A0002','A0003','A0005')
AND 성별 = '남';

-- IN 앞에 NOT을 쓰면 기입된 조건을 제외한 다른 조건에 해당하는 행만 뽑을 수 있다


SELECT *
FROM 직원
WHERE 연봉>=2800 AND 연봉<=3400; //연봉이라는 말 중복 입력해야

-- 원래 데이터베이스는 3항연산이 안 되지만 이를 하게 해 주는 연산자 BETWEEN. 범위연산.

SELECT *
FROM 직원
WHERE 연봉 BETWEEN 2800 AND 3400;

-- BETWEEN A AND B 연산은 A가 B보다 작은 경우만 지원한다. A값이 더 크면 연산 안 됨.

SELECT *
FROM 직원
WHERE 직원ID BETWEEN 'A0001' AND 'A0004';

-- WHERE와 BETWEEN 사이에 아무 것도 입력하지 않는 실수 잦다. 비교할 컬럼을 꼭 입력해 줘야 비교가 가능함!
-- BETWEEN 등은 함수가 아닌 연산자!

SELECT *
FROM 직원
WHERE 이름 LIKE '%민';
-- %는 전부를 의미한다. 즉 앞에 %를 두면 마지막 문자열을 찾을 수 있고 뒤에 두면 처음 문자열 찾을 수 있음.
-- 앞뒤에 %를 하면 이름에 그 글자가 포함되기만 하면 전부 출력(가운데 이름 출력 아님!)


SELECT 직원ID, 이름, 나이 
FROM 직원
WHERE 이름 LIKE '%철%';

SELECT 직원ID, 연봉, 입사일시
FROM 직원
WHERE 연봉 BETWEEN 7000 AND 9000;

SELECT * 
FROM 직원주소
WHERE 주소 LIKE '동구%';

SELECT *
FROM 직원
WHERE 입사일시 LIKE'___11%';

-- 언더바는 글자수 제한. 제한하고 싶은 글자수만큼 언더바를 앞 또는 뒤에 쓰면 된다.