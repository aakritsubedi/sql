-- Exercise 1: 
-- how many bookings did customer id 10 make in October 2017
-- count the no. of screening for Blade Runner 2049 in October 2017
-- count the no. of unique customer who made a booking for October 2017

-- 1.1 how many bookings did customer id 10 make in October 2017
SELECT COUNT(b.id) FROM bookings b
JOIN screenings s
ON b.screening_id = s.id
WHERE b.customer_id = 10
AND s.start_time BETWEEN '2017-10-01' AND '2017-10-31';
-- Ans: 6

-- 1.2 count the no. of screening for Blade Runner 2049 in October 2017
SELECT COUNT(s.id) FROM screenings s 
JOIN films f 
ON s.film_id = f.id
WHERE f.name = 'Blade Runner 2049';
-- Ans: 24

-- 1.3 count the no. of unique customer who made a booking for October 2017
SELECT COUNT(DISTINCT(customer_id)) FROM bookings b
JOIN screenings s
ON b.screening_id = s.id
WHERE s.start_time BETWEEN '2017-10-01' AND '2017-10-31';
-- Ans: 105
