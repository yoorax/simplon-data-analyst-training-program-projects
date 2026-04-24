-- 1. select all customers with first name 'John' :
SELECT * FROM customers
WHERE first_name = 'John';

--2. select all orders with total amount greater than 100 EURO :
SELECT * FROM orders
WHERE total_amount > 100;

-- 3. select all customers with last name starting with 'D' :
SELECT * FROM customers
WHERE last_name LIKE 'D%';

