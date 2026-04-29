# SELECT — MySQL

## Syntax

```sql
-- Select all columns
SELECT * FROM tablename;

-- Select specific columns
SELECT column1, column2 FROM tablename;
```

---

## Example

```sql
-- Get everything from the users table
SELECT * FROM users;

-- Get only the email and name columns
SELECT email, name FROM users;
```

---

## Breaking it Down

### `SELECT`
Specifies **which columns** you want to retrieve. It's always the first keyword in a query.

### `*` (asterisk)
A shorthand that means **"all columns"**. Useful for quick exploration, but avoid it in production — it fetches unnecessary data and slows things down.

### `column1, column2`
List only the columns you actually need, separated by commas.

```sql
SELECT id, name, email FROM users;
```

### `FROM`
Tells MySQL **which table** to fetch the data from.

---

## Key Rules

| Rule | Detail |
|---|---|
| `SELECT` always comes before `FROM` | You can't swap the order |
| Columns are comma-separated | `SELECT name, email` not `SELECT name email` |
| `*` returns all columns | Fine for testing, avoid in production |
| SQL is case-insensitive | `select * from users` works too, but uppercase keywords are convention |