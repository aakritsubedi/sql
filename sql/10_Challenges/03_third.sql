-- How many bookings did the film 'Jigsaw' have in October 2017?
SELECT
  COUNT(b.*) as no_of_bookings
FROM
  bookings b
  JOIN screenings s ON b.screening_id = s.id
WHERE
  s.film_id = (
    SELECT
      id
    FROM
      films
    WHERE
      name = 'Jigsaw'
  );
  