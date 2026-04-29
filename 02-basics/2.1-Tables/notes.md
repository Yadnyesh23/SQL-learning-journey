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

-- Add a new column to an existing table
ALTER TABLE tablename ADD COLUMN column_name datatype constraints;

-- Remove a column from an existing table
ALTER TABLE tablename DROP COLUMN column_name;

-- Modify a column's datatype or constraints
ALTER TABLE tablename MODIFY COLUMN column_name datatype constraints;

-- Change the position of a column
ALTER TABLE tablename MODIFY COLUMN column_name datatype AFTER other_column_name;
```

---

## Example

```sql
-- Create the users table
CREATE TABLE users (
    id            INT           AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100)  NOT NULL,
    email         VARCHAR(100)  UNIQUE NOT NULL,
    gender        ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- Rename users to customers
RENAME TABLE users TO customers;

-- Add is_active column to customers
ALTER TABLE customers ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- Remove is_active column
ALTER TABLE customers DROP COLUMN is_active;

-- Increase name column length
ALTER TABLE customers MODIFY COLUMN name VARCHAR(150) NOT NULL;

-- Move email column to appear right after id
ALTER TABLE customers MODIFY COLUMN email VARCHAR(100) UNIQUE NOT NULL AFTER id;
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
Renames an existing table without affecting its data or structure.

```sql
RENAME TABLE users TO customers;
```

### `ALTER TABLE`
Modifies the **structure of an existing table**. Used to add, remove, or change columns after the table has already been created.

| Operation | Syntax |
|---|---|
| Add a column | `ALTER TABLE t ADD COLUMN col datatype;` |
| Drop a column | `ALTER TABLE t DROP COLUMN col;` |
| Modify a column | `ALTER TABLE t MODIFY COLUMN col datatype constraints;` |
| Reorder a column | `ALTER TABLE t MODIFY COLUMN col datatype AFTER other_col;` |

> **Note:** When using `MODIFY COLUMN`, always re-specify the full datatype and constraints — MySQL does not carry over the original ones.

---

## Datatypes

Defines **what kind of data** is allowed in that column. MySQL rejects any value that doesn't match.

| Datatype        | Used For                           | Example                           |
|-----------------|------------------------------------|-----------------------------------|
| `INT`           | Whole numbers                      | `age INT`                         |
| `VARCHAR(n)`    | Variable-length text (max n chars) | `name VARCHAR(100)`               |
| `DATE`          | Date only — `YYYY-MM-DD`           | `date_of_birth DATE`              |
| `TIMESTAMP`     | Date + time                        | `created_at TIMESTAMP`            |
| `ENUM(...)`     | One value from a fixed list        | `ENUM('Male', 'Female', 'Other')` |
| `BOOLEAN`       | True or False (`1` or `0`)         | `is_active BOOLEAN`               |

---

## Constraints

Rules applied to a column to **enforce data integrity**. Multiple constraints can be applied to a single column.

| Constraint                  | What It Does                                             |
|-----------------------------|----------------------------------------------------------|
| `PRIMARY KEY`               | Uniquely identifies each row; only one allowed per table |
| `AUTO_INCREMENT`            | Automatically assigns the next integer on each insert    |
| `NOT NULL`                  | The column must always have a value                      |
| `UNIQUE`                    | No two rows can have the same value in this column       |
| `DEFAULT value`             | Uses a fallback value if none is provided                |
| `DEFAULT CURRENT_TIMESTAMP` | Automatically stores the current date and time on insert |

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
- No `NOT NULL` — gender is optional

```sql
date_of_birth DATE
```
- Stores date in `YYYY-MM-DD` format
- No constraints — this field is optional

```sql
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
```
- Automatically records the exact date and time the row was inserted
- You never need to pass this value manually