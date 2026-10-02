-- Relational analysis with joins

USE classicmodels;

-- 1. Customer and payment analysis

SELECT * FROM customers;
SELECT * FROM payments;

SELECT c.customernumber, paymentDate, customerName, creditlimit, phone,
checkNumber, amount
FROM customers c JOIN payments p
ON c.customerNumber = p.customerNumber
ORDER BY paymentDate DESC;


-- 2. Employee and office analysis

SELECT * FROM employees;
SELECT * FROM offices;

Select employeeNumber, firstName, lastName, o.officecode, 
city, state, country
FROM employees e JOIN offices o 
ON o.officeCode = e.officeCode
ORDER BY employeeNumber;

-- 3. Order and product analysis

SELECT * FROM orders;
SELECT * FROM products;
SELECT o.orderNumber, p.productCode, productName, 
productLine, od.priceEach, buyPrice FROM orders o
JOIN orderdetails od on od.orderNumber = o.orderNumber
JOIN products p ON p.productCode = od.productCode
ORDER BY orderNumber DESC;

-- 4. Office Analysis

SELECT * FROM employees;
SELECT * FROM offices;

Select o.officecode, city, country, COUNT(e.employeeNumber) AS NumOfEmployees
FROM offices o LEFT JOIN employees e
ON o.officeCode = e.officeCode
GROUP BY o.officecode, city, country
ORDER BY NumOfEmployees DESC;

-- 5. Sales Representative Analysis

SELECT c.customerNumber, c.customerName,
e.employeeNumber AS salesRepNumber,
CONCAT(e.firstName, " ", e.lastName) AS salesRepName
FROM customers c LEFT JOIN employees e 
ON c.salesRepEmployeeNumber = e.employeeNumber;

-- 6. Employee Hierarchy

SELECT * FROM employees;
SELECT e.employeeNumber, e.firstName, e.lastName, 
m.employeeNumber AS managerEmployeeNumber,
CONCAT(m.firstname," ",m.lastname) AS managerName
FROM employees e LEFT JOIN employees m
ON e.reportsTo = m.employeeNumber;

-- 7. Missing relationship

-- Customers without orders

SELECT * FROM customers;
SELECT * FROM orders;

SELECT c.customerNumber, c.customerName
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.customerNumber IS NULL;

-- Products that have never been sold

SELECT * FROM products;
SELECT * FROM orders;

SELECT p.productCode, productName FROM products p 
LEFT JOIN orderDetails od ON p.productCode = od.productCode
WHERE od.productCode IS NULL;

-- Records without matching relationship

SELECT e.employeeNumber, e.firstName, e.lastName
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE c.customerNumber IS NULL;
