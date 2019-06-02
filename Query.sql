CREATE TABLE departments (
	dept_no VARCHAR(255),
	dept_name VARCHAR(255)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(255),
	from_date DATE,
	to_date DATE
);
		
CREATE TABLE dept_manager(
	dept_no VARCHAR(255),
	emp_no INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE employees(
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	gender VARCHAR(255),
	hire_date DATE
);
	
CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles(
	emp_no INT,
	title VARCHAR(255),
	from_date DATE,
	to_date DATE
);


--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT last_name, first_name, gender, salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;


--2.List employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;
       

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT  last_name, first_name, from_date, to_date, dept_name, departments.dept_no
FROM dept_manager
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no;


--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no=departments.dept_no;


--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales';


--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales' OR dept_name='Development';


--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT last_name, COUNT(last_name)  
FROM employees
GROUP BY last_name
ORDER BY last_name DESC