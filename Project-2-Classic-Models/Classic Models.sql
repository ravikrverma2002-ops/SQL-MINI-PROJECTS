USE classicmodels;

SHOW TABLES;

SELECT * FROM customers;

-- CUSTOMER ANALYSIS 

SELECT * FROM customers 
WHERE creditlimit >= 100000;

SELECT * FROM customers 
WHERE country = 'USA' AND creditlimit >= 50000
ORDER BY creditlimit DESC;

SELECT * FROM customers
WHERE customername LIKE 'A%';

SELECT * FROM customers
WHERE customername LIKE '%Mini%';

SELECT * FROM customers 
WHERE country IN ('France','USA','Australia');

SELECT * FROM customers
ORDER BY customername ASC
LIMIT 10;

SELECT * FROM customers
ORDER BY customername ASC
LIMIT 10,10;

SELECT country, COUNT(*) 
AS customer_count FROM customers
GROUP BY country;

SELECT country, COUNT(*) 
AS customer_count FROM customers
GROUP BY country
HAVING customer_count >= 5;

SELECT customername, creditlimit 
FROM customers
WHERE creditlimit = (SELECT MAX(creditlimit) 
FROM customers);

-- PRODUCT ANALYSIS 

SELECT * FROM products;

SELECT productname,productline,quantityinstock,buyprice
FROM products;

SELECT * FROM products
WHERE quantityInStock < 1000;

SELECT * FROM products
WHERE productname LIKE '%Porsche%';

SELECT productLine, COUNT(*)
AS productline_count FROM products
GROUP BY productLine;

SELECT productLine, MAX(buyPrice),
MIN(buyPrice) FROM products
GROUP BY productLine;

SELECT * FROM payments;
 
SELECT COUNT(*) FROM payments
WHERE paymentdate < "2003-02-16";

SELECT customernumber, COUNT(*) AS PaymentCount
FROM payments
GROUP BY customernumber
ORDER BY PaymentCount DESC;

SELECT customernumber,
SUM(amount) AS TotalPayment
FROM payments
GROUP BY customerNumber
ORDER BY TotalPayment DESC;

SELECT customerNumber, 
ROUND(AVG(amount),2) AS AveragePayment
FROM payments
GROUP BY customerNumber
ORDER BY AveragePayment DESC;

SELECT customerNumber, MAX(amount),
MIN(amount) FROM payments
GROUP BY customerNumber;


-- Sales rep & Product sorting (added)
SELECT salesRepEmployeeNumber, COUNT(*) AS customer_count
FROM customers
GROUP BY salesRepEmployeeNumber
ORDER BY customer_count DESC;


SELECT customerName, country, creditLimit
FROM customers
WHERE salesRepEmployeeNumber = 1165;


SELECT customerName, country
FROM customers
WHERE salesRepEmployeeNumber IS NULL;


SELECT productName, productLine, buyPrice
FROM products
ORDER BY buyPrice DESC;


SELECT productName, quantityInStock
FROM products
ORDER BY quantityInStock ASC;


SELECT productLine, productName, buyPrice
FROM products
ORDER BY productLine ASC, buyPrice ASC;
