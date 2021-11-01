-- Exercise 1
-- From the customers table, select the first name and phone no. of all the females who have a last name Bluth
-- From the products table, select the name for all products that have a price greater than 3.00 or coffee origin of NEPAL
-- How many male customers don't have a phone no. entered into the customers table?

-- 1.1 From the customers table, select the first name and phone no. of all the females who have a last name Bluth
SELECT first_name, phone_no FROM customers
WHERE gender = 'FEMALE'
AND
last_name = 'Bluth';

-- 1.2 From the products table, select the name for all products that have a price greater than 3.00 or coffee origin of NEPAL
SELECT name FROM products 
WHERE price >= 3.00
OR 
coffee_origin = 'NEPAL';

-- 1.3 How many male customers don't have a phone no. entered into the customers table?
SELECT first_name FROM customers 
WHERE phone_no IS NULL
AND gender = 'MALE';

SELECT count(*) FROM customers 
WHERE phone_no IS NULL
AND gender = 'MALE';
 