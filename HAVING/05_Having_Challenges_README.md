# SQL Toolbox: HAVING Challenges

## What I Practised

I completed two SQL challenges focused on the `HAVING` clause.

These challenges helped me practise combining:

- `HAVING`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `WHERE`

The main idea was learning how to filter grouped results after an aggregate calculation.

---

## Challenge 1 — Platinum Customers

### Business Problem

The store is launching a platinum service for its most loyal customers.

Customers who have made **40 or more payment transactions** are eligible for platinum status.

### My SQL

```sql
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;
```

### What I Did

- Used the `payment` table.
- Grouped the payments by `customer_id`.
- Used `COUNT(amount)` to count each customer's payment transactions.
- Used `HAVING` to keep only customers with 40 or more transactions.

### Key Idea

`HAVING` is useful here because the condition is based on the result of `COUNT()` for each customer.

---

## Challenge 2 — Customers Who Spent More Than $100 With Staff Member 2

### Business Problem

Find the customer IDs of customers who have spent more than **$100** in payment transactions handled by `staff_id` 2.

### My SQL

```sql
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;
```

### What I Did

- Used the `payment` table.
- Used `WHERE staff_id = 2` to first keep only payments handled by staff member 2.
- Grouped the remaining payments by `customer_id`.
- Used `SUM(amount)` to calculate each customer's total spending with that staff member.
- Used `HAVING SUM(amount) > 100` to keep only customers whose total was greater than $100.

### Key Idea

The thinking flow is:

```text
WHERE
↓
Filter the payment rows

GROUP BY
↓
Group the remaining rows by customer

SUM()
↓
Calculate each customer's total

HAVING
↓
Keep only groups with a total above $100
```

---

## What I Learned

The biggest lesson from these challenges was understanding what `HAVING` does after `GROUP BY`.

### `WHERE` vs `HAVING`

A useful way to think about them is:

```text
WHERE
→ Filters individual rows BEFORE grouping

GROUP BY
→ Creates groups

HAVING
→ Filters the groups AFTER grouping
```

For example:

```sql
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;
```

The `COUNT()` is calculated for each customer first.

Then `HAVING` asks:

> "Does this customer's count meet my condition?"

---

## Key Things to Remember

- `GROUP BY` creates groups of rows based on a column.
- `HAVING` filters those groups.
- `WHERE` filters rows before they are grouped.
- `COUNT()` can be used with `GROUP BY` to count rows in each group.
- `SUM()` can be used with `GROUP BY` to calculate a total for each group.
- Conditions involving aggregate results such as `COUNT()` and `SUM()` can be handled with `HAVING`.
- When both `WHERE` and `HAVING` are needed, `WHERE` can first narrow down the rows before grouping.

---

## Quick Self-Check

1. Why do we use `HAVING COUNT(amount) >= 40` instead of putting that condition in `WHERE`?

2. In Challenge 2, why does `WHERE staff_id = 2` come before `GROUP BY customer_id`?

3. What would happen to the Challenge 2 results if `HAVING SUM(amount) > 100` were removed?
