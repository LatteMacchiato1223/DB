/*2-1 마당서점 도서의 총수*/
SELECT COUNT(*) AS "도서의 총수"
FROM Book; 

/*2-2 마당서점에 도서를 출고하는 출판사의 총수*/
SELECT COUNT(DISTINCT publisher) AS "출판사의 총수"
FROM Book; 

/*2-3 모든 고객의 이름과 주소*/
SELECT name, address 
FROM Customer; 

/*2-4 2020/07/04 ~ 2020/07/07 사이 주문받은 도서의 주문번호*/
SELECT orderid AS "주문번호" 
FROM Orders 
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07'; 

/*2-5 (조건 동일) 제외한 도서의 주문번호*/
SELECT orderid AS "주문번호"
FROM Orders 
WHERE orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07'; 

/*2-6 성이 '김'씨인 고객의 이름과 주소*/
SELECT name, address 
FROM Customer 
WHERE name LIKE '김%'; 

/*2-7 성이 '김'씨고 이름이 '아'로 끝나는 고객의 이름과 주소*/
SELECT name, address 
FROM Customer 
WHERE name LIKE '김%아'; 
