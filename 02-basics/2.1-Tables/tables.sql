-- Syntax
-- Creating Table

CREATE TABLE tablename (
    column_name datatype constraints
)

RENAME TABLE currentName TO newName

-- Example :-

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY_KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', "Other"),
    date_of_birth DATE,
    create_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP
)

RENAME TABLE users TO customers