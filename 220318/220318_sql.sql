
drop database if exists 프랜차이즈_관리;

create database 프랜차이즈_관리;

use 프랜차이즈_관리;


create table 프랜차이즈_본사(
	번호 varchar(10),
    회사명 varchar(45)not null unique,
    대표 varchar(45) not null,
    주소 varchar(45) not null,
    연락처 varchar(45) not null,
    primary key(번호)
);

create table 프랜차이즈_대리점(
	번호 varchar(10),
    프랜번호 varchar(10) not null,
    대리점명 varchar(45)not null,
    대표 varchar(45) not null,
    주소 varchar(45) not null,
    연락처 varchar(45) not null,
    primary key(번호, 프랜번호),
    constraint fk_프랜차이즈 
    foreign key(프랜번호) references 프랜차이즈_본사(번호) 
    on delete cascade
    on update cascade
);





insert into 프랜차이즈_본사 values(
	'0001',
    '(주) 닥꼬기',
    '홍길동',
    '서울마포구 1-1',
    '010-1111-1111'
);
insert into 프랜차이즈_본사 values(
	'0002',
    '마징가 떢뽂끼',
    '이몽룡',
    '대구 달서구 2-5',
    '010-2222-2222'
);
insert into 프랜차이즈_본사 values(
	'0003',
    '오나라 징어군',
    '오징어',
    '인천시 미추홀구 34-5',
    '010-3333-3333'
);
insert into 프랜차이즈_본사 values(
	'0004',
    '맴구만 빙수',
    '성춘향',
    '제주도 서귀포시 48-23',
    '010-4444-4444'
);


insert into 프랜차이즈_대리점 values('0001-1', '0001', '서울 홍대점', '김사장', '서울 서대문구 25-1', '02-111-1111');
insert into 프랜차이즈_대리점 values('0001-2', '0001', '서울 마포점', '이사장', '서울 마포 25-4', '02-222-2222');
insert into 프랜차이즈_대리점 values('0001-3', '0001', '서울 강남점', '박사장', '서울 강남 16-5', '02-333-3333');
insert into 프랜차이즈_대리점 values('0001-4', '0001', '인천 서구점', '정사장', '인천 서구 24-9', '032-111-1111');
insert into 프랜차이즈_대리점 values('0002-1', '0002', '대구 달서점', '김사장', '대구 달서구 1', '052-111-1111');
insert into 프랜차이즈_대리점 values('0002-2', '0002', '대구 중구점', '이사장', '대구 중구 2', '052-222-2222');
insert into 프랜차이즈_대리점 values('0002-3', '0002', '대전 서구점', '최사장', '대전 서구 1-2', '042-111-1111');
insert into 프랜차이즈_대리점 values('0003-1', '0003', '본점', '오징어', '인천시 미추홀구 1-12', '032-222-2222');
insert into 프랜차이즈_대리점 values('0004-1', '0004', '본점', '성춘향', '제주도 서귀포 52-4', '062-111-1111');
insert into 프랜차이즈_대리점 values('0004-2', '0004', '제주시점', '월매', '제주도 제주시 52-9', '062-222-2222');
insert into 프랜차이즈_대리점 values('0004-3', '0004', '한라대점', '변사또', '제주도 한림음 52-4', '062-333-3333');
insert into 프랜차이즈_대리점 values('0004-4', '0004', '마라점', '강감찬', '제주도 서귀포시 마라도 5-2', '062-444-4444');

-- -- foreign_key 해제
-- set foreign_key_checks = 0;

-- -- table constraint 삭제
-- alter table 프랜차이즈_대리점 drop constraint fk_프랜차이즈;
-- select * from information_schema.table_constraints where table_name = '프랜차이즈_대리점';




-- -- table constraint 추가
-- alter table 프랜차이즈_대리점 add constraint fk_프랜차이즈 foreign key(프랜번호) references 프랜차이즈_본사(번호);


-- -- foreign_key 설정
-- set foreign_key_checks = 1;

-- set foreign_key_checks = 0;
-- alter table 프랜차이즈_대리점 drop constraint fk_프랜차이즈;

-- delete from 프랜차이즈_본사 where 번호 = '0001';
-- delete from 프랜차이즈_대리점 where 프랜번호 = '0001';

-- alter table 프랜차이즈_대리점 add constraint fk_프랜차이즈 foreign key(프랜번호) references 프랜차이즈_본사(번호);
-- set foreign_key_checks = 1;


-- 반드시 순서가 중요하다!
-- 외래키로 인한 참조무결성때문에.
-- delete from 프랜차이즈_대리점 where 프랜번호 = (select 번호 from 프랜차이즈_본사 where 대표 = '홍길동');
-- delete from 프랜차이즈_본사 where 대표 = '홍길동';


-- update 프랜차이즈_대리점 set 플랜번호 = '1000' where 번호 = (select 번호 from 프랜차이즈_본사 where 번호 = '0002');
update 프랜차이즈_본사 set 번호 = '1000' where 번호 = '0002';

delete from 프랜차이즈_본사 where 대표 = '홍길동';



select * from 프랜차이즈_본사;
select * from 프랜차이즈_대리점;

