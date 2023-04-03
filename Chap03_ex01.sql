/*1-1 ������ȣ�� 1�� ������ �̸�*/
SELECT bookname
FROM Book
WHERE bookid = 1;

/*1-2 ������ 2���� �̻��� ������ �̸�*/
SELECT bookname 
FROM Book 
WHERE price >= 20000; 

/*1-3 �������� �ѱ��ž�*/
SELECT SUM(saleprice) AS �ѱ��ž� 
FROM Orders 
WHERE custid = 1; /*�ܷ�Ű : �⺻Ű ���� �Ӽ�*/

/*1-3-2 �������� �ѱ��ž� : LIKE ���*/
SELECT SUM(saleprice) AS �ѱ��ž� 
FROM Orders, Customer 
WHERE name LIKE '������' AND Orders.custid = Customer.custid; 

/*1-4 �������� ������ ������ ��*/
SELECT COUNT(*) AS "������ ��" 
FROM Orders 
WHERE custid = 1; 

/*1-4-2 �������� ������ ������ �� : LIKE ���*/
SELECT COUNT(*) AS "������ ��" 
FROM Orders, Customer 
WHERE name LIKE '������' AND Orders.custid = Customer.custid; 

/*1-5 �������� ������ ������ ���ǻ� ��*/
SELECT COUNT(publisher) AS "���ǻ� ��" 
FROM Book, Orders, Customer 
WHERE name LIKE '������' AND Orders.custid = Customer.custid AND Book.bookid = Orders.bookid; 