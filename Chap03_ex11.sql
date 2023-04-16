/*���� 199p ���� 11��*/

/*���� ���̺�*/
create table theater(
Tnum number primary key, 
Tname varchar2(20),
location varchar2(20));

/*�󿵰� ���̺�*/
create table movie(
Tnum number references theater(Tnum), 
/*�󿵰� ��ȣ�� 1���� 10 ����*/
Mnum number primary key check(1 <= Mnum and Mnum <= 10),
Mname varchar2(20),
/*��ȭ ������ 20000�� ����*/
price number check(price < 20000),
seat number);

/*�� ���̺�*/ 
create table client(
Cnum number primary key, 
name varchar2(20),
address varchar2(20));

/*���� ���̺�*/
create table reservation(
Tnum number references theater(Tnum), 
Mnum number references movie(Mnum),
Cnum number references client(Cnum),
/*���� ����� ���� �¼���ȣ�� �ι� ������ �Ұ���*/
Snum number unique,
Rdate date);

/*Ʃ�� �߰�*/
insert into theater values(1, '�Ե�', '���');
insert into theater values(2, '�ް�', '����');
insert into theater values(3, '����', '���');
insert into movie values(1, 1, '����� ��ȭ', 15000, 48);
insert into movie values(3, 3, '���� ��ȭ', 7500, 120);
insert into movie values(3, 2, '��մ� ��ȭ', 8000, 110);
insert into client values(3, 'ȫ�浿', '����');
insert into client values(4, '��ö��', '���');
insert into client values(9, '�ڿ���', '����');
insert into reservation values(3, 2, 3, 15, '2020-09-01');
insert into reservation values(3, 1, 4, 16, '2020-09-01');
insert into reservation values(1, 1, 9, 48, '2020-09-01');

/*�ܼ�����*/
/*��� ������ �̸��� ��ġ*/
select Tname as �����̸�, location as ��ġ
from theater;

/*'���'�� �ִ� ����*/
select * 
from theater
where location = '���';

/*'���'�� ��� ���� �̸� (�������� ����)*/
select name as �̸�
from client
where address = '���'
order by name;

/*������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ����*/
select Tnum as �����ȣ, Mnum as �󿵰���ȣ, Mname as ��ȭ����
from movie
where price <= 8000;

/*���� ��ġ�� ���� �ּҰ� ���� ��*/
select distinct name, address, location
from theater, client
where client.address = theater.location;

/*��������*/
/*������ ��*/
select count(Tnum) as "������ ��"
from theater;

/*�󿵵Ǵ� ��ȭ�� ��հ�*/
select avg(price) as ��հ�
from movie;

/*2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ��*/
select count(name) as "���� ��"
from reservation, client
where reservation.Cnum = client.Cnum and Rdate = '2020-09-01';

/*�μ����ǿ� ����*/
/*'����'���忡�� �󿵵� ��ȭ����*/
select Mname as ��ȭ����
from theater, movie
where theater.Tnum = movie.Tnum and Tname = '����';

/*'����'���忡�� ��ȭ�� �� ���� �̸�*/
select name as �̸�
from theater, reservation, client
where theater.Tnum = reservation.Tnum and reservation.Cnum = client.Cnum and Tname = '����';

/*'����'������ ��ü ����*/
select sum(price) as "��ü ����"
from theater, reservation, movie
where theater.Tnum = reservation.Tnum and reservation.Mnum = movie.Mnum and Tname = '����';

/*�׷�����*/
/*���庰 �󿵰� ��*/
select theater.Tnum as �����ȣ, count(Mnum) as "�󿵰� ��"
from theater, movie
where theater.Tnum = movie.Tnum 
group by theater.Tnum;

/*'���'�� �ִ� ������ �󿵰�*/
select *
from theater, movie
where theater.Tnum = movie.Tnum and location = '���';

/*2020�� 9�� 1���� ���庰 ��� ���� �� ��*/
select theater.Tnum as �����ȣ, count(Cnum) as "��� ������ ��"
from theater, reservation
where theater.Tnum = reservation.Tnum and Rdate = '2020-09-01'
group by theater.Tnum;

/*2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ*/
select Mname as ��ȭ�̸�, count(*) as ���� 
from movie, reservation 
where movie.Tnum = reservation.Tnum and movie.Mnum = reservation.Mnum and Rdate = '2020-09-01'
group by movie.Mname;

/*���̺� ���� �� ���� Ȯ�ο�*/
select * from theater;
select * from movie;
select * from client;
select * from reservation;