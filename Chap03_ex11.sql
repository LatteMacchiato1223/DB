/*교재 199p 문제 11번*/

/*극장 테이블*/
create table theater(
Tnum number primary key, 
Tname varchar2(20),
location varchar2(20));

/*상영관 테이블*/
create table movie(
Tnum number references theater(Tnum), 
/*상영관 번호는 1부터 10 사이*/
Mnum number primary key check(1 <= Mnum and Mnum <= 10),
Mname varchar2(20),
/*영화 가격은 20000원 이하*/
price number check(price < 20000),
seat number);

/*고객 테이블*/ 
create table client(
Cnum number primary key, 
name varchar2(20),
address varchar2(20));

/*예약 테이블*/
create table reservation(
Tnum number references theater(Tnum), 
Mnum number references movie(Mnum),
Cnum number references client(Cnum),
/*같은 사람이 같은 좌석번호를 두번 예약은 불가능*/
Snum number unique,
Rdate date);

/*튜플 추가*/
insert into theater values(1, '롯데', '잠실');
insert into theater values(2, '메가', '강남');
insert into theater values(3, '대한', '잠실');
insert into movie values(1, 1, '어려운 영화', 15000, 48);
insert into movie values(3, 3, '멋진 영화', 7500, 120);
insert into movie values(3, 2, '재밌는 영화', 8000, 110);
insert into client values(3, '홍길동', '강남');
insert into client values(4, '김철수', '잠실');
insert into client values(9, '박영희', '강남');
insert into reservation values(3, 2, 3, 15, '2020-09-01');
insert into reservation values(3, 1, 4, 16, '2020-09-01');
insert into reservation values(1, 1, 9, 48, '2020-09-01');

/*단순질의*/
/*모든 극장의 이름과 위치*/
select Tname as 극장이름, location as 위치
from theater;

/*'잠실'에 있는 극장*/
select * 
from theater
where location = '잠실';

/*'잠실'에 사는 고객의 이름 (오름차순 정렬)*/
select name as 이름
from client
where address = '잠실'
order by name;

/*가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목*/
select Tnum as 극장번호, Mnum as 상영관번호, Mname as 영화제목
from movie
where price <= 8000;

/*극장 위치와 고객의 주소가 같은 고객*/
select distinct name, address, location
from theater, client
where client.address = theater.location;

/*집계질의*/
/*극장의 수*/
select count(Tnum) as "극장의 수"
from theater;

/*상영되는 영화의 평균가*/
select avg(price) as 평균가
from movie;

/*2020년 9월 1일에 영화를 관람한 고객의 수*/
select count(name) as "고객의 수"
from reservation, client
where reservation.Cnum = client.Cnum and Rdate = '2020-09-01';

/*부속질의와 조인*/
/*'대한'극장에서 상영된 영화제목*/
select Mname as 영화제목
from theater, movie
where theater.Tnum = movie.Tnum and Tname = '대한';

/*'대한'극장에서 영화를 본 고객의 이름*/
select name as 이름
from theater, reservation, client
where theater.Tnum = reservation.Tnum and reservation.Cnum = client.Cnum and Tname = '대한';

/*'대한'극장의 전체 수입*/
select sum(price) as "전체 수입"
from theater, reservation, movie
where theater.Tnum = reservation.Tnum and reservation.Mnum = movie.Mnum and Tname = '대한';

/*그룹질의*/
/*극장별 상영관 수*/
select theater.Tnum as 극장번호, count(Mnum) as "상영관 수"
from theater, movie
where theater.Tnum = movie.Tnum 
group by theater.Tnum;

/*'잠실'에 있는 극장의 상영관*/
select *
from theater, movie
where theater.Tnum = movie.Tnum and location = '잠실';

/*2020년 9월 1일의 극장별 평균 관람 고객 수*/
select theater.Tnum as 극장번호, count(Cnum) as "평균 관람객 수"
from theater, reservation
where theater.Tnum = reservation.Tnum and Rdate = '2020-09-01'
group by theater.Tnum;

/*2020년 9월 1일에 가장 많은 고객이 관람한 영화*/
select Mname as 영화이름, count(*) as 고객수 
from movie, reservation 
where movie.Tnum = reservation.Tnum and movie.Mnum = reservation.Mnum and Rdate = '2020-09-01'
group by movie.Mname;

/*테이블 구조 및 내용 확인용*/
select * from theater;
select * from movie;
select * from client;
select * from reservation;