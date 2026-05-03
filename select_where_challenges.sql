-- Challenge 1: Find email of Nancy Thomas
SELECT email 
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- Challenge 2: Get description of "Outlaw Hanky"
SELECT title, description 
FROM film
WHERE title = 'Outlaw Hanky';

-- Challenge 3: Get phone number by address
SELECT phone 
FROM address
WHERE address = '259 Ipoh Drive';