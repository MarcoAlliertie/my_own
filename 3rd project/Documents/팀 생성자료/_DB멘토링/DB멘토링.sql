> 팀명 : 시옷
  주제 : 스마트화장실
  팀원 : 하승철/임용묵/김성재(T)/최교인
  강의실 : 캠퍼스 C강의실

> 모델링 주소: 

URL : https://aquerytool.com/aquerymain/index/?rurl=33eb634d-6b63-4b75-a5e0-507ec7ce1e7e&
Password : fpg11m


> MySQL 서버구축 정보 

HOST : project-db-campus.smhrd.com
PORT : 3307
USER : campus_23IS_IoT2_P2_4
PASS : smhrd4


> 데이터베이스 설계순서?

 요구사항분석 > 개념설계 > 논리설계 > 물리설계 > 데이터베이스구현 (개.눈.물)

> ERD 
  ER-Diagram 
  Entity Relationship Diagram  엔터티 릴레이션쉽 다이어그램

> DDL, Data Definition Language     - 정의 명령어 : CREATE, ALTER, DROP TABLE...
  DML, Data Manipulation Language   - 조작 명령어 : INSERT, UPDATE, DELETE * SELECT는 아님(주의!: SQLD시험에서 SELECT를 DML취급)
  DCL, Data Control Language        - 제어 명령어 : GRANT, REVOKE, COMMIT, ROLLBACK
  DQL, Data Query Language          - 질의 명령어 : SELECT 문
  TCL, Transaction Control Language : DCL중에서 COMMIT과 ROLLBACK을 따로 떼어서 TCL이라고 부르기도 함.





> 소수점 데이터의 처리 

   키 :    185.2cm    ... DECIMAL(4,1), NUMERIC(4,1)
   몸무게 : 80.3kg     ... DECIMAL(4,1), NUMERIC(4,1)
   암모니아 :  233423423.534 ... DECIMAL(12, 3)

> int와 int unsigned 차이 

  int          ... 32 bit 정수(-2147483648~-1, 0~2147483647)  * 대략 -21억~+21억
  int unsigned ... 32 bit 정수(0~2147483647 + 2147483648)     * 대략     0~+42억


> 회원(members) ------------------ 센서데이터(sensors)

     1                 :           0, 1, N(Numerous, 여러개의)


   

  Relation       : 일반적인 관계('날씨와 우산판매량의 관계')
  Relations      : 국가적인 관계(relations) between the two countries.
  Relationship   : 개인적인 관계
-------------------------------------------------------------------------------
(핵심프로젝트 MySQL SQL문)  


-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- members Table Create SQL
-- 테이블 생성 SQL - members
use campus_23IS_IoT2_P2_4;

CREATE TABLE members
(
    `member_id`         VARCHAR(30)      NOT NULL    COMMENT '회원 아이디', 
    `member_pw`         VARCHAR(30)      NOT NULL    COMMENT '회원 패스워드', 
    `member_name`       VARCHAR(40)      NOT NULL    COMMENT '회원 이름', 
    `member_phone`      VARCHAR(20)      NOT NULL    COMMENT '회원 연락처', 
    `member_birthdate`  DATE             NOT NULL    COMMENT '회원 생년월일', 
    `member_addr`       VARCHAR(1000)    NOT NULL    COMMENT '회원 주소', 
    `member_height`     DECIMAL(4,1)     NOT NULL    COMMENT '회원 키', 
    `member_weight`     DECIMAL(4,1)     NOT NULL    COMMENT '회원 몸무게', 
    `guardian_name`     VARCHAR(40)      NOT NULL    COMMENT '보호자 이름', 
    `guardian_phone`    VARCHAR(20)      NOT NULL    COMMENT '보호자 연락처', 
    `sleep_time`        VARCHAR(30)      NOT NULL    COMMENT '수면시간대', 
    `sleep_lightening`  INT              NOT NULL    COMMENT '수면시간 조명밝기', 
    `joined_at`         DATETIME         NOT NULL    COMMENT '회원 가입일자', 
     PRIMARY KEY (member_id)
);

