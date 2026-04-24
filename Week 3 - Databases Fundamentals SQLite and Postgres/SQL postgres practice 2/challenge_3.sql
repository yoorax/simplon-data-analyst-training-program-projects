
-- 1. calculate the total amount spent by each customer
SELECT 
    c.first_name, 
    c.last_name, 
    SUM(o.total_amount) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY 
    c.customer_id;

-- 2. total orders per month 

SELECT
	TO_CHAR(order_date, 'YYYY-MM') AS order_month, 
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY order_month;

-- 3. average orders per month 
SELECT
	TO_CHAR(order_date, 'YYYY-MM') AS order_month, 
	AVG(total_amount) AS avg_amount_per_month 
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY order_month;

-- 4. find customers with orders greater than 900

SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.order_id
WHERE total_amount > 900;



	

