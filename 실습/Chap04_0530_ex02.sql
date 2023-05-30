/*���� 4-13*/
/*��ø����(nested subquery)-where��-�񱳿�����*/
select orderid, custid, saleprice
from orders md
where saleprice > (select avg(saleprice)
                   from orders so
                   where md.custid = so.custid);
                
/*���� 4-14*/
/*��ø����(nested subquery)-in, not in ������*/
select sum(saleprice) "total"
from orders
where custid in (select custid
                 from customer
                 where address like '%���ѹα�%');
                 
/*���� 4-15*/
/*��ø����(nested subquery)-all, some(any) ������*/
select orderid, saleprice
from orders
where saleprice > all (select saleprice
                       from orders
                       where custid = 3);

/*���� 4-16*/
/*��ø����(nested subquery)-exists, not exists ������*/
select sum(saleprice) "total"
from orders od
where exists (select *
              from customer cs
              where address like '%���ѹα�%' and cs.custid = od.custid);

