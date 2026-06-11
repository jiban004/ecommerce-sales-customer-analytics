/*
Project:
E-Commerce Sales & Customer Analytics Platform

Purpose:
Business KPI reporting using SQL

Reports Included:
- Executive KPIs
- Category Analysis
- Regional Analysis
- Customer Analysis
- Product Analysis
- Monthly Sales Trends
- Profitability Analysis
*/

-- Total Sales

SELECT
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales;

-- Total Profit

SELECT
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales;

-- Total Orders

SELECT
COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales;

-- Total Customers

SELECT
COUNT(DISTINCT customer_id) AS total_customers
FROM superstore_sales;

SELECT
ROUND(
SUM(sales) /
COUNT(DISTINCT order_id),
2
) AS average_order_value
FROM superstore_sales;

SELECT
ROUND(
(SUM(profit) / SUM(sales))*100,
2
) AS profit_margin_pct
FROM superstore_sales;

SELECT
category,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT
category,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

SELECT
region,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

SELECT
state,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

SELECT
customer_name,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
product_name,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
order_year,
order_month,
ROUND(SUM(sales),2) AS monthly_sales
FROM superstore_sales
GROUP BY
order_year,
order_month
ORDER BY
order_year,
order_month;

SELECT
order_year,
order_month,
ROUND(SUM(profit),2) AS monthly_profit
FROM superstore_sales
GROUP BY
order_year,
order_month
ORDER BY
order_year,
order_month;

SELECT
segment,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;

SELECT
product_name,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

