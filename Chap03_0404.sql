/*1-5 박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(DISTINCT publisher) as "출판사 수" 
FROM Book WHERE bookid IN (SELECT bookid FROM Orders WHERE custid = 
                          (SELECT custid FROM Customer WHERE name = '박지성'));

/*1-6 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격 차이*/
SELECT bookname AS "도서의 이름", price AS 가격, price - saleprice AS "정가 차이" 
FROM Orders JOIN book ON Orders.bookid = Book.bookid 
WHERE custid = (SELECT custid FROM Customer WHERE name = '박지성');

/*1-7 박지성이 구매하지 않은 도서의 이름*/
SELECT Book.bookname 
FROM Book 
WHERE NOT EXISTS (SELECT bookname FROM Orders WHERE Orders.bookid = Book.bookid AND Orders.custid = 
                 (SELECT custid FROM Customer WHERE name = '박지성'));

/*2-8 주문하지 않은 고객의 이름 : 부속질의*/
SELECT name 
FROM Customer 
WHERE NOT EXISTS (SELECT custid FROM Orders WHERE Customer.custid = Orders.custid );

/*2-9 주문 금액의 총액과 주문의 평균 금액*/
SELECT SUM(Orders.saleprice) AS "총액", ROUND(AVG(Orders.saleprice)) AS "평균 금액" 
FROM Orders;

/*2-10 고객의 이름과 고객별 구매액*/
SELECT Customer.name, SUM(Orders.saleprice) AS 구매액
FROM Orders 
JOIN Customer ON Orders.custid = Customer.custid 
GROUP BY Customer.name;

/*2-11 고객의 이름과 고객이 구매한 도서 목록*/
SELECT name, bookname AS "구매한 도서" 
FROM Book, Orders, Customer 
WHERE Orders.bookid = Book.bookid AND Orders.custid = Customer.custid;

/*2-12 도서의 가격(Book)과 판매가격(Orders)의 차이가 가장 많은 주문*/
SELECT * 
FROM Book 
JOIN Orders ON Book.bookid = Orders.bookid 
WHERE price - saleprice LIKE (SELECT MAX(price - saleprice) FROM Book JOIN Orders ON Book.bookid = Orders.bookid);

/*2-13 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT name 
FROM Customer, Orders 
WHERE Customer.custid = Orders.custid 
GROUP BY name 
HAVING avg(saleprice) > (SELECT avg(saleprice) FROM Orders);