-- 테이블 Comment 설정 SQL - members
ALTER TABLE members COMMENT '회원';


-- sensors Table Create SQL
-- 테이블 생성 SQL - sensors
CREATE TABLE sensors
(
    `sensor_idx`    INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '센서 순번', 
    `sensor_type`   VARCHAR(20)      NOT NULL    COMMENT '센서 구분', 
    `sensor_value`  DECIMAL(12,3)    NOT NULL    COMMENT '센서 값', 
    `sensored_at`   VARCHAR(50)      NOT NULL    COMMENT '측정 시간', 
    `member_id`     VARCHAR(30)      NOT NULL    COMMENT '회원 아이디', 
     PRIMARY KEY (sensor_idx)
);

-- 테이블 Comment 설정 SQL - sensors
ALTER TABLE sensors COMMENT '센서 데이터';

-- Foreign Key 설정 SQL - sensors(member_id) -> members(member_id)
ALTER TABLE sensors
    ADD CONSTRAINT FK_sensors_member_id_members_member_id FOREIGN KEY (member_id)
        REFERENCES members (member_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - sensors(member_id)
-- ALTER TABLE sensors
-- DROP FOREIGN KEY FK_sensors_member_id_members_member_id;


-- inouts Table Create SQL
-- 테이블 생성 SQL - inouts
CREATE TABLE inouts
(
    `io_idx`     INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '출입 순번', 
    `io_type`    CHAR(1)         NOT NULL    COMMENT '출입 구분', 
    `io_time`    DATETIME        NOT NULL    COMMENT '출입 시간', 
    `member_id`  VARCHAR(30)     NOT NULL    COMMENT '회원 아이디', 
     PRIMARY KEY (io_idx)
);

-- 테이블 Comment 설정 SQL - inouts
ALTER TABLE inouts COMMENT '화장실 출입 정보';

-- Foreign Key 설정 SQL - inouts(member_id) -> members(member_id)
ALTER TABLE inouts
    ADD CONSTRAINT FK_inouts_member_id_members_member_id FOREIGN KEY (member_id)
        REFERENCES members (member_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - inouts(member_id)
-- ALTER TABLE inouts
-- DROP FOREIGN KEY FK_inouts_member_id_members_member_id;


-- fallings Table Create SQL
-- 테이블 생성 SQL - fallings
CREATE TABLE fallings
(
    `fall_idx`   INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '낙상 순번', 
    `fall_time`  DATETIME        NOT NULL    COMMENT '낙상 시간', 
    `fall_info`  TEXT            NOT NULL    COMMENT '낙상 내용', 
    `member_id`  VARCHAR(30)     NOT NULL    COMMENT '회원 아이디', 
     PRIMARY KEY (fall_idx)
);

-- 테이블 Comment 설정 SQL - fallings
ALTER TABLE fallings COMMENT '낙상사고 정보';

-- Foreign Key 설정 SQL - fallings(member_id) -> members(member_id)
ALTER TABLE fallings
    ADD CONSTRAINT FK_fallings_member_id_members_member_id FOREIGN KEY (member_id)
        REFERENCES members (member_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - fallings(member_id)
-- ALTER TABLE fallings
-- DROP FOREIGN KEY FK_fallings_member_id_members_member_id;







12:39:14	INSERT INTO members (member_id, member_pw, member_name, member_phone, member_birthdate, member_addr, member_height, member_weight, guardian_name, guardian_phone, sleep_time, sleep_lightening, joined_at) VALUES ('member_id 0997', 'member_pw 0997', 'member_name 0997', 'member_phone 0997', NOW(), 'member_addr 0997', 0997, 0997, 'guardian_name 0997', 'guardian_phone 0997', 'sleep_time 0997', 0997, NOW())	1 row(s) affected, 1 warning(s): 1292 Incorrect date value: '2024-02-16 12:39:14' for column 'member_birthdate' at row 1	0.032 sec
