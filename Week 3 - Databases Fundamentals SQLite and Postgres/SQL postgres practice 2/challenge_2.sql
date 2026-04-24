
-- 1. calculate the total amount of all orders
SELECT SUM(total_amount) AS grand_total
FROM orders;

-- 2. calculate the total number of all customers 

SELECT COUNT(customer_id) AS number_of_customers
FROM customers;

-- 3. calculate the total number of all orders 

SELECT AVG(total_amount) AS average_orders_amount
FROM orders


