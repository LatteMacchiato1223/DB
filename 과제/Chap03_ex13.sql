/*department table ����*/
create table Department (
deptno number not null primary key,
deptname varchar2(20),
manager varchar2(20));


/*employee table  ����*/
create table Employee (
empno number not null primary key,
name varchar2(20),
phoneno number,
address varchar2(20),
sex varchar2(20),
position varchar2(20),
deptno number,
foreign key (deptno) references Department(deptno) on delete cascade);


/*project table ����*/ 
create table Project (
projno number not null primary key,
projname varchar2(20),
deptno number,
foreign key (deptno) references Department(deptno) on delete cascade);


/*works table ����*/
create table Works (
projno number not null,
empno number not null,
hoursworked number,
primary key (projno, empno),
foreign key (projno) references Project(projno) on delete cascade,
foreign key (empno) references Employee(empno) on delete cascade);


/*department table ������*/
insert into Department(deptno, deptname, manager)
values(1, 'IT', '����');
insert into Department(deptno, deptname, manager)
values(2, 'Marketing', 'ȫ�浿');


/*employee table ������*/
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(1, '�����', 01012341232, '����', '��', 'Programmer', 1);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(2, '�̼���', 01012323122, '����', '��', 'Programmer', 1);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(3, '�ڿ���', 01076851231, '����', '��', 'Salesperson', 2);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(4, 'ȫ�浿', 01012341546, '����', '��', 'Manager', 2);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(5, '����', 01012311112, '����', '��', 'Manager', 1);


/*project table ������*/
insert into Project(projno, projname, deptno)
values(1, '�����ͺ��̽�', 1);
insert into Project(projno, projname, deptno)
values(2, '��������', 2);


/*works table ������*/
insert into Works(projno, empno, hoursworked)
values(1, 1, 3);
insert into Works(projno, empno, hoursworked)
values(1, 2, 1);
insert into Works(projno, empno, hoursworked)
values(2, 3, 1);
insert into Works(projno, empno, hoursworked)
values(2, 4, 5);
insert into Works(projno, empno, hoursworked)
values(1, 5, 1);


/*���̺� ���� �� ���� Ȯ�ο�*/
select * from Department;
select * from Employee;
select * from Project;
select * from Works;
