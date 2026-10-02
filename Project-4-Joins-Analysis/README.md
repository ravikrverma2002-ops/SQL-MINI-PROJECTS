# SQL Mini Project 4: Joins Analysis

## Overview

This project practices SQL joins by analyzing relationships between customers, payments, employees, offices, orders, products, and sales representatives in the `classicmodels` database. The script uses different join techniques to combine related tables, analyze business relationships, count related records, and identify records without matching relationships.

## Database

- **Database:** `classicmodels`
- **SQL file:** `Joins Analysis.sql`
- **SQL environment:** MySQL / MySQL Workbench

## What the script does

- Uses the existing `classicmodels` database.
- Joins `customers` and `payments` to analyze customer payment information.
- Joins `employees` and `offices` to display employee office locations.
- Joins `orders`, `orderdetails`, and `products` to analyze ordered products and pricing.
- Uses a `LEFT JOIN` between `offices` and `employees` to count employees working at each office.
- Joins `customers` and `employees` to identify sales representatives assigned to customers.
- Uses a self-join on the `employees` table to display employee-manager relationships.
- Finds customers who have never placed an order.
- Finds products that have never been sold.
- Finds employees who are not assigned as sales representatives to any customer.

## SQL concepts practiced

`JOIN`, `LEFT JOIN`, `ON`, table aliases, `ORDER BY`, `GROUP BY`, aggregate functions such as `COUNT()`, `CONCAT()`, self-joins, `IS NULL`, and multi-table joins.

## Analysis sections

1. **Customer and Payment Analysis** — connects customers with their payment records and sorts payments by date.
2. **Employee and Office Analysis** — connects employees with their respective office details.
3. **Order and Product Analysis** — connects orders, order details, and products to analyze purchased products and prices.
4. **Office Analysis** — counts the number of employees assigned to each office.
5. **Sales Representative Analysis** — identifies the sales representative assigned to each customer.
6. **Employee Hierarchy** — connects employees with their managers using a self-join.
7. **Missing Relationships** — identifies customers without orders, products never sold, and employees without assigned customers.

## Project files

- `Joins Analysis.sql` — contains all database queries and join-based analysis.

## Run the project

Open `Joins Analysis.sql` in MySQL Workbench and execute the script in order. Make sure the `classicmodels` database is available before running the queries.

## Results and observations

1. **Customers with no orders:** The LEFT JOIN between `customers` and `orders`
   (Query 7) shows [X] of [Y] customers have never placed an order. These are
   candidates for re-engagement.

2. **Unsold product:** [X] product(s) in `products` never appear in
   `orderdetails` (Query 7): [product name]. This could be reviewed for
   promotion or discontinuation.

3. **Uneven office staffing:** Query 4 shows [city] has the most employees ([X]),
   while [cities] have only [Y] each.

4. **Customers without a sales rep:** Query 5 shows [X] customers have a NULL
   `salesRepEmployeeNumber`, so these accounts have no clear owner.

5. **Employees with no customers:** Query 7 shows [X] employees are not the sales
   rep for any customer, mostly management roles. This matches the hierarchy in
   Query 6, where the President has no manager.
   
## Notes

The script is focused on relational analysis using joins. The final section specifically demonstrates how `LEFT JOIN` combined with `IS NULL` can be used to find records that do not have a matching relationship in another table.
