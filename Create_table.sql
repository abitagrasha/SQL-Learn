CREATE TABLE IF NOT Exists supervisors (
    supervisor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    email VARCHAR (50) NOT NULL UNIQUE,
);