USE sakila;

SELECT title
FROM (SELECT* 
FROM film
WHERE(SELECT language_id
FROM language
WHERE name = 'English')) AS english_film
WHERE title LIKE 'K%' or title LIKE 'Q%';

SELECT first_name,last_name
FROM actor
WHERE actor_id IN(SELECT actor_id
FROM film_actor
WHERE(SELECT film_id
FROM film
WHERE title = 'Alone Trip'));

SELECT first_name, last_name, address,country
FROM(
SELECT 
	customer.first_name,
    customer.last_name,
    address.address,
    city.city,
    country.country
FROM
	customer
    INNER JOIN
    address
    ON customer.address_id = address.address_id
    LEFT JOIN
    city
	ON 
    address.city_id = city.city_id
    LEFT JOIN 
    country
    ON 
    city.country_id = country.country_id) AS customer_full    
WHERE country = 'Canada';

SELECT title
FROM film
WHERE film_id IN(SELECT film_id
FROM film_category
WHERE(SELECT category_id
FROM category
WHERE name = 'Family'));

SELECT title, COUNT(*) AS rental_count
FROM(SELECT 
	film.title,
    inventory.inventory_id,
    rental.rental_id
FROM 
	film 
    INNER JOIN
    inventory 
    ON 
    film.film_id = inventory.film_id
    INNER JOIN
    rental
    ON 
    inventory.inventory_id = rental.inventory_id)AS title_count
GROUP BY title ORDER BY rental_count DESC;

SELECT store_id, SUM(amount) 
FROM(SELECT 
	store.store_id,
    payment.payment_date,
    payment.amount
FROM 
	store
    INNER JOIN 
    inventory
    ON 
    store.store_id = inventory.store_id
    INNER JOIN 
    rental
    ON 
    inventory.inventory_id = rental.inventory_id
    INNER JOIN
    payment
    ON 
    rental.rental_id = payment.rental_id)
    AS store_payment GROUP BY store_id;

SELECT store_id,city,country
FROM(
SELECT 
	store.store_id,
    address.address,
    city.city,
    country.country
FROM
	store
    INNER JOIN
    address
    ON store.address_id = address.address_id
    LEFT JOIN
    city
	ON 
    address.city_id = city.city_id
    LEFT JOIN 
    country
    ON 
    city.country_id = country.country_id) AS store_address;	
    
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
    ORDER BY gross_revenue DESC;