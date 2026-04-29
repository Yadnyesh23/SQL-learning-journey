# CREATE TABLE — MySQL

## Syntax

```sql
CREATE TABLE tablename (
    column_name datatype constraints,
    column_name datatype constraints,
    ...
);
```

## Example

```sql
CREATE TABLE users (
    id           INT           AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100)  NOT NULL,
    email        VARCHAR(100)  UNIQUE NOT NULL,
    gender       ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at   TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);
```

---

## Breaking it Down

### `CREATE TABLE`
The core SQL command that tells MySQL you want to **define a new table structure**. Nothing is inserted yet — you're just setting up the blueprint.

### `tablename`
The **unique name** you assign to your table. It should be lowercase, descriptive, and typically plural.

```
users, products, orders
```

### `column_name`
Identifies a **specific attribute** (field) you want to store in the table.

```
id, name, email, date_of_birth
```

### `datatype`
Defines **what kind of data** is allowed in that column. MySQL will reject any value that doesn't match.

| Datatype       | Used For                        | Example              |
|----------------|---------------------------------|----------------------|
| `INT`          | Whole numbers                   | `age INT`            |
| `VARCHAR(n)`   | Variable-length text (max n)    | `name VARCHAR(100)`  |
| `DATE`         | Date only (YYYY-MM-DD)          | `date_of_birth DATE` |
| `TIMESTAMP`    | Date + time                     | `created_at TIMESTAMP` |
| `ENUM(...)`    | One value from a fixed list     | `ENUM('Male', 'Female', 'Other')` |
| `BOOLEAN`    | True or False     | `is_active` |

### `constraints`
Rules applied to a column to **enforce data integrity**. Multiple constraints can be applied to a single column.

| Constraint          | What it does                                              |
|---------------------|-----------------------------------------------------------|
| `PRIMARY KEY`       | Uniquely identifies each row; only one per table          |
| `AUTO_INCREMENT`    | Automatically assigns the next integer value              |
| `NOT NULL`          | The column must always have a value                       |
| `UNIQUE`            | No two rows can have the same value in this column        |
| `DEFAULT value`     | Uses a fallback value if none is provided                 |
| `DEFAULT TIMESTAMP`     | Uses a fallback value(current time+date) as a timestamps                |

---

## Column-by-Column Walkthrough

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```
- `INT` — stores a whole number
- `AUTO_INCREMENT` — MySQL automatically assigns 1, 2, 3… on each insert
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

```sql
date_of_birth DATE
```
- Stores date in `YYYY-MM-DD` format; no constraints, so it's optional

```sql
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
```
- Automatically records the exact date and time when the row was inserted