CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    dept_id INT,
    CONSTRAINT fk_students_department
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

SELECT * FROM students;