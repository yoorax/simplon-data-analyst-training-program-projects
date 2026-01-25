
--deleting using the tracking method (Parent - child) since we are in restricted mode 
DELETE FROM order_items 
WHERE order_id IN (SELECT order_id FROM orders WHERE order_date < '2023-01-01');

DELETE FROM orders 
WHERE order_date < '2023-01-01';

--verfication
SELECT * FROM orders;

--2. Configure Cascade Delete and remove customer with ID 1

ALTER TABLE orders 
  DROP CONSTRAINT IF EXISTS orders_customer_id_fkey,
  ADD CONSTRAINT orders_customer_id_fkey 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
    ON DELETE CASCADE; 

ALTER TABLE order_items 
  DROP CONSTRAINT IF EXISTS order_items_order_id_fkey,
  ADD CONSTRAINT order_items_order_id_fkey 
    FOREIGN KEY (order_id) REFERENCES orders(order_id) 
    ON DELETE CASCADE;

DELETE FROM orders
WHERE order_date < '2023-01-01';

SELECT * FROM customers;



-- 3. delete all orders and order_items for customer with id = 3
DELETE FROM order_items 
WHERE order_id IN (SELECT order_id FROM orders WHERE customer_id = 3);

DELETE FROM orders 
WHERE customer_id = 3;
