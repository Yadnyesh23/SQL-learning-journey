# Joins — MySQL

A **JOIN** combines rows from two or more tables based on a related column between them. Joins are essential for querying data spread across multiple tables.

---

## Types of Joins

| Join Type | Returns |
|---|---|
| `INNER JOIN` | Only rows with a match in **both** tables |
| `LEFT JOIN` | All rows from the **left** table + matched rows from right |
| `RIGHT JOIN` | All rows from the **right** table + matched rows from left |
| `CROSS JOIN` | Every combination of rows from both tables |
| `SELF JOIN` | A table joined with **itself** |

---

## Sample Tables Used in Examples

**users**
| id | name    |
|----|---------|
| 1  | Yadnyesh |
| 2  | Stavan  |
| 3  | Hemant  |

**addresses**
| address_id | user_id | city    |
|------------|---------|---------|
| 1          | 1       | Pune    |
| 2          | 2       | Mumbai  |

> User `3` (Hemant) has no address — this is what makes the join type matter.

---

## INNER JOIN

Returns **only rows that have a match in both tables**. Rows with no match on either side are excluded.

```sql
-- Syntax
SELECT table1.column1, table2.column2
FROM table1
INNER JOIN table2 ON table1.id = table2.id;

-- Example
SELECT users.name, addresses.city
FROM users
INNER JOIN addresses ON users.id = addresses.user_id;
```

**Result:**
| name     | city   |
|----------|--------|
| Yadnyesh | Pune   |
| Stavan   | Mumbai |

> Hemant is excluded because he has no matching address.

---

## LEFT JOIN

Returns **all rows from the left table** and the matched rows from the right table. If there is no match, right table columns return `NULL`.

```sql
-- Syntax
SELECT table1.column1, table2.column2
FROM table1
LEFT JOIN table2 ON table1.id = table2.id;

-- Example
SELECT users.name, addresses.city
FROM users
LEFT JOIN addresses ON users.id = addresses.user_id;
```

**Result:**
| name     | city   |
|----------|--------|
| Yadnyesh | Pune   |
| Stavan   | Mumbai |
| Hemant   | NULL   |

> Hemant appears with `NULL` city — he's in the left table (users) but has no address.

```sql
-- Useful trick: find users with NO address at all
SELECT users.name
FROM users
LEFT JOIN addresses ON users.id = addresses.user_id
WHERE addresses.user_id IS NULL;
```

---

## RIGHT JOIN

Returns **all rows from the right table** and the matched rows from the left table. If there is no match, left table columns return `NULL`.

```sql
-- Syntax
SELECT table1.column1, table2.column2
FROM table1
RIGHT JOIN table2 ON table1.id = table2.id;

-- Example
SELECT users.name, addresses.city
FROM users
RIGHT JOIN addresses ON users.id = addresses.user_id;
```

**Result:**
| name     | city   |
|----------|--------|
| Yadnyesh | Pune   |
| Stavan   | Mumbai |

> If an address existed with no matching user, `name` would appear as `NULL`.

> 💡 A `RIGHT JOIN` can always be rewritten as a `LEFT JOIN` by swapping the table order — most developers prefer `LEFT JOIN` for consistency.

---

## CROSS JOIN

Returns **every combination** of rows from both tables (cartesian product). No `ON` condition is needed.

```sql
-- Syntax
SELECT table1.column1, table2.column2
FROM table1
CROSS JOIN table2;

-- Example
SELECT users.name, addresses.city
FROM users
CROSS JOIN addresses;
```

> If `users` has 3 rows and `addresses` has 2 rows, the result has 3 × 2 = **6 rows**.

---

## SELF JOIN

A table joined **with itself**. Useful for hierarchical data like employees and their managers.

```sql
-- Example: find each employee and their manager
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;
```

---

## Using Aliases (Cleaner Queries)

Instead of writing the full table name every time, use aliases:

```sql
-- Without alias
SELECT users.name, addresses.city FROM users INNER JOIN addresses ON users.id = addresses.user_id;

-- With alias (much cleaner)
SELECT u.name, a.city
FROM users u
INNER JOIN addresses a ON u.id = a.user_id;
```

---

## Joining Multiple Tables

```sql
SELECT u.name, a.city, o.order_date
FROM users u
INNER JOIN addresses a ON u.id = a.user_id
INNER JOIN orders o   ON u.id = o.user_id;
```

---

## INNER vs LEFT vs RIGHT — Visual Summary

```
Table A     Table B

INNER JOIN  → only the overlapping middle
LEFT JOIN   → all of A + overlapping middle
RIGHT JOIN  → all of B + overlapping middle
```

| | INNER JOIN | LEFT JOIN | RIGHT JOIN |
|---|---|---|---|
| Rows from left table | Matched only | ✅ All | Matched only |
| Rows from right table | Matched only | Matched only | ✅ All |
| Unmatched rows | ❌ Excluded | `NULL` on right | `NULL` on left |