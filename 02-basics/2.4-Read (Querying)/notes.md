# Querying Data — MySQL

## Syntax

```sql
-- Select all columns
SELECT * FROM tablename;

-- Select specific columns
SELECT column1, column2 FROM tablename;

-- Filter rows with a condition
SELECT * FROM tablename WHERE condition;

-- AND — both conditions must be true
SELECT * FROM tablename WHERE condition1 AND condition2;

-- OR — at least one condition must be true
SELECT * FROM tablename WHERE condition1 OR condition2;

-- NOT — exclude rows matching a condition
SELECT * FROM tablename WHERE NOT condition;

-- IN — match against a list of values
SELECT * FROM tablename WHERE column IN ('value1', 'value2');

-- BETWEEN — match a range (inclusive)
SELECT * FROM tablename WHERE column BETWEEN value1 AND value2;

-- IS NULL / IS NOT NULL — check for missing values
SELECT * FROM tablename WHERE column IS NULL;
SELECT * FROM tablename WHERE column IS NOT NULL;

-- LIKE — pattern matching
SELECT * FROM tablename WHERE column LIKE 'pattern';

-- Sort results
SELECT * FROM tablename ORDER BY column ASC;
SELECT * FROM tablename ORDER BY column DESC;

-- Sort by multiple columns
SELECT * FROM tablename ORDER BY column1 ASC, column2 DESC;

-- Limit number of results
SELECT * FROM tablename LIMIT N;

-- Limit with offset (skip first N rows)
SELECT * FROM tablename LIMIT N OFFSET skip;

-- Alias — rename a column in the output
SELECT column AS alias_name FROM tablename;

-- DISTINCT — remove duplicate values
SELECT DISTINCT column FROM tablename;
```

---

## Example

```sql
-- Basic selects
SELECT * FROM users;
SELECT id, name, email FROM users;

-- Filtering
SELECT * FROM users WHERE gender = 'Male';
SELECT * FROM users WHERE id <= 5;
SELECT * FROM users WHERE date_of_birth IS NULL;
SELECT * FROM users WHERE date_of_birth IS NOT NULL;
SELECT * FROM users WHERE date_of_birth >= '2003-02-23';
SELECT * FROM users WHERE date_of_birth BETWEEN '2001-01-01' AND '2005-12-31';
SELECT * FROM users WHERE gender IN ('Male', 'Female');
SELECT * FROM users WHERE gender NOT IN ('Other');

-- AND / OR / NOT
SELECT * FROM users WHERE gender = 'Male' AND salary > 50000;
SELECT * FROM users WHERE gender = 'Male' OR salary > 50000;
SELECT * FROM users WHERE NOT gender = 'Male';

-- LIKE pattern matching
SELECT * FROM users WHERE name LIKE 'a%';       -- starts with 'a'
SELECT * FROM users WHERE name LIKE '%kumar';    -- ends with 'kumar'
SELECT * FROM users WHERE name LIKE '%raj%';     -- contains 'raj'

-- Sorting
SELECT * FROM users ORDER BY name ASC;
SELECT * FROM users ORDER BY salary DESC;
SELECT * FROM users ORDER BY gender ASC, name ASC;

-- Limiting results
SELECT * FROM users LIMIT 5;
SELECT * FROM users LIMIT 5 OFFSET 10;   -- skip first 10, show next 5

-- Aliases
SELECT name AS full_name, email AS contact FROM users;

-- Distinct values
SELECT DISTINCT gender FROM users;
```

---

## Breaking it Down

### `SELECT`
Specifies which columns to retrieve. Use `*` for all columns or list specific ones.

### `WHERE`
Filters rows based on a condition. Only rows where the condition is `TRUE` are returned.

### Comparison Operators

| Operator | Meaning | Example |
|---|---|---|
| `=` | Equal to | `WHERE gender = 'Male'` |
| `!=` or `<>` | Not equal to | `WHERE gender != 'Male'` |
| `>` | Greater than | `WHERE salary > 50000` |
| `<` | Less than | `WHERE age < 30` |
| `>=` | Greater than or equal | `WHERE id >= 5` |
| `<=` | Less than or equal | `WHERE id <= 10` |

### Logical Operators

| Operator | Behaviour |
|---|---|
| `AND` | Both conditions must be true |
| `OR` | At least one condition must be true |
| `NOT` | Inverts the condition |

### `IN`
Checks if a value matches **any value in a list**. Cleaner than writing multiple `OR` conditions.

```sql
-- Instead of this:
WHERE gender = 'Male' OR gender = 'Female'

-- Write this:
WHERE gender IN ('Male', 'Female')
```

### `BETWEEN`
Matches values within a **range, inclusive of both ends**.

```sql
WHERE date_of_birth BETWEEN '2001-01-01' AND '2005-12-31'
```

### `LIKE`
Used for **pattern matching** on text columns.

| Pattern | Matches |
|---|---|
| `'a%'` | Anything starting with `a` |
| `'%a'` | Anything ending with `a` |
| `'%raj%'` | Anything containing `raj` |
| `'_raj'` | Any single character followed by `raj` |

### `IS NULL` / `IS NOT NULL`
Checks for **missing or empty values**. You cannot use `= NULL` — it won't work in MySQL.

```sql
-- Wrong
WHERE date_of_birth = NULL

-- Correct
WHERE date_of_birth IS NULL
```

### `ORDER BY`
Sorts the result set. Default is `ASC` (ascending). Can sort by multiple columns.

### `LIMIT` / `OFFSET`
`LIMIT` caps the number of rows returned. `OFFSET` skips a number of rows — useful for **pagination**.

```sql
-- Page 1 (rows 1–5)
SELECT * FROM users LIMIT 5 OFFSET 0;

-- Page 2 (rows 6–10)
SELECT * FROM users LIMIT 5 OFFSET 5;
```

### `AS` (Alias)
Renames a column **in the output only** — does not change the actual column name in the table.

### `DISTINCT`
Removes duplicate rows from the result. Useful when a column has repeated values.

```sql
SELECT DISTINCT gender FROM users;
-- Returns: Male, Female, Other  (not repeated)
```