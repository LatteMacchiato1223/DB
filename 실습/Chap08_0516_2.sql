select sys_context('userenv', 'sessionid') from dual;

/* T2 Ʈ����� ���� */ 
set transaction name 'T2';

/* bookid = 1 ���� Ȯ�� */
select * 
from book
where bookid = 1;

/* T1�� commit �ϱ� ������ lock ����*/
update book
set price = price + 100
where bookid = 1;

select * 
from book
where bookid = 1;

/* Ʈ����� ���� */
commit;