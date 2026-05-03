# Primary Key — MySQL

A **Primary Key** is a column (or combination of columns) that **uniquely identifies every row** in a table. It is the most fundamental constraint in relational databases.

---

## Rules

| Rule | Detail |
|---|---|
| Must be unique | No two rows can have the same primary key value |
| Cannot be NULL | Every row must have a value |
| One per table | A table can only have one primary key |
| Can be composite | A primary key can span multiple columns |

---

## Syntax

```sql
-- Single column primary key (on CREATE)
CREATE TABLE users (
    id INT PRIMARY KEY
);

-- With AUTO_INCREMENT
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY
);

-- Composite primary key (multiple columns)
CREATE TABLE enrollments (
    student_id INT,
    course_id  INT,
    PRIMARY KEY (student_id, course_id)
);

-- Add primary key via ALTER
ALTER TABLE users ADD PRIMARY KEY (id);

-- Drop primary key
ALTER TABLE users DROP PRIMARY KEY;
```

---

## Example

```sql
CREATE TABLE users (
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO users VALUES (1, 'Yadnyesh', 'yadnyesh@gmail.com');
INSERT INTO users VALUES (1, 'Stavan',   'stavan@gmail.com');   -- ❌ Error: duplicate id
INSERT INTO users VALUES (NULL, 'Hemant', 'hemant@gmail.com');  -- ❌ Error: id cannot be NULL
```

---

## PRIMARY KEY vs UNIQUE

| | `PRIMARY KEY` | `UNIQUE` |
|---|---|---|
| Allows NULL | ❌ | ✅ (one NULL allowed) |
| Allows duplicates | ❌ | ❌ |
| One per table | ✅ | ❌ (can have many) |
| Identifies each row | ✅ | ❌ |
| Creates an index | ✅ (clustered) | ✅ (non-clustered) |

> Use `PRIMARY KEY` to identify rows. Use `UNIQUE` to just prevent duplicates (e.g. email, phone number).

---

## Composite Primary Key

When no single column is unique on its own, you can combine two or more columns to form the primary key.

```sql
CREATE TABLE enrollments (
    student_id INT,
    course_id  INT,
    PRIMARY KEY (student_id, course_id)
);
```

> A student can appear multiple times (different courses), and a course can appear multiple times (different students) — but the **combination** must be unique.

---

## AUTO_INCREMENT with PRIMARY KEY

`AUTO_INCREMENT` is almost always paired with `PRIMARY KEY` so you never have to manually assign an ID.

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO users (name) VALUES ('Yadnyesh');  -- id = 1 assigned automatically
INSERT INTO users (name) VALUES ('Stavan');    -- id = 2 assigned automatically
```

```sql
-- Change the starting value
ALTER TABLE users AUTO_INCREMENT = 100;  -- next id will be 100
```

---

## Can You Drop a PRIMARY KEY?

Yes — but the column must not have `AUTO_INCREMENT` on it first. Remove `AUTO_INCREMENT` before dropping.

```sql
-- Step 1: Remove AUTO_INCREMENT first
ALTER TABLE users MODIFY COLUMN id INT;

-- Step 2: Drop the primary key
ALTER TABLE users DROP PRIMARY KEY;
```

> ⚠️ Dropping a primary key is rarely a good idea in production — foreign keys in other tables may depend on it.

---

## Key Takeaways

- Every table should have a primary key
- Use `INT AUTO_INCREMENT` as default — simple, fast, and reliable
- Use composite keys only when a single column can't be unique on its own
- `PRIMARY KEY` = `NOT NULL` + `UNIQUE` combined, with the added role of row identification