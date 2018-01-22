SELECT 
	staff.first_name,
    staff.last_name,
    address.address
FROM 
	address
    INNER JOIN
    staff
    ON 
    staff.address_id = address.address_id;
    
SELECT * FROM (    
SELECT 
	staff.first_name,
    staff.last_name,
    payment.payment_id,
    payment.amount,
    payment.payment_date
FROM 
	staff
    INNER JOIN
    payment
    ON 
    staff.staff_id = payment.staff_id
    )AS payment_staff 
WHERE payment_date LIKE '2005-08%';

SELECT title, COUNT(*)AS actor_count
FROM (
SELECT 
	film.title,
    film_actor.actor_id
FROM 
	film
    INNER JOIN
    film_actor
    ON 
    film.film_id = film_actor.film_id
)AS film_act_join GROUP BY title;


SELECT title, COUNT(*)AS inventory_count
FROM (
SELECT 
	film.title
FROM 
	film
    INNER JOIN
    inventory
    ON 
    film.film_id = inventory.film_id
)AS film_inventory WHERE title = 'Hunchback Impossible';

SELECT last_name,first_name, SUM(amount)
FROM(
SELECT 
    customer.last_name,
    customer.first_name,
    customer.customer_id,
    payment.amount
FROM 
	customer
    INNER JOIN
    payment
    ON 
    customer.customer_id = payment.customer_id
) AS payment_customer GROUP BY customer_id 
ORDER BY last_name;