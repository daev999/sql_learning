-- Assessment Test 1
-- Practising GROUP BY, WHERE, HAVING, SUM, COUNT, LIKE, ORDER BY, and LIMIT.

-- Task 1: Customers who spent at least $110 with staff member 2.
-- WHERE filters payments to staff member 2 first.
-- GROUP BY creates a group for each customer.
-- SUM(amount) calculates each customer's total spending.
-- HAVING keeps customers whose total is at least $110.

SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;


-- Task 2: Count films beginning with the letter J.
-- LIKE 'J%' finds titles that start with J.
-- COUNT(title) counts the matching films.

SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%';


-- Task 3: Find the customer with the highest customer ID
-- whose first name starts with E and whose address ID is below 500.
-- WHERE applies both filters.
-- ORDER BY customer_id DESC puts the highest ID first.
-- LIMIT 1 returns only that customer.

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
