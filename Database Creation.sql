-- SQL Foundations & Database Creation

DROP DATABASE IF EXISTS online_store;

CREATE DATABASE online_store;

USE online_store;

CREATE TABLE customers(
customerID INT PRIMARY KEY,
FirstName VARCHAR(15) NOT NULL,
LastName VARCHAR(15),
Contact CHAR(15) NOT NULL,
Address VARCHAR(20) NOT NULL,
City VARCHAR(20) NOT NULL,
State VARCHAR(20) NOT NULL
);

SELECT * FROM customers;

INSERT INTO customers(customerID, FirstName, LastName, Contact, Address, City, State)
VALUES 
(101, "Rahul", "Gupta", '+914536278336', "Khar", "Mumbai", "Maharashtra"),
(102, "Aryan", "Kashyap", '+914659375938', "Boring Road", "Patna", "Bihar"),
(103, "Shreya", "Sharma", '+912354566788', "Raysan", "Gandhinagar", "Gujarat"),
(104, "Rohit", "Rajesh", '+912548392567', "Usha Nagar", "Indore", "MP"),
(105, "Jackie", "Son", '+914528364982', "Sajara", "Jodhpur", "Rajasthan"),
(106, "Gyaneshwar", "Saw", '+912738465920', "Bijnor", "Lucknow", "UP"),
(107, "Shristi", "Raj", '+912637482978', "Kankarbagh", "Patna", "Bihar"),
(108, "Piyush", "Pankaj", '+912739475892', "Jayanagar", "Bangalore", "Karnataka");
SELECT * FROM customers;

ALTER TABLE customers
ADD email VARCHAR(25);

SET sql_safe_updates = 0;

UPDATE customers
SET email = 'shristi@gmail.com'
WHERE customerID = 107;

UPDATE customers
SET email = 'jackieson@gmail.com'
WHERE customerID = 105;

DELETE FROM customers 
WHERE customerID = 102;

ALTER TABLE customers
DROP Address;

SELECT * FROM customers;

Create Table products(
productID INT PRIMARY KEY,
ProductName VARCHAR(20) NOT NULL,
Category VARCHAR(20) NOT NULL,
Price FLOAT NOT NULL,
StockQuantity INT NOT NULL
);

SELECT * FROM products;

INSERT INTO products(productID, productName, Category, Price, StockQuantity)
VALUES
(3265, "ASUS Expertbook", "Electronics", "65500.42", 680),
(6372, "LG Ac", "Appliances", 38700.75, 374),
(2530, "Samsung Vision", "Appliances", 104990, 735),
(1867, "Cmf Buds", "Smart Gadgets", 4300.23, 2507),
(9521, "Treadmills", "Fitness", 15999, 230);
SELECT * FROM products;

SELECT ProductName, Price,
CASE
    WHEN Price < 10000 THEN 'Budget'
    WHEN Price BETWEEN 10000 AND 50000 THEN 'Standard'
ELSE 'Premium'
END AS ProductType
FROM products;

CREATE TABLE orders(
orderID INT PRIMARY KEY,
customerID INT NOT NULL,
orderDate DATE NOT NULL,
orderStatus VARCHAR(20) NOT NULL,
totalAmount FLOAT NOT NULL);

SELECT * FROM orders;

INSERT INTO orders(orderID, customerID, orderDate, orderStatus, totalAmount)
VALUES
(1, 103, '2026-01-13', "Delivered", 4300.2),
(2, 107, '2026-01-17', "Pending", 31988),
(3, 104, '2026-01-17', "Delivered", 104990),
(4, 101, '2026-01-20', "Processing", 38700.75),
(5, 108, '2026-01-21', "Cancelled", 4300.23);
SELECT * FROM orders;

ALTER TABLE orders 
RENAME COLUMN orderStatus TO Status;

SELECT * FROM customers 
WHERE State = "Bihar";

CREATE TABLE orderdetails(
orderDetailID INT PRIMARY KEY,
orderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
UnitPrice FLOAT NOT NULL,
FOREIGN KEY (orderID)
REFERENCES orders(orderID),
FOREIGN KEY (productID)
REFERENCES products(productID)
);

SELECT * FROM orderDetails;

INSERT INTO orderDetails(orderDetailID, orderID, ProductID, Quantity, UnitPrice)
VALUE
(1, 1, 1867, 1, 4300.23),
(2, 2, 9521, 2, 15999),
(3, 3, 2530, 1, 104990),
(4, 4, 6372, 1, 38700),
(5, 5, 1867, 1, 4300.23);
SELECT * FROM orderDetails;
