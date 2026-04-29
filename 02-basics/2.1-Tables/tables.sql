-- Syntax

-- Creating Table
CREATE TABLE tablename (
    column_name datatype constraints
)


-- Rename table
RENAME TABLE currentName TO newName


-- Alter table(Add new columns to existing table)
ALTER TABLE tablename  ADD COLUMN column_name datatype constraints;


-- Alter table(Drop columns)
ALTER TABLE tablename DROP COLUMN column_name;


-- Alter table(Modify columns)
ALTER TABLE tablename MODIFY COLUMN column_name;


-- Alter Table(Change sequence of columns)
ALTER TABLE tablename MODIFY COLUMN column1_name datatype AFTER column2_name  


-- Example :-

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY_KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', "Other"),
    date_of_birth DATE,
    create_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP
)

RENAME TABLE users TO customers;

ALTER TABLE customers  ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

ALTER TABLE users DROP COLUMN is_active;

ALTER TABLE users MODIFY COLUMN name VARCHAR(150);

ALTER TABLE users MODIFY COLUMN email VARCHAR(100) after id;
