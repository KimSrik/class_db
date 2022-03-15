-- ------------------------------------------------------------------------
-- 										병원업무관리 프로젝트 
-- ------------------------------------------------------------------------

-- ------------------------------------------------------------------------
-- 												DB초기화
-- ------------------------------------------------------------------------
drop database if exists 병원업무관리_DB;
drop user if exists srik2@localhost;
create database 병원업무관리_DB;
create user srik2@localhost identified with mysql_native_password by 'qwer1234!'; 
grant all privileges on 병원업무관리_DB.* to srik2@localhost with grant option;
commit;

use 병원업무관리_DB;

-- ------------------------------------------------------------------------
-- 											의사 테이블 정리
-- ------------------------------------------------------------------------
create table 의사(
	의사ID varchar(10) primary key not null unique,
    담당진료 varchar(20) not null, 
    성명 varchar(20) not null,
    성별 varchar(10) not null,
    연락처 varchar(20) not null unique,
    이메일 varchar(20) unique,
    직급 varchar(10)
);

-- ------------------------------------------------------------------------
-- 											간호사 테이블 정리
-- ------------------------------------------------------------------------

create table 간호사( 
	간호사ID varchar(10) primary key not null unique,
    담당업무 varchar(40) not null,
    성명 varchar(20) not null,
    성별 varchar(10) not null,
    이메일 varchar(20) not null unique,
    직급 varchar(10)
);

-- ------------------------------------------------------------------------
-- 											환자 테이블 정리
-- ------------------------------------------------------------------------

create table 환자( 
	환자ID varchar(10) primary key not null unique,
    환자성명 varchar(20) not null,
    주민번호 varchar(14) not null unique,
    성별 varchar(20) not null,
    주소 varchar(50) not null,
    연락처 varchar(20) not null,
    이메일 varchar(20) unique,
    직업 varchar(20) not null,
    의사ID varchar(10),
    간호사ID varchar(10),
    foreign key (의사ID) references 의사(의사ID),
    foreign key (간호사ID) references 간호사(간호사ID)
);

-- ------------------------------------------------------------------------
-- 											진료 테이블 정리
-- ------------------------------------------------------------------------

create table 진료( 
	진료ID int not null,
    의사ID varchar(10) not null,
    환자ID varchar(10) not null,
    진료내용 varchar(100) not null,
    진료날짜 date not null,
    primary key(진료ID, 의사ID, 환자ID),	-- 각각 기본키가 아니라 세개의 값이 모여야 기본키가 된다. // 다중 기본키 (multi primary key)
    foreign key (의사ID) references 의사(의사ID),
	foreign key (환자ID) references 환자(환자ID)
);

-- ------------------------------------------------------------------------
-- 											의사 테이블 삽입
-- ------------------------------------------------------------------------

insert into 의사 values ( 
	1001, -- 의사ID 문자 기본키
    '흉부외과', -- 담당진료 문자 낫 널, 
    '홍길동', -- 성명 문자 낫 널,
    '남',  -- 성별 varchar(10) not null,
    '010-1111-1111', -- varchar(20) not null unique,
    'hong@naver.com', -- 이메일 varchar(20) unique,
    '과장' -- 직급 varchar(10)
);
insert into 의사 values ( 1002, '일반내과', '이몽룡', '남', '010-2222-2222', 'hong2@naver.com', '진료부장');
insert into 의사 values ( 1003, '호흡기내과', '성춘향', '여', '010-3333-3333', 'hong3@naver.com', '부원장');
insert into 의사 values ( 1004, '소화기내과', '월매', '여', '010-4444-4444', 'hong4@naver.com', '외래교수');
insert into 의사 values ( 1005, '소아청소년과', '변사또', '여', '010-5555-5555', 'hong5@naver.com', '원장');


-- ------------------------------------------------------------------------
-- 											간호사 테이블 삽입
-- ------------------------------------------------------------------------

insert into 간호사 values ( 
	'2001',-- 간호사ID varchar(10) primary key not null unique,
    '외래',-- 담당업무 varchar(40) not null,
    '홍길순',-- 성명 varchar(20) not null,
    '여',-- 성별 varchar(10) not null,
    'nurse1@naver.com',-- 이메일 varchar(20) not null unique,
    '사원'-- 직급 varchar(10)
);
insert into 간호사 values ('2002', '외래', '이몽철', '남', 'nurse2@naver.com', '사원');
insert into 간호사 values ('2003', '외래', '성춘왕', '여', 'nurse3@naver.com', '계약직');
insert into 간호사 values ('2004', '병실', '월병', '여', 'nurse4@naver.com', '대리');
insert into 간호사 values ('2005', '병실', '변사순', '여', 'nurse5@naver.com', '사원');
insert into 간호사 values ('2006', '응급', '강감찬', '남', 'nurse6@naver.com', '파견');


