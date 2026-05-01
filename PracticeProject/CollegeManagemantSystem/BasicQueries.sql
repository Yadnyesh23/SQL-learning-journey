-- Show all students
SELECT * FROM students;

-- Show only student names and emails
SELECT name , email FROM students;

-- Show all the courses
SELECT * FROM courses;

-- Show all courses with fees < 30,000
SELECT * FROM courses WHERE fees < 30000;
