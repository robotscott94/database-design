-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Create tables using QuickDBD schema

-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

-- Create dept_emp table
-- There are two foreign keys (composite key) because neither column has all unique values
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no, dept_no
     )
);

-- Add foreign key references to dept_emp table
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_employees_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        emp_no
     )
);

-- Add foreign key references to dept_manager table
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_managers_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_managers_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);


-- Create employees table
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date VARCHAR   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date VARCHAR   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

-- Convert date in string format to SQL 'Date' format
ALTER TABLE employees ADD COLUMN formatted_hire_date DATE;
UPDATE employees SET formatted_hire_date = to_date(to_char(to_date(my_date, 'MM/DD/YYYY'), 'YYYY-MM-DD'), 'YYYY-MM-DD');

-- Add foreign key reference for employees
ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

-- Check to ensure all data is correctly uploaded
SELECT * FROM departments




