-- HAVING Challenge Tasks
-- Practising HAVING with COUNT(), SUM(), WHERE, and GROUP BY.

-- Challenge 1: Platinum customers
-- Find customers who have made 40 or more payment transactions.
-- GROUP BY customer_id creates one group for each customer.
-- COUNT(amount) counts the payment rows for each customer.
-- HAVING filters the grouped results and keeps customers
-- who have 40 or more payments.

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;


-- Challenge 2: Customers who spent more than $100 with staff member 2
-- Find customers whose payments handled by staff_id 2
-- total more than $100.
-- WHERE staff_id = 2 filters the payment rows before grouping.
-- GROUP BY customer_id creates one group for each customer.
-- SUM(amount) adds the payment amounts for each customer.
-- HAVING filters the grouped totals and keeps customers
-- whose total spending is greater than $100.

SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;