-- ------------------------------------------------------------------------
-- 											환자 테이블 삽입
-- ------------------------------------------------------------------------
-- create table 환자( 
-- 	환자ID varchar(10) primary key not null unique,
--     환자성명 varchar(20) not null,
--     주민번호 varchar(14) not null unique,
--     성별 varchar(20) not null,
--     주소 varchar(50) not null,
--     연락처 varchar(20) not null,
--     이메일 varchar(20) unique,
--     직업 varchar(20) not null,
--     의사ID varchar(10),
--     간호사ID varchar(10),
--     foreign key (의사ID) references 의사(의사ID),
--     foreign key (간호사ID) references 간호사(간호사ID)
-- );

insert into 환자 values('3001', '이승만','090909-1111111', '남', '서울시', '010-0101-0101', null, '전직대통령', '1001', '2006');
insert into 환자 values('3002', '윤보선','090909-2222222', '남', '서울시', '010-0202-0202', null, '전직대통령', '1001', '2006');
insert into 환자 values('3003', '박정희','090909-3333333', '남', '구미', '010-0303-0303', null, '전직대통령', '1003', '2001');
insert into 환자 values('3004', '최규하','090909-4444444', '남', '서울시', '010-0404-0404', null, '전직대통령', '1004', '2002');
insert into 환자 values('3005', '전두환','090909-5555555', '남', '고령', '010-0505-0505', null, '전직대통령', '1002', '2003');
insert into 환자 values('3006', '노태우','090909-6666666', '남', '서울시', '010-0606-0606', null, '전직대통령', '1003', '2003');
insert into 환자 values('3007', '김영삼','090909-7777777', '남', '마산', '010-0707-0707', null, '전직대통령', '1002', '2001');
insert into 환자 values('3008', '김대중','090909-8888888', '남', '광주', '010-0808-0808', null, '전직대통령', '1002', '2004');
insert into 환자 values('3009', '노무현','090909-9999999', '남', '김해', '010-0909-0909', null, '전직대통령', '1004', '2005');
insert into 환자 values('3010', '이명박','090909-0000000', '남', '일본', '010-1010-1010', null, '전직대통령', '1005', '2006');


-- ------------------------------------------------------------------------
-- 											진료 테이블 삽입
-- ------------------------------------------------------------------------
-- create table 진료( 
-- 	진료ID int not null,
--     의사ID varchar(10) not null,
--     환자ID varchar(10) not null,
--     진료내용 varchar(100) not null,
--     진료날짜 date not null,
--     primary key(진료ID, 의사ID, 환자ID),	-- 각각 기본키가 아니라 세개의 값이 모여야 기본키가 된다. // 다중 기본키 (multi primary key)
--     foreign key (의사ID) references 의사(의사ID),
-- 	foreign key (환자ID) references 환자(환자ID)
-- );

insert into 진료 values('2201001','1001','3010','감기몸살','2022-01-02');
insert into 진료 values('2201002','1005','3009','코로나','2022-01-02');
insert into 진료 values('2201003','1005','3009','소화불량','2022-01-03');
insert into 진료 values('2201004','1003','3008','감기몸살','2022-01-03');
insert into 진료 values('2201005','1003','3001','가슴통증','2022-01-03');
insert into 진료 values('2201006','1002','3005','사마귀','2022-01-03');
insert into 진료 values('2201007','1001','3002','여드름','2022-01-03');
insert into 진료 values('2201008','1002','3001','감기몸살','2022-01-03');
insert into 진료 values('2201009','1005','3010','가슴통증','2022-01-03');
insert into 진료 values('2201010','1003','3009','복통','2022-01-03');
insert into 진료 values('2201011','1005','3004','복통','2022-01-03');

desc 의사;
desc 간호사;
desc 환자;
desc 진료;

select 의사.성명 as 의사명, 환자.환자성명 as 환자명, 진료.진료날짜 as 진료날짜, 진료.진료내용 as 진료내용
from 의사 join 진료 on 의사.의사ID = 진료.의사ID join 환자 on 진료.환자ID = 환자.환자ID;





