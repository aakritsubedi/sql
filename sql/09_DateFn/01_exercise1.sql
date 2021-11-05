-- Exercise 1: 
-- Select the film id and start time from the screenings table for the date of 20th of Oct 2017
-- Select all the data from the screenings table for the start time between the 6th and 13th Oct 2017
-- Select all the data from the screenings table for Oct 2017

-- 1.1 Select the film id and start time from the screenings table for the date of 20th of Oct 2017
SELECT film_id, start_time FROM screenings 
WHERE DATE(start_time) = '2017-10-20';

-- 1.2 Select all the data from the screenings table for the start time between the 6th and 13th Oct 2017
SELECT * FROM screenings 
WHERE DATE(start_time) BETWEEN '2017-10-06' AND '2017-10-13';

-- 1.3 Select all the data from the screenings table for Oct 2017
SELECT * FROM screenings 
WHERE MONTH(start_time) = '10' 
AND YEAR(start_time) = '2017';
