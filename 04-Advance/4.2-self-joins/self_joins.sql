-- Syntax

-- Example
SELECT 
a.id,
a.name AS user_name,
b.name AS referred_by_name
FROM users a
INNER JOIN users b ON a.refered_by_id = b.id