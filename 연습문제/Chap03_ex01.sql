/*1-1 도서번호가 1인 도서의 이름*/
SELECT bookname
FROM Book
WHERE bookid = 1;

/*1-2 가격이 2만원 이상인 도서의 이름*/
SELECT bookname 
FROM Book 
WHERE price >= 20000; 

/*1-3 박지성의 총구매액*/
SELECT SUM(saleprice) AS 총구매액 
FROM Orders 
WHERE custid = 1; /*외래키 : 기본키 참조 속성*/

/*1-3-2 박지성의 총구매액 : LIKE 사용*/
SELECT SUM(saleprice) AS 총구매액 
FROM Orders, Customer 
WHERE name LIKE '박지성' AND Orders.custid = Customer.custid; 

/*1-4 박지성이 구매한 도서의 수*/
SELECT COUNT(*) AS "도서의 수" 
FROM Orders 
WHERE custid = 1; 

/*1-4-2 박지성이 구매한 도서의 수 : LIKE 사용*/
SELECT COUNT(*) AS "도서의 수" 
FROM Orders, Customer 
WHERE name LIKE '박지성' AND Orders.custid = Customer.custid; 

/*1-5 박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(publisher) AS "출판사 수" 
FROM Book, Orders, Customer 
WHERE name LIKE '박지성' AND Orders.custid = Customer.custid AND Book.bookid = Orders.bookid; 
