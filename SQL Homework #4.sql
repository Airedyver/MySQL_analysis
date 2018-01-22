

SELECT last_name, COUNT(*)  AS last_count
FROM actor
GROUP BY last_name;

SELECT * FROM (
	SELECT last_name, COUNT(*) AS last_count
	FROM actor
	GROUP BY last_name
) as last_name_count
WHERE last_count >1;

SELECT actor_id, first_name,last_name
FROM actor
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

UPDATE actor
SET first_name = 'HARPO'
WHERE actor_id = 172;

UPDATE actor
SET first_name = 'GROUCHO'
WHERE actor_id = 172; 

SELECT actor_id, first_name,last_name
FROM actor
WHERE actor_id = 172;


