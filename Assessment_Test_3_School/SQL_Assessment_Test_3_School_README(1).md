# SQL Assessment Test 3 — School Database

This assessment was a hands-on exercise in creating a PostgreSQL database, designing tables, applying constraints, and inserting data.

## Assessment Goal

Create a new database called `School` containing two tables:

- `students`
- `teachers`

### Students

- `student_id`
- `first_name`
- `last_name`
- `homeroom_number`
- `phone`
- `email`
- `graduation_year`

### Teachers

- `teacher_id`
- `first_name`
- `last_name`
- `homeroom_number`
- `department`
- `email`
- `phone`

### Required Constraints

1. Student phone numbers must be provided because they are needed for emergencies.
2. The IDs must be primary keys.
3. Phone numbers and emails must be unique to the individual.

---

# My Step-by-Step Work

## 1. Students Table

### Step 1 — What is the table for?

> The `students` table is for storing information about students. One row represents information about one student.

### Step 2 — Columns and data types

```text
student_id       → BIGSERIAL
first_name       → VARCHAR(50)
last_name        → VARCHAR(50)
homeroom_number  → INTEGER
phone            → VARCHAR(15)
email            → VARCHAR(250)
graduation_year  → SMALLINT
```

### Step 3 — Primary key

`student_id` is the primary key because each student needs a unique identifier.

### Step 4 — Foreign keys

No foreign key was needed because the `students` table does not need to reference another table.

### Step 5 — Constraints

```text
student_id       → PRIMARY KEY
first_name       → NOT NULL
last_name        → NOT NULL
homeroom_number  → NOT NULL
phone            → NOT NULL, UNIQUE
email            → UNIQUE
graduation_year  → NOT NULL
```

I deliberately did not make `email` `NOT NULL` because Mark Watney does not have an email address.

### Step 6 — Create the table

```sql
CREATE TABLE students(
   student_id BIGSERIAL PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   homeroom_number INTEGER NOT NULL,
   phone VARCHAR(15) NOT NULL UNIQUE,
   email VARCHAR(250) UNIQUE,
   graduation_year SMALLINT NOT NULL
);
```

### Step 7 — Verify the table

```sql
SELECT * FROM students;
```

The table was created successfully and the columns and constraints were checked in pgAdmin.

---

# 2. Teachers Table

### Step 1 — What is the table for?

> The `teachers` table is for storing information about teachers. One row represents one teacher.

### Step 2 — Columns and data types

```text
teacher_id       → BIGSERIAL
first_name       → VARCHAR(50)
last_name        → VARCHAR(50)
homeroom_number  → INTEGER
department       → VARCHAR(50)
email            → VARCHAR(250)
phone            → VARCHAR(15)
```

### Step 3 — Primary key

`teacher_id` is the primary key because each teacher needs a unique identifier.

### Step 4 — Foreign keys

No foreign key was needed because the `teachers` table does not need to reference another table.

### Step 5 — Constraints

```text
teacher_id       → PRIMARY KEY
first_name       → NOT NULL
last_name        → NOT NULL
homeroom_number  → NOT NULL
department       → NOT NULL
phone            → NOT NULL, UNIQUE
email            → UNIQUE
```

### Step 6 — Create the table

```sql
CREATE TABLE teachers(
   teacher_id BIGSERIAL PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   homeroom_number INTEGER NOT NULL,
   department VARCHAR(50) NOT NULL,
   phone VARCHAR(15) NOT NULL UNIQUE,
   email VARCHAR(250) UNIQUE
);
```

### Step 7 — Verify the table

```sql
SELECT * FROM teachers;
```

The table was created successfully and the columns and constraints were checked in pgAdmin.

---

# 3. Insert Mark Watney

The assessment required:

```text
student_id       → 1
first_name       → Mark
last_name        → Watney
homeroom_number  → 5
phone            → 777-555-1234
email            → no email
graduation_year  → 2035
```

My final `INSERT` query:

```sql
INSERT INTO students (
    student_id,
    first_name,
    last_name,
    phone,
    email,
    graduation_year,
    homeroom_number
)
VALUES (
    1,
    'Mark',
    'Watney',
    '777-555-1234',
    NULL,
    2035,
    5
);
```

I verified the inserted data with:

```sql
SELECT * FROM students;
```

