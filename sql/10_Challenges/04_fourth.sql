-- Which 5 customers made the most bookings in October 2017?
SELECT
  CONCAT(c.first_name, ' ', c.last_name) AS full_name,
  COUNT(b.*) AS no_of_bookings
FROM
  bookings b
  JOIN customers c ON b.customer_id = c.id
GROUP BY
  b.customer_id,
  c.first_name,
  c.last_name
ORDER BY
  no_of_bookings DESC
LIMIT
  5;
  