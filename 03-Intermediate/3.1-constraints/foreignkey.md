# Foreign Key — MySQL

A **Foreign Key** is a column (or group of columns) in one table that refers to the **Primary Key of another table**. It enforces a link between the two tables and ensures **referential integrity** — you can't have data in one table that points to non-existent data in another.

---

## Syntax

```sql
CREATE TABLE tablename (
    column_name datatype,
    CONSTRAINT fk_name FOREIGN KEY (column_name) REFERENCES other_table(primary_key_column)
);
```

---

## Example

```sql
-- Parent table
CREATE TABLE users (
    id     INT          AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(200) NOT NULL,
    email  VARCHAR(200) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other')
);

-- Child table (references users)
CREATE TABLE addresses (
    address_id INT          AUTO_INCREMENT PRIMARY KEY,
    user_id    INT,
    street     VARCHAR(200),
    city       VARCHAR(200),
    state      VARCHAR(200),
    pincode    VARCHAR(10),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

> `users` is the **parent table**, `addresses` is the **child table**. A user must exist before an address can reference them.

---

## Adding a Foreign Key Later (ALTER TABLE)

```sql
ALTER TABLE addresses
ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
```

---

## Dropping a Foreign Key

```sql
-- Drop the foreign key constraint
ALTER TABLE addresses DROP FOREIGN KEY fk_user;

-- Drop the index left behind (optional but clean)
ALTER TABLE addresses DROP INDEX fk_user;
```

> ⚠️ Always drop the **foreign key constraint first** before dropping the column itself.

---

## ON DELETE Behaviour

Defines what happens to rows in the **child table** when the referenced row in the **parent table** is deleted.

| Option | What Happens to Child Rows |
|---|---|
| `CASCADE` | Child rows are **automatically deleted** |
| `SET NULL` | Child foreign key column is set to `NULL` |
| `RESTRICT` | Delete is **blocked** if child rows exist |
| `NO ACTION` | Same as `RESTRICT` (default if not specified) |
| `SET DEFAULT` | Child column is set to its default value |

### `ON DELETE CASCADE`
```sql
-- Deleting user id=1 will also delete all their addresses
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
```

### `ON DELETE SET NULL`
```sql
-- Deleting user id=1 sets user_id to NULL in addresses
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
```
> The `user_id` column must allow `NULL` for this to work.

### `ON DELETE RESTRICT`
```sql
-- Deleting user id=1 is blocked if they have addresses
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT
```

---

## ON UPDATE Behaviour

Same options apply when the **parent's primary key is updated**.

```sql
CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
```

---

## Parent vs Child Table

| | Parent Table | Child Table |
|---|---|---|
| Contains | Primary Key | Foreign Key |
| Example | `users` | `addresses` |
| Created | First | Second |
| Deleted | Last | First |

> Always **create the parent table first** and **drop the child table first**.

---

## Key Rules

| Rule | Detail |
|---|---|
| Referenced column must be `PRIMARY KEY` or `UNIQUE` | Foreign key must point to a uniquely identifiable column |
| Datatypes must match | `user_id INT` must reference an `INT` primary key |
| Name your constraints | Makes dropping and debugging easier (`fk_user` vs unnamed) |
| Drop child before parent | Can't drop a parent table while a foreign key points to it |