The insert was successful.

### What I learned

I initially forgot that the `email` column still needed a value in the `VALUES` list, even though Mark did not have an email.

I learned that SQL uses:

```sql
NULL
```

to represent a missing value.

I also learned that text values need quotes, while numeric values do not:

```sql
'Mark'
'Watney'
'777-555-1234'

1
2035
5
```

---

# 4. Insert Jonas Salk

The assessment required:

```text
teacher_id       → 1
first_name       → Jonas
last_name        → Salk
homeroom_number  → 5
department       → Biology
email            → jsalk@school.org
phone            → 777-555-4321
```

My final `INSERT` query:

```sql
INSERT INTO teachers (
    teacher_id,
    first_name,
    last_name,
    homeroom_number,
    department,
    email,
    phone
)
VALUES (
    1,
    'Jonas',
    'Salk',
    5,
    'Biology',
    'jsalk@school.org',
    '777-555-4321'
);
```

I verified the inserted data with:

```sql
SELECT * FROM teachers;
```

The insert was successful.

---

# Complete Assessment SQL

```sql
-- Create the students table
CREATE TABLE students(
   student_id BIGSERIAL PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   homeroom_number INTEGER NOT NULL,
   phone VARCHAR(15) NOT NULL UNIQUE,
   email VARCHAR(250) UNIQUE,
   graduation_year SMALLINT NOT NULL
);

-- Check the students table
SELECT * FROM students;


-- Create the teachers table
CREATE TABLE teachers(
   teacher_id BIGSERIAL PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   homeroom_number INTEGER NOT NULL,
   department VARCHAR(50) NOT NULL,
   phone VARCHAR(15) NOT NULL UNIQUE,
   email VARCHAR(250) UNIQUE
);

-- Check the teachers table
SELECT * FROM teachers;


-- Insert Mark Watney
INSERT INTO students (
    student_id,
    first_name,
    last_name,
    phone,
    email,
    graduation_year,
    homeroom_number
)
VALUES (
    1,
    'Mark',
    'Watney',
    '777-555-1234',
    NULL,
    2035,
    5
);

-- Verify Mark's record
SELECT * FROM students;


-- Insert Jonas Salk
INSERT INTO teachers (
    teacher_id,
    first_name,
    last_name,
    homeroom_number,
    department,
    email,
    phone
)
VALUES (
    1,
    'Jonas',
    'Salk',
    5,
    'Biology',
    'jsalk@school.org',
    '777-555-4321'
);

-- Verify Jonas's record
SELECT * FROM teachers;
```

---

# Key SQL Concepts Practised

- `CREATE TABLE`
- PostgreSQL data types
- `BIGSERIAL`
- `PRIMARY KEY`
- `NOT NULL`
- `UNIQUE`
- `NULL`
- `INSERT INTO`
- `VALUES`
- `SELECT *`
- Verifying tables after creating them
- Verifying rows after inserting them
- Thinking about constraints before inserting data

## Important Lessons

### Primary keys

A primary key uniquely identifies a row.

```sql
student_id BIGSERIAL PRIMARY KEY
```

### `NOT NULL`

`NOT NULL` means the column must have a value.

```sql
phone VARCHAR(15) NOT NULL
```

### `UNIQUE`

`UNIQUE` prevents duplicate values.

```sql
email VARCHAR(250) UNIQUE
```

`UNIQUE` does not automatically mean a value is required. That is why an email column can be `UNIQUE` without being `NOT NULL`.

### Phone numbers are text

Phone numbers are stored as `VARCHAR` because they are labels, not values used for arithmetic.

```sql
phone VARCHAR(15)
```

### `NULL`

`NULL` represents a missing value.

Mark does not have an email, so his email value is:

```sql
NULL
```

---

# Final Result

```text
School
├── students
│   └── Mark Watney
│
└── teachers
    └── Jonas Salk
```

The assessment was completed by designing the tables, choosing data types and constraints, creating the tables, inserting the required records, and verifying the results in pgAdmin.

## What I Want to Remember

The biggest lesson from this assessment is that creating a database is not just about remembering SQL syntax.

The process is:

**Plan → Choose data types → Identify keys → Decide constraints → Create → Insert → Verify**

The syntax becomes much easier when I understand what I am trying to represent first.
