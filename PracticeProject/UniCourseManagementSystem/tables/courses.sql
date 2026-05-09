CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(50) UNIQUE,
    credits INT,
    dept_id INT,
    faculty_id INT,
    CONSTRAINT fk_courses_faculty
        FOREIGN KEY (faculty_id)
        REFERENCES faculty(faculty_id),
    CONSTRAINT fk_courses_department
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

SELECT * FROM courses;