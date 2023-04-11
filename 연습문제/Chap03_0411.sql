/*newBook 테이블 생성*/
create table newBook(
bookid number primary key, /*기본키로 설정*/
bookname varchar2(20) not null, /*데이터 값이 공백일 수 X*/
publisher varchar2(20) unique, /*출판사 중복은 X*/
price number default 10000 check(price > 1000)); /*1000원 이상, 기본값 10000원*/

/*newCustomer 테이블 생성*/
create table newCustomer(
custid number primary key, /*기본키로 설정*/
name varchar2(20),
address varchar2(20),
phone varchar2(30));

/*newOrders 테이블 생성*/
create table newOrders(
orderid number,
custid number not null, /*데이터 값이 공백일 수 X : 외래키*/
bookid number not null, /*데이터 값이 공백일 수 X : 외래키*/
saleprice number, 
orderdate date, 
primary key(orderid), /*이 방식으로도 기본키 설정이 가능*/
foreign key(custid) references newCustomer(custid) on delete cascade); /*references : 참조 테이블 & on delete cascade : 삭제 시 연쇄삭제*/

/*생성한 테이블의 속성과 속성에 관한 제약 변경*/
alter table newBook add isbn varchar2(13); /*add : 속성 추가*/
alter table newBook modify isbn number; /*modify : 속성 변경*/
drop table newBook; /*drop : 테이블 삭제*/

/*튜플 추가*/
insert into book(bookid, bookname, publisher, price)
values(11, '스포츠의학', '한술의학서적', 90000);

insert into book(bookid, bookname, publisher)
values(14, '스포츠의학', '한술의학서적');

/*대량 삽입*/
insert into book(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price
from imported_book;

/*주소 변경*/
update customer
set address = '대한민국 부산'
where custid=5; /*id가 5인 인물의 주소만 변경*/

update customer
set address=(select address
             from customer
             where name='김연아') /*김연아의 주소로 변경*/
where name='박세리';

/*튜플 삭제*/
delete from customer
where custid = 5;
/*삭제복구 : delete 복구용*/
rollback;

/*테이블 구조 및 내용 확인용*/
select * from newBook;
select * from newCustomer;
select * from newOrders;
select * from book;
select * from imported_book;
select * from customer;
