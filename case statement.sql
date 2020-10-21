Select
emp_no,
first_name,
last_name,
Case
When gender='M' THEN 'Male'
ELSE 'Female'
END AS gender
FROM
employees;

SELECT
e.emp_no,
e.first_name,
e.last_name,
Case
When dm.emp_no IS NOT NULL THEN 'Manager'
ELSE 'Emloyee'
END AS is_manager
FROM
employees e
LEFT JOIN
dept_manager dm ON dm.emp_no=e.emp_no
Where
e.emp_no > 109990;

Select
dm.emp_no,
e.first_name,
e.last_name,
MAX(s.salary)-MIN(s.salary) AS salary_difference,
CASE
WHEN MAX(s.salary)-MIN(s.salary) > 30000 THEN
'salary was raised by more than $30.000'
WHEN MAX(s.salary)-MIN(s.salary) BETWEEN 20000 AND 300000 THEN 'Salary was raised by more than $20.000 but less than 30.000'
ELSE
'Salary was raised by less than $20000'
END AS salary_increase
FROM
dept_manager dm
JOIN
employees e ON e.emp_no = dm.emp_no
JOIN
salaries s ON s.emp_no=dm.emp_no
GROUP BY e.emp_no;
