/* ���� id Ȯ�� */
select sys_context('userenv', 'sessionid') from dual;

/* T1 Ʈ����� ���� */ 
set transaction name 'T1';

/* bookid = 1 ���� Ȯ�� */
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
