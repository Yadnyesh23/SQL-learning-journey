-- Add a student with missing DOB
INSERT INTO students (name, email, gender) VALUES
('Manish Kumar', 'manish@gmail.com', 'Male'),
('Pooja Shah', 'pooja@gmail.com', 'Female'),
('Amit Kulkarni', 'amit@gmail.com', 'Male'),
('Riya Das', 'riya@gmail.com', 'Female'),
('Karan Malhotra', 'karan@gmail.com', 'Male');


-- Find students where DOB IS NULL
SELECT * FROM students  WHERE date_of_birth IS NULL;


-- Find students where DOB IS NOT NULL
SELECT * FROM students  WHERE date_of_birth IS NOT  NULL;
