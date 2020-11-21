CREATE TABLE titles (
	title_id VARCHAR(12) PRIMARY KEY,
	title VARCHAR(64)
)

CREATE TABLE employees (
	emp_no VARCHAR(12) PRIMARY KEY,
	emp_title_id VARCHAR(12),
	birth_date DATE,
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	sex VARCHAR(12),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
)

CREATE TABLE salaries (
	emp_no VARCHAR(12) PRIMARY KEY,
	salary INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

CREATE TABLE departments(
	dept_no VARCHAR(12) PRIMARY KEY,
	dept_name VARCHAR(64)
)

CREATE TABLE dept_manager(
	dept_no VARCHAR(12),
	emp_no VARCHAR(12) PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

CREATE TABLE dept_employee (
	emp_no VARCHAR(12),
	dept_no VARCHAR(12),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
)
	
SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM departments
SELECT * FROM dept_manager
SELECT * FROM dept_employee