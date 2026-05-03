-- Syntax


-- INNER JOIN
SELECT table1.column1 , table2.column2 FROM table1 INNER JOIN table2 ON table1.id = table2.id


-- LEFT JOIN
SELECT table1.column1 , table2.column2 FROM table1 INNER JOIN table2 ON table1.id = table2.id

-- RIGHT JOIN
SELECT table1.column1 , table2.column2 FROM table1 RIGHT JOIN table2 ON table1.id = table2.id

-- Example


-- INNER JOIN
SELECT users.name, addresses.city FROM users INNER JOIN addresses ON users.id = addresses.user_id;

-- LEFT JOIN
SELECT users.name, addresses.city FROM users LEFT JOIN addresses ON users.id = addresses.user_id

-- RIGHT JOIN
SELECT users.name, addresses.city FROM users RIGHT JOIN addresses ON users.id = addresses.user_id