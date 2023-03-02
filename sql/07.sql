/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

SELECT FILM.TITLE
FROM FILM
INNER JOIN INVENTORY
USING (FILM_ID)
WHERE FILM.TITLE NOT IN (
SELECT TITLE
FROM FILM
INNER JOIN INVENTORY 
USING (film_id)
INNER JOIN RENTAL 
USING (inventory_id)
INNER JOIN CUSTOMER 
USING (customer_id)
INNER JOIN ADDRESS 
USING (address_id)
INNER JOIN CITY 
USING (city_id)
INNER JOIN COUNTRY 
USING (country_id)
WHERE COUNTRY ILIKE 'United States'
)
GROUP BY title
ORDER BY title;

