/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT TITLE 
FROM FILM
LEFT JOIN INVENTORY
USING (FILM_ID)
WHERE inventory.film_id 
IS NULL
ORDER BY title;
