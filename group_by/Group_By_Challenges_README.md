# GROUP BY Challenge Tasks

## What I Practised

I completed three SQL challenges focused on `GROUP BY` and aggregate functions.

The challenges helped me practise:

- `GROUP BY`
- `COUNT()`
- `AVG()`
- `ROUND()`
- `SUM()`
- `ORDER BY`
- `DESC`
- `LIMIT`

The main idea I practised was **grouping rows first, then using an aggregate function to calculate something for each group**.

---

## Challenge 1 — Payments Handled by Each Staff Member

### Business Problem

There are two staff members. We want to find out how many payments each staff member handled so we can identify who processed the most payments and give them a bonus.

### My SQL

```sql
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;
```

### What I Did

- Used the `payment` table.
- Grouped the payments by `staff_id`.
- Used `COUNT()` to count the number of payments handled by each staff member.

### Key Idea

`GROUP BY staff_id` gives us a separate result for each staff member.

---

## Challenge 2 — Average Replacement Cost by Rating

### Business Problem

The company wants to understand the relationship between a movie's MPAA rating and its replacement cost.

The question was:

> What is the average replacement cost for each movie rating?

### My SQL

```sql
SELECT rating, ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating;
```

### What I Did

- Used the `film` table.
- Grouped the films by `rating`.
- Used `AVG()` to calculate the average replacement cost for each rating.
- Used `ROUND(..., 2)` to display the average to two decimal places.

### Key Idea

Instead of calculating one average for the entire table, `GROUP BY rating` calculates an average **for each rating**.

---

## Challenge 3 — Top 5 Customers by Total Spending

### Business Problem

The company wants to reward its top five customers with coupons.

The question was:

> Which five customers have spent the most money?

### My SQL

```sql
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;
```

### What I Did

- Used the `payment` table.
- Grouped payments by `customer_id`.
- Used `SUM(amount)` to calculate each customer's total spending.
- Used `ORDER BY SUM(amount) DESC` to put the highest spenders first.
- Used `LIMIT 5` to return only the top five customers.

### Key Idea

The query first calculates each customer's total spending, then sorts those totals from highest to lowest, and finally keeps the first five.

---

## What I Learned

These challenges helped me understand that aggregate functions can be used together with `GROUP BY` to answer questions about groups of data.

### The patterns I practised

```text
GROUP BY + COUNT()
→ How many are in each group?

GROUP BY + AVG()
→ What is the average for each group?

GROUP BY + SUM()
→ What is the total for each group?

GROUP BY + ORDER BY + LIMIT
→ Which groups have the highest/lowest values?
```

---

## My Main Takeaway

When I see a question asking for a result **for each** customer, staff member, rating, or another category, I should start thinking:

> **"Do I need GROUP BY?"**

Then I can ask:

1. What am I grouping by?
2. What calculation do I need?
3. Do I need to sort the results?
4. Do I only need the top or bottom few results?

---

## Quick Self-Check

1. Why do we use `GROUP BY staff_id` in the first challenge?

2. What is the difference between using `COUNT()` and `SUM()` in these challenges?

3. In Challenge 3, what would happen to the results if `DESC` was removed or changed to `ASC`?
