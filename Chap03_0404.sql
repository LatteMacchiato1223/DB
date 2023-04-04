/*1-5 �������� ������ ������ ���ǻ� ��*/
SELECT COUNT(DISTINCT publisher) as "���ǻ� ��" 
FROM Book WHERE bookid IN (SELECT bookid FROM Orders WHERE custid = 
                          (SELECT custid FROM Customer WHERE name = '������'));

/*1-6 �������� ������ ������ �̸�, ����, ������ �ǸŰ��� ����*/
SELECT bookname AS "������ �̸�", price AS ����, price - saleprice AS "���� ����" 
FROM Orders JOIN book ON Orders.bookid = Book.bookid 
WHERE custid = (SELECT custid FROM Customer WHERE name = '������');

/*1-7 �������� �������� ���� ������ �̸�*/
SELECT Book.bookname 
FROM Book 
WHERE NOT EXISTS (SELECT bookname FROM Orders WHERE Orders.bookid = Book.bookid AND Orders.custid = 
                 (SELECT custid FROM Customer WHERE name = '������'));

/*2-8 �ֹ����� ���� ���� �̸� : �μ�����*/
SELECT name 
FROM Customer 
WHERE NOT EXISTS (SELECT custid FROM Orders WHERE Customer.custid = Orders.custid );

/*2-9 �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT SUM(Orders.saleprice) AS "�Ѿ�", ROUND(AVG(Orders.saleprice)) AS "��� �ݾ�" 
FROM Orders;

/*2-10 ���� �̸��� ���� ���ž�*/
SELECT Customer.name, SUM(Orders.saleprice) AS ���ž�
FROM Orders 
JOIN Customer ON Orders.custid = Customer.custid 
GROUP BY Customer.name;

/*2-11 ���� �̸��� ���� ������ ���� ���*/
SELECT name, bookname AS "������ ����" 
FROM Book, Orders, Customer 
WHERE Orders.bookid = Book.bookid AND Orders.custid = Customer.custid;

/*2-12 ������ ����(Book)�� �ǸŰ���(Orders)�� ���̰� ���� ���� �ֹ�*/
SELECT * 
FROM Book 
JOIN Orders ON Book.bookid = Orders.bookid 
WHERE price - saleprice LIKE (SELECT MAX(price - saleprice) FROM Book JOIN Orders ON Book.bookid = Orders.bookid);

/*2-13 ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT name 
FROM Customer, Orders 
WHERE Customer.custid = Orders.custid 
GROUP BY name 
HAVING avg(saleprice) > (SELECT avg(saleprice) FROM Orders);





