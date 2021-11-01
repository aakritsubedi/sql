# Database

An organized collection of information/data. 

# SQL 

- Structure Query Language 
- SQL is a standard language for storing, manipulating and retrieving data in databases
- access and manipulate databases

### What can SQL do ? 

- can execute queries against a database
- can retrieve data from a database
- can insert, update, delete, create records in a database
- can create new databases
- can create new tables in a database
- can create stored procedures in a database
- can create views in a database
- can set permissions on tables, procedures, and views
  
# Data Definition Language
Data definition language(DDL) is a subsection of SQL which deals with the creation of database objects such as tables and views.

## Data Types
 
**Numeric Data Types**
- smallint: small-range integer	
- integer: typical choice for integer	
- bigint: large-range integer	
- decimal: user-specified precision,exact	
- numeric:  user-specified precision,exact	
- real: variable-precision,inexact	
- double precision: variable-precision,inexact	
- smallserial: small autoincrementing integer	
- serial: autoincrementing integer	
- bigserial: large autoincrementing integer	
  
**Non Numeric Data Types**
- Char(N): Fixed length character
- Varchar(N): Varying length character
- TEXT: variable unlimited length
- Boolean: True or False values

**Date and Time Types**
- Date: Date(YYYY-MM-DD)
- timestamp: both date and time (no time zone)
- TIMESTAMPTZ: both date and time, with time zone	
- TIME: Time (HHH-MM-SS)

## Primary And Foreign Keys

Primary Key is a column, or set of columns, which uniquely identifies a record within a table.
- A primary key must be unique.
- A primary key cannot be null.
- A table can only have one primary key.

Foreign Key is used to link two tables together.
- A foreign key is a column whose values match the values of another tables primary key column.
- The table with the primary key is called the referenced or parent table, and the table with the foreign key is called the child table.
- A table can have multiple foreign keys.

## Create the coffee store database

```sh
// Login to postgreSQL

$ sudo -su postgres psql
// enter the password 

$ postgres=# 
```

```sh 
// check the available database list 
$ postgres=# \l //list of databases

// if you want to get more information, you can use the \l+ command:
$ postgres=# \l+
```

- Create databases  
Syntax: 
```sql
CREATE DATABASE database_name;
```

Example: 
```sql
CREATE DATABASE coffee_store;
```

```sh 
// connect or select a desired database
$ postgres=# \c database_name;

Eg:
$ postgres=# \c coffee_store;

// list the tables in the database
$ postgres=# \dt
```

- Create tables  
Syntax: 
```sql
CREATE TABLE table_name(
  column1 datatype,
  column2 datatype,
  ...

  columnN datatype,
  PRIMARY KEY (one or more columns)
);
```

Example:  
**Products Table**
```sql
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  price DECIMAL(3,2),
  status BOOLEAN
);
```

Creating ENUM
```sql
CREATE TYPE enum_name AS ENUM (value1, value2, ...)

CREATE TYPE gender_enum AS ENUM ('MALE', 'FEMALE', 'OTHER');
```

**Customers Table**
```sql
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  gender gender_enum,
  phone_no VARCHAR(10),
  status BOOLEAN
);
```

**Orders Table**
```sql
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  product_id INT,
  customer_id INT,
  order_time TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES products (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);
```

- Modify the table schema  
to add/remove primary key, foreign key, unique constraint, change column name, change column data type
Syntax: 
```sql
// add or remove primary key
ALTER TABLE table_name { ADD | DROP } PRIMARY KEY (columns);

// add or remove foreign key 
ALTER TABLE table_name ADD CONSTRAINT constaintName FOREIGN KEY (column) REFERENCES table_name(column);

ALTER TABLE table_name DROP FOREIGN KEY constraintName;

// add or remove unique constraint
ALTER TABLE table_name ADD CONSTRAINT constraintName UNIQUE (column);

ALTER TABLE table_name DROP CONSTRAINT constraintName;


// rename column
ALTER TABLE table_name RENAME  'old_name' TO 'new_column_name';

// change datatype 
ALTER TABLE table_name ALTER COLUMN columnName type datatype;
```

