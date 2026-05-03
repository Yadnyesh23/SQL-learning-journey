-- Syntax 

-- UNION
SELECT name FROM table1
UNION
SELECT name FROM table2;

-- UNION ALL
SELECT name FROM table1
UNION ALL
SELECT name FROM table2;

-- Example
-- UNION
SELECT name FROM users
UNION 
SELECT name FROM admins;

-- UNION ALL
SELECT name FROM users
UNION ALL
SELECT name FROM admins;