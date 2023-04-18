/*department table 생성*/
create table Department (
deptno number not null primary key,
deptname varchar2(20),
manager varchar2(20));


/*employee table  생성*/
create table Employee (
empno number not null primary key,
name varchar2(20),
phoneno number,
address varchar2(20),
sex varchar2(20),
position varchar2(20),
deptno number,
foreign key (deptno) references Department(deptno) on delete cascade);


/*project table 생성*/ 
create table Project (
projno number not null primary key,
projname varchar2(20),
deptno number,
foreign key (deptno) references Department(deptno) on delete cascade);


/*works table 생성*/
create table Works (
projno number not null,
empno number not null,
hoursworked number,
primary key (projno, empno),
foreign key (projno) references Project(projno) on delete cascade,
foreign key (empno) references Employee(empno) on delete cascade);


/*department table 데이터*/
insert into Department(deptno, deptname, manager)
values(1, 'IT', '고남순');
insert into Department(deptno, deptname, manager)
values(2, 'Marketing', '홍길동');


/*employee table 데이터*/
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(1, '김덕성', 01012341232, '서울', '여', 'Programmer', 1);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(2, '이서울', 01012323122, '서울', '남', 'Programmer', 1);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(3, '박연세', 01076851231, '대전', '여', 'Salesperson', 2);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(4, '홍길동', 01012341546, '서울', '남', 'Manager', 2);
insert into Employee(empno, name, phoneno, address, sex, position, deptno)
values(5, '고남순', 01012311112, '서울', '여', 'Manager', 1);


/*project table 데이터*/
insert into Project(projno, projname, deptno)
values(1, '데이터베이스', 1);
insert into Project(projno, projname, deptno)
values(2, '시장조사', 2);


/*works table 데이터*/
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


/*테이블 구조 및 내용 확인용*/
select * from Department;
select * from Employee;
select * from Project;
select * from Works;
