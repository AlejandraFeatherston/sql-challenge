-- Question 1: List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
	employees.emp_no
	,employees.last_name
	,employees.first_name
	,employees.sex
	,salaries.salary
FROM
	employees
JOIN
	salaries
ON
	employees.emp_no = salaries.emp_no;
	
-- Question 2: List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	employees.first_name
	,employees.last_name
	,employees.hire_date
FROM
	employees
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986;

-- Question 3: List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	employees.first_name
	,employees.last_name
	,departments.dept_no
	,departments.dept_name
	,dept_manager.emp_no
FROM
	departments
JOIN
	dept_manager
ON
	departments.dept_no = dept_manager.dept_no
JOIN
	employees
ON
	dept_manager.emp_no = employees.emp_no;

-- Question 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
	dept_emp.dept_no
	,departments.dept_name
	,employees.emp_no
	,employees.first_name
	,employees.last_name
FROM
	employees
JOIN
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
ON
	dept_emp.dept_no  = departments.dept_no

-- Question 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	employees.first_name
	,employees.last_name
	,employees.sex
FROM
	employees
WHERE
	employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

-- Question 6: List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
	employees.emp_no
	,employees.last_name
	,employees.first_name
FROM
	employees
JOIN 
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name = 'Sales'

-- Question 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	employees.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM
	employees
JOIN 
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name IN ('Sales' ,'Development');

-- Question 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
    last_name AS "last name"
    ,COUNT(last_name) AS "count"
FROM 
	employees
GROUP BY 
	"last name"
ORDER BY 
	"count" DESC;