```sql
// schema details of the table 
$ postgres=# \d+ table_name

Eg: 
$ postgres=# \d+ products
```

Example:  
```sql
ALTER TABLE products 
ADD COLUMN coffee_origin VARCHAR(30);

ALTER TABLE products 
ALTER COLUMN coffee_origin SET DEFAULT 'NEPAL';
```

- Deleting Tables  
Syntax:  
```sql
DROP TABLE table_name;
```

Example:  
```sql
DROP TABLE test;
```

- Truncating Tables
Syntax:
```sql
TRUNCATE TABLE table_name;
```

Example:  
```sql
TRUNCATE TABLE test;
```

## Exercise: 1 Data Definition Language and Alter Table
```
Exercise 1
-- Create database Test
-- Create Pets and People Table
-- Add a primary key to the id fields in the pets and people table 
-- Add a foreign key to the owner_id field in the pets table referencing the id field in the people table
-- Add a column named email to the people table 
-- Add a unique constraint to email column in the people table 
-- Rename the column name in the peoples table to 'first_name'
-- Change the postcode data type to char(7) in the people table
```

Source: [Solution to Exercise1](./sql/01_DDL/01_exercise1.sql)

# Data Manipulation Language 
Data manipulation language or DML is a subset of SQL which is concerned with the inserting and updating and deleting of data in tables. So DDL was concerned with creating tables, and now DML is concerned with inserting data into those tables. 

- INSERT data into table  
Syntax:
```sql
INSERT INTO table_name (column1, column2...) 
VALUES('value1', 'value2', ...);
```

Example:  
```sql
INSERT INTO products(name, price, status) 
VALUES('Himalayan Beans', 9.50, true);

INSERT INTO products(name, price, status)
VALUES ('Latte', 3.50, true), ('Cappuccino', 3.50, false), ('Americano', 3.00, true);
```

- Update data   
Syntax:
```sql
UPDATE table_name
SET column = 'value'
WHERE condition;
```

Example:
```sql
UPDATE products
SET price = 7
WHERE id = 2;

UPDATE products 
SET price=7.5, name='Nepal Himalayan Bean'
WHERE id=2;
```

- DELETE data  
Syntax:
```sql
DELETE FROM table_name
WHERE condition;
```

Example: 
```sql
DELETE FROM products
WHERE id=2;
```

## Inserting dummy values in tables  
[Inserting sample data](./sql/02_DML/01_insertingData.sql)  

# SELECTING from a table

- SELECT Statement  
Syntax:
```sql
SELECT column1, column2 ... 
FROM table_name;
```

Example: 
```sql
SELECT first_name, last_name FROM customers;

// selecting all the records
SELECT * FROM customers;
```

- adding WHERE clause  
```sql
SELECT column1, column2 ...
FROM table_name
WHERE condition;
```

**Note:**  
- `>` greater than
- `>=` greater than or equal to
- `<` less than
- `<=` less than or equal to

Example: 
```sql
SELECT * FROM products
WHERE coffee_origin='NEPAL';

SELECT * FROM products
WHERE price > 4;

SELECT * FROM products
WHERE price >= 5;

SELECT * FROM products
WHERE price <= 3;

-- Multiple Condition
SELECT * FROM products
WHERE coffee_origin='NEPAL'
AND
price > 4;

SELECT * FROM products
WHERE coffee_origin='NEPAL'
OR 
price > 4;
```

- Null values    
SELECTing all the customers with phoneNo is/not NULL.

```sql
-- all the customers with no phone no.
SELECT * FROM customers
WHERE phone_no IS NULL;

-- all the customers with phone no.
SELECT * FROM customers
WHERE phone_no IS NOT NULL;
```

## Exercise 1
```
Exercise 1
- From the customers table, select the first name and phone no. of all the females who have a last name Bluth
- From the products table, select the name for all products that have a price greater than 3.00 or coffee origin of NEPAL
- How many male customers don't have a phone no. entered into the customers table?
```
Source: [Solution to Exercise1](./sql/03_SELECT/01_exercise1.sql)

## IN, NOT IN, BETWEEN, LIKE

