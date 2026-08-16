# SQL Toolbox: Assessment Test 1

## What It Does

This assessment brought together several SQL concepts I have learned so far:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `SUM()`
- `COUNT()`
- `LIKE`
- `ORDER BY`
- `DESC`
- `LIMIT`

The main challenge was choosing the right combination of these tools to answer each business question.

## Basic Syntax

The assessment used different combinations of these patterns:

```sql
SELECT column_name
FROM table_name
WHERE condition
GROUP BY column_name
HAVING aggregate_condition
ORDER BY column_name DESC
LIMIT number;
```

## Simple Examples

### Task 1 — Customers Who Spent at Least $110

**Problem:** Return customers who spent at least $110 with staff member 2.

```sql
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;
```

This filters payments to staff member 2, totals the spending for each customer, and keeps totals of at least $110.

**Expected customers:** `187` and `148`.

### Task 2 — Films Beginning With J

**Problem:** Find how many films begin with the letter J.

```sql
SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%';
```

This finds titles beginning with `J` and counts them.

**Expected result:** `20`.

### Task 3 — Highest Customer ID Starting With E

**Problem:** Find the customer with the highest customer ID whose first name starts with `E` and whose address ID is below 500.

```sql
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
```

This filters the customers, sorts the matches from highest customer ID to lowest, and returns the first one.

**Expected result:** Eddie Tomlin.

## Common Mistakes / Things to Watch For

- **Using `WHERE` to filter an aggregate result** — In Task 1, `SUM(amount) >= 110` is a condition on a grouped calculation, so `HAVING` is used instead.
- **Forgetting what `%` means in `LIKE 'J%'`** — The `%` allows any characters to come after `J`, so it means the title starts with `J`.
- **Sorting in the wrong direction** — Task 3 asks for the highest customer ID, so `DESC` puts the highest ID first.
- **Forgetting `LIMIT 1`** — Without it, all matching customers would be returned instead of only the highest-ID customer.

## How to Think About It

Before writing the query, break the question into steps:

1. **What information am I being asked to return?**
2. **Which table contains it?**
3. **Which rows should I filter?**
4. **Do I need to group the rows?**
5. **Do I need a calculation such as `SUM()` or `COUNT()`?**
6. **Am I filtering individual rows or a calculated group?**
7. **Do I need to sort the results?**
8. **Do I only need a certain number of results?**

A useful mental model from this assessment is:

```text
Filter rows
    ↓
Group rows if needed
    ↓
Calculate
    ↓
Filter groups if needed
    ↓
Sort
    ↓
Limit results
```

## Key Things to Remember

- `WHERE` filters rows before grouping.
- `GROUP BY` creates groups such as one group per customer.
- `SUM()` adds values together.
- `COUNT()` counts matching rows.
- `HAVING` filters groups after an aggregate calculation.
- `LIKE 'J%'` finds values that start with `J`.
- `ORDER BY ... DESC` puts the highest values first.
- `LIMIT 1` returns only one result.
- SQL becomes much easier when a business question is broken into small steps.

## Quick Self-Check

1. Why does Task 1 need both `WHERE` and `HAVING`?

2. If Task 3 asked for the **lowest** customer ID instead, what would you change?

3. What would `LIKE '%J'` look for compared with `LIKE 'J%'`?
