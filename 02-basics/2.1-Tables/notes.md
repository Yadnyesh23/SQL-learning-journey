# CREATE TABLE — MySQL

## Syntax

```sql
-- Create a new table
CREATE TABLE tablename (
    column_name datatype constraints,
    column_name datatype constraints,
    ...
);

-- Rename an existing table
RENAME TABLE current_name TO new_name;
```

---

## Example

```sql
CREATE TABLE users (
    id            INT           AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100)  NOT NULL,
    email         VARCHAR(100)  UNIQUE NOT NULL,
    gender        ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

RENAME TABLE users TO customers;
```

---

## Breaking it Down

### `CREATE TABLE`
The core SQL command that tells MySQL you want to **define a new table structure**. Nothing is inserted yet — you're just setting up the blueprint.

### `tablename`
The **unique name** you assign to your table. Should be lowercase, descriptive, and typically plural.

```
users    products    orders
```

### `column_name`
Identifies a **specific attribute** (field) you want to store in the table.

```
id    name    email    date_of_birth
```

### `RENAME TABLE`
Renames an existing table without affecting its data.

```sql
RENAME TABLE users TO customers;
```

---

## Datatypes

Defines **what kind of data** is allowed in that column. MySQL rejects any value that doesn't match.

| Datatype        | Used For                          | Example                           |
|-----------------|-----------------------------------|-----------------------------------|
| `INT`           | Whole numbers                     | `age INT`                         |
| `VARCHAR(n)`    | Variable-length text (max n chars)| `name VARCHAR(100)`               |
| `DATE`          | Date only — `YYYY-MM-DD`          | `date_of_birth DATE`              |
| `TIMESTAMP`     | Date + time                       | `created_at TIMESTAMP`            |
| `ENUM(...)`     | One value from a fixed list       | `ENUM('Male', 'Female', 'Other')` |
| `BOOLEAN`       | True or False (`1` or `0`)        | `is_active BOOLEAN`               |

---

## Constraints

Rules applied to a column to **enforce data integrity**. Multiple constraints can be on a single column.

| Constraint                  | What It Does                                                  |
|-----------------------------|---------------------------------------------------------------|
| `PRIMARY KEY`               | Uniquely identifies each row; only one allowed per table      |
| `AUTO_INCREMENT`            | Automatically assigns the next integer on each insert         |
| `NOT NULL`                  | The column must always have a value                           |
| `UNIQUE`                    | No two rows can have the same value in this column            |
| `DEFAULT value`             | Uses a fallback value if none is provided                     |
| `DEFAULT CURRENT_TIMESTAMP` | Automatically stores the current date and time on insert      |

---

## Column-by-Column Walkthrough

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```
- `INT` — stores a whole number
- `AUTO_INCREMENT` — MySQL assigns 1, 2, 3… automatically on each insert
- `PRIMARY KEY` — uniquely identifies every row in the table

```sql
name VARCHAR(100) NOT NULL
```
- `VARCHAR(100)` — text up to 100 characters
- `NOT NULL` — a name must always be provided

```sql
email VARCHAR(100) UNIQUE NOT NULL
```
- `UNIQUE` — no two users can share the same email
- `NOT NULL` — email is mandatory

```sql
gender ENUM('Male', 'Female', 'Other')
```
- Only accepts one of the three listed values; anything else is rejected
- No `NOT NULL` here, so gender is optional

```sql
date_of_birth DATE
```
- Stores date in `YYYY-MM-DD` format
- No constraints — this field is optional

```sql
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
```
- Automatically records the exact date and time when the row was inserted
- You never need to pass this value manually