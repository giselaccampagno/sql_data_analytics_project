/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Finding the date of the fist and last order
-- How many years of sales are available
SELECT 
	MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    TIMESTAMPDIFF(YEAR, MIN(order_date), MAX(order_date)) AS years_of_sales_available
FROM gold2.fact_sales; 

-- Finding the youngest and oldest customer
SELECT 
	MIN(birthdate) AS 'Youngest birthdate',
	TIMESTAMPDIFF(YEAR, MIN(birthdate), NOW()) AS 'Oldest customer age',
    MAX(birthdate) AS 'Oldest birthdate',
	TIMESTAMPDIFF(YEAR, MAX(birthdate), NOW()) AS 'Youngest customer age'
FROM gold2.dim_customers;
