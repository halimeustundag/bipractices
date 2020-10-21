Select
e.emp_no,
e.first_name,
e.last_name,
CASE
WHEN emp_no > 109990 THEN 'Manager'
ELSE 'Employee'
END AS dept_manager
FROM
employees e;





SELECT 
dm.emp_no,
e.first_name,
e.last_name,
MAX(s.salary)-MIN(s.salary) AS salary_difference,
CASE
WHEN MAX(s.salary)-MIN(s.salary) > 30000 THEN
'Salary was raised by more than $30.000'
ELSE
'Salary was not raised by more than $30.000'
END AS salary_raise
FROM
dept_manager dm
JOIN 
salaries s ON s.emp_no=dm.emp_no
JOIN
employees e ON e.emp_no=dm.emp_no
GROUP BY s.emp_no;



SELECT 
e.emp_no,
e.first_name,
e.last_name,
CASE
WHEN MAX(de.to_date)>SYSDATE() THEN 'Is still employed'
ELSE
'Not an employee anymore'
END AS current_employee
FROM
employees e
JOIN
dept_emp de On de.emp_no= e.emp_no
GROUP BY de.emp_no
LIMIT 100;



