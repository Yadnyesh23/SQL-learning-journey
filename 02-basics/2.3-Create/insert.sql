-- Syntax

-- Insert a values of single row in table
INSERT INTO tablename VALUES 
('value', 'value',.......)

-- Insert a values of multiple row in table
INSERT INTO tablename VALUES 
('value', 'value',.......),
('value', 'value',.......),
('value', 'value',.......),
('value', 'value',.......),
.....
....
.....
.....

-- Insert only value of specific columns
INSERT INTO tablename (column1, columns2) VALUES 
( 'value', 'value',.........)

-- Example

INSERT INTO users VALUES 
(1,"yadnyesh@gmail.com", "yadnyesh", "Male", "2006-02-23", default)


INSERT INTO users VALUES 
(1,"yadnyesh@gmail.com", "yadnyesh", "Male", "2006-02-23", default)
(2,"stavan@gmail.com", "stavan", "Male", "2012-09-24", default)
(3,"hemant@gmail.com", "hemant", "Male", "1978-06-10", default)
(4,"sapna@gmail.com", "sapna", "Female", "1981-10-17", default)


INSERT INTO users (name, email) VALUES 
( "sapna","sapna@gmail.com")