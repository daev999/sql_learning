-- Challenge 1: Find the months during which payments occurred.
-- TO_CHAR() formats payment_date as the month name.
-- DISTINCT removes duplicate month names so each month appears only once.
SELECT DISTINCT (TO_CHAR(payment_date, 'MONTH'))
FROM payment;


-- Challenge 2: Count how many payments occurred on a Monday.
-- EXTRACT(DOW FROM payment_date) gets the day of the week as a number.
-- PostgreSQL uses 1 for Monday when using DOW.
-- WHERE keeps only payments that occurred on Monday.
-- COUNT(*) counts the remaining payment rows.
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1;
