-- member_db라는 데이터베이스를 삭제한다.
drop database if exists member_db;

-- 'user1'이라는 사용자를 삭제하겠다.
drop user if exists user1@localhost;

-- member_db라는 데이터베이스를 생성하겠다.
create database member_db;

-- 'user1'이라는 사용자가 localhost에 비밀번호 user1로 접속가능하도록 등록
create user user1@localhost identified by 'user1';
-- create user user1@% identified by 'user1';

-- user1 에게 모든 권한을 부여하겠다.
-- grant all privileges on db명.테이블 to 계정정보;
grant all privileges on member_db.* to user1@localhost;

-- 데이터베이스 이동
use member_db;

-- 'member'테이블 생성
create table member(
	member_num int primary key,
    member_id varchar(20) not null,
    member_pass varchar(20) not null
);

desc member;

insert into member(member_num, member_id, member_pass) values(10, 'srik', 'qwer1234');
insert into member values(11, 'srik2', 'qwer2222');
insert into member values(12, 'srik3', 'qwer4321');

delete from member where member_id = 'srik';

update member set member_pass = 'qwer3333!'where member_id = 'srik2';

select * from member;

-- 아이디가 srik2인자의 패스워드 검색
select member_pass from member where member_id = 'srik2';
select member_id as 성명 from member where member_num = 11;
select sum(member_num) as 번호합계 from member;
select sum(member_id) as 아이디합계 from member;
select count(member_id) as 인원수 from member;

insert into member values(13, 'srik4', 'qwerty1234');
insert into member values(14, 'srik4', 'qwerty1234');
insert into member values(15, 'srik4', 'qwerty1234');
insert into member values(16, 'srik4', 'qwerty1234');
insert into member values(17, 'srik4', 'qwerty1234');

select * from member;
select sum(member_num) as 넘버합계 from member where member_pass='qwerty1234';
select sum(member_num) as 동일패스워드의넘버합계, member_pass as 패스워드 from member group by member_pass='qwerty1234';


-- 부속질의 넘버가 가장 큰 사람의 아이디를 검색하시오
select member_id from member where member_num = (
	select max(member_num) from member
);

