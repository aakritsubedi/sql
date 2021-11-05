-- Exercise 1
-- Concatenate the film names and length from the films table
-- Extrat the customers email from the 5th character onwards
-- Select the customers first name in lower case and their last name in upper case for each customer with a last name of `Smith`
-- Select the last 3 letters of each film name from the films table
-- Concatenate the first three letters in the first_name and last_name columns together from the customers table

-- 1.1 Concatenate the film names and length from the films table
SELECT CONCAT(name, ": ",length_min) as film_info FROM films;

-- 1.2 Extrat the customers email from the 5th character onwards
SELECT SUBSTRING(email, 5) FROM customers;

-- 1.3 Select the customers first name in lower case and their last name in upper case for each customer with a last name of `Smith`
SELECT LOWER(first_name), UPPER(last_name) FROM customers
WHERE last_name = 'Smith';

-- 1.4 Select the last 3 letters of each film name from the films table
SELECT SUBSTRING(name, -3) AS film_name FROM films; 

-- 1.5 Concatenate the first three letters in the first_name and last_name columns together from the customers table
SELECT CONCAT(
  SUBSTRING(first_name, 1,3), ' ', SUBSTRING(last_name, 1,3)
) AS secret_name FROM customers;
