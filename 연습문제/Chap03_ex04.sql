/*���� 196p 4���� 1~7 ����*/

/*���ο� ����('����������', '���ѹ̵��', 10000��) ����*/
/*������ �� �� ��� �ʿ��� �߰� ������ Ȯ��*/
insert into book(bookid, bookname, publisher, price)
values(15, '����������', '���ѹ̵��', 10000); /*bookid�� �߰��Ǿ�� ��*/

/*'�Ｚ��'���� ������ ���� ����*/
delete from book
where publisher = '�Ｚ��';
/*�������� : delete ������*/
rollback;

/*'�̻�̵��'���� ������ ���� ����*/
/*������ �� �� ��� ���� Ȯ��*/
/*�ܷ�Ű ������ ���� ���� �Ұ���*/
delete from book
where publisher = '�̻�̵��';
/*�������� : delete ������*/
rollback;

/*���ǻ� '���ѹ̵��'�� '�������ǻ�'�� ����*/
update book
set publisher = '�������ǻ�'
where publisher= '���ѹ̵��';

/*���ǻ翡 ���� ������ �����ϴ� ���̺� BookCompany(name, address, begin)�� ����*/
/*name: �⺻Ű, varchar2(20), address: varchar2(20), begin: date*/
create table bookCompany(
name varchar2(20) primary key,
address varchar2(20),
begin date);

/*bookCompany ���̺� ���ͳ� �ּҸ� �����ϴ� webaddress �Ӽ� �߰�*/
/*webaddress: varchar2(30)*/
alter table bookCompany add webaddress varchar2(30);

/*bookCompany ���̺� ������ Ʃ�� ����*/
/*name = �Ѻ���ī����, address = ����� ������, begin = 1993-01-01, webaddress = http://hanbit.co.kr*/
insert into bookCompany(name, address, begin, webaddress)
values('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');

/*���̺� ���� �� ���� Ȯ�ο�*/
select * from book;
select * from bookCompany;
