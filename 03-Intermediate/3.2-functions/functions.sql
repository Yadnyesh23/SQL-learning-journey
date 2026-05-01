-- Syntax:-

-- Example:-
SELECT * FROM users;
SELECT COUNT(*) FROM  users;
SELECT COUNT(*) FROM  users WHERE gender = 'Male';
SELECT MIN(salary) as min_salary, MAX(salary) as max_salary FROM users;
SELECT SUM(salary) AS total_salary FROM users;
SELECT AVG(salary) AS avg_salary FROM users;
SELECT gender, AVG(salary) AS avg_salary, SUM(salary) as total_salary FROM users GROUP BY gender;
SELECT name , LENGTH(name) AS name_len FROM users;
SELECT LOWER(name) FROM users;
SELECT name,  CONCAT(LOWER(name), '123') AS username FROM users;
SELECT name,id,date_of_birth , MONTH(date_of_birth) as Month, DAY(date_of_birth) as Day, YEAR(date_of_birth) as Year FROM users;
SELECT name, id , DATEDIFF(CURDATE() ,date_of_birth) as days FROM users;
SELECT 	salary, ROUND(salary) as rounded, FLOOR(salary) as floor, CEIL(salary) as ceiled FROM users;
SELECT  name, gender , IF(gender = 'Female', 'Yes', 'No') as is_female FROM users;