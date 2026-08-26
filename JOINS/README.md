# SQL JOIN Challenges — DVD Rental Database

A couple of practice challenges applying `INNER JOIN` to real business questions using the Postgres `dvdrental` sample database.

---

## Challenge 1: Customers in California

**Question:** Get the emails of customers who live in California.

**The problem:** the customer's email lives in the `customer` table, but their location (district) lives in a separate `address` table. These two tables are connected through a shared `address_id` column.

### Approach
1. `INNER JOIN` the `customer` table to the `address` table, matching on `address_id`.
2. Filter the joined results with `WHERE` to only keep rows where `district = 'California'`.

### Solution
```sql
SELECT customer.email, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California';
```

### Result
A list of customer email addresses, each paired with their district, for every customer whose district is California.

---

## Challenge 2: Every Film Nick Wahlberg Has Been In

**Question:** Get the movies that Nick Wahlberg has been in.

**The problem:** this one needs THREE tables, not two, because actors and films aren't directly connected — there's a linking table in between:
- `actor` holds the actor's name.
- `film` holds the movie title.
- `film_actor` sits between them, connecting `actor_id` to `film_id` (this is a classic many-to-many relationship — one actor can be in many films, one film can have many actors, so a linking table is needed to represent all those combinations).

### Approach
1. `INNER JOIN` `actor` to `film_actor`, matching on `actor_id`.
2. `INNER JOIN` the result to `film`, matching on `film_id`, to pull in the actual movie title.
3. Filter with `WHERE` on both `first_name` and `last_name` to isolate Nick Wahlberg specifically.

### Solution
```sql
SELECT actor.first_name, actor.last_name, film.title
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick'
AND actor.last_name = 'Wahlberg';
```

### Result
A list of every film title Nick Wahlberg has appeared in, according to the database.

---

## Key Takeaway

Both challenges use the same core INNER JOIN pattern, just at different scales:
- **Challenge 1** needed a single JOIN — two tables, one shared key.
- **Challenge 2** needed a chained JOIN — three tables, because the actor and film tables aren't directly related and need a linking table (`film_actor`) in between to connect them.

This chained-JOIN pattern (JOIN → JOIN → WHERE) is extremely common in real relational databases, since many-to-many relationships (actors in films, students in classes, products in orders) almost always require a linking table like `film_actor` to represent the connection properly.
