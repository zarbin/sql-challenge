--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, last_name, first_name, sex, salary
FROM "Employees" e
INNER JOIN "Salaries" s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees" 
WHERE hire_date > '1/1/1986' and hire_date < '12/31/1986';

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT concat(first_name, ' ', last_name) as Manager, de.dept_no, d.dept_Name, e.emp_no, last_name, first_name
FROM "Employees" e
INNER JOIN "Dept_Emp" de ON de.emp_no = e.emp_no
INNER JOIN "Departments" d ON d.dept_no = de.dept_no
WHERE e.emp_no IN (
	SELECT emp_no
	FROM "Dept_Manager" dm
);

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_Name
FROM "Employees" e
INNER JOIN "Dept_Emp" de ON de.emp_no = e.emp_no
INNER JOIN "Departments" d ON d.dept_no = de.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM "Employees" e
WHERE first_name = 'Hercules' and last_name like 'B%'

--List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT d.dept_Name, e.emp_no, e.last_name, e.first_name
FROM "Employees" e
INNER JOIN "Dept_Emp" de ON de.emp_no = e.emp_no
INNER JOIN "Departments" d ON d.dept_no = de.dept_no
WHERE d.dept_Name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT d.dept_Name, e.emp_no, e.last_name, e.first_name
FROM "Employees" e
INNER JOIN "Dept_Emp" de ON de.emp_no = e.emp_no
INNER JOIN "Departments" d ON d.dept_no = de.dept_no
WHERE d.dept_Name in ('Sales', 'Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how 
--many employees share each last name).
SELECT e.last_name, count(*) as LastNameCnt
FROM "Employees" e
GROUP BY e.last_name
ORDER BY LastNameCnt DESC