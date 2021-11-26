 /*************************************************************************************
       *  Author     : Amish Trivedi
       *  Version    : 1.0
       *  Created    : 25-November-2021
       *  Description : Populate the Departments and Employees data structures using the data specified in the Appendix.
       *  Tables :  tbl_departments, tbl_employees
       *  Change History
       *  Version        Date                Author             Change
       *  1.0         25-Nov-2021     Amish Trivedi    Initial version
       *************************************************************************************/ 

-- Populating tbl_departments from the data specified in the Appendix 
INSERT ALL
INTO tbl_departments (department_id, department_name, location) VALUES (1, 'Management', 'London')
INTO tbl_departments (department_id, department_name, location) VALUES (2, 'Engineering', 'Cardiff')
INTO tbl_departments (department_id, department_name, location) VALUES (3, 'Research & Development', 'Edinburgh')
INTO tbl_departments (department_id, department_name, location) VALUES (4, 'Sales', 'Belfast')
SELECT * FROM dual;    
   
-- Populating tbl_employees from the data specified in the Appendix    
INSERT ALL
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90001, 'John Smith', 'CEO', NULL, TO_DATE('1995/01/01', 'yy/mm/dd'), 100000, 1)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90002, 'Jimmy Willis', 'Manager', 90001, TO_DATE('2003/09/23', 'yy/mm/dd'), 52500, 4)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90003, 'Roxy Jones', 'Salesperson', 90002, TO_DATE('2017/02/11', 'yy/mm/dd'), 35000, 4)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90004, 'Selwyn Field', 'Salesperson', 90003, TO_DATE('2015/05/20', 'yy/mm/dd'), 32000, 4)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90005, 'David Hallett', 'Engineer', 90006, TO_DATE('2018/04/17', 'yy/mm/dd'), 40000, 2)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90006, 'Sarah Phelps', 'Manager', 90001, TO_DATE('2015/03/21', 'yy/mm/dd'), 45000, 2)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90007, 'Louise Harper', 'Engineer', 90006, TO_DATE('2013/01/01', 'yy/mm/dd'), 47000, 2)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90008, 'Tina Hart', 'Engineer', 90009, TO_DATE('2014/07/28', 'yy/mm/dd'), 45000, 3)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90009, 'Gus Jones', 'Manager', 90001, TO_DATE('2018/05/15', 'yy/mm/dd'), 50000, 3)
INTO tbl_employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) VALUES (90010, 'Mildred Hall', 'Secretary', 90001, TO_DATE('1996/10/12', 'yy/mm/dd'), 35000, 1)
SELECT * FROM dual;
         
    
  