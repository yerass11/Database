create database lab8;

create table countries(
    name varchar(15)
);

create table departments(
    name varchar(15),
    id SERIAL PRIMARY KEY,
    budget INT
);

create table employees(
    name varchar(15),
    surname varchar(15),
    salary INT,
    department_id INT REFERENCES departments(id)
);

-- Insert random data into the 'countries' table
INSERT INTO countries (name) VALUES
    ('Russia'),
    ('USA'),
    ('China'),
    ('string'),
    ('Brazil');

-- Insert random data into the 'departments' table
INSERT INTO departments (name, budget) VALUES
    ('HR', 50000),
    ('Finance', 100000),
    ('IT', 80000);
drop table employees;
INSERT INTO employees (name, surname, salary, department_id)
VALUES
    ('John', 'Doe', 55000, 1),
    ('Alice', 'Smith', 60000, 2),
    ('Bob', 'Johnson', 50000, 3),
    ('Eva', 'Lee', 70000, 1),
    ('Michael', 'Brown', 48000, 2),
    ('Olivia', 'Williams', 65000, 3),
    ('Daniel', 'Taylor', 52000, 1),
    ('Sophia', 'Jones', 59000, 2),
    ('William', 'Miller', 53000, 3),
    ('string', 'string', 72000, 3),
    ('Emma', 'Davis', 67000, 1);



--1
SELECT * FROM countries WHERE name = 'string';

CREATE INDEX ind1 ON countries(name);

--2
SELECT * FROM employees WHERE name = 'string' and surname = 'string';

CREATE INDEX ind2 ON employees(name,surname);

--3

SELECT * FROM employees WHERE salary>50000 AND salary < 70000;

CREATE UNIQUE INDEX ind3 ON employees(salary);

-- 4
SELECT * FROM employees WHERE substring(name from 1 for 4) = 'Soph';

CREATE INDEX ind4 ON employees(substring(name from 1 for 4));

--5

SELECT * FROM employees e
JOIN departments d
    ON d.id = e.department_id WHERE d.budget > 50000 AND e.salary < 100000;

CREATE INDEX idx_employees_departments ON employees(department_id);
CREATE INDEX idx_departments_budget ON departments(budget);









SELECT * FROM employees WHERE substring(name from 1 for 4) = 'stri';

CREATE INDEX ind99 ON employees(substring(name from 1 for 4));







SELECT * FROM employees WHERE salary<2 AND salary > 1;

CREATE UNIQUE INDEX ind3 ON employees(salary);

-- 4
SELECT * FROM employees WHERE substring(name from 1 for 4) = 'abab';

CREATE INDEX ind4 ON employees(substring(name from 1 for 4));

--5

SELECT * FROM employees e
JOIN departments d
    ON d.id = e.department_id WHERE d.budget > 50000 AND e.salary < 100000;

CREATE INDEX idx_employees_departments ON employees(department_id);
CREATE INDEX idx_departments_budget ON departments(budget);