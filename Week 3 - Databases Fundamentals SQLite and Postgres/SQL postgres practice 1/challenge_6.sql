-- 1. Update the phone number of the customer with first name 'John' :
UPDATE customers
SET phone_number = '0600000000'
WHERE first_name = 'John';

--verfication
SELECT * from customers 
where first_name = 'John';

-- 2. Update the total amount of all orders by adding 10% :
UPDATE orders
SET total_amount = total_amount + (total_amount * 0.1);

--verfication
SELECT * from orders;


-- 3. Update the email of the customer with first name 'David' :
UPDATE customers
SET email = 'david.dubois@gmail.com'
WHERE first_name = 'David';

--verfication
SELECT * from customers 
where first_name = 'David';