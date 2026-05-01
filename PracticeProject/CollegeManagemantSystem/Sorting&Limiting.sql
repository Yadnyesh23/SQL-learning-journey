-- Sort students by name
SELECT * FROM students ORDER BY  name ASC;


-- Sort by DOB DESC
SELECT * FROM students ORDER BY date_of_birth DESC;


-- Get top 5 youngest students
SELECT * FROM students ORDER BY date_of_birth DESC LIMIT 5;