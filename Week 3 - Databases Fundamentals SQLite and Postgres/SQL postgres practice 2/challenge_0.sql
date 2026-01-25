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