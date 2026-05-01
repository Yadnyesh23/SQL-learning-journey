# SQL Practice Project: College Management System

A structured hands-on project to build real-world SQL skills — from table creation to intermediate queries — using a single coherent scenario.

---

## Scenario

Building a **College Management System** to manage students, courses, and their enrollments.

---

## Database Schema

### Students
| Column        | Type      | Constraints        |
|---------------|-----------|--------------------|
| id            | INT       | PRIMARY KEY        |
| name          | VARCHAR   | NOT NULL           |
| email         | VARCHAR   | UNIQUE, NOT NULL   |
| gender        | VARCHAR   |                    |
| date_of_birth | DATE      |                    |
| created_at    | TIMESTAMP | DEFAULT NOW()      |

### Courses
| Column          | Type    | Constraints      |
|-----------------|---------|------------------|
| course_id       | INT     | PRIMARY KEY      |
| course_name     | VARCHAR | UNIQUE, NOT NULL |
| duration_months | INT     |                  |
| fees            | DECIMAL |                  |

### Enrollments
| Column          | Type | Constraints             |
|-----------------|------|-------------------------|
| enrollment_id   | INT  | PRIMARY KEY             |
| student_id      | INT  | FOREIGN KEY (Students)  |
| course_id       | INT  | FOREIGN KEY (Courses)   |
| enrollment_date | DATE |                         |

---

## Topics Covered

- Database & table creation
- Constraints — PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY
- CRUD operations
- Filtering — WHERE, AND, OR, NOT, IN, BETWEEN, LIKE
- NULL handling — IS NULL, IS NOT NULL
- Sorting & limiting — ORDER BY, LIMIT
- Subqueries

---

## Practice Steps

### Step 1 — Create the database
- Create the database
- Create all three tables with correct data types

### Step 2 — Apply constraints
- PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY

### Step 3 — Seed data
- Insert 10 students, 5 courses, and 15 enrollments
- Include some NULL values for later practice

### Step 4 — Basic queries
- Retrieve all records from each table
- Select specific columns (e.g. name, email)
- Filter courses where fees > 50000

### Step 5 — Filtering
- `WHERE`, `AND`, `OR`, `NOT`
- `IN`, `BETWEEN`, `LIKE`

Example tasks:
- Students where gender = 'Male'
- Students born between 2000 and 2005
- Names starting with 'A'
- Emails containing 'gmail'

### Step 6 — NULL handling
- Use `IS NULL` and `IS NOT NULL` to find incomplete records

### Step 7 — Sorting & limiting
- Sort students by name (ascending)
- Sort by date of birth (descending)
- Retrieve the top 5 records with `LIMIT`

### Step 8 — Update & delete
- Update a student's email
- Increase course fees
- Delete records with NULL values
- Delete specific enrollments

### Step 9 — Intermediate challenges
- Find all students enrolled in a specific course
- Find students not enrolled in any course
- Count the number of students per course

---

## Goals

By completing this project you will:
- Build strong SQL fundamentals
- Understand real-world database schema design
- Be ready for interview-level SQL questions

---

## Up Next

- JOINs — INNER, LEFT, RIGHT
- Aggregation — GROUP BY, HAVING
- Advanced SQL concepts

---

## Author

**Yadnyesh Halde**

---

*If you found this helpful, consider starring the repo!*