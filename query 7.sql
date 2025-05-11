-- TRIGGERS
SELECT * FROM employees;
ALTER TABLE employees
ADD COLUMN salary DECIMAL (10,2) AFTER hourly_pay;
UPDATE employees 
SET salary = hourly_pay *2080;
SELECT * FROM employees;
CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay *20280);
SHOW TRIGGERS;
SELECT* FROM employees;
UPDATE employees
SET hourly_pay =50
WHERE employee_id =1;
SELECT* FROM employees;
UPDATE employees
SET hourly_pay =hourly_pay +1;
DELETE FROM employees
WHERE employee_id =6;
SELECT* FROM employees;

CREATE TRIGGER  before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.salary =(NEW.hourly_pay *2080);
SELECT* FROM employees;
INSERT INTO employees(employee_id, first_name, last_name,hourly_pay, salary, job, hire_date, email, supervisor_id)
VALUES (6,"Sheldon", "Plankton", 10, NULL, "janitor", "2023-01-07", "SPlankton@gmail.com", 5);
SELECT* FROM employees;

CREATE TABLE expenses (
expense_id INT PRIMARY KEY,
expense_name VARCHAR (50),
expense_total DECIMAL (10,2)
);
SELECT * FROM expenses;
INSERT INTO expenses 
VALUES (1,"salary",0), (2, "supplies", 0), (3, "taxes", 0);
UPDATE expenses
SET expense_total = (SELECT SUM (salary) FROM employees)
WHERE expense_name = "salaries";
SELECT * FROM expenses;
CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total =expense_total - OLD.salary
WHERE expense_name = "salaries";

SELECT * FROM employees;
DELETE FROM employees
WHERE employee_id =6;

CREATE TRIGGER after_salary_insert 
AFTER INSERT ON employees
FOR EACH ROW 
UPDATE expenses
SET expense_total = expense_total + NEW.salary
WHERE expense_name ="salaries";
INSERT INTO employees(employee_id, first_name, last_name,hourly_pay, salary, job, hire_date, email, supervisor_id)
VALUES (6,"Sheldon", "Plankton", 10, NULL, "janitor", "2023-01-07", "SPlankton@gmail.com", 5);
SELECT* FROM employees;
SELECT * FROM expenses;

CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW 
UPDATE expenses
SET expense_total = expense_total + (NEW.salary - 0LD.salary)
WHERE expense_name = "salaries";
UPDATE employees
SET hourly_pay = 100
WHERE employee_id =1;
SELECT * FROM expenses;