/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

WITH subquery 
AS( 
  SELECT TITLE, unnest(special_features) AS UNNESTED
  FROM FILM
)


SELECT TITLE
FROM
subquery as s1
INNER JOIN
subquery as s2
USING (title)
WHERE s1.UNNESTED = 'Behind the Scenes' AND S2.UNNESTED = 'Trailers'
ORDER BY title;

