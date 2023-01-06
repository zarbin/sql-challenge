# SQL Challenge - Module 9 Homework

ERD Diagram
![image](https://user-images.githubusercontent.com/36682023/210923299-1c44839b-396e-478c-bb1e-f9a839614649.png)

    --List the employee number, last name, first name, sex, and salary of each employee.
    SELECT e.emp_no, last_name, first_name, sex, salary
    FROM "Employees" e
    INNER JOIN "Salaries" s
    ON e.emp_no = s.emp_no;
    
![image](https://user-images.githubusercontent.com/36682023/210923718-87128749-3590-40d5-9207-7add373107e0.png)

    --List the first name, last name, and hire date for the employees who were hired in 1986.
    SELECT first_name, last_name, hire_date
    FROM "Employees" 
    WHERE hire_date > '1/1/1986' and hire_date < '12/31/1986';
    
![image](https://user-images.githubusercontent.com/36682023/210923805-4d0d33c6-a0b5-4344-9108-fcb9d86aba07.png)

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

![image](https://user-images.githubusercontent.com/36682023/210923886-f392d4d6-b7c1-495e-9f54-8f32ceb24ded.png)

    --List the department number for each employee along with that employee’s 
    --employee number, last name, first name, and department name.
    SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_Name
    FROM "Employees" e
    INNER JOIN "Dept_Emp" de ON de.emp_no = e.emp_no
    INNER JOIN "Departments" d ON d.dept_no = de.dept_no
    
![image](https://user-images.githubusercontent.com/36682023/210924053-4372e8a8-411b-4204-b040-b9a4e5267b54.png)

    --List first name, last name, and sex of each employee whose first name is Hercules 
    --and whose last name begins with the letter B.
    SELECT first_name, last_name, sex
    FROM "Employees" e
    WHERE first_name = 'Hercules' and last_name like 'B%'
    
![image](https://user-images.githubusercontent.com/36682023/210924110-1584afba-f18d-4fdc-b1b5-d9185bb39aee.png)

    --List each employee in the Sales department, including their employee number, 
    --last name, and first name.
    SELECT d.dept_Name, e.emp_no, e.last_name, e.first_name
    FROM "Employees" e
    INNER JOIN "Dept_Emp" de ON de.emp_no = e.emp_no
    INNER JOIN "Departments" d ON d.dept_no = de.dept_no
    WHERE d.dept_Name = 'Sales'
    
![image](https://user-images.githubusercontent.com/36682023/210924180-37b7e800-7d59-414a-9d10-4766eb4c0a0a.png)

    --List each employee in the Sales and Development departments, including their employee number, 
    --last name, first name, and department name.
    SELECT d.dept_Name, e.emp_no, e.last_name, e.first_name
    FROM "Employees" e
    INNER JOIN "Dept_Emp" de ON de.emp_no = e.emp_no
    INNER JOIN "Departments" d ON d.dept_no = de.dept_no
    WHERE d.dept_Name in ('Sales', 'Development')
    
![image](https://user-images.githubusercontent.com/36682023/210924219-1edc1893-c719-4c69-81d1-53eb879f5daa.png)

    --List the frequency counts, in descending order, of all the employee last names (that is, how 
    --many employees share each last name).
    SELECT e.last_name, count(*) as LastNameCnt
    FROM "Employees" e
    GROUP BY e.last_name
    ORDER BY LastNameCnt DESC
    
![image](https://user-images.githubusercontent.com/36682023/210924259-b6af2eb9-b67c-47f8-b6c0-7824747e588d.png)
