-- Update a student's email
UPDATE students SET email = 'aarav2@gmail.com' WHERE  id = 1;


-- Increase course fees by 10%
SELECT * FROM courses;
UPDATE  courses SET  fees = fees + (fees * 10 )/100 WHERE course_id  > 0;
SELECT * FROM courses;


-- Change gender of a student
SELECT * FROM students;
UPDATE students SET gender = 'Male' WHERE  id = 10;
SELECT * FROM students;


-- Delete students with NULL DOB
SELECT * FROM students;
DELETE FROM students WHERE date_of_birth IS NULL AND id > 0;
SELECT * FROM students;


-- Delete enrollments for a specific course
SELECT * FROM  enrollments;
DELETE FROM enrollments WHERE course_id =(SELECT course_id FROM courses WHERE course_name = 'Data Structures') AND enrollment_id > 0;
SELECT * FROM  enrollments;