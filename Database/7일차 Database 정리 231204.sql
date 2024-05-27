DROP TABLE 회원정보;  -- 테이블 삭제. 단 PK 제약조건 등으로 다른 테이블과 연결되어 있으면 삭제 안 됨.
DROP TABLE 회원정보 CASCADE CONSTRAINTS; -- 제약조건들까지 모조리 삭제


CREATE SEQUENCE 회원ID_SEQ;

SELECT 회원ID_SEQ.NEXTVAL
FROM DUAL;

DROP SEQUENCE 회원ID_SEQ;


CREATE VIEW 부서별최고연봉_VIEW AS -- 뒤에 AS 써줘야
SELECT 부서ID, MAX(연봉) AS 부서별_최고연봉
FROM 직원
GROUP BY 부서ID
ORDER BY 부서ID;

SELECT * 
FROM 부서별최고연봉_VIEW;

SELECT * 
FROM (SELECT 부서ID, MAX(연봉) AS 부서별_최고연봉
FROM 직원
GROUP BY 부서ID
ORDER BY 부서ID); -- 뷰 값은 곧 뷰로 저장된 SELECT의 값과 동일하므로 원문을 괄호 치고 그대로 집어넣어도 작동

SELECT A.이름, A.연봉, B.부서별_최고연봉
FROM 직원 A, 부서별최고연봉_VIEW B
WHERE A.부서ID = B.부서ID
AND A.연봉 = B.부서별_최고연봉;

DROP VIEW 부서별최고연봉_VIEW;

INSERT INTO 수강생정보(학생ID, 학생이름, 소속반)
VALUES('S0088', '민수', 'H');

SELECT *
FROM 수강생정보;
-- 위에서 삽입한 정보 확인

UPDATE 수강생정보
SET 학생ID = 'S0089',
학생이름 = '김민수',
소속반 = 'G'
WHERE 학생ID = 'S0088';

-- UPDATE 성적표 SET 성적 = 100; --WHERE절이 없으므로 실행하면 성적표 테이블에 있는 모든 성적이 100이 된다.

UPDATE 수강생정보
SET 학생ID = 'S0010',
학생이름 = '아이유',
소속반 = 'S'
WHERE 학생ID = 'S2222'; --해당하는 학생ID가 없으므로 오류가 나진 않고 0행이 업데이트.


--DELETE FROM 성적표; --WHERE절 안 적었으므로 모든 행 삭제

INSERT INTO 직원(직원ID, 패스워드, 이름, 나이, 입사일시, 주민등록번호, 연봉, 부서ID)
VALUES('A1000', 'hello1000', '신캐릭', 29, sysdate, '950120-1566221', 3500, 'D006')
; -- 나이를 '29'로 입력했다 해도 데이터베이스의 형변환 함수 우선순위(날숫문)에 따라 자동으로 숫자로 변환
-- 성별은 nullable이므로 굳이 입력 안해도 자동으로 null로 입력됨.
UPDATE 직원
SET 성별 = '남',
부서ID = 'D005',
패스워드 = 'hello1000!!!'
WHERE 직원ID = 'A1000';

COMMIT;

DELETE FROM 직원
WHERE 직원ID='A1000';

INSERT INTO 직원(직원ID, 패스워드, 이름, 나이, 입사일시, 주민등록번호, 연봉, 부서ID)
VALUES ('A2000', 'hello222','이홍시',40,SYSDATE, '830220-1566221',5600,'D006'); 

INSERT INTO 직원연락처(직원ID, 구분코드, 연락처) VALUES ('A2000', '휴대폰','010-5959-1111');
INSERT INTO 직원주소 (직원ID, 구분코드, 주소) VALUES ('A2000', '집', '운천로 123');

DELETE FROM 성적표;

COMMIT;

INSERT INTO 직원연락처 (직원ID, 구분코드, 연락처) VALUES ('A2000', '집전화', '062-123-1111');

COMMIT;

UPDATE 직원연락처 
SET 연락처 = '010-3333-5959'
WHERE 구분코드 = '휴대폰'
AND 직원ID = 'A2000';

--기존연락처를 WHERE로 잡아도 문제가 풀리긴 풀린다. 다만 기존연락처가 문제에서 제시되지 않았을 경우도 있을 수 있음.

COMMIT;

DELETE 
FROM 직원주소
WHERE 직원ID IN ('A0011', 'A0012', 'A0013', 'A2000');

COMMIT;

DELETE
FROM 직원연락처
WHERE 직원ID IN ('A0011', 'A0012', 'A0013', 'A2000');

DELETE
FROM 직원
WHERE 직원ID IN ('A0011', 'A0012', 'A0013', 'A2000');

-- 위 세 삭제 문제 : 자식 테이블에 있는 데이터부터 삭제해야 한다는 것 가르쳐 주기 위함.
-- 아래 거 먼저 실행하면 오류.

INSERT INTO 성적표 (학생ID, 과목, 성적) VALUES ('S0001','국어',90) ; 
INSERT INTO 성적표 (학생ID, 과목, 성적) VALUES ('S0001','수학',85) ; 
INSERT INTO 성적표 (학생ID, 과목, 성적) VALUES ('S0001','영어',70); 

UPDATE 성적표
SET 성적 = 80
WHERE 과목 = '영어'
AND 학생ID = 'S0001';
