# Self Join — MySQL

A **Self Join** is when a table is joined **with itself**. This is useful when rows within the same table are related to each other — such as employees and their managers, or users and who referred them.

> There is no special `SELF JOIN` keyword — you just join a table to itself using aliases to treat it as two separate tables.

---

## Syntax

```sql
-- INNER SELF JOIN (only rows with a match)
SELECT a.column1, b.column2
FROM tablename a
INNER JOIN tablename b ON a.foreign_key = b.primary_key;

-- LEFT SELF JOIN (include rows with no match)
SELECT a.column1, b.column2
FROM tablename a
LEFT JOIN tablename b ON a.foreign_key = b.primary_key;
```

---

## Example

**users table:**

| id | name     | referred_by_id |
|----|----------|----------------|
| 1  | Yadnyesh | NULL           |
| 2  | Stavan   | 1              |
| 3  | Hemant   | 1              |
| 4  | Sapna    | 2              |

```sql
-- INNER JOIN: only users who were referred by someone
SELECT
    a.id,
    a.name          AS user_name,
    b.name          AS referred_by_name
FROM users a
INNER JOIN users b ON a.referred_by_id = b.id;
```

**Result:**

| id | user_name | referred_by_name |
|----|-----------|-----------------|
| 2  | Stavan    | Yadnyesh        |
| 3  | Hemant    | Yadnyesh        |
| 4  | Sapna     | Stavan          |

> Yadnyesh is excluded — `referred_by_id` is `NULL` so there's no match.

```sql
-- LEFT JOIN: include users with no referral too
SELECT
    a.id,
    a.name          AS user_name,
    b.name          AS referred_by_name
FROM users a
LEFT JOIN users b ON a.referred_by_id = b.id;
```

**Result:**

| id | user_name | referred_by_name |
|----|-----------|-----------------|
| 1  | Yadnyesh  | NULL            |
| 2  | Stavan    | Yadnyesh        |
| 3  | Hemant    | Yadnyesh        |
| 4  | Sapna     | Stavan          |

> Now Yadnyesh appears with `NULL` in `referred_by_name` since nobody referred him.

---

## Breaking it Down

### Aliases (`a` and `b`)
Since you're using the same table twice, you **must** give each instance a different alias. MySQL treats them as two separate tables.

```sql
FROM users a       -- 'a' = the child (the referred user)
INNER JOIN users b -- 'b' = the parent (the one who referred)
ON a.referred_by_id = b.id
```

### INNER vs LEFT Self Join

| | `INNER JOIN` | `LEFT JOIN` |
|---|---|---|
| Rows with a match | ✅ Included | ✅ Included |
| Rows with no match (NULL) | ❌ Excluded | ✅ Included as NULL |
| Use when | You only want linked rows | You want all rows regardless |

---

## Another Common Use Case — Employee & Manager

```sql
-- employees table: id, name, manager_id
SELECT
    e.name AS employee,
    m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;
```

**Result:**

| employee | manager  |
|----------|----------|
| Alice    | NULL     |
| Bob      | Alice    |
| Carol    | Alice    |
| Dave     | Bob      |

> Alice has no manager (she's the top) — `LEFT JOIN` ensures she still appears.

---

## Key Rules

| Rule | Detail |
|---|---|
| Always use aliases | Required when joining a table with itself |
| Use `LEFT JOIN` to include unmatched rows | `INNER JOIN` excludes rows where the self-reference is `NULL` |
| Common for hierarchical data | Referrals, org charts, category trees, threaded comments |
| No special syntax | It's just a regular `JOIN` — the table name appears twice |