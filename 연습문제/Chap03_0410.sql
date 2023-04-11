/*과제 수정본*/

/*1-5 박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(DISTINCT publisher) as "출판사 수" 
FROM Customer, Orders, Book 
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/*1-6 박지성이 구매한 도서의 이름, 가격, 정가와 판매가 차이*/ 
/*SELECT * FROM Book > Price : 정가*/
/*SELECT * FROM Orders > SalePrice : 판매가*/
SELECT bookname AS "도서의 이름", price AS 가격, price - saleprice AS "정가 차이" 
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/*1-7 박지성이 구매하지 않은 도서의 이름*/
/*
박지성이 구매한 도서의 이름 먼저 확인
SELECT bookname
FROM Customer, Orders
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';
*/
/*교재 177p 참고 : 상관 부속질의*/
SELECT bookname AS "도서의 이름"
FROM Book 
WHERE NOT EXISTS (SELECT bookname
                  FROM Customer, Orders
                  WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성');

/*2-8 주문하지 않은 고객의 이름 : 부속질의를 사용할 것*/
/*주문한 고객의 이름을 먼저 확인*/
/*
SELECT name 
FROM Customer 
WHERE (SELECT name 
       FROM Customer, Orders 
       WHERE Customer.custid = Orders.custid);
*/
/*NOT IN 사용*/
SELECT name AS 이름 
FROM Customer 
WHERE name NOT IN (SELECT name 
              FROM Customer, Orders 
              WHERE Customer.custid = Orders.custid);

/*2-9 주문 금액의 총액과 주문의 평균 금액*/
/*집합 함수 사용 > 합계 : SUM & 평균 : AVG*/
SELECT SUM(saleprice) AS 총액, AVG(saleprice) AS 평균액 
FROM Orders;

/*2-10 고객의 이름과 고객별 구매액*/
/*고객"별" > GROUP BY 사용 : 고객의 이름이 기준*/
SELECT name, SUM(saleprice) AS 구매액
FROM Customer, Orders 
WHERE Customer.custid = Orders.custid 
GROUP BY name;

/*2-11 고객의 이름과 고객이 구매한 도서 목록*/
SELECT name AS 이름, Book.bookname AS "구매한 도서" 
FROM Book, Orders, Customer 
WHERE Orders.bookid = Book.bookid AND Customer.custid = Orders.custid;

/*2-12 도서의 가격(Book)과 판매가격(Orders)의 차이가 가장 많은 주문*/
/*정가와 판매가격의 차이가 가장 큰 주문*/
/*도서가격과 판매가의 차이를 먼저 확인*/
/*전 속성 다 표시 > "*" */
SELECT * 
FROM Book, Orders 
WHERE Book.bookid = Orders.bookid AND price - saleprice = (SELECT MAX(price - saleprice)
                                                           FROM Book, Orders
                                                           WHERE Book.bookid = Orders.bookid);

/*2-13 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
/*해당하는 조건에 속하는 것만 GROUP BY 에 표시 : HAVING*/
/*평균액도 표시하도록 해 봄*/
SELECT name AS 이름, AVG(saleprice) AS "평균 판매액"
FROM Customer, Orders 
WHERE Customer.custid = Orders.custid 
GROUP BY name 
HAVING AVG(saleprice) > (SELECT AVG(saleprice) FROM Orders);

