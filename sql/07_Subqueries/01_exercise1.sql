-- Exercise 1
-- Select the film name and length for all films with a length greater than the average film length
-- Select the maximum no. and minimum no. of screening for a particular film
-- Select each film name and the no. of screenings for that film

-- 1.1 Select the film name and length for all films with a length greater than the average film length
SELECT
  name,
  length_min
FROM
  films
WHERE
  length_min > (
    SELECT
      AVG(length_min)
    FROM
      films
  );

-- 1.2 Select the maximum no. and minimum no. of screening for a particular film
SELECT
  MAX(counter),
  MIN(counter)
FROM
  (
    SELECT
      film_id,
      COUNT(id) AS counter
    FROM
      screenings
    GROUP BY
      film_id
  ) s;

-- 1.3 Select each film name and the no. of screenings for that film
SELECT
  name,
  (
    SELECT
      COUNT(*)
    FROM
      screenings
    WHERE
      film_id = f.id
  )
FROM
  films f;
  