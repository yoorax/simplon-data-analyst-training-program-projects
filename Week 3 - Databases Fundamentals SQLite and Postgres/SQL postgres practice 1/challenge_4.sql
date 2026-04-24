-- 1. select all customers 
SELECT * FROM customers ;

-- 2. select all orders from and after 2024-01-01 :
SELECT * FROM orders 
WHERE order_date > '2024-01-01' ;



-- 3. select all customers and their orders :
SELECT DISTINCT
customers.customer_ID,
customers.first_name, 
customers.last_name,
customers.email,
orders.order_date
FROM customers JOIN orders ON customers.customer_ID = orders.customer_ID;

