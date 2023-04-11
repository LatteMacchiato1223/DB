/*교재 196p 4번의 1~7 문제*/

/*새로운 도서('스포츠세계', '대한미디어', 10000원) 삽입*/
/*삽입이 안 될 경우 필요한 추가 데이터 확인*/
insert into book(bookid, bookname, publisher, price)
values(15, '스포츠세계', '대한미디어', 10000); /*bookid가 추가되어야 함*/

/*'삼성당'에서 출판한 도서 삭제*/
delete from book
where publisher = '삼성당';
/*삭제복구 : delete 복구용*/
rollback;

/*'이상미디어'에서 출판한 도서 삭제*/
/*삭제가 안 될 경우 원인 확인*/
/*외래키 참조로 인해 삭제 불가능*/
delete from book
where publisher = '이상미디어';
/*삭제복구 : delete 복구용*/
rollback;

/*출판사 '대한미디어'를 '대한출판사'로 변경*/
update book
set publisher = '대한출판사'
where publisher= '대한미디어';

/*출판사에 대한 정보를 저장하는 테이블 BookCompany(name, address, begin)을 생성*/
/*name: 기본키, varchar2(20), address: varchar2(20), begin: date*/
create table bookCompany(
name varchar2(20) primary key,
address varchar2(20),
begin date);

/*bookCompany 테이블에 인터넷 주소를 저장하는 webaddress 속성 추가*/
/*webaddress: varchar2(30)*/
alter table bookCompany add webaddress varchar2(30);

/*bookCompany 테이블에 임의의 튜플 삽입*/
/*name = 한빛아카데미, address = 서울시 마포구, begin = 1993-01-01, webaddress = http://hanbit.co.kr*/
insert into bookCompany(name, address, begin, webaddress)
values('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');

/*테이블 구조 및 내용 확인용*/
select * from book;
select * from bookCompany;
