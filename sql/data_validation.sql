SELECT COUNT(*) AS total_rows
FROM superstore_sales;

SELECT ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales;

SELECT ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales;

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM superstore_sales;

SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM superstore_sales;