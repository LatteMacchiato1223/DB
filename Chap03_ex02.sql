/*2-1 ���缭�� ������ �Ѽ�*/
SELECT COUNT(*) AS "������ �Ѽ�"
FROM Book; 

/*2-2 ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�*/
SELECT COUNT(DISTINCT publisher) AS "���ǻ��� �Ѽ�"
FROM Book; 

/*2-3 ��� ���� �̸��� �ּ�*/
SELECT name, address 
FROM Customer; 

/*2-4 2020/07/04 ~ 2020/07/07 ���� �ֹ����� ������ �ֹ���ȣ*/
SELECT orderid AS "�ֹ���ȣ" 
FROM Orders 
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07'; 

/*2-5 (���� ����) ������ ������ �ֹ���ȣ*/
SELECT orderid AS "�ֹ���ȣ"
FROM Orders 
WHERE orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07'; 

/*2-6 ���� '��'���� ���� �̸��� �ּ�*/
SELECT name, address 
FROM Customer 
WHERE name LIKE '��%'; 

/*2-7 ���� '��'���� �̸��� '��'�� ������ ���� �̸��� �ּ�*/
SELECT name, address 
FROM Customer 
WHERE name LIKE '��%��'; 