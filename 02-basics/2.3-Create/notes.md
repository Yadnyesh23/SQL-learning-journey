# INSERT — MySQL

## Syntax

```sql
-- Insert a single row (all columns, in order)
INSERT INTO tablename VALUES
('value1', 'value2', ...);

-- Insert multiple rows at once
INSERT INTO tablename VALUES
('value1', 'value2', ...),
('value1', 'value2', ...),
('value1', 'value2', ...);

-- Insert into specific columns only
INSERT INTO tablename (column1, column2) VALUES
('value1', 'value2');

-- Insert using SET (alternative syntax)
INSERT INTO tablename SET
    column1 = 'value1',
    column2 = 'value2';

-- Insert result of a SELECT query (copy rows from another table)
INSERT INTO tablename (column1, column2)
SELECT column1, column2 FROM other_table WHERE condition;
```

---

## Example

```sql
-- Single row insert
INSERT INTO users VALUES
(1, 'yadnyesh@gmail.com', 'yadnyesh', 'Male', '2006-02-23', DEFAULT);

-- Multiple rows insert
INSERT INTO users VALUES
(1, 'yadnyesh@gmail.com', 'yadnyesh', 'Male',   '2006-02-23', DEFAULT),
(2, 'stavan@gmail.com',   'stavan',   'Male',   '2012-09-24', DEFAULT),
(3, 'hemant@gmail.com',   'hemant',   'Male',   '1978-06-10', DEFAULT),
(4, 'sapna@gmail.com',    'sapna',    'Female', '1981-10-17', DEFAULT);

-- Specific columns only (other columns use DEFAULT or NULL)
INSERT INTO users (name, email) VALUES
('sapna', 'sapna@gmail.com');

-- Insert using SET syntax
INSERT INTO users SET
    name   = 'rahul',
    email  = 'rahul@gmail.com',
    gender = 'Male';

-- Copy rows from another table
INSERT INTO archived_users (name, email)
SELECT name, email FROM users WHERE created_at < '2023-01-01';
```

---

## Breaking it Down

### `INSERT INTO tablename VALUES`
Inserts a **full row** — values must be provided in the **exact same order** as the columns were defined in `CREATE TABLE`. Skipping a column is not allowed; use `DEFAULT` or `NULL` as a placeholder.

### `INSERT INTO tablename (col1, col2) VALUES`
Inserts values into **specific columns only**. Any column not listed will use its `DEFAULT` value or `NULL` (if allowed). This is the **recommended approach** — safer and unaffected by column reordering.

### `DEFAULT`
Tells MySQL to use the **default value** defined for that column. For `created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP`, this automatically fills in the current date and time.

### `INSERT ... SET`
An alternative syntax that uses `column = value` pairs instead of a values list. More readable for single-row inserts, especially when a table has many columns.

### `INSERT INTO ... SELECT`
Copies rows from one table into another. Useful for archiving data, creating backups, or populating a new table from an existing one.

---

## Key Rules

| Rule | Detail |
|---|---|
| Value order matters | When not specifying columns, values must match the exact column order |
| Always specify columns | Avoids bugs if the table structure changes later |
| `DEFAULT` keyword | Use it to trigger a column's default value explicitly |
| String values | Must be wrapped in single quotes `'value'` |
| `AUTO_INCREMENT` columns | Pass `DEFAULT` or `NULL` — MySQL handles the number automatically |