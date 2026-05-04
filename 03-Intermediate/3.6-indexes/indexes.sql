-- Syntax
-- Viewing indexes from table
SHOW INDEXES FROM tablename

--Creating single column index
CREATE INDEX indexname ON tablename(columnname);

-- Dropping index
DROP INDEX idx_name ON tablename

-- Example
-- Viewing indexes from table
SHOW INDEXES FROM user

--Creating single column index
CREATE INDEX idx_email ON users(email);

-- Dropping index
DROP INDEX idx_email ON users