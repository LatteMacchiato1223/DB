/*Chapter04 - SQL고급*/

/*질의 4-3*/
/*2023-05-30 함수 연습*/
/*고객별 평균 주문 금액을 백원 단위로 반올림*/
select custid "고객번호", round(sum(saleprice)/count(*), -2) "평균금액"
from orders
group by custid;

/*교과서 p216*/
/*날짜의 이전 이후 계산*/
select to_date('2020-07-01','yyyy-mm-dd')+5 before,
to_date('2020-07-01','yyyy-mm-dd')-5 after
from dual;

/*질의 4-7*/
/*주문일로부터 10일 후 매출 확정*/
select orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
from orders;

/*질의 4-9*/
/*DBMS 서버에 설정된 현재 날짜와 시간, 요일 확인*/
select sysdate,
to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "sysdate_1"
from dual;

/*질의 4-6*/
/*마당서점 고객 중 같은 성을 가진 사람이 몇 명인지 성별로 인원수 구하기*/
select substr(name,1,1) "성", count(*) "인원"
from customer
group by substr(name,1,1);

/*질의 4-10*/
/*null값을 다른 값으로 대치하는 nvl함수*/
select name "이름", nvl(phone,'연락처 없음') "전화번호"
from customer;

/*질의 4-11*/
/*sql 조회 결과를 순번으로 나타내는 rownum*/
select rownum "순번", custid, name, phone
from customer
where rownum <= 2;

/*연습문제 03*/
/*3-1*/
select *
from book;

/*3-2*/
select *
from book
where rownum <= 5;

/*3-3*/
select *
from book
where rownum <= 5
order by price;

/*3-4*/
select *
from (select * from book order by price) 
where rownum <= 5;

/*3-5*/
select *
from (select * from book where rownum <= 5) 
order by price;

/*3-6*/
select *
from (select * from book where rownum <= 5 order by price);