Example: 
```sql
-- IN
SELECT * FROM customers
WHERE last_name IN ('Subedi', 'Bhandari', 'Nepal');

-- NOT IN
SELECT * FROM customers
WHERE first_name NOT IN ('Ram', 'John', 'Roshan');

-- BETWEEN: in range 
SELECT * FROM orders
WHERE order_time BETWEEN '2017-01-01' AND '2017-01-07';

SELECT * FROM customers
WHERE id BETWEEN 5 AND 10; // will include 5 and 10 also.

SELECT * FROM customers
WHERE last_name BETWEEN 'A' and 'L';

-- LIKE: matching pattern
-- `%` any no. of character
-- `_` just one character

SELECT * FROM customers
WHERE last_name LIKE 'W%';

SELECT * FROM customers
WHERE last_name LIKE 'W___';

SELECT * FROM customers
WHERE last_name LIKE '%o%'; 

SELECT * FROM customers
WHERE first_name LIKE '_o%';

SELECT * FROM products WHERE
WHERE price LIKE '3%';
```

## ORDER BY
Order data in specific order  

Syntax:  
```sql
SELECT * FROM table_name
WHERE condition
ORDER BY column { ASC | DESC };
```

Example: 
```sql
SELECT * FROM products
ORDER BY price DESC;

SELECT * FROM products
ORDER BY price ASC;

SELECT * FROM customers
ORDER BY first_name ASC;

SELECT * FROM orders
ORDER BY order_time DESC;

-- Default is ascending
SELECT * FROM products
ORDER BY price;
```

## Exercise: 2 SELECTing data
```
Exercise 2
-- From the products table, select the name and price of all products with coffee origin equal to Nepal or Indonesia. Order by name from A-Z
-- From the orders table, select all the orders from Feb 2017 for customers with id's 2,4,6,8.
-- From the customers table, select first_name and phone no. of all customers who's last_name contains the patten 'ar'
```

Source: [Solution to Exercise2](./sql/03_SELECT/02_exercise2.sql)

## DISTINCT

Syntax: 
```sql
SELECT DISTINCT column FROM table_name;
```

Example:  
```sql
SELECT DISTINCT coffee_origin FROM products;
```

## LIMIT and OFFSET

Syntax: 
```sql
SELECT column FROM table_name
LIMIT value
OFFSET value;
```

Example:
```sql
SELECT * FROM customers
LIMIT 10;
```

## Column Name Alias

Syntax:  
```sql
SELECT column1 AS alias FROM table_name;
```

Example:
```sql
SELECT coffee_origin AS country FROM products;
```

## Exercise: 3 
```
Exercise 3
- From the customer table, select distinct last names and order alphabetically from A-Z
- From the orders table, select the first 3 orders placed by customer with id 1 in Feb 2017
- From the products table, select the name, price and coffee origin but rename the price to retail price in the result set
```

Source: [Solution to Exercise3](./sql/03_SELECT/03_exercise3.sql)

# SELECTING from Multiple Tables

## What is a JOIN? 
Joins allow you to retrieve data from multiple tables in a single SELECT statement. To join two tables there needs to be a related column between them. 

There are many different kinds of JOINs
- **INNER Join**
  - will retrieve data only when there is matching values in both tables

- **LEFT Join**
  - will retrieve data from the left table(table 1) and matching rows from the right table(table 2)

- **RIGHT Join**
  - will retrieve data from the right table(table 2) and matching rows from the left table(table 1)

- **FULL/OUTER Join**
  - will retrieve all records when there is a match in either the left or right table

