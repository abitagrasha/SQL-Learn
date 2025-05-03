CREATE DATABASE myAG;
CREATE TABLE employees (
employee_id INT,
first_name VARCHAR (50) NOT NULL AUTO_INCREMENT,
last_name VARCHAR (50) NOT NULL,
hourly_pay DECIMAL (5,2),
hire_date DATE 
);
SELECT *FROM employees;
ALTER TABLE employees
ADD phone_number VARCHAR (15);
SELECT * FROM employees;
ALTER TABLE employees
RENAME COLUMN phone_number TO email;
SELECT *FROM employees;
ALTER TABLE employees 
MODIFY COLUMN email VARCHAR (100);
SELECT *FROM employees;
ALTER TABLE employees
MODIFY COLUMN hourly_pay DECIMAL (5,2)
AFTER last_name;
SELECT *FROM employees;
INSERT INTO employees 
VALUES 	(2,"Squidwards", "Tentacles", 15.00, "2023-01-03", "STentacles@gmail.com");
SELECT *FROM employees;
INSERT INTO employees 
VALUES(3,"Spongebob", "Squarepants", 12.50,"2023-01-04", "Ssquarepants@gmail.com");
SELECT *FROM employees;
INSERT INTO employees
VALUES (4,"Patrick", "Star", 12.50,"2023-01-05", "PStar@gmail.com");
SELECT *FROM employees;

SELECT *
FROM employees 
WHERE employee_id =3;

SELECT *
FROM employees
WHERE hire_date IS NULL;

UPDATE employees
SET hourly_pay = 10.25,
WHERE employee_id =6;

SELECT * FROM employee;

SELECT *FROM test;
INSERT INTO test
VALUES (CURRENT_DATE (), CURRENT_TIME(), NOW());
SELECT *FROM TEST;

CREATE TABLE products(
product_id INT,
product_name VARCHAR (25) UNIQUE,
price DECIMAL (4,2)
);
INSERT INTO products
VALUES (100,"hamburger", 3.99);
SELECT * FROM products;
INSERT INTO products
VALUES (101, "fries",1.89);
SELECT *FROM products;
INSERT INTO products
VALUES (103, "ice cream", 1.49);
SELECT *FROM products;

SELECT *FROM employees;
ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >=10.00);

ALTER TABLE employees
DROP CHECK chk_hourly_pay;

SELECT *FROM products;
SELECT * FROM proINSERT INTO products
VALUES (107, "spoon", 0.00);
SELECT *FROM products;
ALTER TABLE products
ALTER price SET DEFAULT 0;
INSERT INTO products (product_id, product_name)
VALUES (107, "spoon");
SELECT *FROM products;

CREATE TABLE transactions (
transaction_id INT,
amount DECIMAL (5,2),
transaction_date DATETIME DEFAULT NOW()
);
SELECT *FROM transactions;
INSERT INTO transactions (transaction_id, amount)
VALUES (3, 8.37);
SELECT *FROM transactions;
DROP TABLE transactions;

CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
amount DECIMAL (5,2)
);
SELECT *FROM transactions;
INSERT INTO transactions
VALUES (1003, 4.99);
DROP TABLE transactions;

CREATE TABLE transactions (
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
amount DECIMAL (5,2)
);
SELECT* FROM transactions;
INSERT INTO transactions (amount)
VALUES (4.99);
ALTER TABLE transactions 
AUTO_INCREMENT =1000;

DELETE FROM transactions;
SELECT * FROM transactions;
INSERT INTO transactions (amount)
VALUES (4.99);
SELECT * FROM transactions;

CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50),
last_name VARCHAR (50)
);
INSERT INTO customers (first_name, last_name)
VALUES ("Bubble", "Bass");
SELECT * FROM customers;

DROP TABLE transactions;
-- TABLE CREATION
CREATE TABLE transactions (
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
amount DECIMAL (5,2),
customer_id INT,transactions
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
 );
