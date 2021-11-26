 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 25-November-2021
       *  Description : Create an appropriate executable database object to allow an Employee to be created.
       *  Table : tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         25-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 

CREATE OR REPLACE PROCEDURE pr_insert_employee(p_employee_id IN tbl_employees.employee_id%TYPE, 
                                               p_employee_name IN tbl_employees.employee_name%TYPE,  
                                               p_job_title IN tbl_employees.job_title%TYPE, 
                                               p_manager_id IN tbl_employees.manager_id%TYPE, 
                                               p_date_hired IN tbl_employees.date_hired%TYPE,  
                                               p_salary IN tbl_employees.salary%TYPE,  
                                               p_department_id IN tbl_employees.department_id%TYPE)
IS
BEGIN

    dbms_output.put_line('The pr_insert_employee procedure has started at '|| TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI'));

    INSERT INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
    VALUES (p_employee_id, p_employee_name ,p_job_title, p_manager_id, TO_DATE(p_date_hired, 'yy/mm/dd'), p_salary, p_department_id);
    
    COMMIT;
    
    dbms_output.put_line('The pr_insert_employee procedure has successfully completed at '|| TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI'));
    
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
      raise_application_error (-20001,'You have tried to insert a duplicate employee_id - ' || p_employee_id);
      ROLLBACK;   

   WHEN OTHERS THEN
      raise_application_error (-20002,'An error has occurred inserting a new employee record.'); 
      ROLLBACK;     
          
END;
/

/*************************************************************************************/
-- Calling procedure to insert an employee
DECLARE 
  P_EMPLOYEE_ID NUMBER;
  P_EMPLOYEE_NAME VARCHAR2(50);
  P_JOB_TITLE VARCHAR2(50);
  P_MANAGER_ID NUMBER;
  P_DATE_HIRED DATE;
  P_SALARY NUMBER;
  P_DEPARTMENT_ID NUMBER;

BEGIN 
  P_EMPLOYEE_ID := 90011;
  P_EMPLOYEE_NAME := 'Amish Trivedi';
  P_JOB_TITLE := 'Oracle Engineer';
  P_MANAGER_ID := 90006;
  P_DATE_HIRED := SYSDATE;
  P_SALARY := 40000;
  P_DEPARTMENT_ID := 2;

  APPS.PR_INSERT_EMPLOYEE (P_EMPLOYEE_ID, P_EMPLOYEE_NAME, P_JOB_TITLE, P_MANAGER_ID, P_DATE_HIRED, P_SALARY, P_DEPARTMENT_ID);
  COMMIT; 
END; 

/* Note: We can also create a package of the above procedure. */
