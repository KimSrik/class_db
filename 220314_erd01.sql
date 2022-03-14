-- 데이터베이스, 유저가 있으면 삭제.
drop database if exists school_db;
drop user if exists school_db@localhost;

-- 데이터베이스, 유저 생성 및 권한 부여
create database school_db;
create user school_db@localhost identified with mysql_native_password by 'school';
grant all privileges on school_db.* to school_db@localhost with grant option;

use school_db;

-- 테이블 생성
create table 기본정보(
	학번 int primary key,
    -- 기본키는 유일성(unique)와 not null이 포함되있다.
    성명 varchar(12),
    주소 varchar(150),
    전화번호 varchar(15)
);
create table 교수자(
	교수번호 int,
    과목명 varchar(12) primary key
);
create table 과목1(
	학번 int,
    과목명 varchar(12),
    foreign key(학번) references 기본정보(학번),
    foreign key(과목명) references 교수자(과목명)
);
create table 과목2(
	학번 int,
    과목명 varchar(12),
    foreign key(학번) references 기본정보(학번),
    foreign key(과목명) references 교수자(과목명)
);


-- insert 구문
insert into 기본정보 values(101, '홍길동', '서울', '010-1111-1111');
insert into 기본정보 values(102, '이몽룡', '남원', '010-2222-2222');
insert into 기본정보 values(104, '성춘향', '남원', '010-3333-3333');
insert into 기본정보 values(105, '이몽룡', '귀주', '010-4444-4444');

select * from 기본정보;

insert into 과목1 values(101, '국어');
insert into 과목1 values(101, '국어');
insert into 과목1 values(104, '국어');
insert into 과목1 values(105, '국어');

insert into 과목2 values(101, '영어');
insert into 과목2 values(101, '영어');
insert into 과목2 values(104, '영어');
insert into 과목2 values(105, '영어');

insert into 교수자 values(1001, '국어');
insert into 교수자 values(1002, '영어');


-- select * from 수강신청;

-- 내부 조건문
-- select 기본정보.성명, 기본정보.주소, 수강신청.수강과목1, 수강신청.수강과목2, 수강신청.수강과목3
-- from 기본정보, 수강신청
-- where 기본정보.학번 = 104 and 기본정보.학번 = 수강신청.학번;

-- 외부(조인) 조건문
select 기본정보.성명, 기본정보.주소, 수강신청.수강과목1, 수강신청.수강과목2, 수강신청.수강과목3
from 기본정보 join 수강신청 on 기본정보.학번 = 수강신청.학번
where 기본정보.학번 = 104;