/*
 * Use a subquery to select the film_id and title columns
 * for all films whose rental_rate is greater than the average.
 * Use the film table and order by title.
 *
 * HINT:
 * The postgresqltutorial.com website has a solution for this problem.
 */

SELECT film.film_id, film.title
FROM film
WHERE film.rental_rate > (
	SELECT AVG (film.rental_rate)
	FROM film
)
ORDER BY film.title;
