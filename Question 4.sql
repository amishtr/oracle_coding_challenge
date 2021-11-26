 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 25-November-2021
       *  Description : Create an appropriate executable database object to allow the Salary for an Employee to be increased or decreased by a percentage.
       *  Table : tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         25-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 

CREATE OR REPLACE PROCEDURE pr_update_employee_salary(p_employee_id IN tbl_employees.employee_id%TYPE,                                                              
                                                      p_new_salary_percentage IN tbl_employees.salary%TYPE,
                                                      retcode OUT NUMBER)
IS
    v_employee_name VARCHAR2(50);
    
BEGIN

    dbms_output.put_line('The pr_update_employee_salary procedure has started at '|| TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI'));

    SELECT employee_name INTO v_employee_name
    FROM tbl_employees
    WHERE employee_id = p_employee_id;

    -- Calculating salary increment
    IF p_new_salary_percentage > 0 THEN    
       UPDATE tbl_employees
       SET salary = salary +  (salary * p_new_salary_percentage/100)
       WHERE employee_id =  p_employee_id;
              
       dbms_output.put_line( 'The salary for employee - ' || v_employee_name || ' has been increased by ' || p_new_salary_percentage || '%');       

      -- Calculating salary decrement
    ELSIF p_new_salary_percentage < 0 THEN    
       UPDATE tbl_employees
       SET salary = salary - (-1 * (salary * p_new_salary_percentage/100))
       WHERE employee_id =  p_employee_id;     
              
        dbms_output.put_line( 'The salary for employee - ' || v_employee_name || ' has been decreased by ' || p_new_salary_percentage || '%');   
       
    ELSE 
       dbms_output.put_line( 'The salary for employee - ' || v_employee_name || ' was not updated.');  
               
       COMMIT;          
    END IF;   

    dbms_output.put_line('The pr_update_employee_salary procedure has successfully completed at '|| TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI'));
    retcode := 0;

EXCEPTION 
   WHEN NO_DATA_FOUND THEN 
      raise_application_error (-20001, 'No such employee record was found.'); 
      retcode := 100;
      ROLLBACK;   
      
   WHEN OTHERS THEN 
      raise_application_error (-20002, 'Application Error!'); 
      retcode := 200;
      ROLLBACK;   

END;
/

/*************************************************************************************/ 
-- Calling procedure to increment an employee salary (e.g. by 10%)
DECLARE 
  P_EMPLOYEE_ID NUMBER;
  P_NEW_SALARY_PERCENTAGE NUMBER;
  RETCODE NUMBER;

BEGIN 
  P_EMPLOYEE_ID := 90011;
  P_NEW_SALARY_PERCENTAGE := 10;
  RETCODE := NULL;

  APPS.PR_UPDATE_EMPLOYEE_SALARY (P_EMPLOYEE_ID, P_NEW_SALARY_PERCENTAGE, RETCODE);
  COMMIT; 
END;  
-------------------------------------------------------------------------------------
-- Calling procedure to decrement an employee salary (e.g. by -15%)
DECLARE 
  P_EMPLOYEE_ID NUMBER;
  P_NEW_SALARY_PERCENTAGE NUMBER;
  RETCODE NUMBER;

BEGIN 
  P_EMPLOYEE_ID := 90011;
  P_NEW_SALARY_PERCENTAGE := -15;
  RETCODE := NULL;

  APPS.PR_UPDATE_EMPLOYEE_SALARY (P_EMPLOYEE_ID, P_NEW_SALARY_PERCENTAGE, RETCODE);
  COMMIT; 
END;  

/* Note: We can also create a package of the above procedure. */