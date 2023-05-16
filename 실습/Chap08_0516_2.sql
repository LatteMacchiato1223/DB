select sys_context('userenv', 'sessionid') from dual;

/* T2 트랜잭션 생성 */ 
set transaction name 'T2';

/* bookid = 1 가격 확인 */
select * 
from book
where bookid = 1;

/* T1이 commit 하기 전까진 lock 상태*/
update book
set price = price + 100
where bookid = 1;

select * 
from book
where bookid = 1;

/* 트랜잭션 종료 */
commit;