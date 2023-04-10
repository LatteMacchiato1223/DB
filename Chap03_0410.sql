/*���� ������*/

/*1-5 �������� ������ ������ ���ǻ� ��*/
SELECT COUNT(DISTINCT publisher) as "���ǻ� ��" 
FROM Customer, Orders, Book 
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '������';

/*1-6 �������� ������ ������ �̸�, ����, ������ �ǸŰ� ����*/ 
/*SELECT * FROM Book > Price : ����*/
/*SELECT * FROM Orders > SalePrice : �ǸŰ�*/
SELECT bookname AS "������ �̸�", price AS ����, price - saleprice AS "���� ����" 
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '������';

/*1-7 �������� �������� ���� ������ �̸�*/
/*
�������� ������ ������ �̸� ���� Ȯ��
SELECT bookname
FROM Customer, Orders
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '������';
*/
/*���� 177p ���� : ��� �μ�����*/
SELECT bookname AS "������ �̸�"
FROM Book 
WHERE NOT EXISTS (SELECT bookname
                  FROM Customer, Orders
                  WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '������');

/*2-8 �ֹ����� ���� ���� �̸� : �μ����Ǹ� ����� ��*/
/*�ֹ��� ���� �̸��� ���� Ȯ��*/
/*
SELECT name 
FROM Customer 
WHERE (SELECT name 
       FROM Customer, Orders 
       WHERE Customer.custid = Orders.custid);
*/
/*NOT IN ���*/
SELECT name AS �̸� 
FROM Customer 
WHERE name NOT IN (SELECT name 
              FROM Customer, Orders 
              WHERE Customer.custid = Orders.custid);

/*2-9 �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
/*���� �Լ� ��� > �հ� : SUM & ��� : AVG*/
SELECT SUM(saleprice) AS �Ѿ�, AVG(saleprice) AS ��վ� 
FROM Orders;

/*2-10 ���� �̸��� ���� ���ž�*/
/*��"��" > GROUP BY ��� : ���� �̸��� ����*/
SELECT name, SUM(saleprice) AS ���ž�
FROM Customer, Orders 
WHERE Customer.custid = Orders.custid 
GROUP BY name;

/*2-11 ���� �̸��� ���� ������ ���� ���*/
SELECT name AS �̸�, Book.bookname AS "������ ����" 
FROM Book, Orders, Customer 
WHERE Orders.bookid = Book.bookid AND Customer.custid = Orders.custid;

/*2-12 ������ ����(Book)�� �ǸŰ���(Orders)�� ���̰� ���� ���� �ֹ�*/
/*������ �ǸŰ����� ���̰� ���� ū �ֹ�*/
/*�������ݰ� �ǸŰ��� ���̸� ���� Ȯ��*/
/*�� �Ӽ� �� ǥ�� > "*" */
SELECT * 
FROM Book, Orders 
WHERE Book.bookid = Orders.bookid AND price - saleprice = (SELECT MAX(price - saleprice)
                                                           FROM Book, Orders
                                                           WHERE Book.bookid = Orders.bookid);

/*2-13 ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
/*�ش��ϴ� ���ǿ� ���ϴ� �͸� GROUP BY �� ǥ�� : HAVING*/
/*��վ׵� ǥ���ϵ��� �� ��*/
SELECT name AS �̸�, AVG(saleprice) AS "��� �Ǹž�"
FROM Customer, Orders 
WHERE Customer.custid = Orders.custid 
GROUP BY name 
HAVING AVG(saleprice) > (SELECT AVG(saleprice) FROM Orders);

