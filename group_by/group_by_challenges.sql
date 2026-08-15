-- GROUP BY Challenge Tasks
-- Practice with COUNT, AVG, ROUND, SUM, GROUP BY, ORDER BY, and LIMIT.

-- Challenge 1: Count the payments handled by each staff member.
-- Each row in the payment table represents one payment.
-- GROUP BY staff_id creates one group for each staff member.
-- COUNT(payment_id) counts how many payments each staff member handled.

SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;


-- Challenge 2: Find the average replacement cost for each movie rating.
-- GROUP BY rating creates one group for each rating (G, PG, R, etc.).
-- AVG(replacement_cost) calculates the average replacement cost
-- for the films within each rating.
-- ROUND(..., 2) keeps the result to two decimal places.

SELECT rating, ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating;


-- Challenge 3: Find the top 5 customers based on total spending.
-- SUM(amount) adds together all payments made by each customer.
-- GROUP BY customer_id creates one group for each customer.
-- ORDER BY SUM(amount) DESC puts the highest spenders first.
-- LIMIT 5 keeps only the top five customers.

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;
