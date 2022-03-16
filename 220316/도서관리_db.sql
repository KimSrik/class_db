drop database if exists 도서관리_db;
create database if not exists 도서관리_db;
use 도서관리_db;

create table 회원정보(
	회원번호 varchar(5) not null,
    회원이름 varchar(20) not null,
    주소 varchar(50) not null,
    전화번호 varchar(20) not null unique,
    primary key(회원번호)
);

create table 주문회원(
	주문번호 varchar(11) not null,
    주문날짜 date,
    회원번호 varchar(50) not null,
    primary key(주문번호),
    foreign key(회원번호) references 회원정보(회원번호)
);

create table 도서정보(
	도서시리얼넘버 varchar(8) not null,
    도서명 varchar(50) not null unique,
    primary key(도서시리얼넘버)
);

create table 판매정보(
	주문번호 varchar(11) not null,
    회원번호 varchar(5) not null,
    도서시리얼넘버 varchar(8) not null,
    수량 int,
    단가 int,
    primary key(주문번호),
    foreign key(주문번호) references 주문회원(주문번호),
    foreign key(회원번호) references 회원정보(회원번호),
    foreign key(도서시리얼넘버) references 도서정보(도서시리얼넘버)
);
