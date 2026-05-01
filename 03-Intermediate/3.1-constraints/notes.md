# Constraints — MySQL

Constraints are **rules applied to table columns** to ensure the accuracy, validity, and integrity of data. They are defined when creating or altering a table.

---

## List of Constraints

| Constraint | Purpose |
|---|---|
| `NOT NULL` | Column must always have a value |
| `UNIQUE` | No duplicate values allowed in the column |
| `PRIMARY KEY` | Uniquely identifies each row (`NOT NULL` + `UNIQUE` combined) |
| `AUTO_INCREMENT` | Automatically assigns the next integer on each insert |
| `DEFAULT` | Uses a fallback value if none is provided |
| `CHECK` | Ensures a value meets a specific condition |
| `FOREIGN KEY` | Links a column to a primary key in another table |

---

## `NOT NULL`

Ensures a column **cannot be left empty**. Every row must provide a value.

```sql
-- On CREATE
CREATE TABLE users (
    name VARCHAR(100) NOT NULL
);

-- Add via ALTER
ALTER TABLE users MODIFY COLUMN name VARCHAR(100) NOT NULL;

-- Remove via ALTER
ALTER TABLE users MODIFY COLUMN name VARCHAR(100) NULL;
```

> Without `NOT NULL`, a column accepts `NULL` by default.

---

## `UNIQUE`

Ensures **no two rows have the same value** in that column.

```sql
-- On CREATE
CREATE TABLE users (
    email VARCHAR(100) UNIQUE
);

-- Add via ALTER
ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);

-- Remove via ALTER
ALTER TABLE users DROP INDEX unique_email;
```

> Unlike `PRIMARY KEY`, a table can have **multiple** `UNIQUE` columns, and they allow `NULL`.

---

## `PRIMARY KEY`

**Uniquely identifies every row** in a table. Combination of `NOT NULL` + `UNIQUE`. Each table can have only one.

```sql
-- On CREATE
CREATE TABLE users (
    id INT PRIMARY KEY
);

-- Add via ALTER
ALTER TABLE users ADD PRIMARY KEY (id);

-- Remove via ALTER
ALTER TABLE users DROP PRIMARY KEY;
```

---

## `AUTO_INCREMENT`

Automatically assigns the **next available integer** when a new row is inserted. Always used with `PRIMARY KEY`.

```sql
-- On CREATE
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY
);

-- Add via ALTER
ALTER TABLE users MODIFY COLUMN id INT AUTO_INCREMENT;

-- Change starting value
ALTER TABLE users AUTO_INCREMENT = 100;
```

> You never need to manually pass a value for this column — use `DEFAULT` or `NULL` on insert.

---

## `DEFAULT`

Sets a **fallback value** for a column when no value is provided during insert.

```sql
-- On CREATE
CREATE TABLE users (
    is_active  BOOLEAN   DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add via ALTER
ALTER TABLE users ALTER COLUMN is_active SET DEFAULT TRUE;
ALTER TABLE users ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;

-- Remove via ALTER
ALTER TABLE users ALTER COLUMN is_active DROP DEFAULT;
```

---

## `CHECK`

Ensures a column value **satisfies a specific condition** before it is accepted.

```sql
-- On CREATE
CREATE TABLE users (
    age    INT           CHECK (age >= 18),
    salary DECIMAL(10,2) CHECK (salary >= 0)
);

-- Add via ALTER
ALTER TABLE users ADD CONSTRAINT check_age CHECK (age >= 18);
ALTER TABLE users ADD CONSTRAINT check_salary CHECK (salary >= 0);

-- Remove via ALTER
ALTER TABLE users DROP CHECK check_age;
```

> If the condition fails, MySQL rejects the insert or update entirely.

---

## `FOREIGN KEY`

Links a column to the **primary key of another table**, enforcing a relationship between them.

```sql
-- On CREATE
CREATE TABLE orders (
    id      INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Add via ALTER
ALTER TABLE orders ADD CONSTRAINT fk_user
    FOREIGN KEY (user_id) REFERENCES users(id);

-- Remove via ALTER
ALTER TABLE orders DROP FOREIGN KEY fk_user;
```

> Prevents inserting a `user_id` that doesn't exist in the `users` table.

---

## All Together — Full Example

```sql
CREATE TABLE users (
    id         INT            AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100)   NOT NULL,
    email      VARCHAR(100)   UNIQUE NOT NULL,
    age        INT            CHECK (age >= 18),
    salary     DECIMAL(10, 2) DEFAULT 30000.00 CHECK (salary >= 0),
    is_active  BOOLEAN        DEFAULT TRUE,
    created_at TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);
```

---

## ALTER TABLE — Constraints Quick Reference

| Constraint | Add | Remove |
|---|---|---|
| `NOT NULL` | `MODIFY COLUMN col datatype NOT NULL` | `MODIFY COLUMN col datatype NULL` |
| `UNIQUE` | `ADD CONSTRAINT name UNIQUE (col)` | `DROP INDEX name` |
| `PRIMARY KEY` | `ADD PRIMARY KEY (col)` | `DROP PRIMARY KEY` |
| `DEFAULT` | `ALTER COLUMN col SET DEFAULT value` | `ALTER COLUMN col DROP DEFAULT` |
| `CHECK` | `ADD CONSTRAINT name CHECK (condition)` | `DROP CHECK name` |
| `FOREIGN KEY` | `ADD CONSTRAINT name FOREIGN KEY (col) REFERENCES t(col)` | `DROP FOREIGN KEY name` |

---

## Quick Reference

| Constraint | Allows NULL | Allows Duplicates | One per Table |
|---|---|---|---|
| `NOT NULL` | ❌ | ✅ | ❌ |
| `UNIQUE` | ✅ | ❌ | ❌ |
| `PRIMARY KEY` | ❌ | ❌ | ✅ |
| `CHECK` | ✅ | ✅ | ❌ |
| `DEFAULT` | ✅ | ✅ | ❌ |
| `FOREIGN KEY` | ✅ | ✅ | ❌ |