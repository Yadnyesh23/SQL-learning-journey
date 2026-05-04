
-- Syntax 
-- Creating view
CREATE VIEW viewname AS select_query....

-- Quering view
SELECT * FROM viewname

-- Dropping view
DROP VIEW viewname

-- Example
-- Creating view
CREATE VIEW rich_users AS
SELECT * FROM users WHERE salary > 70000;

-- Quering view
SELECT * FROM rich_users

-- Dropping view
DROP VIEW rich_users