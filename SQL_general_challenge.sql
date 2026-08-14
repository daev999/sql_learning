-- SQL General Challenges
-- Practice combining SELECT, COUNT, WHERE, DISTINCT, LIKE, and BETWEEN.

-- Challenge 1: How many payment transactions were greater than $5?
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;

-- Challenge 2: How many actors have a first name that starts with 'P'?
SELECT first_name
FROM actor
WHERE first_name LIKE 'P%';

-- Challenge 3: How many unique districts are customers from?
SELECT COUNT(DISTINCT district)
FROM address;

-- Challenge 4: What are the names of those distinct districts?
SELECT DISTINCT district
FROM address;

-- Challenge 5: How many films have an R rating and a replacement cost between $5 and $15?
SELECT COUNT(*)
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;

-- Challenge 6: How many films have the word 'Truman' somewhere in the title?
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';