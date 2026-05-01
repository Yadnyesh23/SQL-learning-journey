# SQL Functions — MySQL

SQL functions help you analyze, transform, and summarize data in your tables.

---

## Categories

### Aggregate Functions
Operate on a set of rows and return a single value.

```sql
-- Count all rows
SELECT COUNT(*) FROM users;

-- Count with a condition
SELECT COUNT(*) FROM users WHERE gender = 'Male';

-- Min and max
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM users;

-- Sum
SELECT SUM(salary) AS total_salary FROM users;

-- Average
SELECT AVG(salary) AS avg_salary FROM users;

-- Group by a column
SELECT gender, AVG(salary) AS avg_salary, SUM(salary) AS total_salary
FROM users
GROUP BY gender;
```

---

### String Functions
Operate on text values.

```sql
-- Length of a string
SELECT name, LENGTH(name) AS name_length FROM users;

-- Convert to lowercase
SELECT LOWER(name) FROM users;

-- Concatenate strings
SELECT name, CONCAT(LOWER(name), '123') AS username FROM users;
```

---

### Date Functions
Extract or calculate date-related values.

```sql
-- Extract parts of a date
SELECT name, id, date_of_birth,
  MONTH(date_of_birth) AS month,
  DAY(date_of_birth)   AS day,
  YEAR(date_of_birth)  AS year
FROM users;

-- Days between two dates
SELECT name, id, DATEDIFF(CURDATE(), date_of_birth) AS days_old FROM users;
```

---

### Math Functions
Perform numeric operations.

```sql
-- Round, floor, and ceiling
SELECT salary,
  ROUND(salary) AS rounded,
  FLOOR(salary) AS floored,
  CEIL(salary)  AS ceiled
FROM users;
```

---

### Conditional Functions
Return values based on a condition.

```sql
-- IF condition
SELECT name, gender, IF(gender = 'Female', 'Yes', 'No') AS is_female FROM users;
```

---

## Quick Reference

| Function | Category | Description |
|---|---|---|
| `COUNT()` | Aggregate | Number of rows |
| `MIN()` / `MAX()` | Aggregate | Smallest / largest value |
| `SUM()` | Aggregate | Total of a column |
| `AVG()` | Aggregate | Mean of a column |
| `LENGTH()` | String | Character count |
| `LOWER()` | String | Convert to lowercase |
| `CONCAT()` | String | Join strings together |
| `MONTH()` / `DAY()` / `YEAR()` | Date | Extract date parts |
| `DATEDIFF()` | Date | Days between two dates |
| `CURDATE()` | Date | Today's date |
| `ROUND()` / `FLOOR()` / `CEIL()` | Math | Numeric rounding |
| `IF()` | Conditional | Inline if/else |