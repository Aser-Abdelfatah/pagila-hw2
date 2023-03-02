/*
 * Management wants to purchase new films that they don't already have.
 * Select a list of all films in the film table that are not in the inventory table.
 *
 * HINT:
 * This can be done by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 */

SELECT TITLE
FROM FILM
WHERE FILM_ID NOT IN (
SELECT film_id
FROM inventory
)
ORDER BY TITLE;
