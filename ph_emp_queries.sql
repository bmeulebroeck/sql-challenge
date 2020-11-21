-- 1. Employee info plus salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries ON (employees.emp_no=salaries.emp_no)

-- 2. Find employees hired during 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;
--WHERE EXTRACT (year from hire_date) = 1986; --This worked too
 --This one makes more sense to me
--WHERE hire_date > 1986-01-01 AND hire_date < 1986-12-31;

-- 3. List manager of each department and manager info
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON (dept_manager.dept_no = departments.dept_no)
INNER JOIN employees ON (dept_manager.emp_no = employees.emp_no);

-- 4. List each employee and their assigned department(s)
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employee ON (employees.emp_no = dept_employee.emp_no)
INNER JOIN departments ON (dept_employee.dept_no = departments.dept_no);

-- 5. Query to find employees with the first name 'Hercules' and last name beginning with 'B'
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- 6. Query to list all employees in the sales dept
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employee ON (employees.emp_no = dept_employee.emp_no)
INNER JOIN departments ON (departments.dept_no = dept_employee.dept_no)
WHERE departments.dept_no = 'd007';

-- 7. Query to List all employees in the sales and development departments
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employee ON (employees.emp_no = dept_employee.emp_no)
INNER JOIN departments ON (departments.dept_no = dept_employee.dept_no)
WHERE departments.dept_no = 'd007' or departments.dept_no = 'd005'
ORDER BY employees.emp_no;
--ORDER BY departments.dept_name; --I think this also worked but there were so many employees in the list I only was seeing development

-- 8. List the frequency count of last names in descending order ORDER BY example from class (SQL day 2 act 5)
SELECT COUNT(last_name) AS "Number of staff with last name", last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