![JOINS in SQL](https://i.pinimg.com/originals/33/58/3f/33583f5a5f0fb7457743dd278369ab46.png)

## INNER Join
The INNER JOIN keyword selects records that have matching values in both tables.  

Syntax:
```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```

Example:
```sql
SELECT products.name, orders.order_time FROM orders
INNER JOIN products ON orders.product_id = products.id;

-- Shorthand version
SELECT p.name, p.price, o.order_time FROM orders o 
JOIN products p ON o.product_id = p.id
ORDER BY o.order_time DESC;

SELECT p.name, p.price, o.order_time FROM orders o 
JOIN products p ON o.product_id = p.id
WHERE p.price > 4
ORDER BY o.order_time DESC;

SELECT c.first_name, o.order_time FROM orders o
JOIN customers c ON o.customer_id = c.id;

-- Joining multiple tables
SELECT orders.id as "Order Id", products.name, customers.first_name, orders.order_time 
FROM products 
JOIN orders ON products.id = orders.product_id
JOIN customers ON customers.id = orders.customer_id;
```

## LEFT Join
The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.  

Syntax: 
```sql
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```

Example:
```sql
-- orders as first/left table
SELECT o.id, c.phone_no, c.first_name, o.order_time FROM orders o 
LEFT JOIN customers c 
ON o.customer_id = c.id
ORDER BY o.order_time;

-- customers as first/left table
SELECT o.id, c.phone_no, c.first_name, o.order_time FROM customers c 
LEFT JOIN orders o 
ON c.id = o.customer_id
ORDER BY o.order_time;
```

## RIGHT Join
The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.  

Syntax:
```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
```

Example:
```sql
-- orders as second/right table
SELECT o.id, c.phone_no, c.first_name, o.order_time FROM orders o 
RIGHT JOIN customers c 
ON o.customer_id = c.id
ORDER BY o.order_time;

-- customers as second/right table
SELECT o.id, c.phone_no, c.first_name, o.order_time FROM customers c 
RIGHT JOIN orders o 
ON c.id = o.customer_id
ORDER BY o.order_time;
```

## FULL/OUTER Join
The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.  

Syntax:
```sql
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;
```

Example:
```sql
SELECT o.id, c.phone_no, c.first_name, o.order_time FROM customers c 
FULL OUTER JOIN orders o 
ON c.id = o.customer_id
ORDER BY o.order_time;
```

## Joining more than two tables

Example:
```sql
SELECT o.id, c.first_name, c.last_name, p.name, p.price 
FROM products p
JOIN orders o ON p.id = o.product_id
JOIN customers c ON c.id = o.customer_id;
```

## Exercise:  JOINS
```
Exercise 1
- SELECT the order id and customers phone no. for all orders of product id 4
- SELECT product name and order time for the filter coffees sold between January 15th 2017 and February 14th 2017
- SELECT the product name and price adn order time for all orders from FEMALEs in January 2017
```

Source: [Solution to Exercise1](./sql/04_JOINS/01_exercise1.sql)

# Database Design

## Normalization
is the process of efficiently organizing data in a database.  

> Database normalization is a database schema design technique, by which an existing schema is modified to minimize redundancy and dependency of data. Normalization split a large table into smaller tables and define relationships between them to increases the clarity in organizing data.

**Why?**
- to eliminate redundant data
- to only store related data in the table
**Benefits:**
- reduce storage space
- reduce insert, update and delete anomalies
- improve query performance

**Levels of Normalization**
- 1st Normal Form (1NF)
- 2nd Normal Form (2NF)
- 3rd Normal Form (3NF)
- Boyce-Codd Normal Form (BCNF)
- 4th Normal Form (4NF)
- 5th Normal Form (5NF)

## 1st Normal Form (1NF)
Tables are in 1NF if:
- no repeated rows of data
- columns only contain a single value
- the table has a primary key

## 2nd Normal Form (2NF)
Tables are in 2NF if:
- They conform to 1NF
- every column that is not a primary key of the table is dependent on the whole of the primary key  
(removing unrelated data from tables)

## 3rd Normal Form (3NF)
Tables are in 3NF if:
- They conform to 2NF
- every column that is not a primary key is only dependent on the whole of the primary key  
(removing transitive dependent data from tables)  

3NF is achieved, considered as the database is normalized.

## Boyce-Codd Normal Form (BCNF)
Tables are in BCNF if:
- The conform to 3NF
- all tables in the database should be only one primary key.

## 4th Normal Form (4NF)
Tables are in 4NF if:
- Tables cannot have multi-valued dependencies on a Primary Key.

## 5th Normal Form (5NF)
Tables are in 5NF if:
- A composite key shouldn't have any cyclic dependencies.
