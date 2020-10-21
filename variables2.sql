USE employees;
SET @v_emp_no=0;
CALL employees.emp_info('Aruna','Journel',@v_emp_no);
select @v_emp_no;