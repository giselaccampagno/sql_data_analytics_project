/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analize sales performance over time
-- Over the years
SELECT 
	YEAR(order_date) AS year,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold2.fact_sales
WHERE order_date IS NOT NULL
GROUP BY year
ORDER BY year;

-- Over the months
SELECT 
	MONTH(order_date) AS month,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold2.fact_sales
WHERE order_date IS NOT NULL
GROUP BY month
ORDER BY month;

-- Over years and months
SELECT 
	DATE_FORMAT(order_date, '%Y-%m-01') AS order_date,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold2.fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_date
ORDER BY order_date;
