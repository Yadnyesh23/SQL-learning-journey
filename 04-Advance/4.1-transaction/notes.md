# Transactions & AutoCommit — MySQL

A **transaction** is a group of SQL statements that are executed as a single unit. Either **all of them succeed**, or **none of them are applied**.

---

## AutoCommit

By default, MySQL operates in **AutoCommit mode** — every SQL statement is automatically treated as its own transaction and committed immediately.

```sql
SET autocommit = 1;  -- ON  (MySQL default)
SET autocommit = 0;  -- OFF (you control when to commit)
```

> When AutoCommit is `ON`, every `INSERT`, `UPDATE`, or `DELETE` is permanent the moment it runs — there is no undo.

---

## Syntax

```sql
-- Disable AutoCommit
SET autocommit = 0;

-- Begin a transaction explicitly
START TRANSACTION;

-- Your SQL statements
INSERT INTO ...;
UPDATE ...;
DELETE FROM ...;

-- Save all changes permanently
COMMIT;

-- Undo all changes since the last COMMIT
ROLLBACK;
```

---

## Example

```sql
SET autocommit = 0;

START TRANSACTION;

UPDATE accounts SET balance = balance - 5000 WHERE id = 1;  -- Debit
UPDATE accounts SET balance = balance + 5000 WHERE id = 2;  -- Credit

-- If both updates are correct
COMMIT;

-- If something went wrong
ROLLBACK;
```

> This is the classic **bank transfer** use case — you never want one update to succeed without the other.

---

## Breaking it Down

### `SET autocommit = 0`
Turns off automatic committing. MySQL will now **wait for your explicit `COMMIT`** before saving any changes.

### `START TRANSACTION`
Explicitly marks the **beginning of a transaction**. Best practice to always include this instead of relying solely on `SET autocommit = 0`.

### `COMMIT`
**Saves all changes** made during the transaction permanently to the database. Once committed, changes cannot be rolled back.

### `ROLLBACK`
**Undoes all changes** made since the last `COMMIT` or `START TRANSACTION`. Useful when an error occurs mid-transaction.

---

## AutoCommit ON vs OFF

| | AutoCommit ON | AutoCommit OFF |
|---|---|---|
| Default in MySQL | ✅ | ❌ |
| Each statement auto-saved | ✅ | ❌ |
| Can ROLLBACK | ❌ | ✅ |
| Manual COMMIT needed | ❌ | ✅ |
| Safe for grouped operations | ❌ | ✅ |

---

## Key Rules

| Rule | Detail |
|---|---|
| `COMMIT` is permanent | Changes cannot be undone after a commit |
| `ROLLBACK` only works before `COMMIT` | Once committed, it's final |
| Always use transactions for related statements | Prevents partial updates (e.g. debit without credit) |
| `START TRANSACTION` resets the rollback point | Any previous uncommitted changes are committed first |