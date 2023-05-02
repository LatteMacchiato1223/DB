/*7�� summer table*/
create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values (100, 'FORTRAN', 20000);
insert into summer values (150, 'PASCAL', 15000);
insert into summer values (200, 'C', 10000);
insert into summer values (250, 'FORTRAN', 20000);

/*�����б⸦ ��� �л��� �й��� �����ϴ� ����*/
select sid, class
from summer;

/*C ������ ������*/
select price
from summer
where class = 'C';

/*�����ᰡ ���� ��� ����*/
select distinct class
from summer
where price = (select max(price)
               from summer);
               
/*�����б⸦ ��� �л� ���� ������ �Ѿ�*/
select count(*) as "�л� ��", sum(price) as "������ �Ѿ�"
from summer;

/*�����̻�*/
/*200�� �л��� �����б� ������û�� ���*/
delete from summer where sid = 200;

/*���� �� C ���� ������ ��ȸ*/
/*��ȸ �Ұ���*/
select price as "C ������"
from summer
where class = 'C';

/*���� �ǽ��� ���� 200�� �л� �ڷ� �ٽ� �Է�*/
insert into summer values (200, 'C', 10000);

/*�����̻�*/
/*�����б⿡ ���ο� �ڹ� ���¸� ����*/
insert into summer values (null, 'JAVA', 25000);

/*null ���� �ִ� �ܿ� ������ ���� : ������ 5���̳� �����л��� �� 4��*/
select count(*) as "�����ο�"
from summer;

/*�����ο��� 4�� ���*/
select count(sid) as "�����ο�"
from summer;

/*count(*) ���·� �����ϰ� ���� ���*/
select count(*) as "�����ο�"
from summer
where sid is not null;

/*�����̻�*/
/*FORTRAN ������ �����Ḧ 20000���� 15000���� ����*/
update summer
set price = 15000
where class = 'FORTRAN';

/*FORTRAN ������ ������ Ȯ��*/
select distinct price as "FORTRAN ������"
from summer
where class = 'FORTRAN';

/*���� �ǽ��� ���� FORTRAN ������ �����Ḧ �ٽ� 20000���� ����*/
update summer
set price = 20000
where class = 'FORTRAN';

/*UPDATE ���� ������ ���� �ۼ��ϸ� ������ ����ġ ������ �߻�*/
/*FORTRAN ������ �����ᰡ �� �Ǹ� ����*/
update summer
set price = 15000
where class = 'FORTRAN' and sid = 100;

/*FORTRAN ������ �����Ḧ ��ȸ�ϸ� �� ���� ���(������ ����ġ)*/
select distinct price as "FORTRAN ������"
from summer
where class = 'FORTRAN';

/*���� �ǽ��� ���� FORTRAN ������ �����Ḧ �ٽ� 20000���� ����*/
update summer
set price = 20000
where class = 'FORTRAN';

/*���̺� ����ȭ(���̺� �и�)*/
/*summerPrice ���̺� ����*/
create table summerPrice(
    class varchar2(20),
    price integer
);

insert into summerPrice values ('FORTRAN', 20000);
insert into summerPrice values ('PASCAL', 15000);
insert into summerPrice values ('C', 10000);

/*summerEnroll ���̺� ����*/
create table summerEnroll(
    sid integer,
    class varchar2(20)
);

insert into summerEnroll values (100, 'FORTRAN');
insert into summerEnroll values (150, 'PASCAL');
insert into summerEnroll values (200, 'C');
insert into summerEnroll values (250, 'FORTRAN');

/*�����б⸦ ��� �л��� �й��� �����ϴ� ����*/
select sid, class
from summerEnroll;

/*C ������ ������*/
select price
from summerPrice
where class = 'C';

/*�����ᰡ ���� ��� ����*/
select distinct class
from summerPrice
where price = (select max(price)
               from summerPrice);
               
/*�����б⸦ ��� �л� ���� ������ �Ѿ�*/
select count(*) as "�л� ��", sum(price) as "������ �Ѿ�"
from summerPrice, summerEnroll
where summerPrice.class = summerEnroll.class;

/*�����̻� ����*/
/*C ���� ������ ��ȸ*/
/*������û ��� ���Ŀ��� ���� ���*/
select price as "C ������"
from summerPrice
where class = 'C';

/*200�� �л��� �����б� ������û�� ���*/
delete from summerEnroll 
where sid = 200;

/*�����̻� ����*/
/*�����б⿡ ���ο� �ڹ� ���¸� ����*/
insert into summerPrice values ('JAVA', 25000);

/*�����̻� ����*/
/*FORTRAN ������ �����Ḧ 20000���� 15000���� ����*/
update summerPrice
set price = 15000
where class = 'FORTRAN';

/*FORTRAN ������ ������ Ȯ��*/
select price as "FORTRAN ������"
from summerPrice
where class = 'FORTRAN';

/*���̺� ��ȸ*/
select * from summer;
select * from summerPrice;
select * from summerEnroll;