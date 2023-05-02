/*7장 summer table*/
create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values (100, 'FORTRAN', 20000);
insert into summer values (150, 'PASCAL', 15000);
insert into summer values (200, 'C', 10000);
insert into summer values (250, 'FORTRAN', 20000);

/*계절학기를 듣는 학생의 학번과 수강하는 과목*/
select sid, class
from summer;

/*C 강좌의 수강료*/
select price
from summer
where class = 'C';

/*수강료가 가장 비싼 과목*/
select distinct class
from summer
where price = (select max(price)
               from summer);
               
/*계절학기를 듣는 학생 수와 수강료 총액*/
select count(*) as "학생 수", sum(price) as "수강료 총액"
from summer;

/*삭제이상*/
/*200번 학생의 계절학기 수강신청을 취소*/
delete from summer where sid = 200;

/*삭제 후 C 강좌 수강료 조회*/
/*조회 불가능*/
select price as "C 수강료"
from summer
where class = 'C';

/*다음 실습을 위해 200번 학생 자료 다시 입력*/
insert into summer values (200, 'C', 10000);

/*삽입이상*/
/*계절학기에 새로운 자바 강좌를 개설*/
insert into summer values (null, 'JAVA', 25000);

/*null 값이 있는 겨우 주의할 질의 : 투플은 5개이나 수강학생은 총 4명*/
select count(*) as "수강인원"
from summer;

/*수강인원이 4명 출력*/
select count(sid) as "수강인원"
from summer;

/*count(*) 상태로 유지하고 싶을 경우*/
select count(*) as "수강인원"
from summer
where sid is not null;

/*수정이상*/
/*FORTRAN 강좌의 수강료를 20000에서 15000으로 수정*/
update summer
set price = 15000
where class = 'FORTRAN';

/*FORTRAN 강좌의 수강료 확인*/
select distinct price as "FORTRAN 수강료"
from summer
where class = 'FORTRAN';

/*다음 실습을 위해 FORTRAN 강좌의 수강료를 다시 20000으로 복구*/
update summer
set price = 20000
where class = 'FORTRAN';

/*UPDATE 문을 다음과 같이 작성하면 데이터 불일치 문제가 발생*/
/*FORTRAN 강죄의 수강료가 한 건만 수정*/
update summer
set price = 15000
where class = 'FORTRAN' and sid = 100;

/*FORTRAN 강좌의 수강료를 조회하면 두 건이 출력(데이터 불일치)*/
select distinct price as "FORTRAN 수강료"
from summer
where class = 'FORTRAN';

/*다음 실습을 위해 FORTRAN 강좌의 수강료를 다시 20000으로 복구*/
update summer
set price = 20000
where class = 'FORTRAN';

/*테이블 정규화(테이블 분리)*/
/*summerPrice 테이블 생성*/
create table summerPrice(
    class varchar2(20),
    price integer
);

insert into summerPrice values ('FORTRAN', 20000);
insert into summerPrice values ('PASCAL', 15000);
insert into summerPrice values ('C', 10000);

/*summerEnroll 테이블 생성*/
create table summerEnroll(
    sid integer,
    class varchar2(20)
);

insert into summerEnroll values (100, 'FORTRAN');
insert into summerEnroll values (150, 'PASCAL');
insert into summerEnroll values (200, 'C');
insert into summerEnroll values (250, 'FORTRAN');

/*계절학기를 듣는 학생의 학번과 수강하는 과목*/
select sid, class
from summerEnroll;

/*C 강좌의 수강료*/
select price
from summerPrice
where class = 'C';

/*수강료가 가장 비싼 과목*/
select distinct class
from summerPrice
where price = (select max(price)
               from summerPrice);
               
/*계절학기를 듣는 학생 수와 수강료 총액*/
select count(*) as "학생 수", sum(price) as "수강료 총액"
from summerPrice, summerEnroll
where summerPrice.class = summerEnroll.class;

/*삭제이상 없음*/
/*C 강좌 수강료 조회*/
/*수강신청 취소 이후에도 내용 출력*/
select price as "C 수강료"
from summerPrice
where class = 'C';

/*200번 학생의 계절학기 수강신청을 취소*/
delete from summerEnroll 
where sid = 200;

/*삽입이상 없음*/
/*계절학기에 새로운 자바 강좌를 개설*/
insert into summerPrice values ('JAVA', 25000);

/*수정이상 없음*/
/*FORTRAN 강좌의 수강료를 20000에서 15000으로 수정*/
update summerPrice
set price = 15000
where class = 'FORTRAN';

/*FORTRAN 강좌의 수강료 확인*/
select price as "FORTRAN 수강료"
from summerPrice
where class = 'FORTRAN';

/*테이블 조회*/
select * from summer;
select * from summerPrice;
select * from summerEnroll;
