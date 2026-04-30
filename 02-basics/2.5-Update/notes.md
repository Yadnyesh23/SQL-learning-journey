# UPDATE — MySQL

## Syntax

```sql
-- Update a specific column in a specific row
UPDATE tablename SET column_name = new_value WHERE condition;

-- Update multiple columns at once
UPDATE tablename SET column1 = value1, column2 = value2 WHERE condition;

-- Update all rows in a table (no WHERE — use with caution)
UPDATE tablename SET column_name = new_value;

-- Update using a condition on another column
UPDATE tablename SET column_name = new_value WHERE other_column operator value;

-- Update using a subquery
UPDATE tablename SET column_name = (SELECT value FROM other_table WHERE condition)
WHERE condition;
```

---

## Example

```sql
-- Update salary of a specific user
UPDATE users SET salary = 900000 WHERE id = 1;

-- Update multiple columns at once
UPDATE users SET salary = 750000, gender = 'Other' WHERE id = 3;

-- Update all rows (give everyone a default salary)
UPDATE users SET salary = 50000;

-- Update based on a condition
UPDATE users SET salary = 120000 WHERE salary < 50000;

-- Update using a subquery
UPDATE users SET salary = (SELECT avg_salary FROM salary_bands WHERE level = 'senior')
WHERE id = 5;
```

---

## Breaking it Down

### `UPDATE tablename`
Specifies **which table** to modify. No data is inserted or deleted — only existing values are changed.

### `SET`
Defines **which columns to change** and what their new values should be. Multiple columns are separated by commas.

```sql
SET salary = 900000
SET salary = 900000, name = 'Rahul'
```

### `WHERE`
Specifies **which rows to update**. This is critical — without `WHERE`, every row in the table gets updated.

> ⚠️ **Always use `WHERE` with `UPDATE`** unless you intentionally want to update every row.

---

## Key Rules

| Rule | Detail |
|---|---|
| Always use `WHERE` | Without it, all rows are updated |
| Multiple columns | Separate each `column = value` pair with a comma in `SET` |
| String values | Must be wrapped in single quotes `'value'` |
| `WHERE` uses same operators as `SELECT` | `=`, `!=`, `>`, `<`, `IN`, `BETWEEN`, `LIKE`, etc. |
| Subqueries in `SET` | The subquery must return exactly one value |