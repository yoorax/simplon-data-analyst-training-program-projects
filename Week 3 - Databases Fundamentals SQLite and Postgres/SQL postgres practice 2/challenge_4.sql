-- 1. find customers with orders greater than 200 using subquery
SELECT 
	c.first_name,
	c.last_name,
	o.total_amount
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id 
    IN ( SELECT customer_id FROM orders
            WHERE total_amount > 200 );

--------------------------------------------------------------
-- 2. find customer with the greater total amount
SELECT 
	c.first_name,
	c.last_name,
	c.customer_id,
	SUM(o.total_amount) AS total_spent
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IN ( SELECT customer_id 
							FROM orders WHERE total_amount =(SELECT 
																MAX(total_amount) FROM orders) )
GROUP BY c.customer_id, first_name, last_name ;


-------------------------------------------------------------------------
-- 3. find customers with orders greater than average using subquery
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.total_amount 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > ( 
    SELECT AVG(total_amount) FROM orders);