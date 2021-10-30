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
  
# Learning SQL 

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
