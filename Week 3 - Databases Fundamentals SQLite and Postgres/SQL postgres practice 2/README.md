# SQL Advanced Challenges Report

----------------------------------------------------------------------------------------------------------------------------------------------
# Challenge 0: Setup
## 1. Create Tables and Insert Data:
### 1.1. SQL Scripts :
``` sql 
-- 1. Create Customers (No dependencies)
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50),
    phone_number VARCHAR(30)
);

-- 2. Create Products (No dependencies)
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(30),
    price DECIMAL(10,2),
    category VARCHAR(30)
);

-- 3. Create Orders (Depends on Customers)
-- ADDED: ON DELETE CASCADE to customer_id
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10,2)
);

-- 4. Create Order_items (Depends on Orders and Products)
-- ADDED: ON DELETE CASCADE to order_id and product_id
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT REFERENCES products(product_id) ON DELETE CASCADE,
    price_unit DECIMAL(10,2),
    quantity INT
);

-- add 5 clients to customers table :
INSERT INTO Customers (first_name, last_name, email, phone_number)
VALUES 
('John',    'Doe',  'john.doe@gmail.com',   '0612345678'),
('Alice',   'Smith',    'alice.smith@yahoo.com',    '0623456789'),
('David',   'Dubois',   'david.dubois@live.com',    '0634567890'),
('Maria',   'Gonzalez', 'maria.gon@gmail.com',  '0645678901'),
('Karim',   'Dali', 'karim.dali@outlook.com',   '0656789012');


--add 5 products to products table :
INSERT INTO Products (product_ID, product_name, price, category)
VALUES 
(1, 'Laptop', 899.99, 'Electronics'),
(2, 'Smartphone', 599.50, 'Electronics'),
(3, 'Office Chair', 149.90, 'Furniture'),
(4, 'Coffee Maker', 79.99, 'Appliances'),
(5, 'USB-C Cable', 15.00, 'Accessories');


-- add 5 orders to orders table :
INSERT INTO Orders (customer_ID, order_date, total_amount)
VALUES 
(1, '2024-01-15', 914.99),
(3, '2024-03-02', 78.99),
(2, '2023-12-30', 149.90),
(1, '2024-04-18', 614.50),
(5, '2022-11-01', 79.99);


-- add 5 order_items to order_items table :
INSERT INTO order_items (order_id, product_id, price_unit, quantity)
VALUES 
(1, 1,(SELECT price FROM products WHERE product_id = 1), 1),
(1, 5,(SELECT price FROM products WHERE product_id = 5), 1),
(2, 4,(SELECT price FROM products WHERE product_id = 4), 1),
(3, 3,(SELECT price FROM products WHERE product_id = 3), 1),
(4, 2,(SELECT price FROM products WHERE product_id = 2), 1),
(5, 4,(SELECT price FROM products WHERE product_id = 4), 1);
```
### 1.2. Results :
++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------------------
# Challenge 1: Joins
## 1. Display all orders with the customers' names:
### 1.1. SQL Scripts :
``` sql 
SELECT * FROM customers
JOIN orders ON customers.customer_id = orders.customer_id ;
```
### 1.2. Results :
++++++++++++++++++++++++++++++++++

## 2. List customers who have not placed any orders (outer join):
### 2.1. SQL Scripts :
``` sql 
SELECT * FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);
```
### 2.2. Results :
++++++++++++++++++++++++++++++++++

## 3. List all customers with the number of orders they have placed:
### 3.1. SQL Scripts :
``` sql 
SELECT 
    customers.first_name, 
    customers.last_name, 
    COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name;
```
### 3.2. Results :
++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------------------
# Challenge 2: Aggregates
## 1. Calculate the total amount of all orders:
### 1.1. SQL Scripts :
``` sql 
SELECT SUM(total_amount) AS grand_total
FROM orders;
```
### 1.2. Results :
++++++++++++++++++++++++++++++++++

## 2. Calculate the total number of all customers:
### 2.1. SQL Scripts :
``` sql 
SELECT COUNT(customer_id) AS number_of_customers
FROM customers;
```
### 2.2. Results :
++++++++++++++++++++++++++++++++++

## 3. Calculate the average amount of all orders:
### 3.1. SQL Scripts :
``` sql 
SELECT AVG(total_amount) AS average_orders_amount
FROM orders;
```
### 3.2. Results :
++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------------------
# Challenge 3: Grouping
## 1. Calculate the total amount spent by each customer:
### 1.1. SQL Scripts :
``` sql 
SELECT 
    c.first_name, 
    c.last_name, 
    SUM(o.total_amount) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY 
    c.customer_id, c.first_name, c.last_name;
```
### 1.2. Results :
++++++++++++++++++++++++++++++++++

## 2. Total orders per month:
### 2.1. SQL Scripts :
``` sql 
SELECT
	TO_CHAR(order_date, 'YYYY-MM') AS order_month, 
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY order_month;
```
### 2.2. Results :
++++++++++++++++++++++++++++++++++

## 3. Average orders per month:
### 3.1. SQL Scripts :
``` sql 
SELECT
	TO_CHAR(order_date, 'YYYY-MM') AS order_month, 
	AVG(total_amount) AS avg_amount_per_month 
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY order_month;
```
### 3.2. Results :
++++++++++++++++++++++++++++++++++

## 4. Find customers with orders greater than 900:
### 4.1. SQL Scripts :
``` sql 
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 900;
```
### 4.2. Results :
++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------------------
# Challenge 4: Subqueries
## 1. Find customers with orders greater than 200 using subquery:
### 1.1. SQL Scripts :
``` sql 
SELECT 
	c.first_name,
	c.last_name,
	o.total_amount
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id 
    IN ( SELECT customer_id FROM orders
            WHERE total_amount > 200 );
```
### 1.2. Results :
++++++++++++++++++++++++++++++++++

## 2. Find customer with the greater total amount:
### 2.1. SQL Scripts :
``` sql 
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
```
### 2.2. Results :
++++++++++++++++++++++++++++++++++

## 3. Find customers with orders greater than average using subquery:
### 3.1. SQL Scripts :
``` sql 
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.total_amount 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > ( 
    SELECT AVG(total_amount) FROM orders);
```
### 3.2. Results :
++++++++++++++++++++++++++++++++++

----------------------------------------------------------------------------------------------------------------------------------------------
# Challenge 5: Views
## 1. Create a view for customer orders:
### 1.1. SQL Scripts :
``` sql 
CREATE VIEW customer_orders_view AS 
	SELECT 
		c.customer_id,
		c.first_name,
		c.last_name,
		o.total_amount
	FROM customers c JOIN orders o ON c.customer_id = o.customer_id
	ORDER BY total_amount DESC ;
```
### 1.2. Results :
++++++++++++++++++++++++++++++++++

## 2. Find customers with orders greater than 900 using view:
### 2.1. SQL Scripts :
``` sql 
SELECT 
	first_name,
	last_name,
	total_amount
FROM customer_orders_view 
WHERE total_amount > 900;
```
### 2.2. Results :
++++++++++++++++++++++++++++++++++

## 3. Create a view for monthly sales:
### 3.1. SQL Scripts :
``` sql 
CREATE VIEW monthly_sales_view AS
	SELECT 
		TO_CHAR(o.order_date, 'YYYY-MM') AS order_month, 
		SUM (o.total_amount) AS total_sales
	FROM orders o
	GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
	ORDER BY order_month ASC;
```
### 3.2. Results :
++++++++++++++++++++++++++++++++++
