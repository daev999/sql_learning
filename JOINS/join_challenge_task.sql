-- Challenge 1:
-- Get the emails of customers who live in California.
-- The email is in the customer table, while the district is in the address table.
-- Both tables are connected through address_id.
-- INNER JOIN connects the customer to their address,
-- then WHERE filters the results to California.

SELECT customer.email, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California';


-- Challenge 2:
-- Get the movies that Nick Wahlberg has been in.
-- The actor's name is in the actor table.
-- film_actor connects actors to films using actor_id and film_id.
-- First JOIN connects actor to film_actor.
-- Second JOIN connects film_actor to film so we can get the movie title.
-- WHERE filters the results to Nick Wahlberg.

SELECT actor.first_name, actor.last_name, film.title
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick'
AND actor.last_name = 'Wahlberg';