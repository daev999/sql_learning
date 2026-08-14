## General SQL Challenges

These challenges combine several SQL concepts I have learned so far, including `SELECT`, `COUNT`, `WHERE`, `DISTINCT`, `LIKE`, `BETWEEN`, comparison operators, and wildcard characters.

The goal was to practise combining SQL concepts to answer business questions.

### Challenge 1 — Payment Transactions Greater Than $5

**Problem:** Find how many payment transactions were greater than $5.

```sql
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;
```

**What I practised:**
- `COUNT()` to count results
- `WHERE` to filter rows
- `>` to find values greater than 5

---

### Challenge 2 — Actors Whose Names Start With P

**Problem:** Find actors whose first name starts with the letter `P`.

```sql
SELECT first_name
FROM actor
WHERE first_name LIKE 'P%';
```

**What I practised:**
- `LIKE` for pattern matching
- `%` as a wildcard for any number of characters
- `WHERE` to filter the names

---

### Challenge 3 — Number of Unique Districts

**Problem:** Find how many unique districts the customers are from.

```sql
SELECT COUNT(DISTINCT district)
FROM address;
```

**What I practised:**
- `DISTINCT` to remove duplicates
- `COUNT()` to count the unique values

---

### Challenge 4 — List of Unique Districts

**Problem:** Return the names of the unique districts.

```sql
SELECT DISTINCT district
FROM address;
```

**What I practised:**
- `DISTINCT` to return each district only once
- The difference between counting unique values and listing them

---

### Challenge 5 — R-Rated Films With Replacement Cost Between $5 and $15

**Problem:** Find how many films are rated `R` and have a replacement cost between $5 and $15.

```sql
SELECT COUNT(*)
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;
```

**What I practised:**
- `COUNT(*)` to count matching rows
- `WHERE` to filter results
- `AND` to require both conditions
- `BETWEEN` to check a range of numbers

---

### Challenge 6 — Films Containing "Truman"

**Problem:** Find how many films have the word `Truman` somewhere in their title.

```sql
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';
```

**What I practised:**
- `LIKE` for pattern matching
- `%` before and after `Truman` to allow characters on either side
- `COUNT(*)` to count matching films

---

## What I Learned

These challenges helped me practise combining SQL concepts instead of using each statement on its own.

The main patterns I worked with were:

```text
COUNT + WHERE
COUNT + DISTINCT
DISTINCT
LIKE + %
COUNT + WHERE + AND + BETWEEN
COUNT + LIKE + %
```

### Key Lesson

Before writing the query, break the business question into smaller parts:

1. **What am I being asked to find?**
2. **Which table contains the information?**
3. **Which column do I need?**
4. **Do I need to filter the rows?**
5. **Do I need to count or remove duplicates?**
6. **Do I need pattern matching or a range?**

This helped me turn a business question into a SQL query step by step.
