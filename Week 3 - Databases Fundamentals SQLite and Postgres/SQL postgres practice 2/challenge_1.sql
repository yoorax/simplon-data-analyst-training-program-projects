--1. Display all orders with the customers' names

SELECT * FROM customers
JOIN orders ON customers.customer_id = orders.customer_id 


-- 2. List customers who have not placed any orders (outer join)

SELECT * FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);


-- .3. List all customers with the number of orders they have placed

SELECT 
    customers.first_name, 
    customers.last_name, 
    COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name;
