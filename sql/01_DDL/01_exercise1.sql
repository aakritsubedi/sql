-- Exercise 1
-- Create database Test
-- Create Pets and People Table
-- Add a primary key to the id fields in the pets and people table 
-- Add a foreign key to the owner_id field in the pets table referencing the id field in the people table
-- Add a column named email to the people table 
-- Add a unique constraint to email column in the people table 
-- Rename the column name in the peoples table to 'first_name'
-- Change the postcode data type to char(7) in the people table

-- Creating the test database
CREATE DATABASE test;

-- Creating the ENUM for the pets type
CREATE TYPE pet_type_enum AS ENUM ('dogs', 'cats', 'birds');

-- Creating Pets table
CREATE TABLE pets(
  id INT,
  name CHAR(15),
  type pet_type_enum,
  status Boolean,
  create_at timestamp
);

-- Creating People table
CREATE TABLE peoples(
  id INT,
  name CHAR(15),
  status Boolean,
  create_at timestamp
);

-- Adding Primary Key in above tables
ALTER TABLE pets ADD PRIMARY KEY (id);
ALTER TABLE peoples ADD PRIMARY KEY (id);

-- Adding field owner_id and referencing to people table
ALTER TABLE pets ADD COLUMN owner_id INT;

ALTER TABLE pets ADD CONSTRAINT pets_fk FOREIGN KEY (owner_id) REFERENCES peoples (id);

-- Adding email column in people table
ALTER TABLE peoples ADD COLUMN email VARCHAR(255);

-- Add unique constrint to email column in people table
ALTER TABLE peoples ADD CONSTRAINT unique_email UNIQUE (email);

-- Rename name to first name column in people table
ALTER TABLE peoples RENAME "name" TO "first_name";

-- Add postcode info in peoples table and alter datatype
ALTER TABLE peoples ADD COLUMN postcode char(255);
ALTER TABLE peoples ALTER COLUMN postcode type char(7);
