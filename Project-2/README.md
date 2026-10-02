# SQL Mini Project 2: ClassicModels Query Challenge

## Overview

This project uses SQL to explore the ClassicModels sample database and answer business questions about customers, products, and payments.

## Dataset and setup

- **Database:** `classicmodels`
- **SQL file:** `Classic Models.sql`
- **Environment:** MySQL / MySQL Workbench

The ClassicModels database must be installed or imported in MySQL before running the script. Open the SQL file in MySQL Workbench, confirm the database is available, and execute the statements.

## Analysis in this project

### Customer analysis

- Find customers with high credit limits and filter customers by country.
- Search customer names with `LIKE` and select customers from chosen countries with `IN`.
- Sort customers alphabetically and demonstrate `LIMIT` with an offset.
- Count customers by country and filter grouped counts with `HAVING`.
- Find the customer or customers with the highest credit limit using a subquery.
- Count customers assigned to each sales representative, and identify customers with no assigned sales rep.

### Product analysis

- Inspect product details, including product line, stock, and buy price.
- Find products with low stock and search product names.
- Count products by product line and compare minimum and maximum buy prices within each line.
- Sort products by price and by stock level.

### Payment analysis

- Count payments made before a specified date.
- Calculate payment counts, total payments, average payments, and minimum/maximum payment amounts by customer.

## SQL concepts used

`SELECT`, `WHERE`, `AND`, `LIKE`, `IN`, `IS NULL`, `ORDER BY` (single and multi-column), `LIMIT` with offset, `GROUP BY`, `HAVING`, aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), `ROUND`, and a subquery.

## Results and observations

The queries produce customer counts by country, sales rep customer distribution, product counts and price ranges by product line, and payment summaries by customer. Review the result grids after running the script and add any specific numeric findings you want to highlight here.

## Project files

- `Classic Models.sql` — SQL statements for the analysis.
- `screenshots/` — query output screenshots, if included in the repository.

