-- Create database
CREATE DATABASE online_booking; 

-- Customers Table
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(45),
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL UNIQUE
);

-- Bookings Table
CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  screening_id INT NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

--Rooms Table
CREATE TABLE rooms (
  id SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  no_seats INT NOT NULL
);

-- Seats Tables
CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  row CHAR(1) NOT NULL,
  number INT NOT NULL,
  room_id INT NOT NULL,
  FOREIGN KEY (room_id) REFERENCES rooms(id)
);

-- Reserved Seat Table 
CREATE TABLE reserved_seat (
  id SERIAL PRIMARY KEY,
  booking_id INT NOT NULL,
  seat_id INT NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES bookings (id),
  FOREIGN KEY (seat_id) REFERENCES seats (id)
);

-- Films Table
CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  length_min INT NOT NULL
);

-- Screenings Table
CREATE TABLE screenings (
  id SERIAL PRIMARY KEY,
  film_id INT NOT NULL,
  room_id INT NOT NULL,
  start_time TIMESTAMP NOT NULL,
  FOREIGN KEY (film_id) REFERENCES films (id),
  FOREIGN KEY (room_id) REFERENCES rooms (id)
);


