SELECT
customer_name,
ROUND(SUM(sales),2) AS total_sales,

CASE
    WHEN SUM(sales) >= 10000 THEN 'VIP'
    WHEN SUM(sales) >= 5000 THEN 'Premium'
    ELSE 'Regular'
END AS customer_segment

FROM superstore_sales

GROUP BY customer_name

ORDER BY total_sales DESC;

SELECT
customer_segment,
COUNT(*) AS customer_count
FROM
(
    SELECT
    customer_name,

    CASE
        WHEN SUM(sales) >= 10000 THEN 'VIP'
        WHEN SUM(sales) >= 5000 THEN 'Premium'
        ELSE 'Regular'
    END AS customer_segment

    FROM superstore_sales

    GROUP BY customer_name
)
GROUP BY customer_segment;

SELECT
customer_name,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT
state,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;


SELECT
product_name,
ROUND(SUM(sales),2) AS total_sales,

RANK() OVER (
ORDER BY SUM(sales) DESC
) AS sales_rank

FROM superstore_sales

GROUP BY product_name

LIMIT 20;

SELECT
category,
ROUND(SUM(sales),2) AS total_sales,

RANK() OVER(
ORDER BY SUM(sales) DESC
) AS category_rank

FROM superstore_sales

GROUP BY category;


WITH product_sales AS
(
SELECT
category,
product_name,
ROUND(SUM(sales),2) AS total_sales,

RANK() OVER
(
PARTITION BY category
ORDER BY SUM(sales) DESC
) AS rank_num

FROM superstore_sales

GROUP BY
category,
product_name
)

SELECT *
FROM product_sales
WHERE rank_num = 1;

SELECT
state,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY state
ORDER BY total_profit ASC
LIMIT 10;

SELECT
discount,

ROUND(AVG(profit),2) AS avg_profit

FROM superstore_sales

GROUP BY discount

ORDER BY discount;

WITH customer_state_sales AS
(
SELECT
state,
customer_name,
ROUND(SUM(sales),2) AS total_sales,

RANK() OVER
(
PARTITION BY state
ORDER BY SUM(sales) DESC
) AS sales_rank

FROM superstore_sales

GROUP BY
state,
customer_name
)

SELECT *
FROM customer_state_sales
WHERE sales_rank = 1;