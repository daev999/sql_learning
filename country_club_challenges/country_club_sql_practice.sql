-- SQL Practice: Country Club Database
-- Covers SELECT, WHERE, AND, LIKE, IN, date filtering, DISTINCT,
-- ORDER BY, LIMIT, and aggregate functions.

-- 1. View all facilities.
-- Useful for inspecting the table and its columns before filtering.
SELECT * FROM cd.facilities;

-- 2. Find facilities that charge a fee to members.
-- membercost > 0 means the facility is not free for members.
SELECT name
FROM cd.facilities
WHERE membercost > 0;

-- 3. Find facilities where the member fee is less than 1/50
-- of the monthly maintenance cost.
-- Return the facility ID, name, member cost, and monthly maintenance.
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
  AND membercost < monthlymaintenance * 1/50;

-- 4. Find facilities whose name contains 'Tennis'.
-- % allows any characters to appear before or after 'Tennis'.
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- 5. Retrieve facilities with IDs 1 and 5.
-- IN checks for multiple specific values without using OR.
SELECT *
FROM cd.facilities
WHERE facid IN (1, 5);

-- 6. Find members who joined after 1 September 2012.
-- joindate is a date/time value, so it can be compared using >.
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate > '2012-09-01';

-- 7. Produce the first 10 unique surnames in alphabetical order.
-- DISTINCT removes duplicates, ORDER BY sorts the names,
-- and LIMIT 10 returns only the first 10 results.
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

-- 8. Find the signup date/time of the most recently joined member.
-- MAX() returns the latest value from the joindate column.
SELECT MAX(joindate)
FROM cd.members;
