# SQL Challenges — My Learning Journal 🐍

---

## Challenge 1 — SELECT DISTINCT

### Problem
Find the unique rental rates from the `film` table.

### My Approach
- I identified the column: `rental_rate`
- I noticed there were duplicate values
- I used `SELECT DISTINCT` to return only unique values

### SQL Query

```sql
SELECT DISTINCT rental_rate
FROM film;
```

### Result
- 0.99
- 2.99
- 4.99

### Screenshot
![SELECT DISTINCT Result](select_distinct_result.png)

### What I Learned
- `DISTINCT` removes duplicate values
- It helps answer questions like "what unique values exist?"
- Always think in terms of the business question first

---

## Challenge 2 — SELECT WHERE

### Challenge 2a
Find the email of customer Nancy Thomas.

```sql
SELECT email 
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';
```

### Screenshot
![WHERE Challenge 1](where_challenge1.png)

---

### Challenge 2b
Get the description of the movie "Outlaw Hanky".

```sql
SELECT title, description 
FROM film
WHERE title = 'Outlaw Hanky';
```

### Screenshot
![WHERE Challenge 2](where_challenge2.png)

---

### Challenge 2c
Find the phone number of the customer at '259 Ipoh Drive'.

```sql
SELECT phone 
FROM address
WHERE address = '259 Ipoh Drive';
```

### Screenshot
![WHERE Challenge 3](where_challenge3.png)

---

## Challenge 3 — ORDER BY & LIMIT

### Problem
A customer wants to quickly rent a video to watch over their short lunch break. What are the titles of the **5 shortest movies** (by runtime)?

### My Approach
- Used the `film` table
- Looked at the `length` column
- Used `ORDER BY length ASC` to sort from shortest to longest
- Used `LIMIT 5` to grab just the top 5

### SQL Query

```sql
SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 5;
```

### Result
5 movies, each **46 minutes** long.

### Screenshot
![Shortest Movies Result](shortest_movies_result.png)

### What I Learned
- `ORDER BY column ASC` sorts from smallest to largest (ASC is actually the default)
- `LIMIT` controls how many rows come back
- ⚠️ Important gotcha: `LIMIT 5` doesn't guarantee these are the *only* 5 shortest movies — there could be more ties at 46 minutes. Always be aware of ties when using `LIMIT`

---

## Challenge 4 — ORDER BY, LIMIT & WHERE (Bonus)

### Problem Part A
We want to reward our first 10 paying customers. What are the **customer IDs** of the first 10 customers who ever made a payment?

### My Approach
- Used the `payment` table
- Ordered by `payment_date` in ascending order (oldest first)
- Used `LIMIT 10` to get just the first 10

### SQL Query

```sql
SELECT customer_id
FROM payment
ORDER BY payment_date ASC
LIMIT 10;
```

> 💡 Note: `ASC` is the default, so you can leave it out and get the same result.

---

### Problem Part B — Bonus 🎁
If that same customer can only watch movies that are **50 minutes or less**, how many options does she/he have?

### My Approach
- Used the `film` table
- Filtered with `WHERE length <= 50`
- Used `COUNT` to get the total number of qualifying movies

### SQL Query

```sql
SELECT COUNT(title)
FROM film
WHERE length <= 50;
```

### Result
**37 movies** available to watch.

### What I Learned
- You can combine `ORDER BY` and `LIMIT` to find "first" or "last" records
- `ORDER BY payment_date ASC` gives you the earliest payments first
- `COUNT` + `WHERE` is a powerful combo for answering "how many?" questions
- You don't always need `ORDER BY` — when you just need a count, `WHERE` alone does the job

---

*Built while learning SQL on my journey to becoming a Data Analyst 🚀*  
*Follow along on TikTok, Instagram, X & Threads!*