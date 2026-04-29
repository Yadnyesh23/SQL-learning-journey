# CREATE DATABASE & USE — MySQL

## Syntax

```sql
-- Create a database
CREATE DATABASE databasename;

-- Switch to / activate a database
USE databasename;

-- Delete complete database

DROP DATABASE databasename;
```

## Example

```sql
CREATE DATABASE company_db;

USE company_db;

DROP DATABASE company_db;
```

---

## Breaking it Down

### `CREATE DATABASE`
Creates a brand new **container (schema)** in MySQL where you can store all your tables and data. Replace `databasename` with whatever name you want to give it.

```sql
CREATE DATABASE school_db;
CREATE DATABASE company_db;
CREATE DATABASE ecommerce_db;
```

> **Naming tip:** Use lowercase letters with underscores — no spaces or special characters.

---

### `USE`
Tells MySQL **which database to work in** for your current session. Once set, all commands like `CREATE TABLE`, `INSERT`, `SELECT`, etc. will apply to that database.

```sql
USE company_db;
```

Without `USE`, MySQL doesn't know where to create tables or look for data — you'll get an error like:

```
ERROR 1046: No database selected
```

> **In MySQL Workbench:** You can also right-click the database name in the Schemas panel and select **Set as Default Schema** — this does the same thing as `USE`.

### `DROP DATABASE`
Tels MySQL to permanently delete an entire database and all the `tables`, `data`, and `structures` contained within it.

```sql
DROP DATABASE company_db;
```

---

## Typical Workflow

```sql
-- Step 1: Create the database
CREATE DATABASE company_db;

-- Step 2: Switch to it
USE company_db;

-- Step 3: Now create tables inside it
CREATE TABLE employees (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

Always run `CREATE DATABASE` → `USE` → then start building tables inside it.