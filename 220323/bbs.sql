-- DB 구축
-- DB명 : bbs
drop database if exists bbs;

create database bbs;

use bbs;

-- table1: user
create table user(
	userID varchar(20),
    userPassword varchar(20) not null, 
	userName varchar (20) not null, 
	userAddress varchar (50),
	userBirthday date, 
	userGender varchar(5), 
	userEmail varchar(45), 
	userPhone varchar(20) not null,
    primary key(userID)
);

-- table2: notice
create table notice(
	noticeID int not null,
	noticeTit varchar(30) not null,
	noticeContent varchar(5000),
	noticeName varchar(20) not null,
	noticeDate date,
    primary key(noticeID)
);




