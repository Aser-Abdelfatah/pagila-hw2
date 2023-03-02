/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
SELECT TITLE
from film
WHERE FILM_ID IN
(   SELECT FILM_ID
        FROM INVENTORY
        INNER JOIN RENTAL
        USING (INVENTORY_ID)
        INNER JOIN CUSTOMER 
        USING (CUSTOMER_ID)
        WHERE CUSTOMER_ID = 1
        GROUP BY (FILM_ID)
        HAVING (COUNT(film_id) > 1)
    )

