/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT customer_id  
FROM FILM 
JOIN INVENTORY
USING (FILM_ID)
JOIN RENTAL
USING (INVENTORY_ID)
JOIN  CUSTOMER
USING (CUSTOMER_ID)
WHERE film.title IN
    (SELECT FILM.TITLE
    FROM FILM
    INNER JOIN INVENTORY
    ON FILM.FILM_ID = INVENTORY.FILM_ID
    INNER JOIN RENTAL
    ON INVENTORY.INVENTORY_ID = RENTAL.INVENTORY_ID
    INNER JOIN PAYMENT
    ON RENTAL.RENTAL_ID = PAYMENT.RENTAL_ID
    GROUP BY Film.TITLE
    ORDER BY SUM(PAYMENT.AMOUNT) DESC
    LIMIT 5)
GROUP BY customer_id
ORDER BY customer_id;

