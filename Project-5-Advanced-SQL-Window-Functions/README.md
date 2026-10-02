# SQL Mini Project 5: Advanced SQL - Window Functions

## Overview

This project practices advanced SQL analysis using Window Functions in the "classicmodels" database.
The queries focus on analyzing product inventory, customer payments, monthly sales, growth, and trends without collapsing the result set like a traditional "GROUP BY" query.

## Database

- Database: "classicmodels"
- Tables Used: "products", "payments"

## Concepts Covered

- "ROW_NUMBER()"
- "SUM() OVER()"
- "LAG()"
- "AVG() OVER()"
- "PARTITION BY"
- "ORDER BY" inside Window Functions
- "ROWS BETWEEN"
- Common Table Expressions ("WITH")
- Running totals
- Ranking within groups
- Top-N analysis
- Month-over-month analysis
- Multi-month growth analysis
- Moving averages

## Analysis Performed

1. Product Ranking - Ranks products within each "productLine" based on their "quantityInStock".
Concepts: "ROW_NUMBER()", "PARTITION BY", "ORDER BY"

2. Running Total - Calculates the ongoing payment total for each customer based on payment date.
Concepts: "SUM() OVER()", "PARTITION BY", "ORDER BY"

3. Top Products - Identifies the top 3 products within each product line using row numbering.
Concepts: CTE, "ROW_NUMBER()", "PARTITION BY", filtering window-function results

4. Month-over-Month Analysis - Calculates monthly sales and compares each month with the previous month to determine monthly growth.
Concepts: CTE, "DATE_FORMAT()", "SUM()", "LAG()", "ROUND()"

5. Growth Analysis - Compares current monthly sales with sales from 3 months earlier to measure longer-term growth.
Concepts: "LAG()" with an offset, CTE, "ROUND()"

6. Moving Average - Calculates a 3-month moving average of total monthly sales.
Concepts: "AVG() OVER()", "ROWS BETWEEN", "PRECEDING", "CURRENT ROW"

## Key Learning

This project demonstrates how Window Functions can be used for analytical tasks such as:

- Ranking records within groups
- Tracking cumulative values
- Finding top records within categories
- Comparing current values with previous periods
- Measuring growth over multiple periods
- Smoothing time-series data using moving averages

## Skills Practiced

- Advanced SQL
- Window Functions
- Data Analysis
- Time-Series Analysis
- Ranking & Comparative Analysis
- CTEs
- Business-oriented SQL calculations