SELECT * FROM transactions;
ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1;
-- FOREIGN KEY CONSTRAINT
ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES customers (customer_id);
DELETE FROM transactions;
SELECT * FROM transactions;
-- TABLE MODIFICATION
ALTER TABLE transactions
AUTO_INCREMENT =1000
-- INSERTION OF VALUES
INSERT INTO transactions (amount, customer_id)
VALUES (4.99,1);
-- FOREIGN KEY
SELECT *FROM transactions;
-- DELETION OF VALUES
DELETE FROM customers
WHERE customer_id =3;
-- JOINS
INSERT INTO transactions (amount, customer_id)
VALUES (1.00, NULL);
INSERT INTO customers (first_name, last_name)
VALUES ("Poppy", "Puffy");
SELECT * FROM customers;
-- INNER JOIN
SELECT* 
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT transaction_id, amount,first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

-- LEFT JOIN
SELECT *
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT transaction_id, amount,first_name, last_name
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

-- RIGHT JOIN
SELECT *
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT transaction_id, amount,first_name, last_name
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT CONCAT (first_name," ", last_name) AS full_name
FROM employees;

SELECT * FROM employees;
ALTER TABLE employees
ADD COLUMN job VARCHAR (25) after hourly_pay;
UPDATE employees 
SET job = "janitor"
WHERE employee_id = 6;
-- AND OPERATOR
SELECT * 
FROM employees
WHERE hire_date < "2023-01-05" AND  job = "cook";
-- OR OPERATOR 
SELECT *
FROM employees 
WHERE job = "cook" OR job = "manager";

SELECT*
FROM employees
WHERE NOT job = "manager" AND job = "ass.manager";
-- BETWEEN OPERATOR
SELECT *
FROM employees
WHERE hire_date BETWEEN "2023-01-04" AND "2023-01-07";
-- IN OPERATOR
SELECT *
FROM employees
WHERE job IN ("cook", "cashier", "janitor");

-- WILDCARDS
SELECT * FROM employees
WHERE first_name LIKE "s%";

SELECT * FROM employees
WHERE hire_date LIKE "2023%";

SELECT * FROM employees
WHERE hire_date LIKE "_____01___";

SELECT * FROM employees
WHERE job LIKE "_a%";
-- ORDER BY 
SELECT* FROM employees 
ORDER BY last_name DESC;

SELECT* FROM employees 
ORDER BY hire_date DESC;

SELECT * FROM transactions
ORDER BY amount ASC,customer_id DESC;

-- LIMIT CLAUSE
SELECT * FROM customers
ORDER BY last_name LIMIT 1;

SELECT * FROM customers
LIMIT 3;

-- UNION OPERATOR
SELECT*FROM employees;
SELECT*FROM customers;
SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM customers;

-- SELF JOIN
ALTER TABLE customers
ADD referral_id INT;
UPDATE customers
SET referral_id = 2 
WHERE customer_id = 4;
SELECT* FROM customers;
SELECT *
FROM customers AS a
INNER JOIN customers AS b
ON a.referral_id = b.customer_id;

SELECT a.customer_id, a.first_name, a.last_name, b.first_name, b.last_name
FROM customers AS a
INNER JOIN customers AS b
ON a.referral_id = b.customer_id;

SELECT a.customer_id, a.first_name, a.last_name, CONCAT (b.first_name, " ", b.last_name) AS "referred_by"
FROM customers AS a
INNER JOIN customers AS b
ON a.referral_id = b.customer_id;

ALTER TABLE employees
ADD supervisor_id INT;
UPDATE employees
SET supervisor_id =1
WHERE employee_id =5;
SELECT * FROM employees;
SELECT *
FROM employees AS a
INNER JOIN employees AS b
ON a.supervisor_id = b.employee_id;

SELECT a.first_name, a.last_name, CONCAT(b.first_name, "  ", b.last_name) AS "reports to"
FROM employees AS a
INNER JOIN employees AS b
ON a.supervisor_id = b.employee_id;

-- Views
CREATE VIEW employee_attendance AS
SELECT first_name, last_name
FROM employees;
SELECT * FROM employee_attendance
ORDER BY last_name ASC;
DROP VIEW employee_attendance;

ALTER TABLE customers
ADD COLUMN email VARCHAR (50);
UPDATE customers
SET email = "PPuffy@gmail.com"
WHERE customer_id =4;

SELECT * FROM customers;
CREATE VIEW customer_emails AS
SELECT email
FROM customers;
SELECT * FROM customer_emails;

-- INDEX
SHOW INDEXES FROM customers;
CREATE INDEX last_name_idx
ON customers(last_name);
SHOW INDEXES FROM customers;
SELECT * FROM customers
WHERE last_name ="Puffy";