USE employees;
DROP procedure IF EXISTS emp_avg_salary_out;
DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2))
BEGIN
SELECT
AVG(s.salary)
INTO p_avg_salary FROM
employees e
JOIN
salaries s On e.emp_no = s.emp_no 
Where
e.emp_no = p_emp_no;
END$$



USE employees;

DELIMITER $$

CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)

BEGIN

SELECT
e.emp_no
INTO p_emp_no FROM
employees e
WHERE
e.first_name = p_first_name
AND e.last_name = p_last_name;

END$$

DELIMITER ;




