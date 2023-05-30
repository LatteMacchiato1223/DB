/*Chapter04 - SQL���*/

/*���� 4-3*/
/*2023-05-30 �Լ� ����*/
/*���� ��� �ֹ� �ݾ��� ��� ������ �ݿø�*/
select custid "����ȣ", round(sum(saleprice)/count(*), -2) "��ձݾ�"
from orders
group by custid;

/*������ p216*/
/*��¥�� ���� ���� ���*/
select to_date('2020-07-01','yyyy-mm-dd')+5 before,
to_date('2020-07-01','yyyy-mm-dd')-5 after
from dual;

/*���� 4-7*/
/*�ֹ��Ϸκ��� 10�� �� ���� Ȯ��*/
select orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
from orders;

/*���� 4-9*/
/*DBMS ������ ������ ���� ��¥�� �ð�, ���� Ȯ��*/
select sysdate,
to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "sysdate_1"
from dual;

/*���� 4-6*/
/*���缭�� �� �� ���� ���� ���� ����� �� ������ ������ �ο��� ���ϱ�*/
select substr(name,1,1) "��", count(*) "�ο�"
from customer
group by substr(name,1,1);

/*���� 4-10*/
/*null���� �ٸ� ������ ��ġ�ϴ� nvl�Լ�*/
select name "�̸�", nvl(phone,'����ó ����') "��ȭ��ȣ"
from customer;

/*���� 4-11*/
/*sql ��ȸ ����� �������� ��Ÿ���� rownum*/
select rownum "����", custid, name, phone
from customer
where rownum <= 2;

/*�������� 03*/
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
