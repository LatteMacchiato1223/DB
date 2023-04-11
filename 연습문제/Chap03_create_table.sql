/*newBook ���̺� ����*/
create table newBook(
bookid number primary key, /*�⺻Ű�� ����*/
bookname varchar2(20) not null, /*������ ���� ������ �� X*/
publisher varchar2(20) unique, /*���ǻ� �ߺ��� X*/
price number default 10000 check(price > 1000)); /*1000�� �̻�, �⺻�� 10000��*/

/*newCustomer ���̺� ����*/
create table newCustomer(
custid number primary key, /*�⺻Ű�� ����*/
name varchar2(20),
address varchar2(20),
phone varchar2(30));

/*newOrders ���̺� ����*/
create table newOrders(
orderid number,
custid number not null, /*������ ���� ������ �� X : �ܷ�Ű*/
bookid number not null, /*������ ���� ������ �� X : �ܷ�Ű*/
saleprice number, 
orderdate date, 
primary key(orderid), /*�� ������ε� �⺻Ű ������ ����*/
foreign key(custid) references newCustomer(custid) on delete cascade); /*references : ���� ���̺� & on delete cascade : ���� �� �������*/

/*������ ���̺��� �Ӽ��� �Ӽ��� ���� ���� ����*/
alter table newBook add isbn varchar2(13); /*add : �Ӽ� �߰�*/
alter table newBook modify isbn number; /*modify : �Ӽ� ����*/
drop table newBook; /*drop : ���̺� ����*/

/*Ʃ�� �߰�*/
insert into book(bookid, bookname, publisher, price)
values(11, '����������', '�Ѽ����м���', 90000);

insert into book(bookid, bookname, publisher)
values(14, '����������', '�Ѽ����м���');

/*�뷮 ����*/
insert into book(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price
from imported_book;

/*�ּ� ����*/
update customer
set address = '���ѹα� �λ�'
where custid=5; /*id�� 5�� �ι��� �ּҸ� ����*/

update customer
set address=(select address
             from customer
             where name='�迬��') /*�迬���� �ּҷ� ����*/
where name='�ڼ���';

/*Ʃ�� ����*/
delete from customer
where custid = 5;
/*�������� : delete ������*/
rollback;

/*���̺� ���� �� ���� Ȯ�ο�*/
select * from newBook;
select * from newCustomer;
select * from newOrders;
select * from book;
select * from imported_book;
select * from customer;
