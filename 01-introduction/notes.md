# Database Fundamentals

---

## What is a Database?

A database is an **organised collection of data** that can be easily stored, accessed, and managed.

---

## What is a DBMS?

A **Database Management System (DBMS)** is the software that lets you create, manage, and interact with a database.

| | |
|---|---|
| **Database** | Where data lives |
| **DBMS** | The tool used to work with that data |

---

## Types of DBMS

DBMS are mainly classified into two types:

### 1. Relational DBMS (RDBMS)

A Relational DBMS stores data in the form of **tables** (rows and columns) connected via relationships.

**Key features:**
- Uses SQL (Structured Query Language)
- Supports relationships via Primary Key & Foreign Key
- Data is structured and consistent
- Follows rules like normalisation

**Example table:**

| id | name  | age |
|----|-------|-----|
| 1  | Rahul | 20  |

**Popular RDBMS:** MySQL · PostgreSQL · Oracle · SQL Server

> Best for: Banking systems, e-commerce, student management — any structured, relationship-heavy data.

---

### 2. NoSQL DBMS

A NoSQL DBMS stores data in **non-tabular formats** like JSON, key-value pairs, graphs, etc.

**Key features:**
- Schema-less (flexible structure)
- Handles large-scale and unstructured data
- High performance for distributed systems
- Scales horizontally (used in big tech)

**Example (JSON document):**

```json
{
  "name": "Rahul",
  "age": 20,
  "skills": ["SQL", "Python"]
}
```

**Popular NoSQL DBs:** MongoDB · Cassandra · Redis

> Best for: Social media apps, real-time analytics, big data — when data is dynamic or massive in scale.

---

## RDBMS vs NoSQL — Quick Comparison

| Feature         | RDBMS            | NoSQL              |
|-----------------|------------------|--------------------|
| Structure       | Tables           | JSON / Key-Value   |
| Schema          | Fixed            | Flexible           |
| Query language  | SQL              | Varies             |
| Scalability     | Vertical         | Horizontal         |
| Use case        | Structured data  | Unstructured data  |

---

## What is a Query?

A query is a request sent to a database to **retrieve, create, update, or delete** data. Think of it as asking the database a question or giving it an instruction.