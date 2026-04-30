# DELETE & DROP — MySQL

## Syntax

```sql
-- Delete all rows (table structure remains)
DELETE FROM tablename;

-- Delete rows matching a condition
DELETE FROM tablename WHERE condition;

-- Delete using multiple conditions
DELETE FROM tablename WHERE condition1 AND condition2;

-- Delete rows using a subquery
DELETE FROM tablename WHERE column IN (SELECT column FROM other_table WHERE condition);

-- Drop a table completely (structure + data)
DROP TABLE tablename;

-- Drop only if the table exists (no error if it doesn't)
DROP TABLE IF EXISTS tablename;

-- Remove all rows but keep the table structure (faster than DELETE)
TRUNCATE TABLE tablename;
```

---

## Example

```sql
-- Delete all rows from users
DELETE FROM users;

-- Delete a specific user
DELETE FROM users WHERE id = 3;

-- Delete users with low salary
DELETE FROM users WHERE salary < 50000;

-- Delete using multiple conditions
DELETE FROM users WHERE salary < 50000 AND gender = 'Male';

-- Delete using a subquery
DELETE FROM users WHERE id IN (SELECT user_id FROM banned_users);

-- Drop the users table entirely
DROP TABLE users;

-- Drop only if it exists
DROP TABLE IF EXISTS users;

-- Clear all rows but keep the table
TRUNCATE TABLE users;
```

---

## Breaking it Down

### `DELETE FROM`
Removes **rows** from a table. The table itself and its structure remain intact. Can be rolled back if inside a transaction.

### `WHERE`
Specifies which rows to delete. Without it, **all rows are deleted**.

> ⚠️ **Always use `WHERE` with `DELETE`** unless you intentionally want to wipe every row.

### `DROP TABLE`
Completely removes the **table and all its data** from the database — structure, indexes, constraints, everything. This cannot be undone.

### `DROP TABLE IF EXISTS`
Same as `DROP TABLE` but **won't throw an error** if the table doesn't exist. Safer to use in scripts.

### `TRUNCATE TABLE`
Deletes **all rows instantly** but keeps the table structure. Faster than `DELETE FROM tablename` on large tables because it doesn't log each row deletion.

---

## DELETE vs TRUNCATE vs DROP

| | `DELETE` | `TRUNCATE` | `DROP` |
|---|---|---|---|
| Removes rows | ✅ | ✅ | ✅ |
| Keeps table structure | ✅ | ✅ | ❌ |
| Can use `WHERE` | ✅ | ❌ | ❌ |
| Can be rolled back | ✅ | ❌ | ❌ |
| Resets AUTO_INCREMENT | ❌ | ✅ | — |
| Speed on large tables | Slow | Fast | Fast |

---

## Key Rules

| Rule | Detail |
|---|---|
| Always use `WHERE` | Without it, `DELETE` removes every row |
| `DROP` is permanent | There is no undo — double check before running |
| `TRUNCATE` vs `DELETE` | Use `TRUNCATE` to clear a table fast; use `DELETE` when you need `WHERE` or rollback |
| `IF EXISTS` | Always use with `DROP` in scripts to avoid errors |