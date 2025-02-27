/* Calculate the total sales per month
and the running total of sales over time */
SELECT 
    DATE_FORMAT(order_date, '%Y-%m-01') AS order_date,
    SUM(sales) AS total_sales,
    SUM(SUM(sales)) OVER (
        PARTITION BY YEAR(order_date) 
        ORDER BY DATE_FORMAT(order_date, '%Y-%m-01')
    ) AS running_total_sales
FROM gold2.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01'), YEAR(order_date)
ORDER BY order_date;


