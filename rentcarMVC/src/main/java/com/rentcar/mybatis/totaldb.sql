create database rentcarDB;
use rentcarDB;


drop table user;
create table user(
  num int auto_increment primary key,
  name varchar(30) not null,
  userid varchar(30) unique key not null,
  pwd varchar(30) not null,
  email varchar(30) not null,
  phone varchar(30) not null
);
select* from user;

CREATE TABLE rentcar(
	num int auto_increment primary key,
    name VARCHAR(20) unique key not null,
    category INT  not null,
    price INT  not null,
    usepeople INT  not null default 3,
    company VARCHAR(50) not null,
    img VARCHAR(50) not null,
    info VARCHAR(500) 
);

drop table reservation;
CREATE TABLE reservation(
	reserve_seq int auto_increment primary key,
    num INT,
    userid VARCHAR(50),
    qty INT,
    dday INT,
    rday VARCHAR(50),
    usein INT,
    usewifi INT,
    usenavi INT,
    useseat INT
-- CONSTRAINT fk_num FOREIGN KEY(num) REFERENCES rentcar(num) ON DELETE CASCADE on update cascade ,
--  CONSTRAINT fk_id FOREIGN KEY(userid) REFERENCES user(userid) ON DELETE CASCADE on update cascade
);
-- rentercar 데이터 삽입
INSERT INTO rentcar VALUES (null, '아반테', 1,  2000, 4, '기아', '1.jpg' , '아반테 자동차 입니다.');
INSERT INTO rentcar VALUES (null, 'BMW', 3,  6000, 4, 'BMW', '2.jpg' , 'BMW 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '카니발', 1,  4000, 7, '기아', '3.jpg' , '카니발 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '카렌스', 2,  2500, 4, '기아', '4.jpg' , '카렌스 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '코란도', 1,  3000, 4, '현대', '5.jpg' , '코란도 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '에쿠스', 3,  6000, 4, 'BMW', '6.jpg' , '에쿠스 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '제네시스', 1,  3000, 4, '기아', '7.jpg' , '제네시스 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '그랜져', 1,  2400, 4, '현대', '8.jpg' , '그랜져 자동차 입니다.');
INSERT INTO rentcar VALUES (null, 'k3', 1,  2700, 4, '현대', '9.jpg' , 'k3 자동차 입니다.');
INSERT INTO rentcar VALUES (null, 'k5', 2,  5000, 4, '기아', '10.jpg' , 'k5 자동차 입니다.');
INSERT INTO rentcar VALUES (null, 'k9', 1,  6000, 4, '현대', '11.jpg' , 'k9 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '라세티', 2,  2000, 5, '기아', '12.jpg' , '라세티 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '소나타', 1,  2000, 4, '현대', '13.jpg' , 'lf소나타 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '말리부', 3,  2000, 4, 'BMW', '14.jpg' , '말리부 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '모닝', 1,  23000, 4, '현대', '15.jpg' , '모닝 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '올라도', 3,  5000, 4, 'BMW', '16.jpg' , '올라도 자동차 입니다.');
INSERT INTO rentcar VALUES (null, '레이', 2,  4000, 4, '현대', '17.jpg' , '레이 자동차 입니다.');
INSERT INTO rentcar VALUES (null, 'SM5', 1,  2700, 4, 'BMW', '18.jpg' , 'SM5 자동차 입니다.');

select * from rentcar;

INSERT INTO user (name, userid, pwd, email, phone)
VALUES
  ('관리자', 'admin', 'admin', 'admin@example.com', '010-555-1234'),
  ('테스트1', 'qwer', '1234', 'qwer@example$ㅖ{.com', '010-555-5678'),
  ('테스트2', 'abcd', '1234', 'abcd@example.com', '010-555-9012');

INSERT INTO reservation (num, userid, qty, dday, rday, usein, usewifi, usenavi, useseat) VALUES
(1, 'qwer', 1, 3, '2024-02-01', 1, 1, 0, 0),
(2, 'qwer', 1, 5, '2024-02-02', 0, 1, 1, 1),
(3, 'qwer', 1, 7, '2024-02-03', 1, 0, 1, 1),
(1, 'qwer', 1, 4, '2024-02-04', 1, 1, 0, 0),
(4, 'qwer', 1, 6, '2024-02-04', 0, 0, 1, 1),
(2, 'qwer', 1, 8, '2024-02-02', 0, 1, 1, 1);


select * from user;
select * from rentcar;
select * from reservation;

select * from rentcar where usepeople > 0 order by num desc;

select * from rentcar where usepeople > 0 order by num desc limit 3;

select * from rentcar where usepeople > 0 and category= 1 order by price desc;
select * from rentcar where usepeople > 0 and category= 2 order by price desc;
select * from rentcar where usepeople > 0 and category= 3 order by price desc;

select * from reservation where userid = 'qwer' order by reserve_seq desc;
select * from reservation where num = '1' order by rday;




DELETE from rentcar where no=2;
UPDATE rentcar SET no = no -1 WHERE name = 'SM5';
SELECT * FROM rentcar ORDER BY no;
-- 최신순으로 3대의 자동차 정보 추출
SELECT * FROM rentcar ORDER BY no DESC LIMIT 3;
