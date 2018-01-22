CREATE VIEW high_five_category AS 
SELECT name, SUM(amount) AS gross_revenue 
FROM(SELECT 
	category.name,
    payment.amount
FROM 
	category
    INNER JOIN
	film_category
    ON 
    category.category_id = film_category.category_id
    INNER JOIN
	film
    ON 
    film_category.film_id = film.film_id
    INNER JOIN 
    inventory
    ON 
    film.film_id = inventory.film_id
    INNER JOIN 
    rental
    ON 
    inventory.inventory_id = rental.inventory_id
    INNER JOIN
    payment
    ON 
    rental.rental_id = payment.rental_id)
    AS cat_amount 
    GROUP BY name 
    ORDER BY gross_revenue DESC
    LIMIT 5;

SELECT * FROM sakila.high_five_category;

DROP VIEW sakila.high_five_category;