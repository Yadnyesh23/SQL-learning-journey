# Indexes — MySQL

An **Index** is a data structure that MySQL creates separately from the table to allow **faster data retrieval**. Think of it like the index at the back of a book — instead of reading every page, you jump straight to what you need.

> Without an index, MySQL scans **every row** in the table to find a match (full table scan). With an index, it jumps directly to the relevant rows.

---

## When to Use Indexes

| Use an Index | Avoid an Index |
|---|---|
| Columns used frequently in `WHERE` | Columns rarely used in queries |
| Columns used in `JOIN` conditions | Small tables (full scan is fast enough) |
| Columns used in `ORDER BY` | Columns with very few unique values (e.g. `gender`) |
| Columns used in `GROUP BY` | Tables with heavy `INSERT`/`UPDATE`/`DELETE` |

---

## Important Trade-offs

| | Detail |
|---|---|
| ✅ Faster `SELECT` queries | Especially on large tables |
| ❌ Extra disk space | Index is stored separately alongside the table |
| ❌ Slower writes | Every `INSERT`, `UPDATE`, `DELETE` must also update the index |

> Index only the columns you actually filter, sort, or join on — not every column.

---

## Syntax

```sql
-- View all indexes on a table
SHOW INDEXES FROM tablename;

-- Create a single column index
CREATE INDEX index_name ON tablename (column_name);

-- Create a unique index (no duplicate values allowed)
CREATE UNIQUE INDEX index_name ON tablename (column_name);

-- Create a composite index (multiple columns)
CREATE INDEX index_name ON tablename (column1, column2);

-- Add an index via ALTER TABLE
ALTER TABLE tablename ADD INDEX index_name (column_name);

-- Drop an index
DROP INDEX index_name ON tablename;

-- Drop via ALTER TABLE
ALTER TABLE tablename DROP INDEX index_name;
```

---

## Example

```sql
-- View indexes on the users table
SHOW INDEXES FROM users;

-- Create an index on the email column
CREATE INDEX idx_email ON users (email);

-- Create an index on the name column
CREATE INDEX idx_name ON users (name);

-- Create a unique index on email (prevents duplicates too)
CREATE UNIQUE INDEX idx_unique_email ON users (email);

-- Create a composite index (for queries filtering by both city and state)
CREATE INDEX idx_city_state ON addresses (city, state);

-- Add index via ALTER TABLE
ALTER TABLE users ADD INDEX idx_salary (salary);

-- Drop an index
DROP INDEX idx_email ON users;
```

---

## Types of Indexes

| Type | Description | Created Automatically |
|---|---|---|
| `PRIMARY KEY` | Unique, not null — one per table | ✅ Yes (on primary key) |
| `UNIQUE` | No duplicate values | ✅ Yes (on unique columns) |
| `INDEX` (Regular) | Speeds up lookups — duplicates allowed | ❌ Manual |
| `FULLTEXT` | For searching large text fields | ❌ Manual |
| `COMPOSITE` | Index on multiple columns combined | ❌ Manual |

---

## Breaking it Down

### `SHOW INDEXES FROM tablename`
Lists all indexes on a table — name, column, type, and whether it's unique.

### `CREATE INDEX`
Creates a regular index on a column. Allows duplicate values — just speeds up lookups.

### `CREATE UNIQUE INDEX`
Creates an index that also **enforces uniqueness** — similar to adding a `UNIQUE` constraint.

### Composite Index
An index on **multiple columns**. Most effective when your `WHERE` clause filters on both columns together.

```sql
CREATE INDEX idx_city_state ON addresses (city, state);

-- This query benefits from the composite index
SELECT * FROM addresses WHERE city = 'Pune' AND state = 'Maharashtra';

-- This also benefits (uses the first column)
SELECT * FROM addresses WHERE city = 'Pune';

-- This does NOT benefit (skips the first column)
SELECT * FROM addresses WHERE state = 'Maharashtra';
```

> Always put the **most selective column first** in a composite index.

### `DROP INDEX`
Removes an index from the table. The table data is unaffected.

---

## Key Rules

| Rule | Detail |
|---|---|
| Primary keys are auto-indexed | MySQL automatically creates an index on `PRIMARY KEY` |
| `UNIQUE` columns are auto-indexed | No need to manually create one |
| Composite index column order matters | Filter on the leftmost column for the index to kick in |
| Too many indexes hurt performance | Each index slows down `INSERT`/`UPDATE`/`DELETE` |
| Index names must be unique per table | Two indexes on the same table can't share a name |