/* 세션 id 확인 */
select sys_context('userenv', 'sessionid') from dual;

/* T1 트랜잭션 생성 */ 
set transaction name 'T1';

/* bookid = 1 가격 확인 */
select * 
from book
where bookid = 1;

update book
set price = 7100
where bookid = 1;

select *
from book
where bookid = 1;

/* unlock */
commit; 
