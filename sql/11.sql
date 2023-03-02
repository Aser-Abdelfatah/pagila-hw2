/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT CONCAT(first_name, ' ', last_name) AS "Actor Name"
FROM (
    SELECT first_name, last_name, unnest(special_features) AS UNNESTED
    FROM ACTOR
    INNER JOIN FILM_ACTOR
    ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
    INNER JOIN FILM ON
    FILM_ACTOR.FILM_ID = FILM.FILM_ID
) AS SUBQUERY
WHERE UNNESTED LIKE 'Behind the Scenes'
GROUP BY "Actor Name"
ORDER BY "Actor Name";
