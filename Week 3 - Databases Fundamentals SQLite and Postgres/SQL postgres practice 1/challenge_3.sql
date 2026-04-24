-- add 5 clinets to customers table :

INSERT INTO Customers (first_name, last_name, email, phone_number)
VALUES 
('John',	'Doe',	'john.doe@gmail.com',	'0612345678'),
('Alice',	'Smith',	'alice.smith@yahoo.com',	'0623456789'),
('David',	'Dubois',	'david.dubois@live.com',	'0634567890'),
('Maria',	'Gonzalez',	'maria.gon@gmail.com',	'0645678901'),
('Karim',	'Dali',	'karim.dali@outlook.com',	'0656789012');


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


