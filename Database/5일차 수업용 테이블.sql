DROP TABLE 수강생정보 CASCADE CONSTRAINTS; 
DROP TABLE 성적표 CASCADE CONSTRAINTS; 

CREATE TABLE 수강생정보 (
학생ID VARCHAR2(9) PRIMARY KEY , 
학생이름 VARCHAR2(50) NOT NULL , 
소속반 VARCHAR2(5) 
); 

CREATE TABLE 성적표 ( 
    학생ID VARCHAR2(9) , 
    과목   VARCHAR2(30) , 
    성적   NUMBER  , 
    CONSTRAINT PK_성적표 PRIMARY KEY(학생ID , 과목) , 
    CONSTRAINT FK_성적표_REF_수강생 FOREIGN KEY(학생ID) REFERENCES 수강생정보(학생ID) 
)  ; 

INSERT INTO 수강생정보 VALUES ('S0001' , '김현철' , 'A') ; 
INSERT INTO 수강생정보 VALUES ('S0002' , '문현중' , 'A') ; 
INSERT INTO 수강생정보 VALUES ('S0003' , '강문치' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('S0004' , '박나선' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('S0005' , '신태강' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('S0006' , '물고기' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('S0007' , '자라니' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('S0008' , '공팔두' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('S0009' , '최팔현' , 'C') ; 

INSERT INTO 성적표 VALUES('S0001'  ,'국어' , 90); 
INSERT INTO 성적표 VALUES('S0001'  ,'수학' , 85); 
INSERT INTO 성적표 VALUES('S0001'  ,'영어' , 100); 
INSERT INTO 성적표 VALUES('S0002'  ,'국어' , 100); 
INSERT INTO 성적표 VALUES('S0002'  ,'수학' , 100); 
INSERT INTO 성적표 VALUES('S0002'  ,'영어' , 20); 
INSERT INTO 성적표 VALUES('S0003'  ,'국어' , 100); 
INSERT INTO 성적표 VALUES('S0003'  ,'수학' , 100); 
INSERT INTO 성적표 VALUES('S0003'  ,'영어' , 20); 
INSERT INTO 성적표 VALUES('S0004'  ,'국어' , 85); 
INSERT INTO 성적표 VALUES('S0004'  ,'수학' , 40); 
INSERT INTO 성적표 VALUES('S0004'  ,'영어' , 60); 
INSERT INTO 성적표 VALUES('S0005'  ,'국어' , 100); 
INSERT INTO 성적표 VALUES('S0005'  ,'수학' , 100); 
INSERT INTO 성적표 VALUES('S0005'  ,'영어' , 100); 
INSERT INTO 성적표 VALUES ( 'S0006' , '국어' , NULL ) ; 
INSERT INTO 성적표 VALUES ( 'S0006' , '수학' , NULL ) ; 
INSERT INTO 성적표 VALUES ( 'S0006' , '영어' , NULL ) ; 

COMMIT; 
