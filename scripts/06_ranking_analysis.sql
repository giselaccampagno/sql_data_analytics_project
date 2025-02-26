-- Which 5 products generate the highest revenue?
WITH ranked_products AS (
    SELECT
        ROW_NUMBER() OVER(ORDER BY SUM(sales) DESC) AS rank_prd,
        product_key,
        SUM(sales) AS total_revenue
    FROM gold2.fact_sales
    GROUP BY product_key
)
SELECT 
    rank_prd AS top_5_highest_revenue_products,
    product_key,
    total_revenue
FROM ranked_products
WHERE rank_prd <= 5;

-- What are the 5 worst-performing products in term of sales?
 WITH ranked_products AS (
    SELECT
        ROW_NUMBER() OVER(ORDER BY SUM(sales) ASC) AS rank_prd,
        product_key,
        SUM(sales) AS total_revenue
    FROM gold2.fact_sales
    GROUP BY product_key
)
SELECT 
    rank_prd AS top_5_lowest_revenue_products,
    product_key,
    total_revenue
FROM ranked_products
WHERE rank_prd <= 5
ORDER BY total_revenue DESC;

-- Finding the top 10 customers who have generated the highest revenue
WITH ranked_customers AS (
	SELECT
		ROW_NUMBER() OVER(ORDER BY SUM(fs.sales) DESC) AS top_10_customers,
		fs.customer_key,
        dc.first_name,
        dc.last_name,
        SUM(fs.sales) AS total_revenue
	FROM gold2.fact_sales AS fs
    LEFT JOIN gold2.dim_customers AS dc
    USING(customer_key)
    GROUP BY fs.customer_key, dc.first_name, dc.last_name)
SELECT * FROM ranked_customers
LIMIT 10;

-- The 3 customers with the fewest orders placed
WITH ranked_customers AS (
	SELECT
		ROW_NUMBER() OVER(ORDER BY COUNT(DISTINCT fs.order_number) ASC) AS lowest_3_customers,  
		fs.customer_key,
        dc.first_name,
        dc.last_name,
        COUNT(DISTINCT fs.order_number) AS total_orders
	FROM gold2.fact_sales AS fs
    LEFT JOIN gold2.dim_customers AS dc
    USING(customer_key)
    GROUP BY fs.customer_key, dc.first_name, dc.last_name
)
SELECT * FROM ranked_customers
WHERE lowest_3_customers <= 3; 
