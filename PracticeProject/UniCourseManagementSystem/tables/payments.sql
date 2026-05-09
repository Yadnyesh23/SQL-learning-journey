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

SELECT * FROM payments;