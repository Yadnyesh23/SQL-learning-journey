# Views — MySQL

A **View** is a virtual table based on the result of a `SELECT` query. It does not store data itself — it simply saves the query. Whenever you query a view, MySQL runs the underlying query and returns the latest data.

> If data in the base table is updated, the view reflects those changes automatically.

---

## Why Use Views?

| Reason | Detail |
|---|---|
| **Simplicity** | Save complex queries and reuse them like a table |
| **Security** | Expose only specific columns/rows — hide sensitive data like salary or passwords |
| **Consistency** | One definition used everywhere — no risk of rewriting the query differently each time |
| **Readability** | Give meaningful names to complex joins or filters |
| **Abstraction** | Hide the underlying table structure from the end user |

---

## Syntax

```sql
-- Create a view
CREATE VIEW viewname AS
SELECT query...;

-- Replace an existing view (create or overwrite)
CREATE OR REPLACE VIEW viewname AS
SELECT query...;

-- Query a view (same as querying a table)
SELECT * FROM viewname;

-- Query with filters
SELECT * FROM viewname WHERE condition;

-- Update a view's definition
ALTER VIEW viewname AS
SELECT query...;

-- Drop a view
DROP VIEW viewname;

-- Drop only if it exists (no error if it doesn't)
DROP VIEW IF EXISTS viewname;
```

---

## Example

```sql
-- Create a view for high-salary users
CREATE VIEW rich_users AS
SELECT id, name, salary FROM users WHERE salary > 70000;

-- Query the view
SELECT * FROM rich_users;

-- Query the view with additional filters
SELECT name FROM rich_users WHERE salary > 90000;

-- Replace the view with an updated definition
CREATE OR REPLACE VIEW rich_users AS
SELECT id, name, email, salary FROM users WHERE salary > 80000;

-- Update view definition
ALTER VIEW rich_users AS
SELECT id, name, salary FROM users WHERE salary > 100000;

-- Drop the view
DROP VIEW IF EXISTS rich_users;
```

---

## Breaking it Down

### `CREATE VIEW viewname AS`
Saves the `SELECT` query under a name. The view can then be queried just like a regular table.

### `CREATE OR REPLACE VIEW`
Creates the view if it doesn't exist, or **silently overwrites** it if it does. Safer than `DROP` + `CREATE`.

### `ALTER VIEW`
Updates the definition of an existing view without dropping it.

### `DROP VIEW IF EXISTS`
Removes the view. Using `IF EXISTS` prevents an error if the view doesn't exist — good for scripts.

---

## Views vs Tables

| | Table | View |
|---|---|---|
| Stores data | ✅ Yes | ❌ No (virtual) |
| Auto-updates with base table | ❌ No | ✅ Yes |
| Can be queried | ✅ Yes | ✅ Yes |
| Can be indexed | ✅ Yes | ❌ No |
| Can be used in joins | ✅ Yes | ✅ Yes |

---

## Using Views in JOINs

Views can be used just like tables in joins.

```sql
-- View of users with salary > 70000
CREATE VIEW rich_users AS
SELECT id, name, salary FROM users WHERE salary > 70000;

-- Join the view with addresses
SELECT r.name, r.salary, a.city
FROM rich_users r
INNER JOIN addresses a ON r.id = a.user_id;
```

---

## Key Rules

| Rule | Detail |
|---|---|
| No data stored | Views are just saved queries — no physical data |
| Reflects live data | Any change in the base table is immediately visible in the view |
| Cannot index a view | Unlike tables, views can't have indexes |
| One query per view | A view is based on a single `SELECT` statement |
| Dropping a view | Does not affect the base table or its data |