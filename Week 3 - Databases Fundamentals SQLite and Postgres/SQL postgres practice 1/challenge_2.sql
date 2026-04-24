
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
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10,2)
);

-- 4. Create Order_items (Depends on Orders and Products)
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    price_unit DECIMAL(10,2),
    quantity INT
);

