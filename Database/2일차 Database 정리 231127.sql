SELECT 직원ID, 패스워드, 이름, 성별,연봉
FROM 직원
WHERE 성별 = '남'
;

SELECT *
FROM 직원;

SELECT 직원ID, 입사일시,주민등록번호, 연봉, 부서ID
FROM 직원;

SELECT 부서ID, 부서명, 근무지
FROM 부서;

SELECT 직원ID, 구분코드, 연락처
FROM 직원연락처;

SELECT *
FROM 직원;

SELECT *
FROM 직원주소;

SELECT *
FROM 직원연락처;

SELECT DISTINCT 직원ID
FROM 직원연락처;

SELECT 직원ID AS EMP_ID
FROM 직원;

SELECT 직원ID EMP_ID
FROM 직원;

SELECT * FROM 직원 WHERE 나이 IS NULL;

SELECT 직원ID, 나이, NVL(나이, 7) FROM 직원;

SELECT 직원ID, 나이, DECODE(나이,NULL,0,나이) FROM 직원;

SELECT * FROM 직원 WHERE 나이 IS NOT NULL;  

SELECT * FROM 직원 WHERE 입사일시 IS NULL;

SELECT  직원ID, 패스워드, NVL(나이, 20)AS 나이 FROM 직원; 

SELECT 직원ID, 성별, 연봉, DECODE(성별, '남', '남성입니다', '여성입니다')AS 남녀확인 FROM 직원;
