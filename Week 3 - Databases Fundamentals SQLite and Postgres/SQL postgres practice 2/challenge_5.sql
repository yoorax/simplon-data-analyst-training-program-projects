-- 1. create a view for customer orders
CREATE VIEW customer_orders_view AS 
	SELECT 
		c.customer_id,
		c.first_name,
		c.last_name,
		o.total_amount
	FROM customers c JOIN orders o ON c.customer_id = o.customer_id
	ORDER BY total_amount DESC ;

----------------------------------------------------------------
-- 2. find customers with orders greater than 900 using view
SELECT 
	first_name,
	last_name,
	total_amount
FROM customer_orders_view 
WHERE total_amount > 900;

-------------------------------------------------------------
-- 3. create a view for monthly sales
CREATE VIEW monthly_sales_view AS
	SELECT 
		TO_CHAR(o.order_date, 'YYYY-MM') AS order_month, 
		SUM (o.total_amount) AS total_sales
	FROM orders o
	GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
	ORDER BY order_month ASC;
		
