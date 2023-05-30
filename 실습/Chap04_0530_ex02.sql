/*질의 4-13*/
/*중첩질의(nested subquery)-where절-비교연산자*/
select orderid, custid, saleprice
from orders md
where saleprice > (select avg(saleprice)
                   from orders so
                   where md.custid = so.custid);
                
/*질의 4-14*/
/*중첩질의(nested subquery)-in, not in 연산자*/
select sum(saleprice) "total"
from orders
where custid in (select custid
                 from customer
                 where address like '%대한민국%');
                 
/*질의 4-15*/
/*중첩질의(nested subquery)-all, some(any) 연산자*/
select orderid, saleprice
from orders
where saleprice > all (select saleprice
                       from orders
                       where custid = 3);

/*질의 4-16*/
/*중첩질의(nested subquery)-exists, not exists 연산자*/
select sum(saleprice) "total"
from orders od
where exists (select *
              from customer cs
              where address like '%대한민국%' and cs.custid = od.custid);

