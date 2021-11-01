-- Exercise 1
-- SELECT the order id and customers phone no. for all orders of product id 4
-- SELECT product name and order time for the LATTE coffees sold between January 15th 2017 and February 14th 2017
-- SELECT the product name and price and order time for all orders from FEMALEs in January 2017

-- 1.1 SELECT the order id and customers phone no. for all orders of product id 4
SELECT o.id, c.phone_no FROM orders o
JOIN customers c 
ON o.customer_id = c.id
WHERE o.product_id = 4;

-- 1.2 SELECT product name and order time for the LATTE coffees sold between January 15th 2017 and February 14th 2017
SELECT p.name, o.order_time FROM orders o
JOIN products p
ON o.product_id = p.id
WHERE p.name = 'Latte'
AND o.order_time BETWEEN '2017-01-15' AND '2017-02-14';

-- 1.3 SELECT the product name and price and order time for all orders from FEMALEs in January 2017
SELECT p.name, p.price, o.order_time
FROM products p
JOIN orders o ON  p.id = o.product_id
JOIN customers c ON o.customer_id = c.id
WHERE c.gender = 'FEMALE'
AND o.order_time BETWEEN '2017-01-01' AND '2017-01-31';
