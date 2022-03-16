-- -------------------------------------------
-- 권한 설정
-- -------------------------------------------

create user admin_book@localhost identified with mysql_native_password by 'qwer1234!';
grant all privileges on 도서관리_db.* to admin_book@localhost with grant option;
