-- Advancedc SQL - Windows Function

USE classicmodels;

SELECT * FROM Products
ORDER BY quantityInstock DESC;

-- 1. Product Ranking

SELECT productName, productLine, quantityInStock,
	ROW_NUMBER() OVER(PARTITION BY productLine ORDER BY quantityInStock DESC) AS stockRank
		FROM products;
 
 -- 2. Running Total
 
SELECT customerNumber, paymentDate, amount,
    SUM(amount) OVER(PARTITION BY customerNumber ORDER BY paymentDate) 
      AS OngoingPayments
	FROM payments;

-- 3. Top Products
    
WITH ProductsRank AS (SELECT productCode, productName, productLine, 
   ROW_NUMBER() OVER(PARTITION BY ProductLine ORDER BY productCode)
    AS row_num FROM products)
    SELECT productCode, productName, productLine, row_num 
  FROM ProductsRank
  WHERE row_num <= 3;
  
  -- 4. Month-Over-Month Analysis
  
WITH Monthlysales AS (
SELECT 
DATE_FORMAT(PAYMENTDATE, '%y-%m') AS Sales_per_month,
SUM(AMOUNT) AS total_sales 
FROM payments
GROUP BY Sales_per_month
)
SELECT 
Sales_per_month,total_sales,
LAG(total_sales,1) OVER(ORDER BY Sales_per_month) AS previous_month_sales,
ROUND(total_sales- LAG(total_sales,1) OVER(ORDER BY Sales_per_month),2) AS monthly_growth
FROM MonthlySales;

-- 5. Growth Analysis

WITH Monthlysales AS (SELECT DATE_FORMAT(PAYMENTDATE, '%y-%m') 
AS sales_month, SUM(AMOUNT) AS total_sales 
FROM payments GROUP BY sales_month)
SELECT sales_month, total_sales,
LAG(total_sales,3) OVER(ORDER BY sales_month) AS sales_3_month_ago,
ROUND(total_sales- LAG(total_sales,3) OVER(ORDER BY sales_month),2) AS growth_over_3_months_ago
FROM MonthlySales;

-- 6. Moving Average

WITH Monthlysales AS (SELECT DATE_FORMAT(PAYMENTDATE, '%y-%m') 
AS sales_per_month, SUM(AMOUNT) AS total_sales 
FROM payments GROUP BY sales_per_month
)
SELECT sales_per_month,total_sales,
ROUND(AVG(total_sales) OVER(ORDER BY sales_per_month 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2)
AS moving_avg_3_month
FROM MonthlySales;