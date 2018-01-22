SELECT actor_id,first_name,last_name
FROM actor 
WHERE first_name = "Joe";

SELECT first_name, last_name
FROM actor
WHERE last_name REGEXP "GEN";

SELECT 
    first_name, last_name
FROM
    actor
WHERE
    last_name REGEXP 'LI'
ORDER BY last_name;

SELECT country_id, country 
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh' ,'China');
