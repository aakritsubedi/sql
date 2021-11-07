-- Which film was shown in the Chaplin room most often in October 2017?
SELECT
  f.name,
  COUNT(r.name) AS no_of_screenings
FROM
  films f
  JOIN screenings s ON f.id = s.film_id
  JOIN rooms r ON r.id = s.room_id
WHERE
  r.name = 'Chaplin'
GROUP BY
  f.name
ORDER BY
  no_of_screenings DESC
LIMIT
  1;
