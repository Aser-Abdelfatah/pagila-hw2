/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT TITLE
FROM (
SELECT RATING, TITLE, UNNEST(SPECIAL_FEATURES) AS UNNESTED
FROM FILM
) queried 
WHERE RATING = 'G'
AND UNNESTED ILIKE 'Trailers'
ORDER BY TITLE;
