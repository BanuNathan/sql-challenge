-- --1. List the following detils fo each employee: employee number, last name, 
-- --first name, sex, salary

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, e.sex, s.salary
FROM employees  e
INNER JOIN salaries  s
ON e.emp_no = s.emp_no 
ORDER BY e.emp_no ASC;

-- --2. List first name, last name, and hire date for employees who were
-- --hired in 1986
SELECT emp_no, first_name, last_name, 
 extract(
    year from hire_date 
    )  AS "hire_Year" from employees; 

-- --3. List the manager of each department with the following information:
-- --department number, department name, the manager's employee number, 
-- --last name, first name.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no
INNER JOIN employees e ON e.emp_no = dm.emp_no
ORDER BY d.dept_no ;

-- --4.List the department of each employee with the following information: 
-- --employee number, last name, first name, and department name.

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
ORDER BY e.emp_no;

-- --5. List first name, last name and sex of employees whose first name
-- --is 'Hercules' and last name starts with 'B'

SELECT emp_no, first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND substring(last_name,1,1)='B';

-- --6.List all employees ithe sales department,including their employee number, 
-- --last name, first name and department number.

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name in ('Sales')
ORDER BY e.emp_no;

-- -- 7.List all employees ithe sales department,including their employee number, 
-- -- last name, first name and department number.

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name in ('Sales', 'Development')
ORDER BY e.emp_no;

-- -- 8. In descending order list the frequency count of employee last names ie, how many 
-- -- employees share each last name

SELECT  last_name, count(last_name) 
FROM employees
group by last_name
order by last_name desc;

-- -- Average Salary by title
SELECT  t.title, count(t.title),ROUND(AVG(s.salary),2) as average_salary
FROM employees e
INNER JOIN salaries s ON s.emp_no = e.emp_no
INNER JOIN titles t ON t.title_id = e.emp_title_id
group by t.title;



