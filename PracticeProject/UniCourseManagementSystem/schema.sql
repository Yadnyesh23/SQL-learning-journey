students -> student_id(pk) , student_name, email, age, gender, dept_id(fk)
faculty -> faculty_id(pk), faculty_name, email, age, gender, dept_id(fk)
departments -> dept_id(pk), dept_name
courses -> course_id(pk), course_name, code, credit, dept_id(fk), faculty_id(fk)
enrollments -> enroll_id(pk), student_id(fk), course_id(fk), date
payments -> student_id(fk) , amount, status
