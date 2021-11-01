-- Exercise 2
-- From the products table, select the name and price of all products with coffee origin equal to Nepal or Indonesia. Order by name from A-Z
-- From the orders table, select all the orders from Feb 2017 for customers with id's 2,4,6,8.
-- From the customers table, select first_name and phone no. of all customers who's last_name contains the patten 'ar'

-- 2.1 From the products table, select the name and price of all products with coffee origin equal to Nepal or Indonesia. Order by name from A-Z
SELECT name, price FROM products
WHERE coffee_origin IN ('NEPAL', 'INDIA')
ORDER BY name ASC;

-- 2.2 From the orders table, select all the orders from Feb 2017 for customers with id's 2,4,6,8.
SELECT * FROM orders
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28'
AND customer_id IN (2,4,6,8);

-- 2.3 From the customers table, select first_name and phone no. of all customers who's last_name contains the patten 'ar'
SELECT first_name, phone_no FROM customers
WHERE last_name LIKE '%ar%';
