CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
);

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

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_name VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    dept_id INT,
    CONSTRAINT fk_faculty_department
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

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

CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    enroll_date DATE,
    student_id INT,
    course_id INT,
    CONSTRAINT fk_enroll_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(10,2),
    status ENUM('Paid', 'Pending'),
    payment_date DATE,
    CONSTRAINT fk_payments_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);