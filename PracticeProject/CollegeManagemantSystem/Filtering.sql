-- Students with gender = 'Male'
SELECT * FROM students WHERE gender = 'Male';


-- Students born between 2000 and 2005
SELECT * FROM students WHERE  date_of_birth  BETWEEN '2004-01-01' AND '2005-12-31';


-- Students whose name starts with 'A'
SELECT * FROM students WHERE name LIKE 'a%';


-- Students with email containing 'gmail'
SELECT * FROM students WHERE  email LIKE '%gmail%';


-- Courses with fees IN (30000, 50000)
SELECT * FROM courses WHERE fees IN (30000, 50000);
