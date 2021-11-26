 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 25-November-2021
       *  Description : Create an appropriate executable database object to allow the transfer of an Employee to a different Department.
       *  Tables :  tbl_departments, tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         25-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 

CREATE OR REPLACE PROCEDURE pr_update_employee_department(p_employee_id IN tbl_employees.employee_id%TYPE,                                                              
                                                          p_department_id IN tbl_departments.department_id%TYPE,
                                                          retcode OUT NUMBER) 
IS  
    v_employee_id NUMBER; 
    v_department_id NUMBER;
    exp_null_value EXCEPTION;
    
BEGIN         

    dbms_output.put_line('The pr_update_employee_department procedure has started at '|| TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI'));

   -- Validation - if the entered parameter value exists in employees table
    SELECT employee_id INTO v_employee_id
    FROM tbl_employees 
    WHERE employee_id = p_employee_id;
    
    -- Validation - if the entered parameter value exists in departments table
    SELECT department_id INTO v_department_id
    FROM tbl_departments 
    WHERE department_id = p_department_id;
    
    IF (v_employee_id IS NULL OR v_department_id IS NULL) THEN
          RAISE exp_null_value;
    END IF;    
    
    -- Updating the employees table
    UPDATE tbl_employees
    SET department_id = p_department_id
    WHERE employee_id = p_employee_id;  
    
    COMMIT;       
    
    dbms_output.put_line('The pr_update_employee_department procedure has successfully completed at '|| TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI'));
    retcode := 0;
    
EXCEPTION 
   WHEN exp_null_value THEN
      raise_application_error (-20001, 'The specified employee_id or department_id cannot be empty or null.');
      retcode := 100; 
      ROLLBACK;    

   WHEN NO_DATA_FOUND THEN 
      raise_application_error (-20002, 'No such employee record was found to update to a different department.'); 
      retcode := 200;
      ROLLBACK;   
      
   WHEN OTHERS THEN 
      raise_application_error (-20003, 'Application Error!'); 
      retcode := 300;
      ROLLBACK;   

END;
/

/*************************************************************************************/
-- Calling procedure to transfer of an Employee to a different Department.
DECLARE 
  P_EMPLOYEE_ID NUMBER;
  P_DEPARTMENT_ID NUMBER;
  RETCODE NUMBER;

BEGIN 
  P_EMPLOYEE_ID := 90011;
  P_DEPARTMENT_ID := 3;
  RETCODE := NULL;

  APPS.PR_UPDATE_EMPLOYEE_DEPARTMENT (P_EMPLOYEE_ID, P_DEPARTMENT_ID, RETCODE);
  COMMIT; 
END; 

/* Note: We can also create a package of the above procedure. */