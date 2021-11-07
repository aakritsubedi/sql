-- Which film had the most screening in October 2017?
SELECT
  f.name AS film_name,
  COUNT(s.*) AS counter
FROM
  screenings s
  JOIN films f ON s.film_id = f.id
GROUP BY
  s.film_id,
  f.name
ORDER BY
  counter DESC
LIMIT
  1;