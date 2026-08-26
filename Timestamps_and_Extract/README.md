# SQL Date & Time Challenges

These challenges helped me practise working with dates in PostgreSQL using the DVD Rental database.

## Challenge 1 — Months During Which Payments Occurred

### Problem

During which months did payments occur?

The answer needed to return the **full month name**.

### My Approach

I identified `payment_date` in the `payment` table as the information I needed.

I used:
- `TO_CHAR()` to format the date as a month name.
- `DISTINCT` to remove repeated month names.

### Query

```sql
SELECT DISTINCT (TO_CHAR(payment_date, 'MONTH'))
FROM payment;
```

### What I Learned

- `TO_CHAR()` can format a date into readable text.
- `DISTINCT` removes duplicate values.
- The `MONTH` format can be blank-padded, meaning extra spaces may be added to shorter month names.

---

## Challenge 2 — Payments on a Monday

### Problem

How many payments occurred on a Monday?

### My Approach

I used `payment_date` from the `payment` table.

The course had not shown exactly how to find the day of the week, so I used the PostgreSQL documentation to find `EXTRACT(DOW ...)`.

`DOW` uses this numbering:

```text
Sunday    → 0
Monday    → 1
Tuesday   → 2
Wednesday → 3
Thursday  → 4
Friday    → 5
Saturday  → 6
```

I then:
1. Used `EXTRACT(DOW FROM payment_date)` to get the day number.
2. Used `WHERE` to keep only Monday payments (`1`).
3. Used `COUNT(*)` to count those payments.

### Query

```sql
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1;
```

### What I Learned

- `EXTRACT()` can pull a specific part of a date.
- `DOW` means day of the week.
- PostgreSQL's `DOW` numbering starts with Sunday as `0`.
- `WHERE` filters rows before they are counted.
- `COUNT(*)` counts the rows that remain after filtering.

---

## My Problem-Solving Process

I used my step-by-step SQL method:

```text
1. WHAT?
   → What does the question want back?

2. WHERE?
   → Where is the information stored?
   → Do I need one table or multiple tables?

3. CONDITIONS?
   → What must be true for a row to qualify?

4. WHAT TOOL?
   → What SQL function or clause can perform the task?
```

For the Monday challenge, I also practised using documentation when I knew what I wanted but did not know the exact SQL tool.

---

## Key Takeaways

- `TO_CHAR()` → formats dates as text.
- `DISTINCT` → removes duplicate results.
- `EXTRACT()` → extracts a specific part of a date/time value.
- `DOW` → returns the day of the week as a number.
- `WHERE` → filters rows.
- `COUNT(*)` → counts rows.
- PostgreSQL `DOW` uses `0` for Sunday and `1` for Monday.
- Documentation is useful when I understand the problem but don't know the exact SQL syntax yet.

## SQL Concepts Used

```text
SELECT
DISTINCT
TO_CHAR()
EXTRACT()
WHERE
COUNT()
```
