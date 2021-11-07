-- How many of the customers made a booking in October 2017? 
SELECT
  COUNT(DISTINCT(customer_id)) AS no_of_customers
FROM
  bookings;