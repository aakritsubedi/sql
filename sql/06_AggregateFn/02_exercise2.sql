-- Exercise 2
-- SELECT the customer id and count the no. of reserved seats grouped by customer for October 2017
-- SELECT the film name and count the no. of screenings for each film that is over 2hours long.

-- 2.1 SELECT the customer id and count the no. of reserved seats grouped by customer for October 2017
--> (all the data are of OCt 2017)
SELECT b.customer_id, COUNT(r.id) FROM reserved_seat r
JOIN bookings b ON r.booking_id = b.id
GROUP BY b.customer_id; 

SELECT b.customer_id, COUNT(r.id) FROM bookings b
JOIN reserved_seat r ON b.id = r.booking_id
GROUP BY b.customer_id;

-- 2.2 SELECT the customer id and count the no. of reserved seats grouped by customer for October 2017
SELECT f.name, f.length_min, COUNT(s.id) FROM screenings s 
JOIN films f
ON s.film_id = f.id
GROUP BY f.name, f.length_min
HAVING f.length_min > 120;
