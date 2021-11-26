 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 26-November-2021
       *  Description : Create an appropriate executable database object to return the Salary for an Employee.
       *  Tables :  tbl_departments, tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         26-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 

CREATE OR REPLACE FUNCTION fn_fetch_employee_salary(p_employee_name IN tbl_employees.employee_name%TYPE)
RETURN NUMBER
IS
    v_employee_salary NUMBER(10); 
    
BEGIN 

    SELECT salary INTO v_employee_salary
    FROM tbl_employees
    WHERE employee_name = p_employee_name;

    RETURN v_employee_salary;

EXCEPTION      
   WHEN OTHERS THEN 
      raise_application_error (-20003, 'Application Error!'); 
      ROLLBACK;   
      
END;
/

/*************************************************************************************/
-- Calling function to return the Salary for an Employee.
SELECT date_hired,
       employee_id,
       manager_id,
       FN_FETCH_EMPLOYEE_SALARY ('Amish Trivedi') AS salary,
       department_id,
       employee_name,
       job_title    
FROM tbl_employees
WHERE employee_id = 90011;

/* Note: We can also create a package of the above function. */