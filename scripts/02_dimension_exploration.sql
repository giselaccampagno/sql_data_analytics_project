-- Exploring all countries our costumers come from
SELECT DISTINCT country
FROM gold2.dim_customers;

-- Exploring all product categories 'The mayor divitions'
SELECT DISTINCT category, subcategory, product_name
FROM gold2.dim_products
ORDER BY 1, 2, 3;

/*
There are differences in the granularity of product_name, category, 
and subcategory.
*/
