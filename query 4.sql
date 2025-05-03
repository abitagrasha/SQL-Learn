CREATE INDEX last_name_first_name_idx
ON customers(last_name,first_name);
SHOW INDEXES FROM customers;

ALTER TABLE customers
DROP INDEX last_name_idx;
SHOW INDEXES FROM customers;
SELECT * FROM customers
WHERE first_name = "Poppy";