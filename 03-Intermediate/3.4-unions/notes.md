# UNION & UNION ALL — MySQL

`UNION` and `UNION ALL` combine the results of **two or more `SELECT` queries** into a single result set. Each `SELECT` must have the **same number of columns** with **compatible datatypes**.

---

## UNION vs UNION ALL

| | `UNION` | `UNION ALL` |
|---|---|---|
| Removes duplicates | ✅ Yes | ❌ No |
| Speed | Slower (checks for duplicates) | Faster |
| Use when | You want unique rows only | You want every row including duplicates |

---

## UNION

Combines results from both queries and **automatically removes duplicate rows**.

```sql
-- Syntax
SELECT column1, column2 FROM table1
UNION
SELECT column1, column2 FROM table2;

-- Example
SELECT name FROM users
UNION
SELECT name FROM admins;
```

**Result:** (if 'Yadnyesh' exists in both tables, it appears only **once**)

| name     |
|----------|
| Yadnyesh |
| Stavan   |
| Hemant   |

---

## UNION ALL

Combines results and **keeps all rows including duplicates**.

```sql
-- Syntax
SELECT column1, column2 FROM table1
UNION ALL
SELECT column1, column2 FROM table2;

-- Example
SELECT name FROM users
UNION ALL
SELECT name FROM admins;
```

**Result:** (if 'Yadnyesh' exists in both tables, it appears **twice**)

| name     |
|----------|
| Yadnyesh |
| Stavan   |
| Hemant   |
| Yadnyesh |

---

## Adding a Label Column

A common pattern — add a static column to identify **which table each row came from**.

```sql
SELECT name, 'User'  AS role FROM users
UNION ALL
SELECT name, 'Admin' AS role FROM admins;
```

**Result:**

| name     | role  |
|----------|-------|
| Yadnyesh | User  |
| Stavan   | User  |
| Yadnyesh | Admin |
| Hemant   | Admin |

---

## Rules

| Rule | Detail |
|---|---|
| Same number of columns | Both `SELECT` statements must select the same number of columns |
| Compatible datatypes | Column datatypes must be compatible (e.g. both `VARCHAR`) |
| Column names | Final column names come from the **first** `SELECT` statement |
| `ORDER BY` | Can only be used **once**, at the very end of the full query |

---

## Using ORDER BY with UNION

```sql
SELECT name, 'User' AS role FROM users
UNION ALL
SELECT name, 'Admin' AS role FROM admins
ORDER BY name ASC;
```

> `ORDER BY` applies to the **entire combined result**, not individual queries.

---

## Using WHERE with UNION

Each individual query can have its own `WHERE` clause.

```sql
SELECT name, 'User' AS role FROM users WHERE gender = 'Male'
UNION
SELECT name, 'Admin' AS role FROM admins WHERE gender = 'Male';
```

---

## Practical Use Cases

| Scenario | Which to Use |
|---|---|
| Merge two tables, no duplicates needed | `UNION` |
| Merge two tables, keep all records | `UNION ALL` |
| Label rows by source table | `UNION ALL` with a static column |
| Combine active and archived records | `UNION ALL` |
| Find all unique values across two tables | `UNION` |