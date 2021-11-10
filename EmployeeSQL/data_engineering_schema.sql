-- #### Data Engineering 

-- drop all
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- create a table schema
-- create titles table
CREATE TABLE titles (
	
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    PRIMARY KEY (title_id)
);

-- import titles crv
select * from titles;


-- create employee table
CREATE TABLE employees (
	
    emp_no VARCHAR NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

-- import employee crv
select * from employees;


-- create departments table
CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);

-- import departments crv
select * from departments;


-- create salary table
CREATE TABLE salaries (
	
    emp_no VARCHAR NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

-- import salaries crv
select * from salaries;


-- create dept_manager table
CREATE TABLE dept_manager (
	
    dept_no VARCHAR NOT NULL,
    emp_no VARCHAR NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

-- import dept_manager crv
select * from dept_manager;


-- create dept_emp table
CREATE TABLE dept_emp (
	
	emp_no VARCHAR NOT NULL,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- import dept_emp crv
select * from dept_emp;